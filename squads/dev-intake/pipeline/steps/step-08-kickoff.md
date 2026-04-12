# Step 08 — Kickoff Automatico

## Objetivo

Abrir o Ghostty com o Claude Code rodando no projeto e implementando o spec aprovado.

## Processo

### 1. Determinar nome da branch

Padrao por tipo:
- Feature nova: `feature/{slug}`
- Correcao de bug: `fix/{slug}`
- Hotfix urgente: `hotfix/{slug}`

### 2. Escrever o script de kickoff

Salvar em `/tmp/opensquad-kickoff-{slug}.sh`:

```bash
#!/bin/bash
set -e

echo "=== Opensquad Kickoff: {titulo} ==="
echo ""

cd {project_root}

echo "Preparando branch {branch}..."
git checkout develop
git pull origin develop
git checkout -b {branch} 2>/dev/null || git checkout {branch}

echo ""
echo "Iniciando Claude Code..."
echo ""

claude --dangerously-skip-permissions "$(cat '{docs_path}/in-progress/{slug}/.kickoff-prompt.md')"
```

Tornar executavel:
```bash
chmod +x /tmp/opensquad-kickoff-{slug}.sh
```

### 3. Escrever o prompt de kickoff

Salvar em `{docs_path}/in-progress/{slug}/.kickoff-prompt.md`:

```
Voce e um desenvolvedor implementando a feature abaixo. Siga as instrucoes exatamente.

## Feature

Titulo: {titulo}
Branch: {branch}

Leia o spec completo em:
{docs_path}/in-progress/{slug}/spec.md

Leia o briefing em:
{docs_path}/in-progress/{slug}/briefing.md

## Instrucoes de execucao

1. Leia o CLAUDE.md deste projeto (ja estamos na pasta correta)
2. Leia {docs_path}/.specs/codebase/PATTERNS.md — siga os padroes sem excecao
3. Leia {docs_path}/.specs/codebase/STACK.md — antes de usar qualquer biblioteca, consulte a doc da versao instalada via WebFetch
4. A branch {branch} ja foi criada — voce ja esta nela
5. Implemente as tasks do spec em ordem:
   - Uma task por vez
   - Um commit por task concluida (mensagem descritiva, sem referencias a IA ou ferramentas)
   - Revise e teste cada task antes de passar para a proxima
6. Ao finalizar todas as tasks:
   - Confirme que os cenarios de teste do spec estao passando
   - Escreva o arquivo de status: `{docs_path}/in-progress/{slug}/.kickoff-status.md`
     Conteudo exato:
     ```
     status: done
     completed_at: [data e hora atual]
     branch: {branch}
     tasks_completed: [numero de tasks]
     notes: [observacoes relevantes sobre a implementacao]
     ```
   - Informe ao usuario que o arquivo de status foi escrito e que o dev-finalize pode ser rodado

## Regras inviolaveis

- NUNCA commitar para main ou develop diretamente
- NUNCA referenciar IA, Claude, Copilot ou agentes em commits, PRs, titulos ou codigo
- NUNCA rodar comandos destrutivos em banco de producao sem autorizacao explicita
- Commits atomicos — um por task do spec
- Sem emojis em arquivos de codigo
- Sem console.log ou debug code nos commits
```

### 4. Abrir Ghostty com o script

```bash
GHOSTTY="/Applications/Ghostty.app/Contents/MacOS/ghostty"
SCRIPT="/tmp/opensquad-kickoff-{slug}.sh"

if [ -f "$GHOSTTY" ]; then
  "$GHOSTTY" -e "$SCRIPT"
elif command -v ghostty &>/dev/null; then
  ghostty -e "$SCRIPT"
else
  # Fallback: iTerm2
  osascript -e "tell application \"iTerm2\" to create window with default profile command \"$SCRIPT\""
fi
```

### 5. Confirmar ao usuario

```
Ghostty aberto! Claude Code iniciando a implementacao.

Projeto:  {project_name}
Branch:   {branch}
Spec:     {docs_path}/in-progress/{slug}/spec.md

Acompanhe no Ghostty.
Ao concluir: /opensquad run dev-finalize
```

## Observacoes

- `.kickoff-prompt.md` comeca com ponto — ignorado pelo git se `.gitignore` tiver `.**`
- O script `/tmp/opensquad-kickoff-{slug}.sh` e temporario — deletado pelo OS automaticamente
- Se Ghostty nao estiver instalado: fallback automatico para iTerm2
