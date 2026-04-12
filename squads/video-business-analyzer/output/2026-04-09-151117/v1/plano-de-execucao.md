# Plano de Execução: Plataforma de Multi-Atendimento WhatsApp + IA

> **Autor:** Pablo Plano — Estrategista de Negócios  
> **Data:** 2026-04-09  
> **Baseado em:** Plano de negócio + Análise de mercado + Ideia de negócio  
> **Empresa:** Kansai / Grupo OMK

---

## 1. Definição do MVP (MoSCoW)

### MUST — Obrigatório para lançar (Fase 1)

Sem essas features, o produto não resolve o problema central: "centralizar atendimento WhatsApp para equipes de 2–15 pessoas".

| # | Feature | Justificativa |
|---|---|---|
| M1 | Multi-atendimento WhatsApp (vários agentes, 1 número) | Core do produto. Sem isso, não há produto |
| M2 | Inbox unificado com atribuição de conversas | Permite distribuir e rastrear atendimentos por atendente |
| M3 | Cadastro + autenticação (email + senha) | Acesso básico ao sistema |
| M4 | Multi-tenant (workspaces isolados) | Cada empresa = 1 workspace. Dados isolados. Obrigatório para SaaS |
| M5 | Gestão de atendentes com permissões (admin/atendente) | Segurança: atendente não vê dados de outros workspaces |
| M6 | Suporte a mídia (texto, imagem, áudio, vídeo) | WhatsApp é multimidia — só texto é insuficiente |
| M7 | WhatsApp Cloud API Oficial | Evita risco de banimento (Risco #3 do plano de negócio) |
| M8 | Dashboard básico (conversas ativas, atendentes online) | Visão mínima de operação |

### SHOULD — Incluir se possível na Fase 1

| # | Feature | Justificativa |
|---|---|---|
| S1 | CRM Kanban (funil de leads) | Diferencial vs. WhatsApp Business nativo. Referência: Datafy Chats, SocialHub |
| S2 | Modo dark | Conforto visual. Baixo esforço de implementação com Tailwind |
| S3 | Interface responsiva (mobile) | Atendentes usam celular — se não funciona mobile, perde adoção |
| S4 | Transferência de conversa entre atendentes | Fluxo operacional comum: "vou transferir para o setor X" |

### COULD — Fase 2

| # | Feature | Justificativa |
|---|---|---|
| C1 | IA básica — respostas automáticas para FAQ | Diferencial de valor. Implementar com n8n ou Dify self-hosted |
| C2 | Integração Stripe (pagamentos) | Diferencial único identificado na pesquisa — mas NÃO validado com clientes (Gap G7). Deprioritizado até validação |
| C3 | Relatórios de performance por atendente | Feature de gestão — importante mas não bloqueia adoção |
| C4 | Notificações push / alertas | Nice-to-have para produtividade |
| C5 | Templates de mensagem rápida | Agiliza atendimento repetitivo |

### WON'T — Não agora

| # | Feature | Por que não |
|---|---|---|
| W1 | Instagram Direct | Adiciona complexidade de API e integração. Roadmap futuro |
| W2 | Telegram | Demanda baixa no Brasil comparada ao WhatsApp |
| W3 | White-label (marca customizada por agência) | Exige camada extra de configuração. Entrar após PMF |
| W4 | Chatbot builder visual (drag-and-drop) | Feature creep. Integrar n8n é mais rápido e flexível |
| W5 | App mobile nativo | Web responsivo é suficiente para MVP. App nativo é custo sem retorno comprovado |
| W6 | Relatório fiscal / IRPF | Fora do escopo do produto |
| W7 | Multi-moeda | Mercado inicial é Brasil. Sem necessidade |

---

## 2. Roadmap Faseado

### Fase 1 — MVP | Semanas 1–8 | Budget: R$ 35–50K

**Objetivo:** Produto funcional em produção com 5–10 clientes piloto da base Kansai.

**Equipe:**
- Leonardo (fundador) — decisões de produto, onboarding de clientes
- 1 dev assistido por Claude Code — desenvolvimento full-stack (ou o próprio Leonardo com Claude Code, replicando o método DATA7)
- Designer (part-time ou AI-generated UI) — interfaces core

**Entregas por semana:**

| Semana | Entrega |
|---|---|
| 1–2 | Setup do projeto: Nuxt.js + Supabase + auth + multi-tenant. Estrutura de componentização definida. CI/CD básico |
| 3–4 | Integração WhatsApp Cloud API: envio/recebimento, suporte a mídia, QR code para teste. Inbox unificado |
| 5–6 | Gestão de atendentes + permissões. Dashboard básico. Atribuição de conversas. Transferência |
| 7 | CRM Kanban básico (se tempo permitir → SHOULD). Modo dark. Responsivo mobile |
| 8 | Testes com 3 clientes internos. Correção de bugs críticos. Deploy em produção |

**Custo estimado:**

| Item | Custo |
|---|---|
| Claude Code (tokens de desenvolvimento intensivo, ~8 semanas) | R$ 10.000–15.000 |
| Supabase Pro (banco + auth + storage) | R$ 500 |
| Vercel Pro (hosting) | R$ 500 |
| WhatsApp Cloud API (setup + testes) | R$ 500–1.000 |
| Domínio + SSL + DNS | R$ 200 |
| Designer freelancer (3–5 telas core) | R$ 2.000–5.000 |
| Contingência (20%) | R$ 5.000–8.000 |
| **Total Fase 1** | **R$ 35.000–50.000** |

**Nota:** Custo significativamente menor que desenvolvimento tradicional (R$ 150–300K) porque usa Claude Code como motor de desenvolvimento. Premissa: método de Componentização Extrema funciona conforme demonstrado pelo DATA7 Apps.

**Métrica de sucesso:** 5 clientes piloto usando o produto semanalmente por 30 dias, com NPS > 30.

**Kill criteria:** Se após 30 dias de divulgação na base Kansai, menos de 5 empresas aceitarem testar gratuitamente → a dor não é forte o suficiente no segmento. Pivotar para outro segmento ou revisar proposta de valor.

---

### Fase 2 — Product-Market Fit | Meses 3–6 | Budget: R$ 25–40K

**Objetivo:** 35 clientes pagantes, churn < 6%, validação do pricing.

**Equipe:**
- Leonardo — produto + vendas
- 1 dev/manutenção (Claude Code)
- 1 pessoa suporte (meio período, a partir do mês 4)

**Escopo:**

| Prioridade | Feature |
|---|---|
| Alta | IA básica — agente de FAQ via n8n/Dify (COULD C1 promovido) |
| Alta | Templates de mensagem rápida |
| Alta | Relatórios básicos (mensagens/dia, tempo de resposta, atendente mais ativo) |
| Média | Integração Stripe (SOMENTE se > 30% dos clientes piloto pedirem — validação do Gap G7) |
| Média | Notificações push |
| Baixa | API aberta para integrações |

**Go-to-Market ativo:**

1. Mês 3: Lançar landing page + ativar trial de 7 dias
2. Mês 4: Primeiro vídeo no YouTube (demo por nicho: clínicas médicas)
3. Mês 5: Programa de indicação ativo (1 mês grátis por indicação convertida)
4. Mês 6: Segundo e terceiro vídeos (imobiliárias + varejo)

**Custo mensal estimado (meses 3–6):**

| Item | Custo/mês |
|---|---|
| Infraestrutura | R$ 1.500 |
| Claude Code (manutenção + novas features) | R$ 3.000 |
| Marketing/conteúdo | R$ 2.500 |
| Suporte meio-período | R$ 1.500 |
| **Total mensal** | **~R$ 8.500** |
| **Total Fase 2 (4 meses)** | **R$ 25.000–40.000** |

**Métrica de sucesso:** 35 clientes pagantes, churn < 6%/mês, NPS > 40, ARPU > R$ 250.

**Kill criteria:**
- < 20 clientes pagantes ao final do mês 6 → produto não tem PMF. Fazer 10 entrevistas de saída + pivotar
- Churn > 8%/mês por 2 meses consecutivos → problema de produto ou onboarding. Pausar aquisição, focar em retenção
- CAC blended > R$ 800 → canais de aquisição ineficientes. Testar novos canais antes de investir mais

---

### Fase 3 — Crescimento | Meses 7–12 | Budget: R$ 50–80K

**Objetivo:** 84 clientes ativos, MRR R$ 25K, primeiras 2–3 agências white-label.

**Equipe:**
- Leonardo — estratégia + parcerias com agências
- 1 dev (Claude Code)
- 1 suporte (período integral)
- 1 marketing/conteúdo (freelancer ou meio-período)

**Escopo:**

| Prioridade | Feature |
|---|---|
| Alta | White-label (marca customizada) — habilita canal de agências |
| Alta | IA avançada (agentes conversacionais com contexto, não só FAQ) |
| Média | Integração Stripe (se validado na Fase 2) |
| Média | Instagram Direct (primeiro canal adicional) |
| Baixa | API pública documentada |
| Baixa | Webhooks para integrações externas |

**Go-to-Market:**

1. Mês 7: Abordar 5 agências digitais parceiras da Kansai para white-label
2. Mês 8: Google Ads para "multi-atendimento WhatsApp" (budget R$ 3.000/mês)
3. Mês 9: Case study publicado com 3 clientes (resultados reais)
4. Mês 10–12: Escalar canais que funcionaram, cortar os que não

**Custo mensal estimado (meses 7–12):**

| Item | Custo/mês |
|---|---|
| Infraestrutura | R$ 2.500 |
| Claude Code | R$ 2.000 |
| Marketing/ads | R$ 5.000 |
| Suporte integral | R$ 3.000 |
| Freelancer conteúdo | R$ 2.000 |
| **Total mensal** | **~R$ 14.500** |
| **Total Fase 3 (6 meses)** | **R$ 50.000–80.000** |

**Métrica de sucesso:** MRR R$ 25K, 84 clientes ativos, 2+ agências white-label ativas, churn < 5%.

**Kill criteria:**
- MRR < R$ 15K no mês 10 → crescimento insuficiente. Avaliar: é problema de produto (churn) ou de aquisição (CAC)?
- 0 agências convertidas para white-label após 3 abordagens → modelo white-label não funciona. Focar em B2B direto
- Churn > 7%/mês persistente → produto não retém. Decisão: pivotar para outro segmento ou encerrar

---

## 3. Recursos Totais — Resumo

| Recurso | Fase 1 (8 sem.) | Fase 2 (4 meses) | Fase 3 (6 meses) | Total 12 meses |
|---|---|---|---|---|
| Budget | R$ 35–50K | R$ 25–40K | R$ 50–80K | **R$ 110–170K** |
| Equipe | 1–2 pessoas | 2–3 pessoas | 3–4 pessoas | — |
| Clientes-alvo | 5–10 piloto | 35 pagantes | 84 ativos | 84 ativos |
| MRR-alvo | R$ 0 (trial) | R$ 10K | R$ 25K | R$ 25K |

**Investimento total estimado Ano 1:** R$ 110.000–170.000

**ROI estimado (se atingir metas):**
- ARR ao final do ano 1: R$ 300K (MRR R$ 25K × 12)
- Investimento: R$ 140K (ponto médio)
- Payback do investimento total: ~6 meses de operação plena

---

## 4. Tech Stack Sugerido

| Camada | Tecnologia | Justificativa |
|---|---|---|
| **Frontend** | Nuxt.js 3 (Vue.js) | Mesmo stack do Datafy Chats (referência). Componentização extrema comprovada com Claude Code. SSR para SEO da landing page |
| **Backend** | Nuxt Server Routes (Node.js) | Full-stack no mesmo framework. Reduz complexidade. Webhooks para WhatsApp e Stripe |
| **Banco de dados** | Supabase (PostgreSQL) | Auth incluso, Row Level Security para multi-tenant, realtime para chat, storage para mídia. Free tier generoso para MVP |
| **WhatsApp** | WhatsApp Cloud API (Meta) | API oficial = zero risco de banimento. Conversas de serviço gratuitas. Custo previsível |
| **Pagamentos** | Stripe | Checkout, portal do cliente, webhooks, trial automático. Padrão do mercado SaaS |
| **IA (Fase 2)** | n8n self-hosted + modelo LLM (Claude/GPT) | Flexibilidade de fluxos sem código. Self-hosted = custo menor. Agentes customizáveis por cliente |
| **Hosting** | Vercel (frontend) + Railway/Render (n8n) | Deploy automático, preview branches, serverless. Railway para serviços persistentes (n8n) |
| **Monitoramento** | Sentry (erros) + Plausible (analytics) | Sentry free tier. Plausible é privacy-first e leve |
| **Desenvolvimento** | Claude Code + método Componentização Extrema | Motor de produtividade. Premissa: 1 dev com Claude Code = 3–4 devs tradicionais para este tipo de produto |

**Por que NÃO React/Next.js:** A referência (Datafy Chats) usa Nuxt.js e o método de Componentização Extrema foi testado e documentado nesse stack. Trocar para React adicionaria risco sem benefício comprovado. Manter o que funciona.

**Por que NÃO Firebase:** Supabase oferece PostgreSQL real (queries complexas para relatórios), Row Level Security nativo (multi-tenant seguro), e pricing mais previsível. Firebase cobraria por leitura em sistema de chat de alto volume.

---

## 5. Kill Criteria — Resumo Consolidado

| Fase | Condição de Kill | Ação |
|---|---|---|
| **Fase 1** | < 5 empresas aceitam testar gratuitamente após 30 dias de divulgação | Dor insuficiente. Pivotar segmento ou reformular proposta de valor |
| **Fase 1** | Custo de desenvolvimento > R$ 70K (40% acima do budget) | Stack ou método inadequado. Avaliar simplificar escopo ou mudar abordagem técnica |
| **Fase 2** | < 20 clientes pagantes ao final do mês 6 | Produto sem PMF. 10 entrevistas de saída antes de decidir pivot |
| **Fase 2** | Churn > 8%/mês por 2 meses consecutivos | Problema de retenção. Pausar aquisição, focar em produto |
| **Fase 2** | CAC blended > R$ 800 no mês 6 | Canais ineficientes. Testar novos antes de escalar |
| **Fase 3** | MRR < R$ 15K no mês 10 | Crescimento insuficiente. Avaliar causa (produto vs. aquisição) |
| **Fase 3** | Churn > 7%/mês persistente por 3+ meses | Produto não retém. Decisão: pivotar ou encerrar |
| **Qualquer** | Meta lança multi-atendimento nativo grátis no WhatsApp Business | Reavaliar toda a proposta de valor. Possível pivot para CRM + IA como diferencial, abandonando multi-atendimento como core |

---

## 6. Decisões Críticas Pendentes (antes de começar)

| # | Decisão | Impacto | Recomendação |
|---|---|---|---|
| 1 | WhatsApp Cloud API ou QR Code (não-oficial)? | Custo vs. risco de banimento | **Cloud API Oficial.** Custo maior, mas elimina risco existencial |
| 2 | Incluir pagamentos no MVP? | Escopo vs. diferencial | **Não.** Validar demanda antes. Incluir na Fase 2 se > 30% dos piloto pedirem |
| 3 | Supabase ou outro banco? | Lock-in vs. velocidade | **Supabase.** Velocidade de MVP compensa lock-in moderado |
| 4 | Self-hosted ou managed? | Custo vs. operação | **Managed (Vercel/Supabase).** Equipe pequena = zero tempo para DevOps |
| 5 | Nome do produto? | Branding | Definir antes do mês 3. Sugestão: nome curto, fácil de digitar, domínio .com.br disponível |

---

*Documento gerado por Pablo Plano — Estrategista de Negócios*  
*Data: 2026-04-09 | Squad: video-business-analyzer*  
*Premissas baseadas em: plano de negócio + pesquisa de mercado + benchmarks de concorrentes*
