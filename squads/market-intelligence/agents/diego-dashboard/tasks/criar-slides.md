---
task: "Criar Slides"
order: 1
input: |
  - analysis_report: Relatório de análise completo de Ana Analítica
  - output_examples: Exemplos de decks anteriores para referência de qualidade
output: |
  - slide_deck: Arquivo HTML autossuficiente com slide deck executivo completo
---

# Criar Slides

Transforma o relatório de análise em um slide deck executivo HTML com visual profissional, hierarquia clara e narrativa de dados coerente.

## Process

1. Ler `analysis-report.md` completamente — identificar: sumário executivo (3 bullets), KPIs principais, insights (3-6), recomendações (3-5)
2. Definir o título da capa — deve ser um título-conclusão que resume o insight mais crítico da análise (não o tema genérico)
3. Planejar estrutura de slides: Capa → Sumário Executivo → KPIs Principais → Insights → Recomendações (→ Próximos Passos se aplicável)
4. Para cada slide, escrever o título-conclusão antes de qualquer outra coisa — testar: "o executivo sabe o que concluir só pelo título?"
5. Selecionar máximo 8 KPIs para o slide de dados — mover os demais para slide de detalhe ou omitir
6. Gerar o HTML completo com CSS inline, paleta OMK (navy `#0b1120`, cyan `#22d3ee`, azul `#3b82f6`), tipografia legível
7. Verificar autoteste: ler apenas os títulos dos slides em sequência — formam uma narrativa coerente?

## Output Format

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>[Título-conclusão]</title>
  <style>
    /* CSS 100% inline — sem <link> externo */
    /* Paleta: navy #0b1120, cyan #22d3ee, azul #3b82f6 */
  </style>
</head>
<body>
  <!-- Slide 1: Capa com título-conclusão + 2-3 KPIs macro -->
  <!-- Slide 2: Sumário Executivo (3 bullets autossuficientes) -->
  <!-- Slide 3: KPIs Principais (máx 8) com comparativos -->
  <!-- Slides 4-N: Insights (1-2 por slide) com título-conclusão -->
  <!-- Slide Final: Recomendações priorizadas com badges -->
</body>
</html>
```

## Output Example

> Completo — ver `pipeline/data/output-examples.md` para exemplo HTML de 500+ linhas.

Exemplo de títulos-conclusão corretos vs. errados:

```
ERRADO: "Análise do Mercado de IA"
CERTO:  "Janela de 6 Meses para Capturar RAG Corporativo Antes da Comoditização"

ERRADO: "Insights"
CERTO:  "3 Movimentos que Definem os Próximos 6 Meses para a Overmind"

ERRADO: "KPIs"
CERTO:  "IA Corporativa Cresce 38% YoY — 3x Acima da Média Histórica"

ERRADO: "Recomendações"
CERTO:  "3 Ações para os Próximos 90 Dias — Janela está se Fechando"
```

## Quality Criteria

- [ ] Todos os slides têm título-conclusão (verificar: executivo extrai insight só do título)
- [ ] Capa tem tema, marca (OMK / Kansai / Overmind / Meridiano) e data
- [ ] Sumário executivo reproduz exatamente os 3 bullets do analysis-report
- [ ] Máximo 8 KPIs no slide executivo de dados
- [ ] HTML é autossuficiente — zero `<link>` ou `src` externos
- [ ] Paleta OMK aplicada: navy `#0b1120`, cyan `#22d3ee`, azul `#3b82f6`
- [ ] Recomendações têm badges visuais de prioridade (ALTA/MÉDIA/BAIXA) e confiança
- [ ] Autoteste de narrativa: ler apenas os títulos dos slides em sequência e verificar coerência

## Veto Conditions

Reject and redo if ANY are true:
1. Qualquer slide tem título genérico (tema, não conclusão) — ex: "Análise", "Insights", "Dados"
2. HTML tem dependências externas que impediriam renderização offline
