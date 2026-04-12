---
task: "Find and Rank News"
order: 1
input: |
  - research_focus: Tema e período temporal definidos pelo usuário (de research-focus.md)
  - company_context: Contexto da marca Overmind e público-alvo
output: |
  - ranked_news: Lista rankeada de 3-5 notícias com título, fonte, dado âncora, resumo e justificativa
---

# Find and Rank News

Pesquisa notícias e tendências de IA relevantes para carrosséis Instagram da Overmind. Entrega uma lista curada e rankeada por potencial de engajamento.

## Process

1. **Ler o foco de pesquisa** do arquivo `research-focus.md`. Extrair: tema específico e período temporal (24h, 7 dias, 30 dias, evergreen).

2. **Executar buscas focadas** usando web_search:
   - Busca 1: "{tema} + notícias + {período}" em português
   - Busca 2: "{tema} + statistics + data + {período}" em inglês
   - Busca 3: "{tema} + business impact + ROI" em inglês
   - Para cada resultado promissor, usar web_fetch para extrair dados concretos.

3. **Filtrar por critérios Overmind**:
   - Tem dado concreto (número, porcentagem, valor)? Se não, descartar.
   - É relevante para CEO/COO de PME? Se é puramente técnico, descartar.
   - Tem fonte verificável (URL acessível)? Se não, descartar.
   - Passa no "hook test": consigo escrever 8 palavras que param o scroll? Se não, rebaixar no ranking.

4. **Rankear top 3-5** por: potencial de hook > dado âncora forte > frescor temporal > diversidade de sub-tema.

5. **Formatar output** conforme template abaixo.

## Output Format

```yaml
research_date: "YYYY-MM-DD"
focus: "tema pesquisado"
period: "período temporal"
results:
  - rank: 1
    title: "Título descritivo da notícia"
    source: "Nome da fonte"
    url: "URL completa"
    date: "YYYY-MM-DD"
    anchor_data: "O dado ou estatística principal"
    summary: "Resumo em 2-3 frases do que a notícia diz"
    hook_potential: "Por que isso vira um bom carrossel (1 frase)"
  - rank: 2
    ...
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
    summary: "Relatório anual da Zendesk mostra que empresas com IA conversacional no suporte tiveram aumento de 34% no NPS e redução de 47% no tempo médio de resposta. O estudo cobre 4.500 empresas globais."
    hook_potential: "Dado concreto e surpreendente sobre ROI direto de IA. Provoca CEO que ainda não automatizou."
  - rank: 2
    title: "Pesquisa Salesforce: 73% dos consumidores esperam resposta em menos de 5 minutos"
    source: "Salesforce State of Service 2026"
    url: "https://salesforce.com/state-of-service"
    date: "2026-04-05"
    anchor_data: "73% esperam resposta em < 5 min; tempo médio PMEs BR é 47 min"
    summary: "Nova edição do relatório Salesforce revela gap crescente entre expectativa do consumidor e capacidade de resposta das PMEs. Brasil tem uma das maiores discrepâncias entre expectativa e entrega."
    hook_potential: "Contraste brutal entre 5 min vs 47 min. Visual e provocativo. Ideal para carrossel problema/solução."
  - rank: 3
    title: "Gartner prevê que 80% das interações de suporte serão via IA até 2027"
    source: "Gartner Magic Quadrant for Conversational AI 2026"
    url: "https://gartner.com/doc/conversational-ai-2026"
    date: "2026-04-03"
    anchor_data: "80% das interações de suporte via IA até 2027"
    summary: "Projeção do Gartner indica aceleração massiva da adoção de IA conversacional no suporte. Empresas que não adotarem até 2027 ficarão em desvantagem competitiva mensurável."
    hook_potential: "Deadline próximo (2027) cria urgência. Bom para tom provocativo/medo."
```

## Quality Criteria

- [ ] 3-5 notícias rankeadas com todos os campos preenchidos
- [ ] Cada notícia tem dado âncora concreto (número, %, valor)
- [ ] Todas as URLs são verificáveis
- [ ] Período temporal respeitado
- [ ] Diversidade de sub-temas (não tudo sobre o mesmo assunto)
- [ ] Hook potential justificado para cada notícia

## Veto Conditions

Reject and redo if ANY are true:
1. Menos de 3 notícias entregues
2. Alguma notícia sem fonte verificável (URL ou nome de relatório)
