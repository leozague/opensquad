# Step 01 — Checkpoint: Projeto e Feature

## Tipo
checkpoint

## Objetivo
Identificar projeto, feature concluída e branch de desenvolvimento.

## Perguntas

**Pergunta 1:** Qual projeto foi desenvolvido?
Opções: ler `_opensquad/_memory/projects/_index.md` e listar projetos com status `ativo`.

**Pergunta 2:** Qual feature foi concluída?
Ler `{docs_path}/in-progress/_index.md` e listar features em andamento.
Opção adicional: "Feature não está no in-progress" (caso tenha sido hotfix ou trabalho ad-hoc).

**Pergunta 3:** Qual branch foi desenvolvida?
Exemplos:
- `feature/nome-da-feature`
- `fix/nome-do-bug`
- `hotfix/nome`

## Verificação de Status de Kickoff

Após receber projeto + feature, verificar se existe `.kickoff-status.md`:

```
{docs_path}/in-progress/{feature_slug}/.kickoff-status.md
```

**Se existir e `status: done`:**
- Exibir resumo: `completed_at`, `tasks_completed`, `notes`
- Perguntar se quer prosseguir com o dev-finalize

**Se existir e `status` for outro:**
- Alertar que a implementação pode não ter sido concluída
- Perguntar se quer prosseguir mesmo assim

**Se não existir:**
- Informar que não há registro de kickoff automático (pode ser trabalho manual)
- Prosseguir normalmente

## Output
Passar para Git Arqueóloga:
- `projeto`: código do projeto
- `feature_slug`: slug da feature
- `branch`: nome da branch
- `project_root`: caminho local do código (ex: `/Users/macbookpro/Documents/FONTES/GOLD/gold-letras`)
- `docs_path`: caminho da documentação (`_THOTH/01_Projects/{projeto}`)
- `kickoff_status`: done | incomplete | not_found
