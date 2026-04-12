---
task: "Plano de Negócio"
order: 1
input: |
  - ideia-de-negocio.md: Lean Canvas e conceito do produto
  - analise-de-mercado.md: Pesquisa de mercado completa
output: |
  - plano-de-negocio.md: Plano de negócio estruturado
---

# Plano de Negócio

Cria um plano de negócio conciso e acionável com base na ideia formulada e na pesquisa de mercado. Formato Lean Startup: denso, prático, com unit economics fundamentados.

## Process

1. Ler ideia de negócio (Lean Canvas) e análise de mercado. Identificar os dados-chave: segmento, pricing, TAM/SAM/SOM, concorrentes, timing
2. Redigir **Sumário Executivo** standalone (1 página): problema, solução, mercado, modelo de receita, ask
3. Detalhar **Modelo de Negócio**: fontes de receita, tiers de pricing, modelo de distribuição
4. Calcular **Unit Economics**: CAC, LTV, ARPU com premissas explícitas. Usar dados da pesquisa de mercado quando disponíveis, estimar com justificativa quando não
5. Definir **Go-to-Market**: primeiro canal, primeira campanha, primeiros 100 clientes — específico e acionável
6. Projetar **Financeiro**: receita e custo por mês para 12 meses, com premissas por linha
7. Documentar **Riscos e Mitigações**: mínimo 5 riscos com probabilidade, impacto e mitigação

## Output Format

```yaml
sumario_executivo: "Texto standalone de 1 página"
modelo_negocio:
  fontes_receita: [...]
  pricing: [...]
  distribuicao: "..."
unit_economics:
  cac: "Valor + premissa"
  ltv: "Valor + premissa"
  arpu: "Valor + premissa"
  ltv_cac_ratio: "Valor"
go_to_market:
  primeiro_canal: "..."
  primeira_campanha: "..."
  primeiros_100: "Como conseguir os primeiros 100 clientes"
financeiro:
  projecao_12m: "Tabela mês a mês"
  premissas: [...]
riscos:
  - risco: "..."
    probabilidade: "alta/média/baixa"
    impacto: "alto/médio/baixo"
    mitigacao: "..."
```

## Output Example

> Use como referência de qualidade, não como template rígido.

```markdown
# Plano de Negócio: FinSimples

## Sumário Executivo

**Problema:** 67% dos brasileiros não controlam suas finanças (IBGE, 2025).
Apps existentes exigem cadastro manual de cada gasto — complexidade que leva
a abandono em 2 semanas.

**Solução:** FinSimples automatiza controle financeiro via foto de extrato com
categorização por IA, metas visuais gamificadas e alertas inteligentes.

**Mercado:** SAM de R$2.1B (apps finanças pessoais, classe B/C, 25-45 anos).
SOM Ano 1: R$1.07M (6.000 assinantes).

**Modelo:** SaaS Freemium — grátis (1 conta) / R$14,90/mês (multi-banco) /
R$29,90/mês (relatório fiscal).

**Unit Economics:** CAC R$25 | LTV R$536 | Ratio 21:1

**Ask:** R$150k para MVP (3 meses) + validação com 50 beta testers.

## Modelo de Negócio

### Fontes de Receita
1. **Assinatura mensal** (core): 3 tiers
   - Free: 1 conta, categorização básica, limite 50 transações/mês
   - Pro (R$14,90/mês): Multi-banco, IA avançada, relatórios
   - Premium (R$29,90/mês): Relatório fiscal, exportação contador
2. **Receita futura** (Fase 3): Marketplace de serviços financeiros (seguro, crédito)

### Premissas de Pricing
- Benchmark Mobills: R$16,90/mês → posicionamento 12% abaixo
- Willingness-to-pay estimada: R$10-20/mês (pesquisa TBD na validação)

## Unit Economics

| Métrica | Valor | Premissa |
|---------|-------|----------|
| **CAC** | R$25 | Mix: 60% orgânico (R$0) + 40% pago (R$62,50 via Instagram/Google) |
| **ARPU** | R$17,40/mês | Mix: 50% free (R$0) + 35% Pro (R$14,90) + 15% Premium (R$29,90) |
| **Churn** | 8%/mês | Benchmark apps finanças BR (estimado) |
| **Lifetime** | 12,5 meses | 1/churn |
| **LTV** | R$217,50 | ARPU × Lifetime (só pagantes) |
| **LTV/CAC** | 8,7x | Saudável (> 3x) |

## Riscos e Mitigações

| # | Risco | Prob. | Impacto | Mitigação |
|---|-------|-------|---------|-----------|
| 1 | Open Finance com custo proibitivo | Média | Alto | MVP sem Open Finance (importação manual) |
| 2 | Bancos digitais copiam feature | Alta | Alto | Foco em nicho (freelancers) que bancos ignoram |
| 3 | CAC real > R$50 | Média | Médio | Foco em orgânico: SEO, comunidades, referral |
| 4 | Churn > 15%/mês | Média | Alto | Kill criteria: pivotar se churn > 15% por 3 meses |
| 5 | Regulação Open Finance muda | Baixa | Alto | Arquitetura modular que permite trocar fonte de dados |
```

## Quality Criteria

- [ ] Sumário executivo standalone (1 página legível isoladamente)
- [ ] Unit economics com CAC, LTV, ARPU e premissas explícitas
- [ ] Go-to-market específico (primeiro canal, primeiros 100 clientes)
- [ ] Projeção financeira com premissas por linha
- [ ] Mínimo 5 riscos com probabilidade, impacto e mitigação
- [ ] Pricing justificado com benchmark ou dados de mercado

## Veto Conditions

Rejeitar e refazer se QUALQUER condição for verdadeira:
1. Projeções sem premissas — números que aparecem sem justificativa
2. Go-to-market genérico — "marketing digital" sem especificar canal, budget e meta
