---
task: "Gerar Insights"
order: 2
input: |
  - pattern_map: Mapa de padrões e SWOT da tarefa anterior
  - research_brief: Brief original para contexto de fontes
output: |
  - analysis_report: Relatório de análise completo com sumário executivo, insights e recomendações
---

# Gerar Insights

Transforma o mapa de padrões e SWOT em um relatório de análise executivo com insights de negócio acionáveis e recomendações priorizadas.

## Process

1. Identificar os 4-6 insights mais relevantes do mapa de padrões — priorizar por impacto no negócio + confiança dos dados
2. Para cada insight, escrever em estrutura obrigatória: O que aconteceu → Por que importa → **Isso significa:** [implicação de negócio]
3. Atribuir nível de confiança a cada insight com justificativa (baseado nas fontes do brief)
4. Derivar 3-5 recomendações acionáveis dos insights — cada uma com: ação específica, impacto esperado, confiança, esforço, prioridade
5. Ordenar recomendações por prioridade (Alto impacto × Alta confiança = ALTA prioridade)
6. Escrever sumário executivo de exatamente 3 bullets autossuficientes — deve poder ser lido sem o relatório completo
7. Adicionar seção de Metodologia com período, fontes e exclusões

## Output Format

```markdown
ANÁLISE DE INTELIGÊNCIA DE MERCADO
Tema: [tema]
Período: [período]
Preparado: [data]

SUMÁRIO EXECUTIVO
• [KPI principal com comparativo e implicação]
• [Ameaça ou oportunidade crítica com janela temporal]
• [Recomendação de maior impacto]

INSIGHTS

1. [Título assertivo do insight]
   [Dado que sustenta — quantificado]
   Isso significa: [implicação de negócio concreta e específica]
   Confiança: [ALTA/MÉDIA/BAIXA] — [razão]

RECOMENDAÇÕES

1. [Ação específica e executável]
   [Razão baseada em insight específico]
   Prioridade: [ALTA/MÉDIA/BAIXA] | Confiança: [ALTA/MÉDIA] | Esforço: [ALTO/MÉDIO/BAIXO]
   Impacto esperado: [resultado quantificado onde possível]

METODOLOGIA
- Período: [datas]
- Fontes principais: [lista]
- Exclusões: [o que foi excluído e por quê]
```

## Output Example

> Use as quality reference, not as rigid template.

```
ANÁLISE DE INTELIGÊNCIA DE MERCADO
Tema: Posicionamento Competitivo Overmind — IA Corporativa Brasil
Período: 01/03/2026 – 08/04/2026
Preparado: 2026-04-08

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

SUMÁRIO EXECUTIVO
• Mercado de IA corporativa no Brasil cresceu 38% YoY no Q1 2026 — acima da média histórica de 25%, sinalizando aceleração estrutural da demanda
• 3 competidores lançaram RAG corporativo nos últimos 60 dias: janela de diferenciação estimada em 6-9 meses antes da comoditização
• Recomendação prioritária: lançar oferta de RAG + Agentes para PMEs B2B até maio/2026, aproveitando sinergia Overmind + Meridiano + Kansai

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

INSIGHTS

1. A Corrida por RAG Corporativo Já Começou — Vencedor Ainda Não Definido
   3 competidores (Mesha, Doutores da IA, Altera.ai) lançaram RAG nos últimos 60 dias,
   todos sem cases públicos consolidados. Nenhum tem o diferencial de integração dados + software.
   Isso significa: a janela para entrar com posicionamento forte ainda está aberta, mas
   se fecha em 6-9 meses conforme os players acumulam referências de mercado.
   A Overmind tem a vantagem de integrar Meridiano (dados) + Kansai (software) que
   nenhum competidor possui — esse é o ângulo de diferenciação disponível agora.
   Confiança: ALTA — 3 fontes independentes corroboram os lançamentos; janela estimada baseada
   em padrão histórico de comoditização de categorias de IA (referência: chatbots 2023-2024)

2. PMEs B2B São o Maior Mercado Sub-atendido
   62% da nova demanda de IA corporativa vem de empresas de 50-500 funcionários —
   exatamente o segmento que grandes consultorias ignoram e que não tem orçamento para
   montar times internos de IA.
   Isso significa: focar em PMEs B2B reduz concorrência direta (enterprise é battleground de
   Accenture, TOTVS, grandes SIs) e acelera ciclo de vendas por menor ticket de decisão.
   A Overmind pode capturar este segmento antes de qualquer outro player especializado.
   Confiança: MÉDIA — dado da ABES com metodologia parcial; direção é confirmada por
   observação de mercado e posicionamento dos competidores (todos focam enterprise)

3. Verticalização Sinaliza Próxima Fase do Mercado
   Competidores começando a criar verticais por setor (jurídico, saúde, agro).
   Volume de discussão sobre IA vertical no LinkedIn cresceu 3x vs. dezembro/2025.
   Isso significa: o mercado de IA genérica está se comoditizando — próxima fase de
   diferenciação é especialização setorial. Quem "plantar bandeiras" em 1-2 verticais
   antes dos concorrentes terá vantagem de posicionamento de marca difícil de reverter.
   Confiança: MÉDIA — sinal emergente, dados de LinkedIn são amostrais (120 posts)

4. Ausência Online da Overmind É o Maior Risco de Curto Prazo
   Mesha, Doutores da IA e Altera.ai têm site, blog e presença ativa no LinkedIn.
   Overmind opera sem site nem presença social formal — invisível nos momentos de
   busca ativa por fornecedores de IA.
   Isso significa: compradores de IA corporativa pesquisam online antes de solicitar
   indicações. Invisibilidade digital significa perder deals que nunca chegam ao funil.
   Com o mercado crescendo 38% e novos compradores entrando, esta janela de busca ativa
   está no pico — e a Overmind não aparece nela.
   Confiança: ALTA — verificação direta de presença online dos concorrentes

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

RECOMENDAÇÕES

1. Lançar oferta estruturada de RAG Corporativo com cases B2B até maio/2026
   Baseado em: Insights 1 e 2 — janela aberta + segmento PME sub-atendido
   Ação: desenvolver 2-3 projetos piloto com clientes PME em troca de case público.
   Posicionar como "RAG para PMEs B2B" com diferencial Meridiano + Kansai.
   Prioridade: ALTA | Confiança: ALTA | Esforço: MÉDIO
   Impacto esperado: casos de referência pública antes dos competidores consolidarem posição

2. Criar presença digital mínima da Overmind (site + LinkedIn) em 30 dias
   Baseado em: Insight 4 — invisibilidade em momento de demanda máxima
   Ação: site de 3 páginas (Home, Serviços, Contato) + LinkedIn com 2 posts/semana
   Prioridade: ALTA | Confiança: ALTA | Esforço: BAIXO
   Impacto esperado: aparecer nas buscas durante o pico de mercado atual

3. Definir 1 vertical de especialização para posicionamento até jun/2026
   Baseado em: Insight 3 — janela pré-comoditização de IA vertical
   Ação: avaliar base de clientes atual e escolher entre jurídico (RAG documental)
   ou financeiro (sinergia com Meridiano). Publicar 3 peças de thought leadership.
   Prioridade: ALTA | Confiança: MÉDIA | Esforço: BAIXO
   Impacto esperado: posição de autoridade no vertical escolhido antes dos concorrentes

4. Monitorar semanalmente os 3 competidores identificados
   Baseado em: Insight 1 — corrida em andamento
   Ação: acompanhar LinkedIn, site e job postings de Mesha, Doutores da IA, Altera.ai
   Prioridade: MÉDIA | Confiança: ALTA | Esforço: BAIXO
   Impacto esperado: detecção antecipada de movimentos de pricing e expansão de oferta

METODOLOGIA
- Período: 01/03/2026 – 08/04/2026
- Fontes principais: IDC Brazil Q1 2026, ABES Relatório IA 2026, TechCrunch BR,
  LinkedIn (análise própria, 120 posts), sites oficiais dos concorrentes
- Exclusões: dados de receita de concorrentes (empresas privadas, não disponível);
  NPS de clientes (nenhum estudo independente encontrado)
- Limitações: dado de PMEs baseado em única fonte (ABES) com metodologia parcial
```

## Quality Criteria

- [ ] Sumário executivo tem exatamente 3 bullets e pode ser lido isoladamente
- [ ] Cada insight tem "Isso significa:" com implicação de negócio específica
- [ ] Cada recomendação tem todos os 5 campos: ação, impacto, confiança, esforço, prioridade
- [ ] Recomendações ordenadas por prioridade (ALTA primeiro)
- [ ] Nenhum qualificador vago — toda afirmação quantificada ou com nível de confiança
- [ ] Seção de Metodologia completa com período, fontes e exclusões

## Veto Conditions

Reject and redo if ANY are true:
1. Algum insight não tem "Isso significa:" com implicação de negócio concreta
2. Alguma recomendação não tem os 5 campos obrigatórios (ação, impacto, confiança, esforço, prioridade)
