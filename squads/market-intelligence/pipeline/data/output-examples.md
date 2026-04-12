# Output Examples — Squad de Inteligência de Mercado

> Exemplos completos e realistas do output final esperado | 2026-04-08

---

## Exemplo 1: Inteligência Competitiva — Overmind no Mercado de IA Corporativo

### Research Brief (Rafael Rastreador)

```
RESEARCH BRIEF
Tema: Posicionamento competitivo Overmind — Mercado de IA Corporativo no Brasil
Janela Temporal: 01/03/2026 – 08/04/2026
Preparado: 2026-04-08

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PRINCIPAIS ACHADOS

1. O mercado brasileiro de IA corporativa cresceu 38% YoY no Q1 2026, puxado por
   demanda em agentes autônomos para operações B2B (atendimento, cobrança, backoffice).
   Confiança: ALTA
   Fonte: IDC Brazil AI Services Market Q1 2026
   URL: https://www.idc.com/brazil/ai-q1-2026 (exemplo)
   Acessado: 2026-04-07

2. Tres competidores diretos (Mesha, Doutores da IA, Altera.ai) lançaram ofertas de
   RAG corporativo nos últimos 60 dias, sinalizando corrida para capturar o segmento
   de empresas com bases de conhecimento proprietárias.
   Confiança: ALTA
   Fonte: LinkedIn posts oficiais das empresas + TechCrunch BR, 02/04/2026
   URL: https://techcrunch.com/br/2026/04/02/rag-corporativo (exemplo)
   Acessado: 2026-04-07

3. Empresas de médio porte (50-500 funcionários) representam 62% das novas contratações
   de serviços de IA no Brasil — segmento historicamente sub-atendido por grandes consultorias.
   Confiança: MÉDIA — baseado em relatório de associação, metodologia não detalhada
   Fonte: ABES Relatório IA nas Empresas 2026
   URL: https://abes.org.br/relatorio-ia-2026 (exemplo)
   Acessado: 2026-04-06

4. O LinkedIn de executivos do setor mostra volume crescente de posts sobre "IA para vendas B2B"
   e "automação de backoffice com LLMs" — share of voice 3x maior que em dezembro/2025.
   Confiança: MÉDIA — análise manual de 120 posts, não ferramental
   Fonte: LinkedIn (análise própria)
   Acessado: 2026-04-08

TENDÊNCIAS EMERGENTES

- "RAG Corporativo como diferencial" — Ciclo de vida: crescimento acelerado
  Empresas querem IA treinada nos seus próprios dados (manuais, CRM, docs internos).
  Janela estimada antes de comoditização: 6-9 meses

- "Agentes para backoffice B2B" — Ciclo de vida: adoção inicial
  Automação de processos internos (RH, financeiro, cobrança) com agentes LLM.
  Forte demanda mas baixa oferta especializada no Brasil.

- "IA vertical por setor" — Ciclo de vida: emergente
  Competidores começam a criar verticais (saúde, jurídico, agro) em vez de IA genérica.
  Sinaliza próxima fase de diferenciação do mercado.

FONTES

| # | Fonte | Tipo | Relevância | Data |
|---|-------|------|------------|------|
| 1 | IDC Brazil AI Q1 2026 | Analista | 9/10 | 2026-04 |
| 2 | TechCrunch BR | Mídia | 8/10 | 2026-04 |
| 3 | ABES Relatório IA 2026 | Associação | 7/10 | 2026-03 |
| 4 | LinkedIn (análise própria) | Social | 5/10 | 2026-04 |
| 5 | Sites dos concorrentes | Primário | 8/10 | 2026-04 |

LACUNAS

- Dados de receita dos competidores diretos não disponíveis publicamente (todas são privadas)
- Nenhum estudo independente sobre NPS ou satisfação de clientes de agências de IA BR
- Adoção de IA em PMEs ainda carece de dados estruturados — ABES é a única fonte disponível
```

---

### Slide Deck HTML (Diego Dashboard)

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Inteligência de Mercado — Overmind | Abril 2026</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: 'Inter', 'Segoe UI', sans-serif; background: #0b1120; color: #e2e8f0; }
    .slide { min-height: 100vh; padding: 64px 80px; display: flex; flex-direction: column; justify-content: center; border-bottom: 1px solid #1e293b; }
    .slide-number { font-size: 0.75rem; color: #475569; letter-spacing: 3px; text-transform: uppercase; margin-bottom: 48px; }
    h1 { font-size: 2.75rem; font-weight: 700; color: #22d3ee; line-height: 1.2; margin-bottom: 16px; }
    h2 { font-size: 1.5rem; font-weight: 600; color: #3b82f6; margin-bottom: 32px; }
    h3 { font-size: 1.1rem; font-weight: 600; color: #94a3b8; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 16px; }
    .kpi-primary { font-size: 5rem; font-weight: 800; color: #22d3ee; line-height: 1; }
    .kpi-label { font-size: 0.9rem; color: #64748b; text-transform: uppercase; letter-spacing: 2px; margin-top: 8px; }
    .kpi-compare { font-size: 0.85rem; color: #10b981; margin-top: 4px; }
    .kpi-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 32px; margin-top: 32px; }
    .kpi-card { background: #1e293b; border-radius: 12px; padding: 28px; border-top: 3px solid #22d3ee; }
    .insight-card { background: #1e293b; border-left: 4px solid #22d3ee; border-radius: 0 12px 12px 0; padding: 24px; margin-bottom: 20px; }
    .insight-title { font-size: 1.15rem; font-weight: 600; color: #f1f5f9; margin-bottom: 8px; }
    .insight-means { font-size: 0.9rem; color: #64748b; margin-top: 12px; font-style: italic; }
    .badge { display: inline-block; padding: 4px 14px; border-radius: 20px; font-size: 0.75rem; font-weight: 700; letter-spacing: 0.5px; }
    .badge-high { background: #10b98120; color: #10b981; border: 1px solid #10b98140; }
    .badge-medium { background: #f59e0b20; color: #f59e0b; border: 1px solid #f59e0b40; }
    .badge-warning { background: #ef444420; color: #ef4444; border: 1px solid #ef444440; }
    .rec-card { background: #1e293b; border-radius: 12px; padding: 24px; margin-bottom: 16px; display: flex; align-items: flex-start; gap: 20px; }
    .rec-number { font-size: 2rem; font-weight: 800; color: #22d3ee30; min-width: 40px; }
    .rec-content h4 { font-size: 1rem; font-weight: 600; color: #f1f5f9; margin-bottom: 8px; }
    .rec-meta { display: flex; gap: 8px; margin-top: 8px; flex-wrap: wrap; }
    .divider { border: none; border-top: 1px solid #1e293b; margin: 40px 0; }
    .label { font-size: 0.75rem; color: #475569; text-transform: uppercase; letter-spacing: 2px; }
    .bullet-list { list-style: none; }
    .bullet-list li { padding: 12px 0; border-bottom: 1px solid #1e293b30; font-size: 1.05rem; color: #cbd5e1; }
    .bullet-list li:before { content: "→"; color: #22d3ee; margin-right: 12px; font-weight: 700; }
  </style>
</head>
<body>

  <!-- SLIDE 1: CAPA -->
  <div class="slide" style="text-align: center; align-items: center;">
    <div class="label">Grupo OMK · Overmind</div>
    <h1 style="margin-top: 32px; font-size: 3.5rem;">Janela de 6 Meses para<br>Capturar RAG Corporativo</h1>
    <p style="color: #64748b; margin-top: 16px; font-size: 1rem;">Inteligência de Mercado · Abril 2026</p>
    <div style="margin-top: 64px; display: flex; gap: 48px;">
      <div><div class="kpi-primary">38%</div><div class="kpi-label">Crescimento YoY · IA Corporativa BR</div></div>
      <div><div class="kpi-primary">3</div><div class="kpi-label">Competidores em RAG nos últimos 60d</div></div>
      <div><div class="kpi-primary">6mo</div><div class="kpi-label">Janela antes da comoditização</div></div>
    </div>
  </div>

  <!-- SLIDE 2: SUMÁRIO EXECUTIVO -->
  <div class="slide">
    <div class="slide-number">01 · Sumário Executivo</div>
    <h1>O mercado está pronto.<br>A janela está se fechando.</h1>
    <ul class="bullet-list" style="margin-top: 40px;">
      <li>Mercado de IA corporativa cresceu <strong>38% YoY</strong> no Q1 2026 — demanda concentrada em agentes B2B e RAG com dados proprietários</li>
      <li><strong>3 competidores lançaram RAG corporativo nos últimos 60 dias</strong> — janela de diferenciação estimada em 6-9 meses antes da comoditização</li>
      <li><strong>Recomendação:</strong> Posicionar Overmind como especialista em RAG + Agentes para PMEs B2B (50-500 funcionários) — segmento de 62% da demanda, sub-atendido</li>
    </ul>
  </div>

  <!-- SLIDE 3: DADOS PRINCIPAIS -->
  <div class="slide">
    <div class="slide-number">02 · O Mercado em Números</div>
    <h1>IA Corporativa no Brasil Acelera — PMEs Lideram a Demanda</h1>
    <div class="kpi-grid">
      <div class="kpi-card">
        <div class="kpi-primary">38%</div>
        <div class="kpi-label">Crescimento YoY Q1 2026</div>
        <div class="kpi-compare">↑ vs 25% em 2025</div>
      </div>
      <div class="kpi-card">
        <div class="kpi-primary">62%</div>
        <div class="kpi-label">Demanda gerada por PMEs (50-500 func)</div>
        <div class="kpi-compare">Sub-atendidas por grandes consultorias</div>
      </div>
      <div class="kpi-card">
        <div class="kpi-primary" style="color: #f59e0b;">3x</div>
        <div class="kpi-label">Share of voice "IA para B2B" no LinkedIn</div>
        <div class="kpi-compare">vs dez/2025</div>
      </div>
    </div>
  </div>

  <!-- SLIDE 4: INSIGHTS -->
  <div class="slide">
    <div class="slide-number">03 · Insights</div>
    <h1>3 Movimentos que Definem os Próximos 6 Meses</h1>
    <div style="margin-top: 32px;">
      <div class="insight-card">
        <div class="insight-title">🏃 RAG Corporativo: Corrida Iniciada, Vencedor Ainda Não Definido</div>
        <p style="color: #94a3b8; font-size: 0.95rem;">Mesha, Doutores da IA e Altera.ai lançaram RAG nos últimos 60 dias — todos em fase inicial sem cases públicos consolidados.</p>
        <div class="insight-means">Isso significa: a janela para entrar com posicionamento forte ainda está aberta, mas se fecha em 6-9 meses conforme os players consolidam referências.</div>
        <div style="margin-top: 12px;"><span class="badge badge-high">ALTA CONFIANÇA</span></div>
      </div>
      <div class="insight-card" style="border-left-color: #3b82f6;">
        <div class="insight-title">🎯 PMEs B2B São o Segmento de Maior Oportunidade</div>
        <p style="color: #94a3b8; font-size: 0.95rem;">62% da demanda vem de empresas de 50-500 funcionários — exatamente o segmento que grandes consultorias ignoram e que não consegue contratar times internos de IA.</p>
        <div class="insight-means">Isso significa: posicionamento focado em PMEs B2B tem menos concorrência direta e maior velocidade de fechamento de contratos.</div>
        <div style="margin-top: 12px;"><span class="badge badge-medium">MÉDIA CONFIANÇA</span></div>
      </div>
      <div class="insight-card" style="border-left-color: #f59e0b;">
        <div class="insight-title">⚠️ Verticalização Sinaliza Próxima Fase do Mercado</div>
        <p style="color: #94a3b8; font-size: 0.95rem;">Concorrentes começam a criar verticais por setor — jurídico, saúde, agro. Isso sinaliza commoditização da IA genérica e que diferenciação futura exigirá especialização setorial.</p>
        <div class="insight-means">Isso significa: Overmind deve escolher 1-2 verticais para especialização antes que os competidores consolidem posição nesses nichos.</div>
        <div style="margin-top: 12px;"><span class="badge badge-warning">SINAL DE ALERTA</span></div>
      </div>
    </div>
  </div>

  <!-- SLIDE 5: RECOMENDAÇÕES -->
  <div class="slide">
    <div class="slide-number">04 · Recomendações</div>
    <h1>3 Ações Prioritárias para os Próximos 90 Dias</h1>
    <div style="margin-top: 32px;">
      <div class="rec-card">
        <div class="rec-number">1</div>
        <div class="rec-content">
          <h4>Lançar oferta estruturada de RAG Corporativo com cases B2B até maio/2026</h4>
          <p style="color: #94a3b8; font-size: 0.9rem;">Desenvolver 2-3 cases piloto com clientes PME em troca de referência pública. Posicionar como "RAG para PMEs B2B" — diferente dos competidores focados em enterprise.</p>
          <div class="rec-meta">
            <span class="badge badge-high">PRIORIDADE ALTA</span>
            <span class="badge" style="background: #3b82f620; color: #3b82f6; border: 1px solid #3b82f640;">CONFIANÇA ALTA</span>
            <span class="badge" style="background: #8b5cf620; color: #8b5cf6; border: 1px solid #8b5cf640;">ESFORÇO MÉDIO</span>
          </div>
        </div>
      </div>
      <div class="rec-card">
        <div class="rec-number">2</div>
        <div class="rec-content">
          <h4>Definir 1 vertical de especialização para posicionamento de mercado até jun/2026</h4>
          <p style="color: #94a3b8; font-size: 0.9rem;">Candidatos com maior potencial para OMK: jurídico (alta complexidade documental, RAG ideal) ou financeiro (sinergia com Meridiano). Escolher baseado em base de clientes atual.</p>
          <div class="rec-meta">
            <span class="badge badge-high">PRIORIDADE ALTA</span>
            <span class="badge" style="background: #3b82f620; color: #3b82f6; border: 1px solid #3b82f640;">CONFIANÇA MÉDIA</span>
            <span class="badge" style="background: #8b5cf620; color: #8b5cf6; border: 1px solid #8b5cf640;">ESFORÇO BAIXO</span>
          </div>
        </div>
      </div>
      <div class="rec-card">
        <div class="rec-number">3</div>
        <div class="rec-content">
          <h4>Monitorar semanalmente lançamentos dos 3 competidores identificados</h4>
          <p style="color: #94a3b8; font-size: 0.9rem;">Acompanhar LinkedIn, site e job postings de Mesha, Doutores da IA e Altera.ai para detectar movimento de pricing, cases e expansão de oferta antes que se torne público.</p>
          <div class="rec-meta">
            <span class="badge badge-medium">PRIORIDADE MÉDIA</span>
            <span class="badge" style="background: #3b82f620; color: #3b82f6; border: 1px solid #3b82f640;">CONFIANÇA ALTA</span>
            <span class="badge" style="background: #8b5cf620; color: #8b5cf6; border: 1px solid #8b5cf640;">ESFORÇO BAIXO</span>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>
```

---

## Exemplo 2: Monitoramento de Tendências — Mercado de Fábricas de Software (Kansai)

*(Exemplo condensado — estrutura igual, conteúdo diferente)*

**Research Brief resumido:**
- Crescimento de demanda por nearshore com empresas americanas: +45% em contratos para BR em 2026
- 3 competidores expandiram presença no LinkedIn com conteúdo técnico (CI&T, Cheesecake Labs, Vortigo)
- Job postings de Kansai concorrentes aumentaram 28% — sinal de expansão de capacidade

**Slide deck resumido:**
- Título da capa: "Nearshore Brasileiro Aquece — Kansai Tem Vantagem de Marca"
- KPIs principais: +45% contratos nearshore, 3 concorrentes em expansão, posição relativa na busca por "fábrica de software premium"
- Insight principal: "A diferenciação de marca é o ativo mais sub-explorado da Kansai vs. competidores"
- Recomendação prioritária: "Produzir 3 case studies detalhados de projetos de arquitetura digital para capturar busca orgânica e LinkedIn B2B"
