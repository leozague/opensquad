---
execution: subagent
agent: researcher
inputFile: squads/overmind-carrossel/output/research-focus.md
outputFile: squads/overmind-carrossel/output/research-results.md
model_tier: powerful
---

# Step 02: Pesquisa de Notícias

## Context Loading

Load these files before executing:
- `squads/overmind-carrossel/output/research-focus.md` — tema e período definidos pelo usuário
- `_opensquad/_memory/brands/overmind.md` — contexto da marca e público-alvo
- `squads/overmind-carrossel/pipeline/data/research-brief.md` — referência de domínio

## Instructions

### Process
1. Ler o foco de pesquisa (tema + período) do arquivo de input.
2. Executar a task `find-and-rank-news.md` do agente Nico Notícia.
3. Buscar notícias usando web_search e web_fetch conforme o processo definido na task.
4. Filtrar por relevância para o público Overmind (CEOs/COOs de PMEs).
5. Rankear top 3-5 notícias por potencial de hook + dado âncora + frescor.
6. Salvar resultado formatado no outputFile.

## Output Format

```yaml
research_date: "YYYY-MM-DD"
focus: "tema pesquisado"
period: "período temporal"
results:
  - rank: 1
    title: "Título"
    source: "Fonte"
    url: "URL"
    date: "YYYY-MM-DD"
    anchor_data: "Dado principal"
    summary: "Resumo 2-3 frases"
    hook_potential: "Justificativa 1 frase"
```

## Output Example

```yaml
research_date: "2026-04-09"
focus: "IA no atendimento ao cliente"
period: "últimos 7 dias"
results:
  - rank: 1
    title: "Zendesk reporta que empresas com IA no suporte viram NPS subir 34%"
    source: "Zendesk CX Trends Report 2026"
    url: "https://zendesk.com/cx-trends-2026"
    date: "2026-04-07"
    anchor_data: "NPS subiu 34% em empresas que implementaram IA no atendimento"
    summary: "Relatório anual da Zendesk mostra que empresas com IA conversacional no suporte tiveram aumento de 34% no NPS e redução de 47% no tempo médio de resposta."
    hook_potential: "Dado concreto sobre ROI direto de IA. Provoca CEO que ainda não automatizou."
  - rank: 2
    title: "Salesforce: 73% esperam resposta em menos de 5 minutos"
    source: "Salesforce State of Service 2026"
    url: "https://salesforce.com/state-of-service"
    date: "2026-04-05"
    anchor_data: "73% esperam < 5 min; PMEs BR entregam 47 min"
    summary: "Gap crescente entre expectativa e capacidade. Brasil com maior discrepância."
    hook_potential: "Contraste 5 min vs 47 min. Visual e provocativo."
```

## Veto Conditions

Reject and redo if ANY are true:
1. Menos de 3 notícias rankeadas
2. Alguma notícia sem URL ou fonte verificável

## Quality Criteria

- [ ] 3-5 notícias com todos os campos preenchidos
- [ ] Dados âncora concretos em cada notícia
- [ ] Período temporal respeitado
- [ ] Diversidade de sub-temas
