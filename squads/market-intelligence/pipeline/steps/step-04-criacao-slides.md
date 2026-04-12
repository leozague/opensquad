---
execution: inline
agent: market-intelligence/agents/diego-dashboard
inputFile: squads/market-intelligence/output/analysis-report.md
outputFile: squads/market-intelligence/output/slide-deck.html
---

# Step 04: Criação do Slide Deck

## Context Loading

Load these files before executing:
- `squads/market-intelligence/output/analysis-report.md` — análise completa de Ana com sumário, insights e recomendações
- `squads/market-intelligence/pipeline/data/output-examples.md` — exemplo completo de slide deck HTML de referência
- `squads/market-intelligence/pipeline/data/quality-criteria.md` — critérios que Vera usará para revisar o deck
- `squads/market-intelligence/pipeline/data/anti-patterns.md` — erros de design a evitar

## Instructions

### Process

1. **Ler analysis-report.md** — extrair: título-conclusão para capa, 3 bullets do sumário executivo, KPIs principais, 4-6 insights com "Isso significa:", 3-5 recomendações priorizadas
2. **Definir título da capa** — deve ser um título-conclusão que comunica o insight mais crítico: não "Análise de Mercado", mas "Janela de 6 Meses Antes da Comoditização de RAG"
3. **Planejar estrutura**: Capa → Sumário Executivo → KPIs (máx 8) → Insights (1-2 por slide) → Recomendações
4. **Escrever todos os títulos-conclusão antes de qualquer HTML** — testar: "o executivo sabe o que concluir só pelo título?"
5. **Gerar HTML completo** com CSS inline, paleta OMK, hierarquia visual clara
6. **Autoteste**: ler apenas os títulos dos slides em sequência — formam uma narrativa coerente?

## Output Format

Arquivo HTML completo e autossuficiente:

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>[título-conclusão principal]</title>
  <style>
    /* CSS 100% inline — sem link ou src externos */
    /* Paleta: #0b1120 (navy), #22d3ee (cyan), #3b82f6 (azul) */
    body { font-family: 'Inter', 'Segoe UI', sans-serif; background: #0b1120; color: #e2e8f0; margin: 0; }
    .slide { min-height: 100vh; padding: 64px 80px; ... }
    /* [CSS completo] */
  </style>
</head>
<body>
  <!-- Slide 1: CAPA — título-conclusão + 2-3 KPIs macro -->
  <!-- Slide 2: SUMÁRIO EXECUTIVO — 3 bullets autossuficientes -->
  <!-- Slide 3: KPIs PRINCIPAIS — máx 8 com comparativos visuais -->
  <!-- Slides 4-N: INSIGHTS — 1-2 por slide com título-conclusão -->
  <!-- Slide Final: RECOMENDAÇÕES — priorizadas com badges ALTA/MÉDIA/BAIXA -->
</body>
</html>
```

## Output Example

Ver `pipeline/data/output-examples.md` para exemplo HTML de 200+ linhas com:
- Capa com KPIs macro e título-conclusão
- Slide de sumário executivo com bullet list
- Slide de KPIs com grid de cards
- Slide de insights com insight-cards estilizados
- Slide de recomendações com rec-cards e badges de prioridade

## Veto Conditions

Reject and redo if ANY of these are true:
1. Qualquer slide tem título genérico (não-conclusão): "Análise", "Insights", "Recomendações", "KPIs", "Dados"
2. HTML tem dependência externa que impede renderização offline (`<link href="https://...">` ou `<img src="https://...">`)

## Quality Criteria

- [ ] Todos os slides com título-conclusão verificado por autoteste
- [ ] Capa tem tema, marca OMK relevante e data
- [ ] Sumário executivo reproduz os 3 bullets do analysis-report
- [ ] Máximo 8 KPIs no slide executivo
- [ ] HTML autossuficiente sem dependências externas
- [ ] Paleta OMK: navy `#0b1120`, cyan `#22d3ee`, azul `#3b82f6`
- [ ] Recomendações com badges visuais de prioridade
