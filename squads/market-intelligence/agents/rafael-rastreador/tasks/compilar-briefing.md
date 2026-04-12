---
task: "Compilar Briefing"
order: 2
input: |
  - raw_sources: Fontes e achados coletados na tarefa anterior
  - research_focus: Tema e contexto originais (de research-focus.md)
output: |
  - research_brief: Documento estruturado completo em formato padrão
---

# Compilar Briefing

Transforma as fontes e achados brutos coletados em um research brief estruturado, verificado e pronto para consumo pelo agente analista.

## Process

1. Organizar achados por nível de confiança — ALTA primeiro, depois MÉDIA, depois BAIXA
2. Para cada achado de alta confiança: verificar que há pelo menos 2 fontes independentes referenciadas
3. Identificar 2-4 tendências emergentes dos achados — classificar ciclo de vida (emergente/crescimento/maduro/declínio) e estimar janela temporal
4. Montar tabela de fontes completa com: número, nome, tipo, score de relevância, data
5. Documentar lacunas honestamente — o que não foi encontrado, quais categorias foram tentadas
6. Montar o brief completo no formato padrão com todas as seções

## Output Format

```markdown
RESEARCH BRIEF
Tema: [tema do research-focus]
Janela Temporal: [período]
Preparado: [data atual]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PRINCIPAIS ACHADOS

1. [Achado com dado quantificado]
   Confiança: ALTA | Fonte: [nome] | URL: [link] | Acessado: [data]

2. [Segundo achado]
   Confiança: MÉDIA — [razão]
   Fonte: [nome] | URL: [link] | Acessado: [data]

TENDÊNCIAS EMERGENTES

- "[Nome da tendência]" — Ciclo: [emergente/crescimento/maduro/declínio]
  [Descrição e janela temporal]

FONTES

| # | Fonte | Tipo | Relevância | Data |
|---|-------|------|------------|------|
| 1 | [nome] | [tipo] | [X/10] | [mês/ano] |

LACUNAS

- [Dado não encontrado]: [tentativas realizadas e razão do gap]
```

## Output Example

> Use as quality reference, not as rigid template.

```
RESEARCH BRIEF
Tema: Posicionamento competitivo Overmind — Mercado de IA Corporativo Brasil
Janela Temporal: 01/03/2026 – 08/04/2026
Preparado: 2026-04-08

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PRINCIPAIS ACHADOS

1. Mercado brasileiro de IA corporativa cresceu 38% YoY no Q1 2026, com
   concentração de demanda em agentes autônomos para operações B2B.
   Confiança: ALTA
   Fonte: IDC Brazil AI Services Market Q1 2026
   URL: https://www.idc.com/brazil/ai-q1-2026
   Acessado: 2026-04-07

2. Três competidores diretos (Mesha, Doutores da IA, Altera.ai) lançaram
   ofertas de RAG corporativo nos últimos 60 dias.
   Confiança: ALTA
   Fonte: TechCrunch BR, 02/04/2026 + LinkedIn oficial das empresas
   URL: https://techcrunch.com/br/2026/04/02/rag-corporativo
   Acessado: 2026-04-07

3. PMEs de 50-500 funcionários representam 62% das novas contratações de
   serviços de IA no Brasil.
   Confiança: MÉDIA — relatório de associação com metodologia parcialmente divulgada
   Fonte: ABES Relatório IA nas Empresas 2026
   URL: https://abes.org.br/relatorio-ia-2026
   Acessado: 2026-04-06

4. Volume de posts no LinkedIn sobre "IA para B2B" e "automação com LLMs"
   cresceu 3x comparado a dezembro/2025.
   Confiança: MÉDIA — análise manual de 120 posts, não ferramental
   Fonte: LinkedIn (análise própria, amostra limitada)
   Acessado: 2026-04-08

TENDÊNCIAS EMERGENTES

- "RAG Corporativo como diferencial competitivo" — Ciclo: crescimento acelerado
  Empresas querem IA treinada nos seus dados proprietários (manuais, CRM, docs).
  Janela estimada antes da comoditização: 6-9 meses.

- "Agentes autônomos para backoffice B2B" — Ciclo: adoção inicial
  Automação de processos internos (RH, financeiro, cobrança) com agentes LLM.
  Forte demanda, baixa oferta especializada no Brasil.

- "Verticalização por setor" — Ciclo: emergente
  Concorrentes começam a criar verticais (saúde, jurídico, agro).
  Sinaliza próxima fase de diferenciação após commoditização da IA genérica.

FONTES

| # | Fonte | Tipo | Relevância | Data |
|---|-------|------|------------|------|
| 1 | IDC Brazil AI Services Q1 2026 | Analista | 9/10 | 2026-04 |
| 2 | TechCrunch BR | Mídia | 8/10 | 2026-04 |
| 3 | ABES Relatório IA nas Empresas 2026 | Associação | 7/10 | 2026-03 |
| 4 | LinkedIn (análise própria) | Social | 5/10 | 2026-04 |
| 5 | Sites oficiais dos concorrentes | Primário | 8/10 | 2026-04 |

LACUNAS

- Receita dos competidores diretos: todas as empresas são privadas.
  Nenhum dado financeiro público disponível. Crunchbase consultado — só funding parcial.
- NPS e satisfação de clientes: nenhum estudo independente encontrado para agências de IA BR.
- Adoção de IA por setor específico (saúde, agro, jurídico): ABES não segmenta por vertical.
```

## Quality Criteria

- [ ] Todas as seções do brief estão presentes: Achados, Tendências, Fontes, Lacunas
- [ ] Cada achado de alta confiança tem no mínimo 2 fontes referenciadas
- [ ] Tendências incluem ciclo de vida e janela temporal estimada
- [ ] Tabela de fontes com tipo e score de relevância completos
- [ ] Lacunas documentam as tentativas realizadas, não apenas o gap
- [ ] Nenhuma afirmação genérica ("fontes do setor") — sempre fonte específica

## Veto Conditions

Reject and redo if ANY are true:
1. Seção de Lacunas ausente ou vazia sem justificativa de "nenhuma lacuna encontrada"
2. Achados de alta confiança sem pelo menos 2 fontes independentes identificadas
