---
execution: inline
agent: dev-bootstrap/agents/andre-arquitetura
inputFile: squads/dev-bootstrap/output/input-params.yaml
outputFile: squads/dev-bootstrap/output/sdd-plan.md
---

# Step 04: Analyze and Plan (SDD)

## Context Loading

Load these files before executing:
- `squads/dev-bootstrap/output/input-params.yaml` — parametros do projeto
- Arquivo de planejamento em `input-params.yaml → planning.main_file`
- Arquivos de referencia em `input-params.yaml → planning.references` (se houver)
- `squads/dev-bootstrap/pipeline/data/doc-cache/` — todos os arquivos de cache de docs
- `squads/dev-bootstrap/output/research-brief.md` — pesquisa de mercado (se existir)
- `_opensquad/_memory/ports-registry.md` — registro de portas
- `squads/dev-bootstrap/pipeline/data/domain-framework.md` — framework SDD
- `squads/dev-bootstrap/pipeline/data/quality-criteria.md` — criterios de qualidade
- `squads/dev-bootstrap/pipeline/data/anti-patterns.md` — anti-patterns

## Instructions

### Process
1. Executar task `analyze-planning.md`: ler planejamento, extrair requisitos, validar stack contra docs
2. Executar task `generate-sdd-specs.md`: quebrar em modulos, gerar specs, ordenar por dependencia
3. Executar task `design-architecture.md`: definir repo, deploy, portas, consolidar em sdd-plan.md
4. O output final e `sdd-plan.md` — documento unico e completo que servira de blueprint para o Bruno Bootstrap

### Criterios de Decisao
- Se a stack tem incompatibilidades detectadas: reportar ao usuario no checkpoint seguinte
- Se o planejamento tem ambiguidades: anotar como "decisao pendente" para o checkpoint
- Se o planejamento referencia tecnologias sem versao: usar a versao mais recente estavel da doc cache

## Output Format

O `sdd-plan.md` deve conter todas as secoes definidas na task `design-architecture.md`:
- Visao Geral
- Portas Atribuidas
- Arquitetura de Repositorio
- Estrutura de Pastas
- Stack Validada
- Banco de Dados
- Specs dos Modulos (com interfaces, arquivos, testes, acceptance criteria)
- Estrategia de Testes
- Pipeline de Deploy
- Checklist de Entrega

## Output Example

Ver exemplo na task `design-architecture.md` do agente Andre Arquitetura.

## Veto Conditions

Rejeitar e refazer se:
1. Modulos sem specs detalhados (apenas nomes sem interfaces/arquivos/testes)
2. Portas conflitantes com projetos existentes no port registry

## Quality Criteria

- [ ] Todos os requisitos do planejamento mapeados em modulos
- [ ] Specs com interfaces, arquivos, testes e acceptance criteria
- [ ] Ordem de execucao respeita dependencias
- [ ] Stack validada contra doc cache
- [ ] Portas registradas sem conflito
- [ ] Pipeline de deploy definido
