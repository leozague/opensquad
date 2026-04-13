---
execution: subagent
agent: dev-bootstrap/agents/pablo-pesquisa
inputFile: squads/dev-bootstrap/output/input-params.yaml
outputFile: squads/dev-bootstrap/output/research-brief.md
model_tier: fast
---

# Step 02: Market Research (Opcional)

## Context Loading

Load these files before executing:
- `squads/dev-bootstrap/output/input-params.yaml` — parametros do projeto (nome, descricao, segmento)
- `_opensquad/_memory/company.md` — contexto da empresa

## Instructions

### Process
1. Ler `input-params.yaml` para extrair nome do software, descricao e segmento
2. Executar a task `market-research.md` do agente Pablo Pesquisa
3. Salvar output em `research-brief.md`

Este step so executa se `input-params.yaml → market_research == true`.
Se `market_research == false`, o pipeline runner pula este step automaticamente.

## Output Format

O output segue o formato definido na task `market-research.md` do agente Pablo Pesquisa:
- Analise de segmento com tamanho de mercado
- Tabela comparativa de concorrentes
- Tendencias com timeline
- Gaps e oportunidades
- Fontes citadas

## Output Example

Ver exemplo completo na task `market-research.md` do agente Pablo Pesquisa.

## Veto Conditions

Rejeitar e refazer se:
1. Menos de 3 concorrentes analisados
2. Fontes nao citadas ou inexistentes

## Quality Criteria

- [ ] Pesquisa focada no segmento do software (nao generica)
- [ ] Concorrentes com comparativo de features
- [ ] Insights acionaveis para decisoes de produto
