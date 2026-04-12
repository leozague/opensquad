# Step 02 — Análise do Git Diff

## Agente
Git Arqueóloga (subagent)

## Objetivo
Analisar o que foi realmente implementado na branch comparando com `develop`, e produzir um relatório estruturado de mudanças por camada.

## Comandos a executar

```bash
# Navegar para o projeto
cd {project_root}

# Commits da branch
git log develop..{branch} --oneline

# Arquivos alterados
git diff develop...{branch} --stat

# Diff completo (para análise)
git diff develop...{branch}
```

## Análise a produzir

Com base no diff, classificar as mudanças por camada:

### API (novos ou alterados endpoints)
- Listar endpoints adicionados/modificados/removidos
- Identificar breaking changes

### Backend (módulos, services, entities)
- Novos módulos criados
- Entities adicionadas ou alteradas (DB schema changes)
- Services e use-cases modificados

### Frontend (views, stores, components)
- Novas telas ou componentes
- Stores modificados
- Rotas adicionadas

### Database
- Migrations criadas
- Schema changes

### Infra / Config
- Docker, CI/CD, variáveis de ambiente

## Output para Doc Sintetizador
Relatório estruturado com:
- Lista de commits (mensagens)
- Mudanças por camada (API, Backend, Frontend, DB, Infra)
- Versão sugerida (PATCH se bugfix, MINOR se feature, MAJOR se breaking)
- Novas variáveis de ambiente necessárias (se houver)
