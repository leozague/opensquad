# Plano de Negócio: Plataforma de Multi-Atendimento WhatsApp + IA + Pagamentos

> **Autor:** Pablo Plano — Estrategista de Negócios  
> **Data:** 2026-04-09  
> **Baseado em:** Ideia de negócio (Vitor Video), Análise de mercado (Marina Mercado)  
> **Empresa:** Kansai / Grupo OMK (agência de Leonardo)

---

## Sumário Executivo

**Problema:** 80% das PMEs brasileiras usam WhatsApp como canal de vendas, mas a maioria opera com WhatsApp pessoal ou Business nativo — sem centralizar atendimento, sem IA, sem controle de equipe. Empresas com 2–15 atendentes perdem clientes por demora, perdem histórico quando funcionários saem, e usam 3+ ferramentas separadas para atender, cobrar e gerenciar.

**Solução:** Plataforma SaaS de multi-atendimento WhatsApp com IA integrada (agentes 24/7), CRM Kanban e gestão de pagamentos via Stripe — tudo em um painel. White-label disponível para agências revenderem com sua marca.

**Mercado:** SAM de R$ 256–428M/ano (72–120 mil PMEs brasileiras). SOM Ano 1: 80–100 clientes, MRR R$ 25–35K, ARR R$ 300–420K.

**Modelo:** SaaS com 3 tiers (R$ 197–697/mês) + white-label para agências (R$ 997–1.997/mês).

**Unit Economics:** CAC R$ 450 | LTV R$ 5.940 | Ratio 13,2:1

**Diferencial competitivo:** Único no mercado mapeado com pagamentos integrados + IA nativa nos planos iniciais. Concorrentes cobram R$ 997+ para IA (Octadesk) ou não oferecem pagamentos (nenhum).

**Ask:** R$ 35–50K para MVP (8 semanas com Claude Code) + 3 meses de validação com 10 clientes piloto da base Kansai.

---

## 1. Modelo de Negócio

### 1.1 Fontes de Receita

| Fonte | Tipo | Contribuição estimada |
|---|---|---|
| Assinatura SaaS (B2B direto) | Recorrente mensal | 70% da receita |
| White-label para agências | Recorrente mensal (ticket maior) | 20% da receita |
| Setup e onboarding assistido | One-time | 10% da receita |

### 1.2 Pricing

**Modelo SaaS Direto:**

| Plano | Preço | Inclui | Segmento-alvo |
|---|---|---|---|
| Starter | R$ 197/mês | 3 atendentes, 1 número WA, IA básica (FAQ), CRM Kanban | MEI/micro com 2–3 pessoas |
| Profissional | R$ 397/mês | 8 atendentes, 2 números WA, IA avançada (agentes n8n), relatórios | PME com 4–8 atendentes |
| Business | R$ 697/mês | 20 atendentes, 3+ números, IA + pagamentos Stripe, API | PME com 9–20 atendentes |

**Premissas de pricing:**
- Benchmark direto: SocialHub R$ 99–399, WaCorps R$ 146–407, Digisac R$ 197+, Datafy Chats R$ 200 (plano único)
- Posicionamento: acima do SocialHub/WaCorps (justificado por IA + pagamentos), alinhado com Digisac, abaixo do Octadesk (R$ 997+)
- Confiança alta para R$ 197–397, confiança média para R$ 697 (requer validação — P2 da pesquisa)

**Modelo White-Label:**

| Plano | Preço | Inclui |
|---|---|---|
| Agência Start | R$ 997/mês | Até 10 subcontas, marca própria, suporte técnico |
| Agência Pro | R$ 1.997/mês | Até 30 subcontas, domínio customizado, API |

**Premissa:** Agência cobra R$ 297–697 do cliente final. Margem da agência: 30–50%. Fonte: modelo validado em mercado SaaS brasileiro (RD Station, Bling operam com revendas).

### 1.3 Distribuição

- **Canal 1 (primário):** Base de clientes existente da Kansai/OMK → CAC ~R$ 0
- **Canal 2:** YouTube — vídeos demonstrando o sistema por nicho (replicando estratégia DATA7 Apps que gerou 51.600 inscritos e R$ 30K MRR)
- **Canal 3:** Indicação de clientes (programa de referral com 1 mês grátis por indicação convertida)
- **Canal 4 (fase 2):** Parceria com agências de marketing digital como revendedoras white-label

---

## 2. Unit Economics

### 2.1 Métricas Core

| Métrica | Valor | Premissa |
|---|---|---|
| **ARPU** | R$ 297/mês | Mix estimado: 50% Starter (R$ 197) + 35% Profissional (R$ 397) + 15% Business (R$ 697) |
| **Churn mensal** | 5% | Benchmark SaaS SMB Brasil — 3–7% mensal (UserMotion 2024). Conservador: 5% |
| **Lifetime** | 20 meses | 1/churn = 1/0,05 |
| **LTV** | R$ 5.940 | ARPU × Lifetime |
| **CAC blended** | R$ 450 | Mix: 40% orgânico/base (R$ 50) + 40% YouTube/SEO (R$ 300) + 20% pago (R$ 1.500) |
| **LTV/CAC** | 13,2x | Saudável (> 3x). Nota: se churn real for 7%, LTV cai para R$ 4.243 e ratio para 9,4x — ainda saudável |
| **Payback CAC** | 1,5 meses | CAC / ARPU |

### 2.2 Premissas Detalhadas

**CAC por canal:**

| Canal | CAC estimado | % dos clientes | Justificativa |
|---|---|---|---|
| Base Kansai (existente) | R$ 50 | 40% (Ano 1) | Custo de reunião/demo — cliente já confia na empresa |
| YouTube + SEO orgânico | R$ 300 | 40% | Benchmark DATA7 Apps: conteúdo gera leads com CAC baixo |
| Tráfego pago (Google/Meta) | R$ 1.500 | 20% | Benchmark SaaS SMB: CPL R$ 30 × 2% conversão = R$ 1.500/cliente pago |

**Nota de honestidade:** Esses valores são estimativas. O CAC real só será conhecido após 3 meses de operação. Se o CAC blended ultrapassar R$ 800, o modelo exige revisão (ver Kill Criteria).

### 2.3 Economia por Cliente

| Item | Custo mensal por cliente | Premissa |
|---|---|---|
| WhatsApp Cloud API | R$ 15–50 | Conversas de serviço gratuitas desde 11/2024. Custo só em notificações outbound (~R$ 0,40/conversa) |
| Infraestrutura (VPS/Supabase) | R$ 5–15 | Custo rateado. Base de 50 clientes = ~R$ 500/mês total |
| Stripe fees (quando usado) | 2,99% + R$ 0,40/tx | Repasse ao cliente ou absorvido na margem |
| Suporte (tempo humano) | R$ 30–80 | ~30min/mês por cliente após onboarding (estimativa) |
| **Custo total por cliente** | **R$ 50–145/mês** | |
| **Margem bruta** | **51–83%** | R$ 297 ARPU - R$ 50–145 custo |

**Margem bruta estimada:** 65–70% (ponto médio). Benchmark SaaS B2B: 70–80%. Compatível.

---

## 3. Go-to-Market

### 3.1 Estratégia: "Base First, Content Second, Paid Last"

**Fase 1 — Primeiros 30 clientes (meses 1–4): Base existente**

1. Listar os 50 clientes mais ativos da Kansai/OMK
2. Identificar os 20 que usam WhatsApp para atendimento comercial (critério: equipe de 2+)
3. Oferecer trial gratuito de 30 dias com onboarding assistido pessoalmente
4. Meta: converter 10–15 em pagantes (taxa de conversão de trial: 25–35%, benchmark SaaS SMB)
5. **Custo desta fase:** Apenas tempo da equipe (~R$ 0 em marketing)

**Fase 2 — Clientes 30–60 (meses 4–8): YouTube + Referral**

1. Criar canal YouTube com 3 vídeos de demonstração por nicho:
   - "Como clínica médica pode atender 5x mais pacientes no WhatsApp"
   - "Sistema de multi-atendimento para imobiliárias: demo completo"
   - "IA respondendo seus clientes 24/7: configuração em 10 minutos"
2. Ativar programa de indicação: cliente que indica ganha 1 mês grátis
3. SEO: landing pages por nicho (multi-atendimento para [nicho])
4. **Budget desta fase:** R$ 2.000–5.000/mês (produção de conteúdo + ferramentas)

**Fase 3 — Clientes 60–100 (meses 8–12): Tráfego pago + Agências**

1. Google Ads para "multi-atendimento WhatsApp" e variações por nicho
2. Meta Ads: remarketing para quem assistiu vídeos no YouTube
3. Abordagem a 5 agências digitais para modelo white-label
4. **Budget desta fase:** R$ 5.000–10.000/mês

### 3.2 Primeiros 100 Clientes — Plano Específico

| Fonte | Meta de clientes | Prazo |
|---|---|---|
| Base Kansai/OMK | 15 | Meses 1–4 |
| Indicação/referral | 15 | Meses 3–8 |
| YouTube orgânico | 20 | Meses 4–10 |
| SEO/landing pages | 10 | Meses 6–12 |
| Tráfego pago | 15 | Meses 8–12 |
| White-label (via agências) | 25 (subcontas) | Meses 10–12 |
| **Total** | **100** | **12 meses** |

---

## 4. Projeção Financeira — 12 Meses

### 4.1 Premissas da Projeção

| Premissa | Valor | Justificativa |
|---|---|---|
| Novos clientes/mês (meses 1–3) | 5 | Base Kansai, abordagem manual |
| Novos clientes/mês (meses 4–6) | 8 | YouTube + indicação |
| Novos clientes/mês (meses 7–9) | 10 | Tráfego pago entra |
| Novos clientes/mês (meses 10–12) | 12 | White-label + todos canais |
| Churn mensal | 5% | Benchmark SMB |
| ARPU | R$ 297 | Mix de planos |
| Custo variável por cliente | R$ 90/mês | Ponto médio da faixa R$ 50–145 |

### 4.2 Projeção Mês a Mês

| Mês | Novos | Churn | Ativos | MRR | Custo Var. | Custo Fixo | Resultado |
|---|---|---|---|---|---|---|---|
| 1 | 5 | 0 | 5 | R$ 1.485 | R$ 450 | R$ 5.000 | -R$ 3.965 |
| 2 | 5 | 0 | 10 | R$ 2.970 | R$ 900 | R$ 5.000 | -R$ 2.930 |
| 3 | 5 | 1 | 14 | R$ 4.158 | R$ 1.260 | R$ 5.000 | -R$ 2.102 |
| 4 | 8 | 1 | 21 | R$ 6.237 | R$ 1.890 | R$ 6.000 | -R$ 1.653 |
| 5 | 8 | 1 | 28 | R$ 8.316 | R$ 2.520 | R$ 6.000 | -R$ 204 |
| 6 | 8 | 1 | 35 | R$ 10.395 | R$ 3.150 | R$ 6.000 | R$ 1.245 |
| 7 | 10 | 2 | 43 | R$ 12.771 | R$ 3.870 | R$ 8.000 | R$ 901 |
| 8 | 10 | 2 | 51 | R$ 15.147 | R$ 4.590 | R$ 8.000 | R$ 2.557 |
| 9 | 10 | 3 | 58 | R$ 17.226 | R$ 5.220 | R$ 8.000 | R$ 4.006 |
| 10 | 12 | 3 | 67 | R$ 19.899 | R$ 6.030 | R$ 10.000 | R$ 3.869 |
| 11 | 12 | 3 | 76 | R$ 22.572 | R$ 6.840 | R$ 10.000 | R$ 5.732 |
| 12 | 12 | 4 | 84 | R$ 24.948 | R$ 7.560 | R$ 10.000 | R$ 7.388 |

**Resumo Ano 1:**

| Indicador | Valor |
|---|---|
| MRR ao final do mês 12 | R$ 24.948 |
| Clientes ativos mês 12 | 84 |
| Receita total acumulada (12 meses) | ~R$ 146.124 |
| Custos totais acumulados | ~R$ 130.280 |
| Resultado líquido acumulado | ~R$ 15.844 |
| Breakeven estimado | Mês 6 (operacional) |

**Custo fixo mensal — composição:**

| Item | Meses 1–3 | Meses 4–6 | Meses 7–9 | Meses 10–12 |
|---|---|---|---|---|
| Infraestrutura (VPS, Supabase, domínio) | R$ 500 | R$ 1.000 | R$ 1.500 | R$ 2.000 |
| WhatsApp Cloud API (base) | R$ 500 | R$ 1.000 | R$ 1.500 | R$ 2.000 |
| Marketing/conteúdo | R$ 1.000 | R$ 2.000 | R$ 3.000 | R$ 5.000 |
| Ferramenta de suporte | R$ 0 | R$ 500 | R$ 500 | R$ 500 |
| Pessoa de suporte (meio período) | R$ 0 | R$ 0 | R$ 1.500 | R$ 1.500 |
| Stripe/processamento | R$ 0 | R$ 500 | R$ 1.000 | R$ 1.000 |
| Claude Code (dev/manutenção) | R$ 3.000 | R$ 1.000 | R$ 1.000 | R$ 1.000 |
| **Total** | **R$ 5.000** | **R$ 6.000** | **R$ 8.000** | **R$ 10.000** |

**Nota:** A projeção NÃO inclui salário do fundador (Leonardo). Assume que ele opera o negócio como extensão da Kansai nos primeiros 6 meses. Se incluir pró-labore de R$ 5.000/mês, o breakeven desloca para o mês 9–10.

---

## 5. Riscos e Mitigações

| # | Risco | Prob. | Impacto | Mitigação |
|---|---|---|---|---|
| 1 | **Meta transforma WhatsApp Business em concorrente direto** — Business AI evolui para multi-atendimento nativo gratuito | Média | Alto | Janela de 18–36 meses (fonte: Marina Mercado). Usar esse tempo para construir lock-in via CRM + dados + integrações. Monitorar Developer Blog da Meta trimestralmente |
| 2 | **Churn acima de 7%/mês** — PMEs são voláteis, cancelam facilmente | Alta | Alto | Onboarding assistido nos primeiros 30 dias. Kill criteria: se churn > 7% por 3 meses consecutivos, revisar produto e pricing |
| 3 | **Banimento de números WhatsApp** — Se usar QR Code (não-oficial) em vez de Cloud API | Média | Alto | Usar WhatsApp Cloud API Oficial desde o MVP. Custo maior, mas elimina risco existencial |
| 4 | **CAC real > R$ 800** — Custo de aquisição inviabiliza o modelo | Média | Alto | Focar em canais orgânicos (base + YouTube) nos primeiros 6 meses. Kill criteria: se CAC blended > R$ 800 no mês 6, pivotar go-to-market |
| 5 | **Módulo de pagamentos não tem demanda** — PMEs não querem cobrar pelo WhatsApp | Média | Médio | Não incluir pagamentos no MVP. Validar com survey antes de construir. Se < 30% dos clientes piloto pedirem, deprioritizar |
| 6 | **Concorrente baixa preço agressivamente** — SocialHub ou WaCorps cria plano R$ 99 com IA | Média | Médio | Diferenciar por suporte local + customização (vantagem de agência). Não competir por preço |
| 7 | **Sobrecarga de suporte com poucos clientes** — 50 clientes = 25h/mês de suporte manual | Alta | Médio | Documentação + FAQ + chatbot de suporte desde o mês 3. Contratar suporte meio-período no mês 7 |

---

## 6. Métricas de Acompanhamento

### North Star Metric por Fase

| Fase | Período | North Star | Meta |
|---|---|---|---|
| Validação | Meses 1–3 | Clientes que usam o produto semanalmente | > 60% dos ativos |
| PMF | Meses 4–6 | NPS dos clientes pagantes | > 40 |
| Crescimento | Meses 7–12 | MRR | R$ 25K+ |

### Dashboard Semanal (mínimo)

- MRR atual e variação
- Novos trials e taxa de conversão
- Churn e motivos de cancelamento
- CAC por canal
- Tickets de suporte abertos e tempo médio de resolução

---

*Documento gerado por Pablo Plano — Estrategista de Negócios*  
*Data: 2026-04-09 | Squad: video-business-analyzer*  
*Premissas baseadas em: pesquisa de mercado (Marina Mercado) + Lean Canvas (Vitor Video) + benchmarks de mercado*
