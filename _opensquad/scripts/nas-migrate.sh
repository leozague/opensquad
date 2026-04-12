#!/bin/bash
# nas-migrate.sh — Migra arquivos do NAS legado para estrutura PARA
# SEGURO: Apenas COPIA. Nunca apaga originais.
#
# Uso:
#   ./nas-migrate.sh plan       — Gera plano de migracao (nao copia nada)
#   ./nas-migrate.sh execute    — Executa o plano (copia arquivos)
#   ./nas-migrate.sh verify     — Verifica integridade (compara origem x destino)
#   ./nas-migrate.sh status     — Mostra progresso e metricas
#   ./nas-migrate.sh resume     — Retoma migracao interrompida
#
# Os originais em _PESS/ e _WORK/ permanecem intactos como backup.

set -euo pipefail

# === CONFIGURACAO ===
NAS="/Volumes/data"
META_DIR="$NAS/_meta"
PLAN_FILE="$META_DIR/migration-plan.md"
LOG_FILE="$META_DIR/migration.log"
STATUS_FILE="$META_DIR/migration-status.md"
PROGRESS_FILE="$META_DIR/migration-progress.json"
ERRORS_FILE="$META_DIR/migration-errors.log"

# Contadores globais
TOTAL_FILES=0
TOTAL_COPIED=0
TOTAL_SKIPPED=0
TOTAL_ERRORS=0
TOTAL_BYTES_COPIED=0
START_TIME=0

# Contadores por fase
PHASE_FILES=0
PHASE_COPIED=0
PHASE_SKIPPED=0
PHASE_ERRORS=0
PHASE_BYTES=0
PHASE_START=0

# === FUNCOES AUXILIARES ===

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') — $1" | tee -a "$LOG_FILE"
}

log_error() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') — ERRO: $1" | tee -a "$LOG_FILE" >> "$ERRORS_FILE"
}

notify() {
    osascript -e "display notification \"$1\" with title \"NAS Migration\"" 2>/dev/null || true
}

check_nas() {
    if [ ! -d "$NAS" ]; then
        echo "ERRO: NAS nao montado em $NAS"
        echo "Execute: open \"smb://192.168.0.210/data\""
        exit 1
    fi
}

# Extrai data de criacao de um arquivo de midia
get_media_date() {
    local file="$1"
    local filename
    filename=$(basename "$file")

    # 1. Nome do arquivo (padrao YYYYMMDD)
    if [[ "$filename" =~ ^([0-9]{4})([0-9]{2})([0-9]{2}) ]]; then
        local y="${BASH_REMATCH[1]}"
        local m="${BASH_REMATCH[2]}"
        if [ "$y" -ge 2000 ] && [ "$y" -le 2030 ] && [ "$m" -ge 01 ] && [ "$m" -le 12 ]; then
            echo "${y}/${m}"
            return
        fi
    fi

    # 2. Timestamp unix no nome (13 digitos = milissegundos)
    if [[ "$filename" =~ ^([0-9]{13})\. ]]; then
        local ts="${BASH_REMATCH[1]}"
        local ts_sec=$((ts / 1000))
        local dt
        dt=$(date -r "$ts_sec" '+%Y/%m' 2>/dev/null)
        if [ -n "$dt" ]; then
            echo "$dt"
            return
        fi
    fi

    # 3. mdls (EXIF via macOS)
    local mdls_date
    mdls_date=$(mdls -name kMDItemContentCreationDate "$file" 2>/dev/null | grep -oE '[0-9]{4}-[0-9]{2}' | head -1)
    if [ -n "$mdls_date" ]; then
        echo "${mdls_date:0:4}/${mdls_date:5:2}"
        return
    fi

    # 4. Data de modificacao do arquivo
    local mod_date
    mod_date=$(stat -f "%Sm" -t "%Y/%m" "$file" 2>/dev/null)
    if [ -n "$mod_date" ]; then
        echo "$mod_date"
        return
    fi

    echo "sem-data"
}

human_size() {
    local bytes=$1
    if [ "$bytes" -gt 1073741824 ]; then
        echo "$(echo "scale=2; $bytes/1073741824" | bc) GB"
    elif [ "$bytes" -gt 1048576 ]; then
        echo "$(echo "scale=1; $bytes/1048576" | bc) MB"
    elif [ "$bytes" -gt 1024 ]; then
        echo "$(echo "scale=0; $bytes/1024" | bc) KB"
    else
        echo "$bytes B"
    fi
}

elapsed_time() {
    local start=$1
    local now
    now=$(date +%s)
    local diff=$((now - start))
    local hours=$((diff / 3600))
    local mins=$(( (diff % 3600) / 60 ))
    local secs=$((diff % 60))
    printf "%02d:%02d:%02d" $hours $mins $secs
}

transfer_speed() {
    local bytes=$1
    local start=$2
    local now
    now=$(date +%s)
    local diff=$((now - start))
    if [ "$diff" -eq 0 ]; then diff=1; fi
    local bps=$((bytes / diff))
    human_size "$bps"
}

# Barra de progresso inline
progress_bar() {
    local current=$1
    local total=$2
    local phase_name=$3
    if [ "$total" -eq 0 ]; then return; fi
    local pct=$((current * 100 / total))
    local filled=$((pct / 2))
    local empty=$((50 - filled))
    printf "\r  [%-${filled}s%-${empty}s] %3d%% (%d/%d) %s" \
        "$(printf '#%.0s' $(seq 1 "$filled" 2>/dev/null) 2>/dev/null)" \
        "" \
        "$pct" "$current" "$total" "$phase_name"
}

# Inicia contadores de fase
phase_start() {
    PHASE_FILES=0
    PHASE_COPIED=0
    PHASE_SKIPPED=0
    PHASE_ERRORS=0
    PHASE_BYTES=0
    PHASE_START=$(date +%s)
}

# Imprime resumo da fase
phase_summary() {
    local name=$1
    local elapsed
    elapsed=$(elapsed_time "$PHASE_START")
    local speed=""
    if [ "$PHASE_BYTES" -gt 0 ]; then
        speed=" | Velocidade: $(transfer_speed "$PHASE_BYTES" "$PHASE_START")/s"
    fi
    local size_str=""
    if [ "$PHASE_BYTES" -gt 0 ]; then
        size_str=" | Tamanho: $(human_size "$PHASE_BYTES")"
    fi
    echo ""
    log "$name: $PHASE_COPIED copiados, $PHASE_SKIPPED ja existiam, $PHASE_ERRORS erros | Tempo: $elapsed$size_str$speed"
}

# Copia um arquivo com verificacao de integridade
safe_copy() {
    local src="$1"
    local dst_dir="$2"
    local fname
    fname=$(basename "$src")

    mkdir -p "$dst_dir" 2>/dev/null || true

    if [ -f "$dst_dir/$fname" ]; then
        PHASE_SKIPPED=$((PHASE_SKIPPED + 1))
        TOTAL_SKIPPED=$((TOTAL_SKIPPED + 1))
        return 0
    fi

    local src_size
    src_size=$(stat -f%z "$src" 2>/dev/null || echo "0")

    if cp -n "$src" "$dst_dir/$fname" 2>/dev/null; then
        # Verificar integridade por tamanho
        local dst_size
        dst_size=$(stat -f%z "$dst_dir/$fname" 2>/dev/null || echo "-1")

        if [ "$src_size" = "$dst_size" ]; then
            PHASE_COPIED=$((PHASE_COPIED + 1))
            TOTAL_COPIED=$((TOTAL_COPIED + 1))
            PHASE_BYTES=$((PHASE_BYTES + src_size))
            TOTAL_BYTES_COPIED=$((TOTAL_BYTES_COPIED + src_size))
            return 0
        else
            # Tamanho diferente = copia corrompida
            rm -f "$dst_dir/$fname" 2>/dev/null
            log_error "Integridade falhou: $fname (src=$src_size dst=$dst_size)"
            PHASE_ERRORS=$((PHASE_ERRORS + 1))
            TOTAL_ERRORS=$((TOTAL_ERRORS + 1))
            return 1
        fi
    else
        log_error "Falha ao copiar: $src → $dst_dir/"
        PHASE_ERRORS=$((PHASE_ERRORS + 1))
        TOTAL_ERRORS=$((TOTAL_ERRORS + 1))
        return 1
    fi
}

# Copia pasta recursivamente com contagem
safe_copy_dir() {
    local src_dir="$1"
    local dst_dir="$2"

    [ -d "$src_dir" ] || return 0
    mkdir -p "$dst_dir" 2>/dev/null || true

    local count=0
    while IFS= read -r -d '' file; do
        safe_copy "$file" "$dst_dir/$(dirname "${file#$src_dir/}")"
        count=$((count + 1))
        PHASE_FILES=$((PHASE_FILES + 1))
        TOTAL_FILES=$((TOTAL_FILES + 1))
    done < <(find "$src_dir" -type f ! -name '.DS_Store' -print0 2>/dev/null)
}

# Salva progresso (para resume)
save_progress() {
    local phase=$1
    cat > "$PROGRESS_FILE" << EOF
{
    "phase": "$phase",
    "total_files": $TOTAL_FILES,
    "total_copied": $TOTAL_COPIED,
    "total_skipped": $TOTAL_SKIPPED,
    "total_errors": $TOTAL_ERRORS,
    "total_bytes": $TOTAL_BYTES_COPIED,
    "start_time": $START_TIME,
    "updated": "$(date '+%Y-%m-%d %H:%M:%S')"
}
EOF
}

# Mapeamento de pastas
get_folder_map() {
    # Retorna linhas "src|dst"
    cat << 'MAP'
_PESS/Opala|02_Areas/documentos/veiculos/opala
_PESS/backup-celular-mae|04_Archives/dispositivos/celular-mae
_PESS/bck-s9|04_Archives/dispositivos/s9
_PESS/bck-icloud|04_Archives/dispositivos/icloud
_PESS/PODCASTS|03_Resources/podcasts
_PESS/15_Musicas_Sows|03_Resources/musica
_PESS/0_TRAINING|03_Resources/cursos/training-1
_PESS/TRAINING|03_Resources/cursos/training-2
_PESS/background-office|02_Areas/trabalho/midias/background-office
_PESS/ideias-escritorio|02_Areas/trabalho/midias/ideias-escritorio
_PESS/X|04_Archives/legado/x
_PESS/_OGX|04_Archives/legado/ogx
_PESS/TransferNow-MJ|04_Archives/legado/transfernow-mj
_PESS/Fotos_gateway|04_Archives/legado/fotos-gateway
_PESS/0_TEMPORARIA|04_Archives/legado/temporaria
_PESS/ComponentesDelphi11|04_Archives/software/delphi/componentes-delphi11
_PESS/4K Video Downloader+|04_Archives/software/ferramentas/4k-video-downloader
_WORK/1_DEVELOPER_INSTALL|04_Archives/software/ferramentas/developer-install
_WORK/DEV_INSALL|04_Archives/software/ferramentas/dev-install-2
_WORK/Delphi|04_Archives/software/delphi/delphi-work
_WORK/Embarcadero|04_Archives/software/delphi/embarcadero
_WORK/_Microsoft|04_Archives/software/microsoft
_WORK/_DEVELOPER|04_Archives/software/ferramentas/developer
Vostro 8.1|04_Archives/dispositivos/vostro/vostro-8.1
Vostro-bck|04_Archives/dispositivos/vostro/vostro-bck
MAP
}

# ====================================================================
# COMANDO: PLAN
# ====================================================================

do_plan() {
    check_nas
    log "Gerando plano de migracao..."

    mkdir -p "$META_DIR"

    cat > "$PLAN_FILE" << HEADER
---
generated: $(date '+%Y-%m-%d %H:%M:%S')
status: pending
---

# Plano de Migracao — NAS Legado → Estrutura PARA

> Gerado automaticamente. Revise antes de executar.
> Comando: \`./nas-migrate.sh execute\`
> **SEGURO:** Apenas copia. Originais permanecem intactos.

---

HEADER

    # --- PASTAS MAPEADAS ---
    echo "## 1. Pastas com mapeamento direto" >> "$PLAN_FILE"
    echo "" >> "$PLAN_FILE"
    echo "| Origem | Destino | Itens |" >> "$PLAN_FILE"
    echo "|--------|---------|-------|" >> "$PLAN_FILE"

    local total_folders=0

    while IFS='|' read -r src dst; do
        if [ -d "$NAS/$src" ]; then
            local fcount
            fcount=$(ls -1 "$NAS/$src" 2>/dev/null | wc -l | tr -d ' ')
            echo "| \`$src/\` | \`$dst/\` | $fcount |" >> "$PLAN_FILE"
            total_folders=$((total_folders + 1))
        fi
    done <<< "$(get_folder_map)"

    echo "" >> "$PLAN_FILE"
    echo "**$total_folders pastas mapeadas**" >> "$PLAN_FILE"
    echo "" >> "$PLAN_FILE"

    # --- PROJETOS ---
    echo "## 2. Projetos (_WORK/PROJETOS)" >> "$PLAN_FILE"
    echo "" >> "$PLAN_FILE"
    echo "| Projeto | Itens | Destino |" >> "$PLAN_FILE"
    echo "|---------|-------|---------|" >> "$PLAN_FILE"

    if [ -d "$NAS/_WORK/PROJETOS" ]; then
        for proj in "$NAS/_WORK/PROJETOS"/*/; do
            [ -d "$proj" ] || continue
            local pname
            pname=$(basename "$proj")
            local pcount
            pcount=$(ls -1 "$proj" 2>/dev/null | wc -l | tr -d ' ')
            echo "| \`$pname\` | $pcount | \`04_Archives/projetos/$pname/\` |" >> "$PLAN_FILE"
        done
    fi
    echo "" >> "$PLAN_FILE"

    # --- ARQUIVOS SOLTOS ---
    echo "## 3. Arquivos soltos em _PESS/" >> "$PLAN_FILE"
    echo "" >> "$PLAN_FILE"
    echo "| Arquivo | Tamanho | Destino |" >> "$PLAN_FILE"
    echo "|---------|---------|---------|" >> "$PLAN_FILE"

    for file in "$NAS/_PESS"/*; do
        [ -f "$file" ] || continue
        local fname
        fname=$(basename "$file")
        [[ "$fname" == .DS_Store ]] && continue
        local fsize
        fsize=$(stat -f%z "$file" 2>/dev/null || echo "0")
        local ext="${fname##*.}"
        local dest="04_Archives/legado"
        case "$ext" in
            pdf) dest="04_Archives/legado/pdfs" ;;
            rar|zip|7z) dest="04_Archives/legado/compactados" ;;
        esac
        echo "| \`$fname\` | $(human_size "$fsize") | \`$dest/\` |" >> "$PLAN_FILE"
    done
    echo "" >> "$PLAN_FILE"

    # --- FOTOS ---
    echo "## 4. Fotos (_PESS/_FOTOS_FULL)" >> "$PLAN_FILE"
    echo "" >> "$PLAN_FILE"

    local photo_count=0
    if [ -d "$NAS/_PESS/_FOTOS_FULL" ]; then
        photo_count=$(ls -1 "$NAS/_PESS/_FOTOS_FULL" 2>/dev/null | grep -ciE '\.(jpg|jpeg|png|heic|gif|bmp|tiff|webp)$' || echo "0")

        echo "**$photo_count fotos** (tamanho calculado durante execucao)" >> "$PLAN_FILE"
        echo "" >> "$PLAN_FILE"
        echo "Destino: \`02_Areas/media/fotos/YYYY/MM/\` (data via nome do arquivo → EXIF → data de modificacao)" >> "$PLAN_FILE"
        echo "" >> "$PLAN_FILE"

        echo "**Amostra (10 primeiras):**" >> "$PLAN_FILE"
        echo "" >> "$PLAN_FILE"
        echo "| Arquivo | Data detectada | Destino |" >> "$PLAN_FILE"
        echo "|---------|---------------|---------|" >> "$PLAN_FILE"

        local sample_count=0
        for photo in "$NAS/_PESS/_FOTOS_FULL"/*; do
            [ -f "$photo" ] || continue
            local pname
            pname=$(basename "$photo")
            [[ "$pname" == .DS_Store ]] && continue
            local date_path
            date_path=$(get_media_date "$photo")
            echo "| \`$pname\` | $date_path | \`02_Areas/media/fotos/$date_path/\` |" >> "$PLAN_FILE"
            sample_count=$((sample_count + 1))
            [ "$sample_count" -ge 10 ] && break
        done
    fi
    echo "" >> "$PLAN_FILE"

    # --- VIDEOS ---
    echo "## 5. Videos (_PESS/_VIDEOS_FULL)" >> "$PLAN_FILE"
    echo "" >> "$PLAN_FILE"

    local video_count=0
    if [ -d "$NAS/_PESS/_VIDEOS_FULL" ]; then
        video_count=$(ls -1 "$NAS/_PESS/_VIDEOS_FULL" 2>/dev/null | grep -ciE '\.(mp4|mov|avi|mkv|wmv|flv|webm)$' || echo "0")

        echo "**$video_count videos** (tamanho calculado durante execucao)" >> "$PLAN_FILE"
        echo "" >> "$PLAN_FILE"
        echo "Destino: \`02_Areas/media/videos/YYYY/\`" >> "$PLAN_FILE"
        echo "" >> "$PLAN_FILE"

        echo "**Amostra (5 primeiros):**" >> "$PLAN_FILE"
        echo "" >> "$PLAN_FILE"
        echo "| Arquivo | Data detectada | Destino |" >> "$PLAN_FILE"
        echo "|---------|---------------|---------|" >> "$PLAN_FILE"

        local sample_count=0
        for video in "$NAS/_PESS/_VIDEOS_FULL"/*; do
            [ -f "$video" ] || continue
            local vname
            vname=$(basename "$video")
            [[ "$vname" == .DS_Store ]] && continue
            local date_path
            date_path=$(get_media_date "$video")
            echo "| \`$vname\` | $date_path | \`02_Areas/media/videos/${date_path%%/*}/\` |" >> "$PLAN_FILE"
            sample_count=$((sample_count + 1))
            [ "$sample_count" -ge 5 ] && break
        done
    fi
    echo "" >> "$PLAN_FILE"

    # --- RESUMO ---
    {
        echo "---"
        echo ""
        echo "## Resumo do Plano"
        echo ""
        echo "| Metrica | Valor |"
        echo "|---------|-------|"
        echo "| Pastas mapeadas | $total_folders |"
        echo "| Fotos | ${photo_count} |"
        echo "| Videos | ${video_count} |"
        echo ""
        echo "> **IMPORTANTE:** Os originais em \`_PESS/\` e \`_WORK/\` NAO serao apagados."
        echo "> Apos verificar (\`./nas-migrate.sh verify\`), voce decide quando remover."
    } >> "$PLAN_FILE"

    log "Plano gerado: $PLAN_FILE"
    notify "Plano de migracao gerado"
    echo ""
    echo "Plano salvo em: $PLAN_FILE"
    echo "Fotos: $photo_count | Videos: $video_count | Pastas: $total_folders"
    echo ""
    echo "Proximo passo: revise o plano e execute:"
    echo "  ./nas-migrate.sh execute"
}

# ====================================================================
# COMANDO: EXECUTE
# ====================================================================

# ---- FASES INDIVIDUAIS ----

run_phase_folders() {
    log ""
    log "━━━ FASE 1/5: Pastas mapeadas ━━━"
    phase_start

    while IFS='|' read -r src dst; do
        if [ -d "$NAS/$src" ]; then
            log "  $src → $dst"
            safe_copy_dir "$NAS/$src" "$NAS/$dst"
        fi
    done <<< "$(get_folder_map)"

    phase_summary "Fase 1 (Pastas)"
    save_progress "folders"
}

run_phase_projects() {
    log ""
    log "━━━ FASE 2/5: Projetos ━━━"
    phase_start

    if [ -d "$NAS/_WORK/PROJETOS" ]; then
        for proj in "$NAS/_WORK/PROJETOS"/*/; do
            [ -d "$proj" ] || continue
            local pname
            pname=$(basename "$proj")
            log "  Projeto: $pname"
            safe_copy_dir "$proj" "$NAS/04_Archives/projetos/$pname"
        done
    fi

    phase_summary "Fase 2 (Projetos)"
    save_progress "projects"
}

run_phase_loose() {
    log ""
    log "━━━ FASE 3/5: Arquivos soltos ━━━"
    phase_start

    for file in "$NAS/_PESS"/*; do
        [ -f "$file" ] || continue
        local fname
        fname=$(basename "$file")
        [[ "$fname" == .DS_Store ]] && continue

        PHASE_FILES=$((PHASE_FILES + 1))
        TOTAL_FILES=$((TOTAL_FILES + 1))

        local ext="${fname##*.}"
        local dest="$NAS/04_Archives/legado"
        case "$ext" in
            pdf) dest="$NAS/04_Archives/legado/pdfs" ;;
            rar|zip|7z) dest="$NAS/04_Archives/legado/compactados" ;;
        esac

        safe_copy "$file" "$dest"
    done

    phase_summary "Fase 3 (Soltos)"
    save_progress "loose_files"
}

run_phase_photos() {
    log ""
    log "━━━ FASE 4/5: Fotos (pode demorar) ━━━"
    phase_start

    if [ -d "$NAS/_PESS/_FOTOS_FULL" ]; then
        local photo_total
        photo_total=$(ls -1 "$NAS/_PESS/_FOTOS_FULL" 2>/dev/null | grep -cvE '^\.' || echo "0")
        log "  $photo_total fotos para processar..."

        local photo_idx=0
        for photo in "$NAS/_PESS/_FOTOS_FULL"/*; do
            [ -f "$photo" ] || continue
            local pname
            pname=$(basename "$photo")
            [[ "$pname" == .DS_Store ]] && continue

            PHASE_FILES=$((PHASE_FILES + 1))
            TOTAL_FILES=$((TOTAL_FILES + 1))
            photo_idx=$((photo_idx + 1))

            local date_path
            date_path=$(get_media_date "$photo")
            safe_copy "$photo" "$NAS/02_Areas/media/fotos/$date_path"

            if [ $((photo_idx % 50)) -eq 0 ]; then
                local elapsed
                elapsed=$(elapsed_time "$PHASE_START")
                local speed
                speed=$(transfer_speed "$PHASE_BYTES" "$PHASE_START")
                log "  Fotos: $photo_idx/$photo_total | Copiadas: $PHASE_COPIED | Erros: $PHASE_ERRORS | $(human_size "$PHASE_BYTES") | $speed/s | $elapsed"
            fi
        done
    fi

    phase_summary "Fase 4 (Fotos)"
    save_progress "photos"
}

run_phase_videos() {
    log ""
    log "━━━ FASE 5/5: Videos ━━━"
    phase_start

    if [ -d "$NAS/_PESS/_VIDEOS_FULL" ]; then
        local video_total
        video_total=$(ls -1 "$NAS/_PESS/_VIDEOS_FULL" 2>/dev/null | grep -cvE '^\.' || echo "0")
        log "  $video_total videos para processar..."

        local video_idx=0
        for video in "$NAS/_PESS/_VIDEOS_FULL"/*; do
            [ -f "$video" ] || continue
            local vname
            vname=$(basename "$video")
            [[ "$vname" == .DS_Store ]] && continue

            PHASE_FILES=$((PHASE_FILES + 1))
            TOTAL_FILES=$((TOTAL_FILES + 1))
            video_idx=$((video_idx + 1))

            local date_path
            date_path=$(get_media_date "$video")
            local year="${date_path%%/*}"
            safe_copy "$video" "$NAS/02_Areas/media/videos/$year"

            if [ $((video_idx % 10)) -eq 0 ]; then
                local elapsed
                elapsed=$(elapsed_time "$PHASE_START")
                local speed
                speed=$(transfer_speed "$PHASE_BYTES" "$PHASE_START")
                log "  Videos: $video_idx/$video_total | Copiados: $PHASE_COPIED | $(human_size "$PHASE_BYTES") | $speed/s | $elapsed"
            fi
        done
    fi

    phase_summary "Fase 5 (Videos)"
    save_progress "completed"
}

# ---- GERAR RELATORIO FINAL ----

generate_report() {
    # === RELATORIO FINAL ===
    local total_elapsed
    total_elapsed=$(elapsed_time "$START_TIME")
    local total_speed
    total_speed=$(transfer_speed "$TOTAL_BYTES_COPIED" "$START_TIME")
    local success_rate=0
    if [ "$TOTAL_FILES" -gt 0 ]; then
        success_rate=$(( (TOTAL_COPIED + TOTAL_SKIPPED) * 100 / TOTAL_FILES ))
    fi

    log ""
    log "================================================================"
    log "MIGRACAO CONCLUIDA"
    log "================================================================"
    log "Arquivos processados:  $TOTAL_FILES"
    log "Copiados com sucesso:  $TOTAL_COPIED"
    log "Ja existiam (skip):    $TOTAL_SKIPPED"
    log "Erros:                 $TOTAL_ERRORS"
    log "Volume transferido:    $(human_size "$TOTAL_BYTES_COPIED")"
    log "Tempo total:           $total_elapsed"
    log "Velocidade media:      $total_speed/s"
    log "Taxa de sucesso:       $success_rate%"
    log "================================================================"

    # Gerar status rico
    cat > "$STATUS_FILE" << EOF
---
updated: $(date '+%Y-%m-%d %H:%M:%S')
status: completed
---

# Relatorio de Migracao — NAS

## Resumo

| Metrica | Valor |
|---------|-------|
| Data | $(date '+%Y-%m-%d %H:%M:%S') |
| Tempo total | $total_elapsed |
| Arquivos processados | $TOTAL_FILES |
| Copiados com sucesso | $TOTAL_COPIED |
| Ja existiam (skip) | $TOTAL_SKIPPED |
| Erros | $TOTAL_ERRORS |
| Volume transferido | $(human_size "$TOTAL_BYTES_COPIED") |
| Velocidade media | $total_speed/s |
| **Taxa de sucesso** | **$success_rate%** |

## Originais

\`_PESS/\` e \`_WORK/\` permanecem **INTACTOS**.

## Proximo passo

Verificar integridade:
\`\`\`bash
./nas-migrate.sh verify
\`\`\`

## Logs

- Log completo: \`_meta/migration.log\`
- Erros: \`_meta/migration-errors.log\`
- Progresso: \`_meta/migration-progress.json\`
EOF

    if [ "$TOTAL_ERRORS" -gt 0 ]; then
        echo "" >> "$STATUS_FILE"
        echo "## Erros encontrados" >> "$STATUS_FILE"
        echo "" >> "$STATUS_FILE"
        echo '```' >> "$STATUS_FILE"
        cat "$ERRORS_FILE" >> "$STATUS_FILE"
        echo '```' >> "$STATUS_FILE"
        notify "Migracao concluida com $TOTAL_ERRORS erros. Verifique o log."
    else
        notify "Migracao concluida com sucesso! $TOTAL_COPIED arquivos copiados."
    fi

    echo ""
    echo "Relatorio salvo em: $STATUS_FILE"
    echo ""
    echo "Para verificar integridade: ./nas-migrate.sh verify"
}

# ---- EXECUTOR PRINCIPAL ----

do_execute() {
    local phase_filter="${1:-all}"

    check_nas

    if [ ! -f "$PLAN_FILE" ] && [ "$phase_filter" = "all" ]; then
        echo "ERRO: Plano nao encontrado. Execute primeiro: ./nas-migrate.sh plan"
        exit 1
    fi

    mkdir -p "$META_DIR"
    [ ! -f "$ERRORS_FILE" ] && : > "$ERRORS_FILE"

    START_TIME=$(date +%s)

    log "================================================================"
    if [ "$phase_filter" = "all" ]; then
        log "MIGRACAO INICIADA (todas as fases)"
    else
        log "MIGRACAO INICIADA (fase: $phase_filter)"
    fi
    log "Modo: COPIA SEGURA (originais preservados)"
    log "================================================================"

    case "$phase_filter" in
        all)
            run_phase_folders
            run_phase_projects
            run_phase_loose
            run_phase_photos
            run_phase_videos
            ;;
        1|folders|pastas)
            run_phase_folders
            ;;
        2|projects|projetos)
            run_phase_projects
            ;;
        3|loose|soltos)
            run_phase_loose
            ;;
        4|photos|fotos)
            run_phase_photos
            ;;
        5|videos)
            run_phase_videos
            ;;
        *)
            echo "Fase desconhecida: $phase_filter"
            echo ""
            echo "Fases disponiveis:"
            echo "  1 ou pastas    — Pastas mapeadas (backups, podcasts, training, etc)"
            echo "  2 ou projetos  — Projetos (_WORK/PROJETOS)"
            echo "  3 ou soltos    — Arquivos soltos na raiz de _PESS"
            echo "  4 ou fotos     — Fotos (_PESS/_FOTOS_FULL) [mais demorada]"
            echo "  5 ou videos    — Videos (_PESS/_VIDEOS_FULL) [pesada]"
            echo "  all            — Todas as fases em sequencia"
            exit 1
            ;;
    esac

    generate_report
}

# ====================================================================
# COMANDO: VERIFY
# ====================================================================

do_verify() {
    check_nas
    log "Iniciando verificacao de integridade..."

    local verified=0
    local mismatched=0
    local missing=0
    local verify_start
    verify_start=$(date +%s)

    echo "Verificando integridade da migracao..."
    echo ""

    # Verificar pastas mapeadas
    echo "Fase 1: Pastas mapeadas..."
    while IFS='|' read -r src dst; do
        if [ -d "$NAS/$src" ]; then
            while IFS= read -r -d '' file; do
                local relpath="${file#$NAS/$src/}"
                local dst_file="$NAS/$dst/$relpath"

                if [ ! -f "$dst_file" ]; then
                    log_error "FALTANDO: $dst/$relpath (origem: $src/$relpath)"
                    missing=$((missing + 1))
                else
                    local src_size dst_size
                    src_size=$(stat -f%z "$file" 2>/dev/null || echo "0")
                    dst_size=$(stat -f%z "$dst_file" 2>/dev/null || echo "-1")
                    if [ "$src_size" != "$dst_size" ]; then
                        log_error "TAMANHO DIFERENTE: $dst/$relpath (src=$src_size dst=$dst_size)"
                        mismatched=$((mismatched + 1))
                    else
                        verified=$((verified + 1))
                    fi
                fi
            done < <(find "$NAS/$src" -type f ! -name '.DS_Store' -print0 2>/dev/null)
        fi
    done <<< "$(get_folder_map)"

    # Verificar fotos
    echo "Fase 2: Fotos..."
    if [ -d "$NAS/_PESS/_FOTOS_FULL" ]; then
        local photo_idx=0
        for photo in "$NAS/_PESS/_FOTOS_FULL"/*; do
            [ -f "$photo" ] || continue
            local pname
            pname=$(basename "$photo")
            [[ "$pname" == .DS_Store ]] && continue

            photo_idx=$((photo_idx + 1))

            local date_path
            date_path=$(get_media_date "$photo")
            local dst_file="$NAS/02_Areas/media/fotos/$date_path/$pname"

            if [ ! -f "$dst_file" ]; then
                missing=$((missing + 1))
            else
                local src_size dst_size
                src_size=$(stat -f%z "$photo" 2>/dev/null || echo "0")
                dst_size=$(stat -f%z "$dst_file" 2>/dev/null || echo "-1")
                if [ "$src_size" != "$dst_size" ]; then
                    mismatched=$((mismatched + 1))
                else
                    verified=$((verified + 1))
                fi
            fi

            if [ $((photo_idx % 200)) -eq 0 ]; then
                echo "  Fotos verificadas: $photo_idx (ok: $verified, faltando: $missing, divergente: $mismatched)"
            fi
        done
    fi

    # Verificar videos
    echo "Fase 3: Videos..."
    if [ -d "$NAS/_PESS/_VIDEOS_FULL" ]; then
        for video in "$NAS/_PESS/_VIDEOS_FULL"/*; do
            [ -f "$video" ] || continue
            local vname
            vname=$(basename "$video")
            [[ "$vname" == .DS_Store ]] && continue

            local date_path
            date_path=$(get_media_date "$video")
            local year="${date_path%%/*}"
            local dst_file="$NAS/02_Areas/media/videos/$year/$vname"

            if [ ! -f "$dst_file" ]; then
                missing=$((missing + 1))
            else
                local src_size dst_size
                src_size=$(stat -f%z "$video" 2>/dev/null || echo "0")
                dst_size=$(stat -f%z "$dst_file" 2>/dev/null || echo "-1")
                if [ "$src_size" != "$dst_size" ]; then
                    mismatched=$((mismatched + 1))
                else
                    verified=$((verified + 1))
                fi
            fi
        done
    fi

    local total=$((verified + missing + mismatched))
    local verify_elapsed
    verify_elapsed=$(elapsed_time "$verify_start")

    echo ""
    echo "================================================================"
    echo "VERIFICACAO DE INTEGRIDADE"
    echo "================================================================"
    echo "Arquivos verificados:  $total"
    echo "OK (tamanho igual):    $verified"
    echo "Faltando no destino:   $missing"
    echo "Tamanho divergente:    $mismatched"
    echo "Tempo:                 $verify_elapsed"

    if [ "$missing" -eq 0 ] && [ "$mismatched" -eq 0 ]; then
        echo ""
        echo "RESULTADO: TUDO OK — migracao integra."
        echo "Os originais podem ser removidos com seguranca quando voce decidir."
    else
        echo ""
        echo "RESULTADO: $((missing + mismatched)) problemas encontrados."
        echo "Execute novamente: ./nas-migrate.sh execute (retoma o que faltou)"
        echo "Detalhes em: $ERRORS_FILE"
    fi

    echo "================================================================"
    log "Verificacao: $verified ok, $missing faltando, $mismatched divergentes"
}

# ====================================================================
# COMANDO: STATUS
# ====================================================================

do_status() {
    check_nas

    if [ -f "$STATUS_FILE" ]; then
        cat "$STATUS_FILE"
    else
        echo "Nenhuma migracao executada ainda."
    fi

    echo ""
    echo "━━━ Espaco no NAS ━━━"
    echo ""

    if [ -d "$NAS/02_Areas" ]; then
        echo "Estrutura PARA (nova):"
        for dir in 01_Projects 02_Areas 03_Resources 04_Archives; do
            if [ -d "$NAS/$dir" ]; then
                local dsize
                dsize=$(du -sh "$NAS/$dir" 2>/dev/null | awk '{print $1}')
                printf "  %-20s %s\n" "$dir/" "$dsize"
            fi
        done
    fi

    echo ""
    echo "Legado (originais intactos):"
    for dir in _PESS _WORK; do
        if [ -d "$NAS/$dir" ]; then
            local dsize
            dsize=$(du -sh "$NAS/$dir" 2>/dev/null | awk '{print $1}')
            printf "  %-20s %s\n" "$dir/" "$dsize"
        fi
    done

    echo ""

    # Progresso se existir
    if [ -f "$PROGRESS_FILE" ]; then
        echo "━━━ Ultimo progresso ━━━"
        echo ""
        local phase copied errors bytes updated
        phase=$(python3 -c "import json; print(json.load(open('$PROGRESS_FILE'))['phase'])" 2>/dev/null || echo "?")
        copied=$(python3 -c "import json; print(json.load(open('$PROGRESS_FILE'))['total_copied'])" 2>/dev/null || echo "?")
        errors=$(python3 -c "import json; print(json.load(open('$PROGRESS_FILE'))['total_errors'])" 2>/dev/null || echo "?")
        bytes=$(python3 -c "import json; print(json.load(open('$PROGRESS_FILE'))['total_bytes'])" 2>/dev/null || echo "0")
        updated=$(python3 -c "import json; print(json.load(open('$PROGRESS_FILE'))['updated'])" 2>/dev/null || echo "?")
        echo "  Fase: $phase"
        echo "  Copiados: $copied"
        echo "  Erros: $errors"
        echo "  Volume: $(human_size "$bytes")"
        echo "  Atualizado: $updated"
    fi

    # Erros se existirem
    if [ -f "$ERRORS_FILE" ] && [ -s "$ERRORS_FILE" ]; then
        local error_count
        error_count=$(wc -l < "$ERRORS_FILE" | tr -d ' ')
        echo ""
        echo "━━━ Erros ($error_count) ━━━"
        echo ""
        tail -10 "$ERRORS_FILE"
        if [ "$error_count" -gt 10 ]; then
            echo "  ... ($((error_count - 10)) mais em $ERRORS_FILE)"
        fi
    fi

    echo ""
    echo "Comandos disponiveis:"
    echo "  ./nas-migrate.sh plan      Gerar/atualizar plano"
    echo "  ./nas-migrate.sh execute   Executar migracao"
    echo "  ./nas-migrate.sh verify    Verificar integridade"
    echo "  ./nas-migrate.sh resume    Retomar migracao interrompida"
    echo "  ./nas-migrate.sh status    Este relatorio"
}

# ====================================================================
# COMANDO: RESUME
# ====================================================================

do_resume() {
    echo "Retomando migracao..."
    echo "Arquivos ja copiados sao ignorados (cp -n)."
    echo ""
    do_execute "all"
}

# ====================================================================
# MAIN
# ====================================================================

show_execute_header() {
    local phase="${1:-all}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  MIGRACAO NAS → Estrutura PARA"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "Modo: COPIA SEGURA (originais preservados)"
    if [ "$phase" != "all" ]; then
        echo "Fase selecionada: $phase"
    fi
    echo ""
    echo "Interromper: Ctrl+C (retome com: ./nas-migrate.sh resume)"
    echo ""
}

case "${1:-help}" in
    plan)
        do_plan
        ;;
    execute)
        show_execute_header "${2:-all}"
        read -p "Continuar? (s/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Ss]$ ]]; then
            do_execute "${2:-all}"
        else
            echo "Cancelado."
        fi
        ;;
    verify)
        do_verify
        ;;
    resume)
        do_resume
        ;;
    status)
        do_status
        ;;
    *)
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "  NAS Migration Tool — Opensquad"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        echo "Uso:"
        echo "  ./nas-migrate.sh plan             Gera plano (nao copia nada)"
        echo "  ./nas-migrate.sh execute          Executa TODAS as fases"
        echo "  ./nas-migrate.sh execute <fase>   Executa UMA fase especifica"
        echo "  ./nas-migrate.sh verify           Verifica integridade"
        echo "  ./nas-migrate.sh resume           Retoma migracao interrompida"
        echo "  ./nas-migrate.sh status           Mostra progresso e metricas"
        echo ""
        echo "Fases disponiveis:"
        echo "  1 | pastas    Pastas mapeadas (backups, podcasts, training)"
        echo "  2 | projetos  Projetos (_WORK/PROJETOS)"
        echo "  3 | soltos    Arquivos soltos na raiz de _PESS"
        echo "  4 | fotos     Fotos — _PESS/_FOTOS_FULL [mais demorada]"
        echo "  5 | videos    Videos — _PESS/_VIDEOS_FULL [mais pesada]"
        echo "  all           Todas as fases em sequencia (padrao)"
        echo ""
        echo "Exemplos:"
        echo "  ./nas-migrate.sh execute pastas    # So pastas mapeadas"
        echo "  ./nas-migrate.sh execute fotos     # So fotos"
        echo "  ./nas-migrate.sh execute           # Tudo"
        echo ""
        echo "Os originais NUNCA sao apagados."
        echo ""
        echo "Fluxo recomendado:"
        echo "  1. plan              → revise o plano"
        echo "  2. execute pastas    → rapido, testar se funciona"
        echo "  3. execute projetos  → medio"
        echo "  4. execute soltos    → rapido"
        echo "  5. execute fotos     → demorado (rodar quando tiver tempo)"
        echo "  6. execute videos    → pesado (rodar quando tiver tempo)"
        echo "  7. verify            → confere integridade"
        echo "  8. status            → relatorio final"
        ;;
esac
