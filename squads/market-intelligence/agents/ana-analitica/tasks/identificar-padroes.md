---
task: "Identificar Padrões"
order: 1
input: |
  - research_brief: Brief compilado por Rafael com achados, tendências, fontes e lacunas
  - company_context: Contexto do grupo OMK de company.md
output: |
  - pattern_map: Mapa de padrões, anomalias e correlações identificadas nos dados
  - swot_analysis: SWOT do cenário de mercado vs. posição do grupo OMK
---

# Identificar Padrões

Analisa o research brief identificando padrões, anomalias e correlações, e aplica análise SWOT para contextualizar os dados em relação à posição do grupo OMK no mercado.

## Process

1. Ler `research-brief.md` completamente — mapear todos os achados e nível de confiança
2. Identificar os 3 maiores movimentos do período (positivos e negativos) — ordenar por magnitude e confiança
3. Verificar se algum movimento é >25% em relação ao período anterior ou benchmark — sinalizar como "🚨 Anomalia"
4. Buscar correlações entre achados — evitar causalidade não demonstrada, usar "correlaciona com"
5. Aplicar SWOT em relação à posição do grupo OMK:
   - **Strengths**: o que OMK/marca em questão faz melhor que o mercado
   - **Weaknesses**: gaps vs. concorrentes identificados nos dados
   - **Opportunities**: tendências emergentes onde OMK pode capturar posição antes dos outros
   - **Threats**: movimentos de concorrentes que ameaçam posição atual
6. Verificar se há contradições entre fontes que precisam ser preservadas (não resolvidas)

## Output Format

```yaml
top_movements:
  - description: "Descrição do movimento"
    magnitude: "+38% YoY"
    confidence: "ALTA"
    sources: ["fonte1", "fonte2"]
    
anomalies:
  - description: "Movimento >25% identificado"
    magnitude: "+Nx vs período anterior"
    status: "🚨 ANOMALIA"
    
swot:
  strengths:
    - "Ponto forte do grupo OMK vs. mercado (baseado nos dados)"
  weaknesses:
    - "Gap identificado nos dados"
  opportunities:
    - "Tendência emergente onde OMK pode agir"
  threats:
    - "Movimento de concorrente que ameaça posição"
    
correlations:
  - "X correlaciona com Y — razão e evidência"
```

## Output Example

> Use as quality reference, not as rigid template.

```
MAPA DE PADRÕES — Pesquisa: IA Corporativa Brasil | Q1 2026

TOP 3 MOVIMENTOS DO PERÍODO

1. Crescimento de 38% YoY no mercado de IA corporativa
   Magnitude: +38% YoY | Confiança: ALTA
   Fontes: IDC Brazil Q1 2026 + ABES 2026
   Contexto: acima da média histórica de 25% — sinal de aceleração da demanda

2. 🚨 ANOMALIA: 3 players lançando RAG em 60 dias
   Magnitude: 3 lançamentos em 60 dias vs. 0 no trimestre anterior
   Confiança: ALTA | Status: movimento concentrado incomum no setor
   Implicação preliminar: corrida por posicionamento antes da janela se fechar

3. Share of voice de "IA para B2B" no LinkedIn: +3x vs. dezembro/2025
   Magnitude: 3x crescimento | Confiança: MÉDIA (amostra manual)
   Correlaciona com: lançamentos de produtos de concorrentes no mesmo período
   (Nota: correlação, não causalidade comprovada)

ANÁLISE SWOT — Grupo OMK / Overmind vs. Mercado

STRENGTHS (vantagens identificadas nos dados)
- Overmind opera dentro do ecossistema OMK com sinergia Kansai (software) + Meridiano (dados)
  — competidores são agências standalone sem esta integração
- Posicionamento premium já estabelecido em software (Kansai) pode facilitar vendas cross-sell

WEAKNESSES (gaps vs. concorrentes)
- Ausência de presença online da Overmind — competidores Mesha e Altera.ai têm site e cases públicos
- Nenhum case público de RAG ou agente B2B identificado para a Overmind (vs. 3 competidores ativos)

OPPORTUNITIES (tendências a capturar)
- RAG corporativo: janela de 6-9 meses antes de comoditização — Overmind pode entrar com diferencial de integração dados (Meridiano) + software (Kansai)
- PMEs B2B: 62% da demanda, sub-atendidas. Competidores focam em enterprise.

THREATS (ameaças identificadas)
- Mesha, Doutores da IA e Altera.ai consolidando cases e referências enquanto Overmind opera sem presença digital
- Verticalização emergente: competidores podem "plantar bandeiras" em setores jurídico/saúde antes da Overmind

CONTRADIÇÕES NAS FONTES
- Crescimento do mercado: IDC (38%) vs. estimativa informal no LinkedIn de executivos (30-35%)
  → Documentando ambas. Usando IDC como primária por metodologia publicada.
```

## Quality Criteria

- [ ] Top 3 movimentos identificados com magnitude, confiança e fontes
- [ ] Anomalias (>25%) sinalizadas com emoji 🚨 e contextualizadas
- [ ] SWOT com pelo menos 2 itens por quadrante, todos baseados em dados do brief
- [ ] Correlações usam linguagem correta ("correlaciona com", não "causou")
- [ ] Contradições entre fontes preservadas e documentadas, não resolvidas

## Veto Conditions

Reject and redo if ANY are true:
1. SWOT contém afirmações não suportadas por dados do research brief
2. Alguma correlação afirma causalidade sem dados de experimento controlado
