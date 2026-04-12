# Research Brief — Inteligência de Mercado

> Compilado pelo Design phase | 2026-04-08

---

## Domínio

**Inteligência Competitiva e Monitoramento de Mercado** para o Grupo OMK (Kansai Tech House, Overmind, Meridiano).

Fontes: sites públicos, portais de notícias do setor, redes sociais (Twitter/X, LinkedIn, Instagram), APIs externas.

---

## Frameworks e Metodologias

### Framework CI: Collect → Analyze → Activate

O ciclo de inteligência competitiva tem três fases obrigatórias:

1. **Collect** — Coleta de dados brutos de fontes primárias e secundárias
2. **Analyze** — Interpretação com frameworks analíticos (SWOT, PESTLE, gap analysis)
3. **Activate** — Transformação em decisões de negócio acionáveis com owner definido

**Falha mais comum:** pular o "Activate" — pesquisa documentada mas nunca operacionalizada ("research-to-shelf syndrome").

### SWOT + PESTLE + Gap Analysis

- **SWOT** — Strengths, Weaknesses, Opportunities, Threats do cenário analisado
- **PESTLE** — Political, Economic, Social, Technological, Legal, Environmental
- **Gap Analysis** — Diferença entre posição atual e benchmark do mercado

### Information Landscape Mapping

Antes de qualquer busca, mapear categorias de fontes relevantes:
- Publicações do setor (IDC, Gartner, FGV, ABRII)
- Portais de notícias (Valor Econômico, TechCrunch BR, Startups.com.br)
- Redes sociais (LinkedIn de executivos, Twitter/X de analistas do setor)
- Páginas oficiais de concorrentes (pricing, blog, job postings)
- APIs públicas e dados governamentais

---

## Exemplos de Output de Alta Qualidade

### Research Brief: Padrão Esperado

```
RESEARCH BRIEF
Tema: [Tema específico]
Janela Temporal: [DD/MM/AAAA – DD/MM/AAAA]
Preparado: [Data]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PRINCIPAIS ACHADOS

1. [Achado com dado quantificado]
   Confiança: ALTA | Fonte: [Nome] | URL: [link] | Acessado: [data]

2. [Achado com dado quantificado]
   Confiança: MÉDIA — [razão da confiança média]
   Fonte: [Nome] | URL: [link] | Acessado: [data]

TENDÊNCIAS EMERGENTES

- "[Nome da tendência]" — Ciclo de vida: [emergente / crescimento / maduro / declínio]
  [Descrição e janela temporal estimada]

FONTES

| # | Fonte | Tipo | Relevância | Data |
|---|-------|------|------------|------|
| 1 | [Nome] | Analista | 9/10 | [Mês/Ano] |

LACUNAS

- [O que não foi encontrado e por quê]
```

### Analysis Report: Padrão Esperado

```
ANÁLISE DE INTELIGÊNCIA DE MERCADO
Tema: [Tema]
Período: [Período]

SUMÁRIO EXECUTIVO (3 bullets, autossuficiente)
• [KPI principal com comparativo]
• [Ameaça ou oportunidade principal com janela temporal]
• [Recomendação de maior impacto]

INSIGHTS

1. [Insight com título assertivo]
   [Dado que sustenta]
   Isso significa: [implicação de negócio concreta]
   Confiança: [ALTA/MÉDIA/BAIXA] — [razão]

RECOMENDAÇÕES

1. [Ação específica] — Prioridade: [ALTA] | Confiança: [ALTA] | Esforço: [MÉDIO]
   Impacto esperado: [resultado quantificado onde possível]
```

---

## Vocabulário Profissional do Domínio

### Sempre Usar
- **Battle cards** — materiais de habilitação de vendas com posicionamento vs. concorrentes
- **Share of voice** — participação no volume de menções e conversas do setor
- **Displacement risk** — risco de perder posição para um concorrente emergente
- **Win/loss analysis** — análise de por que deals foram ganhos ou perdidos
- **Intelligence requirements** — definição prévia do que se precisa saber para tomar uma decisão
- **Sinais de mercado** — indicadores antecipados de mudança antes de dados definitivos disponíveis
- **Janela de oportunidade** — período em que uma vantagem competitiva existe antes de ser replicada

### Nunca Usar
- "Segundo fontes do setor" — sempre citar fonte específica com URL
- "Crescimento significativo" — quantificar: "crescimento de 34% YoY"
- "Parece que..." — usar nível de confiança estruturado: Confiança: MÉDIA

### Tom de Voz
- Objetivo e baseado em evidências — separar achados de interpretações
- Incerteza explícita — quando dados são escassos, dizer com clareza
- Estratégico e acionável — todo output orienta uma decisão concreta

---

## Anti-Padrões Documentados

1. **Research-to-shelf syndrome** — pesquisa documentada sem owner ou ação definida
2. **Quant sem qual** — números sem contexto comportamental/emocional
3. **Dados desatualizados não sinalizados** — usar dados de 18+ meses em mercado dinâmico sem flag
4. **Confirmation bias** — buscar apenas evidências que confirmam hipóteses pré-existentes
5. **Escopo indefinido** — pesquisar sem "intelligence requirement" claro

---

## Benchmarks de Qualidade

- Todos os achados têm URL e data de acesso
- Níveis de confiança atribuídos a cada achado
- Sumário executivo legível independentemente em <60 segundos
- Cada recomendação tem owner implícito e janela temporal
- Seção de Lacunas sempre preenchida
