# Output Examples: Video Business Analyzer

## Exemplo 1: Ideia de Negócio Extraída (Lean Canvas)

```
# Ideia de Negócio: FinTrack — Dashboard Financeiro para Freelancers

## Hipótese
Freelancers brasileiros com faturamento entre R$5k-R$30k/mês pagarão R$49/mês
por um dashboard que automatiza controle financeiro, emissão de NF e preparação
de imposto de renda.

## Lean Canvas

| Bloco | Conteúdo |
|-------|----------|
| **Problema** | 1. Freelancers gastam 5-8h/mês em controle financeiro manual 2. Mistura de conta PF/PJ gera confusão tributária 3. Contadores cobram caro e não entendem a realidade freelancer |
| **Solução** | Dashboard que integra conta bancária, categoriza gastos automaticamente, emite NF-e e gera relatório pré-IRPF |
| **Proposta de Valor** | "Pare de perder dinheiro com desorganização. Controle financeiro automático feito para quem trabalha por conta." |
| **Vantagem Injusta** | Integração nativa com plataformas de freelancer (99Freelas, Workana, Upwork) para importar receitas |
| **Segmentos** | Freelancers de tecnologia e design, 25-45 anos, faturamento R$5k-R$30k/mês |
| **Canais** | LinkedIn, comunidades de freelancers, parcerias com plataformas |
| **Receita** | SaaS: R$49/mês (básico) / R$99/mês (com contador virtual) |
| **Custos** | Infra cloud, desenvolvimento, integração bancária (Open Finance), suporte |
| **Métricas** | MRR, churn rate, NPS, tempo médio de onboarding |

## Lacunas Identificadas
- Vídeo não mencionou custos de integração com Open Finance
- Não ficou claro se já existe validação com freelancers reais
- Modelo de precificação parece arbitrário — precisa validar willingness-to-pay
```

## Exemplo 2: Sumário Executivo do Plano de Negócio

```
# Sumário Executivo: FinTrack

## O Problema
O Brasil tem 13,5 milhões de trabalhadores por conta própria (IBGE, 2025).
A maioria usa planilhas ou nada para controle financeiro, resultando em
perda média estimada de R$2.400/ano em deduções não aproveitadas e multas
tributárias por atraso.

## A Solução
FinTrack é um SaaS que automatiza o controle financeiro de freelancers:
integra conta bancária via Open Finance, categoriza gastos com IA, emite
NF-e integrada e gera relatório pré-IRPF. Tempo de setup: 10 minutos.

## Mercado
- **TAM:** R$8,1B (mercado de fintech para autônomos no Brasil)
- **SAM:** R$890M (freelancers de tecnologia e design com faturamento > R$5k/mês)
- **SOM Ano 1:** R$2,9M (5.000 assinantes × R$49/mês × 12 meses)

## Modelo de Receita
SaaS com dois tiers: Básico (R$49/mês) e Pro (R$99/mês com contador virtual).
Meta: 60% básico / 40% pro. ARPU projetado: R$69/mês.

## Unit Economics
- **CAC estimado:** R$120 (LinkedIn Ads + comunidades)
- **LTV estimado:** R$1.656 (ARPU R$69 × 24 meses retenção média)
- **LTV/CAC:** 13,8x

## Status e Ask
Fase: Pré-MVP. Precisamos de R$150k para 3 meses de desenvolvimento +
validação com 50 beta testers. Objetivo: atingir 500 assinantes pagantes
em 6 meses.
```

## Exemplo 3: Plano de Execução (Resumo)

```
# Plano de Execução: FinTrack

## Fase 1 — MVP (Meses 1-3) | Budget: R$150k
**Objetivo:** Validar demand com 50 beta testers
**Escopo MVP (MoSCoW):**
- MUST: Dashboard de receitas/despesas, importação manual de extrato, categorização
- SHOULD: Integração Open Finance (1 banco), relatório mensal
- COULD: Emissão de NF-e
- WON'T: Contador virtual, IA de categorização, multi-banco

**Métrica de sucesso:** 50 beta testers com NPS > 40
**Kill criteria:** < 20 testers interessados após 30 dias de divulgação

## Fase 2 — Product-Market Fit (Meses 4-6) | Budget: R$200k
**Objetivo:** 500 assinantes pagantes
**Escopo:** Open Finance multi-banco, NF-e, IA categorização, onboarding guiado
**Métrica de sucesso:** MRR R$30k, churn < 8%/mês
**Kill criteria:** < 200 pagantes após 60 dias de lançamento

## Fase 3 — Scale (Meses 7-12) | Budget: R$500k
**Objetivo:** 5.000 assinantes, breakeven
**Escopo:** Contador virtual (parceria), IRPF automático, app mobile, integrações
**Métrica de sucesso:** MRR R$345k, churn < 5%/mês
```
