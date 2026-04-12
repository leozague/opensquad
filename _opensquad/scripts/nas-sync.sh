#!/bin/bash
# nas-sync.sh — Transfere arquivos pendentes para o NAS quando disponível
# Executado via cron a cada 30 minutos
# Configuração: _opensquad/_memory/nas-config.md

set -euo pipefail

# === CONFIGURAÇÃO ===
NAS_ROOT="/Volumes/data"
PENDING_DIR="/Users/macbookpro/Documents/_THOTH/00_Inbox/_pending-nas"
LOG_FILE="/Users/macbookpro/Documents/_THOTH/_opensquad/_opensquad/scripts/nas-sync.log"
THOTH_ROOT="/Users/macbookpro/Documents/_THOTH"

# === FUNÇÕES ===
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') — $1" >> "$LOG_FILE"
}

notify() {
    # Notificação macOS nativa
    osascript -e "display notification \"$1\" with title \"Opensquad NAS Sync\"" 2>/dev/null || true
}

# === VERIFICAÇÕES ===

# 1. Tem arquivos pendentes?
if [ ! -d "$PENDING_DIR" ] || [ -z "$(ls -A "$PENDING_DIR" 2>/dev/null)" ]; then
    # Nada pendente, sair silenciosamente
    exit 0
fi

PENDING_COUNT=$(find "$PENDING_DIR" -type f ! -name '.gitkeep' ! -name '.DS_Store' | wc -l | tr -d ' ')
if [ "$PENDING_COUNT" -eq 0 ]; then
    exit 0
fi

# 2. NAS está montado?
if [ ! -d "$NAS_ROOT" ]; then
    log "NAS offline. $PENDING_COUNT arquivo(s) pendente(s)."
    exit 0
fi

# === TRANSFERÊNCIA ===
log "NAS online. Iniciando transferência de $PENDING_COUNT arquivo(s)..."
TRANSFERRED=0
FAILED=0

for file in "$PENDING_DIR"/*; do
    [ -f "$file" ] || continue
    filename=$(basename "$file")

    # Ignorar arquivos de controle
    [[ "$filename" == .gitkeep ]] && continue
    [[ "$filename" == .DS_Store ]] && continue

    # Ler o arquivo .meta (JSON com destino) se existir
    meta_file="${file}.meta"
    if [ -f "$meta_file" ]; then
        dest_subpath=$(python3 -c "import json; print(json.load(open('$meta_file'))['nas_path'])" 2>/dev/null || echo "")
        note_path=$(python3 -c "import json; print(json.load(open('$meta_file'))['note_path'])" 2>/dev/null || echo "")
    else
        # Sem meta: usar pasta genérica
        dest_subpath="pessoal/documentos/diversos"
        note_path=""
    fi

    # Criar diretório destino no NAS se necessário
    dest_dir="$NAS_ROOT/$dest_subpath"
    mkdir -p "$dest_dir" 2>/dev/null || {
        log "ERRO: Não conseguiu criar $dest_dir"
        FAILED=$((FAILED + 1))
        continue
    }

    # Copiar arquivo
    if cp "$file" "$dest_dir/$filename" 2>/dev/null; then
        # Verificar integridade (tamanho)
        src_size=$(stat -f%z "$file" 2>/dev/null || echo "0")
        dst_size=$(stat -f%z "$dest_dir/$filename" 2>/dev/null || echo "-1")

        if [ "$src_size" = "$dst_size" ]; then
            # Sucesso: remover original e meta
            rm "$file"
            [ -f "$meta_file" ] && rm "$meta_file"

            # Atualizar nota no vault (trocar pending-transfer por caminho real)
            if [ -n "$note_path" ] && [ -f "$note_path" ]; then
                sed -i '' "s|storage_status: pending-transfer|storage: truenas|" "$note_path" 2>/dev/null
                sed -i '' "s|pending_path:.*|path: \"$dest_subpath/$filename\"|" "$note_path" 2>/dev/null
            fi

            TRANSFERRED=$((TRANSFERRED + 1))
            log "OK: $filename → $dest_subpath/"
        else
            log "ERRO: Tamanho diferente para $filename (src=$src_size, dst=$dst_size)"
            FAILED=$((FAILED + 1))
            # Não remove o original — manter para retry
            rm "$dest_dir/$filename" 2>/dev/null
        fi
    else
        log "ERRO: Falha ao copiar $filename para $dest_dir/"
        FAILED=$((FAILED + 1))
    fi
done

# === RELATÓRIO ===
log "Concluído: $TRANSFERRED transferido(s), $FAILED falha(s)."

if [ "$TRANSFERRED" -gt 0 ]; then
    notify "$TRANSFERRED arquivo(s) transferido(s) para o NAS"
fi

if [ "$FAILED" -gt 0 ]; then
    notify "ATENÇÃO: $FAILED arquivo(s) falharam na transferência"
fi
