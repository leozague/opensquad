---
execution: subagent
agent: dev-bootstrap/agents/diana-docs
inputFile: squads/dev-bootstrap/output/input-params.yaml
model_tier: fast
---

# Step 03: Fetch Framework Docs

## Context Loading

Load these files before executing:
- `squads/dev-bootstrap/output/input-params.yaml` — parametros do projeto (stack, frameworks, versoes)
- Arquivo de planejamento referenciado em `input-params.yaml → planning.main_file`

## Instructions

### Process
1. Ler `input-params.yaml` e o arquivo de planejamento para extrair a lista completa de frameworks/libs com versoes
2. Para cada framework/lib, executar a task `fetch-framework-docs.md` do agente Diana Docs
3. Salvar cada cache em `pipeline/data/doc-cache/{framework}-{version}.md`
4. Se alguma doc nao for encontrada, reportar como gap

### Paralelismo
As buscas de documentacao podem ser feitas em paralelo (uma WebFetch por framework).

## Output Format

Um arquivo `.md` por framework em `pipeline/data/doc-cache/`, seguindo o formato definido na task do agente.

## Output Example

Ver exemplo completo na task `fetch-framework-docs.md` do agente Diana Docs.

## Veto Conditions

Rejeitar e refazer se:
1. Framework do planejamento sem arquivo de cache gerado (a menos que doc nao exista online — neste caso, reportar gap)
2. Versao no cache diferente da versao no planejamento

## Quality Criteria

- [ ] Um arquivo de cache por framework/lib do planejamento
- [ ] Versao exata correspondente ao planejamento
- [ ] URLs fonte e data de acesso presentes
- [ ] Exemplos de codigo da doc oficial
