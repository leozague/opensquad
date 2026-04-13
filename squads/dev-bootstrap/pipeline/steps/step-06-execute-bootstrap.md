---
execution: inline
agent: dev-bootstrap/agents/bruno-bootstrap
inputFile: squads/dev-bootstrap/output/sdd-plan.md
outputFile: squads/dev-bootstrap/output/build-log.md
---

# Step 06: Execute Bootstrap

## Context Loading

Load these files before executing:
- `squads/dev-bootstrap/output/sdd-plan.md` — plano SDD completo (fonte de verdade)
- `squads/dev-bootstrap/output/input-params.yaml` — parametros (caminho, credenciais, servidor)
- `squads/dev-bootstrap/pipeline/data/doc-cache/` — docs cacheadas dos frameworks
- `squads/dev-bootstrap/pipeline/data/anti-patterns.md` — erros a evitar
- `_opensquad/_memory/ports-registry.md` — portas atribuidas

## Instructions

### Process
1. Executar task `scaffold-project.md`:
   - Criar estrutura do projeto no caminho definido
   - Instalar deps nas versoes exatas
   - Configurar linting, formatting, git
   - Criar .env com credenciais e portas
2. Executar task `implement-tasks.md`:
   - Implementar cada modulo na ordem do spec
   - Commit atomico ao concluir cada modulo
   - Consultar doc-cache antes de usar APIs
   - **INTERROMPER e perguntar ao usuario** se surgir decisao nao prevista
3. Executar task `setup-deploy.md`:
   - Gerar Dockerfile multi-stage
   - Gerar docker-compose.yml para Easypanel
   - Configurar GitHub Actions CI/CD
4. Executar task `setup-github.md`:
   - Criar repo privado no KansaiTechHouse
   - Push do codigo
5. Atualizar `build-log.md` com progresso e status final
6. Registrar o projeto no `ports-registry.md` com as portas atribuidas

### Regras de Interrupcao
O agente DEVE interromper e perguntar ao usuario quando:
- Encontrar ambiguidade no spec que afeta a implementacao
- Precisar escolher entre padroes/abordagens nao definidos no spec
- Encontrar incompatibilidade entre dependencias
- Qualquer decisao que altere significativamente a arquitetura

### Regras Inviolaveis
- NUNCA commitar para main sem instrucao explicita
- NUNCA referenciar IA/Claude em commits ou codigo
- NUNCA hardcode de credenciais
- NUNCA Docker para ambiente local (apenas para deploy stack)
- Usar portas do port registry, nunca aleatorias

## Output Format

O output e `build-log.md` com status de cada modulo, commits, testes, e interrupcoes.
Ver formato na task `implement-tasks.md`.

## Output Example

Ver exemplo na task `implement-tasks.md` do agente Bruno Bootstrap.

## Veto Conditions

Rejeitar e refazer se:
1. Modulo commitado com testes falhando
2. Decisao arquitetural tomada sem consultar o usuario
3. Credenciais hardcoded no codigo

## Quality Criteria

- [ ] Todos os modulos do spec implementados
- [ ] Commits atomicos por modulo
- [ ] Projeto roda em localhost
- [ ] Docker stack gerado
- [ ] Repo criado e pushado no GitHub
- [ ] Port registry atualizado
