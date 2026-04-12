# Domain Framework — Inteligência de Mercado

> Framework operacional do Squad de Inteligência de Mercado | 2026-04-08

---

## Visão Geral

O Squad de Inteligência de Mercado executa o ciclo CI completo:
**Collect → Analyze → Activate**

Cada execução parte de uma pergunta de negócio específica e entrega um slide deck executivo acionável.

---

## Fase 1: Definição do Foco (Checkpoint)

**Agente responsável:** Nenhum — input direto do usuário via checkpoint

**Inputs coletados:**
1. Tema específico da pesquisa (texto livre, ex: "competidores da Overmind no mercado de IA corporativo")
2. Janela temporal (24h / 7 dias / 30 dias / evergreen)
3. Formato do output já definido: slide deck HTML executivo

**Output:** `research-focus.md` com tema, período e contexto da empresa

**Critério de qualidade:** Tema é específico o suficiente para orientar buscas focadas (não genérico como "IA no Brasil")

---

## Fase 2: Pesquisa (Rafael Rastreador)

**Método: Information Landscape Mapping + Focused Search Sweep**

### Step 2.1 — Mapear Fontes
Categorizar fontes relevantes para o tema antes de buscar:
- Publicações analistas (IDC, Gartner, FGV, ABES)
- Portais de notícias do setor (Valor, TechCrunch, InfoMoney, Startups.com.br)
- Redes sociais (LinkedIn Pulse, Twitter/X do setor, posts de executivos)
- Sites oficiais de concorrentes (blog, pricing, job postings como sinal de estratégia)

### Step 2.2 — Coleta Focada
- 5-10 fontes candidatas por categoria
- Priorizar: data > autoridade > relevância ao tema
- Coletar: dado principal, URL, data de publicação, autor/organização

### Step 2.3 — Deep-Dive
- 3-5 fontes mais promissoras por profundidade
- Extrair citações e dados específicos
- Cruzar dados entre fontes (atribuir confiança)

### Step 2.4 — Documentação
- Estruturar em research brief padrão
- Registrar lacunas honestamente
- Verificar todas as URLs antes de incluir

**Output:** `research-brief.md` estruturado

---

## Fase 3: Análise (Ana Analítica)

**Método: SWOT + Gap Analysis + Insight Synthesis**

### Step 3.1 — Pattern Identification
- Identificar 3 maiores movimentos do período (positivos e negativos)
- Marcar anomalias (movimentos >25% vs. período anterior)
- Agrupar achados por tema/categoria

### Step 3.2 — Benchmarking
- Comparar com período anterior quando disponível
- Comparar com benchmark do setor (médias publicadas)
- Comparar com targets internos do grupo OMK quando aplicável

### Step 3.3 — SWOT do Cenário
- **Strengths:** o que o grupo OMK/marca em questão faz melhor que o mercado
- **Weaknesses:** onde existem gaps vs. concorrentes
- **Opportunities:** tendências emergentes onde OMK pode capturar posição
- **Threats:** movimentos de concorrentes que ameaçam posição atual

### Step 3.4 — Insight Synthesis
- 4-6 insights com estrutura: O que aconteceu → Por que importa → Isso significa...
- Cada insight com nível de confiança e justificativa

### Step 3.5 — Recomendações
- 3-5 recomendações priorizadas por: Impacto × Confiança × Esforço
- Cada recomendação: ação específica, impacto esperado, confiança, esforço, prioridade

**Output:** `analysis-report.md`

---

## Fase 4: Criação do Slide Deck (Diego Dashboard)

**Método: Data Storytelling + Visual Hierarchy**

### Estrutura padrão do deck (5-7 slides)
1. **Capa** — Tema, marca, data
2. **Sumário Executivo** — 3 bullets, responde "estamos ganhando ou perdendo e por quê"
3. **Dados Principais** — KPIs críticos com comparativos (máximo 8 por slide)
4. **Insights** — 3-4 insights com título-conclusão
5. **Recomendações** — 3-5 ações priorizadas com badges de prioridade
6. **Próximos Passos** (opcional) — Owner + prazo para cada recomendação

### Regras visuais
- Paleta OMK: navy `#0b1120`, cyan `#22d3ee`, azul `#3b82f6`
- Hierarquia visual: KPI principal = maior elemento, top-left
- Títulos-conclusão em todos os slides (não títulos-variável)
- CSS inline, HTML autossuficiente

**Output:** `slide-deck.html`

---

## Fase 5: Revisão (Vera Veredicto)

**Método: Scorecard + Structured Feedback**

### Critérios de avaliação (1-10)
1. Precisão dos dados — fontes verificadas e datadas
2. Clareza executiva — insight principal extraível em <30s por slide
3. Completude — todas as seções presentes e preenchidas
4. Design e legibilidade — paleta, tipografia, hierarquia visual
5. Recomendações acionáveis — priorizadas com impacto e esforço

### Regras de decisão
- **APROVADO:** média ≥ 7/10 e nenhum critério abaixo de 4/10
- **APROVADO CONDICIONAL:** média ≥ 7/10 com 1-2 critérios não-críticos entre 4-6/10
- **REJEITADO:** média < 7/10 OU qualquer critério < 4/10

**Output:** `review-report.md` com veredicto, scorecard e feedback

---

## Ciclo de Revisão

- Máximo 3 revisões antes de escalar ao usuário
- Rejeição retorna ao Step 4 (criação de slides) com feedback específico
- Após aprovação da Vera, checkpoint final com o usuário

---

## Fluxo de Decisão Rápido

```
Tema muito genérico? → Pedir refinamento no checkpoint
Dados conflitantes entre fontes? → Documentar ambos com nível de confiança
Sem dados suficientes para uma seção? → Documentar como Lacuna
Slide com >8 KPIs? → Reorganizar em dois slides ou selecionar os 8 mais críticos
Score de critério < 4/10? → Rejeitar automaticamente, independente da média
3ª rejeição pelo mesmo problema? → Escalar ao usuário com análise do problema recorrente
```
