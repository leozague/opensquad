# Quality Criteria — Squad de Inteligência de Mercado

> Critérios de qualidade para avaliação do output final | 2026-04-08

---

## Critérios de Avaliação do Slide Deck (Escala 1-10)

### 1. Precisão dos Dados (peso alto)

**O que avaliar:**
- Todos os dados citados têm fonte verificável (URL ou referência clara)
- Dados têm data de publicação — dados >12 meses em mercados dinâmicos são sinalizados como "desatualizados"
- Nenhuma afirmação factual sem fonte de suporte
- Contradições entre fontes são documentadas, não silenciadas

**Score 9-10:** Todos os dados com fonte, URL e data; zero afirmações não-suportadas
**Score 7-8:** Maioria dos dados com fonte; 1-2 afirmações gerais sem cite específico
**Score 4-6:** Dados parcialmente fonteados; afirmações genéricas presentes
**Score 1-3:** Dados majoritariamente sem fonte ou afirmações fabricadas

**Trigger de rejeição automática (< 4):** Qualquer dado crítico sem fonte verificável

---

### 2. Clareza Executiva (peso alto)

**O que avaliar:**
- Executivo extrai o insight principal de cada slide em menos de 30 segundos
- Todos os slides têm título-conclusão (não título-variável)
  - BONS: "IA cresce 34% YoY no Brasil", "Janela de 6 meses para capturar RAG corporativo"
  - RUINS: "Crescimento de IA", "Análise de Mercado"
- Zero acrônimos não explicados no deck
- Sumário executivo autossuficiente — pode ser lido isoladamente

**Score 9-10:** Todos os slides com título-conclusão; insight claro em <30s; zero acrônimos opacos
**Score 7-8:** Maioria com título-conclusão; 1-2 slides levam mais de 30s para extrair o insight
**Score 4-6:** Metade dos slides sem título-conclusão; alguns acrônimos não explicados
**Score 1-3:** Títulos genéricos na maioria; deck requer leitura extensiva para extrair valor

**Trigger de rejeição automática (< 4):** Sumário executivo não pode ser lido isoladamente

---

### 3. Completude (peso médio)

**O que avaliar:**
- Capa presente com tema, marca e data
- Sumário executivo com exatamente 3 bullets
- Seção de dados/KPIs principais (com comparativos)
- Seção de insights (mínimo 3)
- Seção de recomendações (mínimo 3, priorizadas)

**Score 9-10:** Todas as seções presentes e preenchidas com profundidade adequada
**Score 7-8:** Todas as seções presentes; 1-2 com profundidade reduzida mas aceitável
**Score 4-6:** 1-2 seções ausentes ou substancialmente incompletas
**Score 1-3:** Deck claramente incompleto; seções faltando ou vazias

---

### 4. Design e Legibilidade (peso médio)

**O que avaliar:**
- Paleta OMK aplicada: navy `#0b1120`, cyan `#22d3ee`, azul `#3b82f6`
- HTML autossuficiente com CSS inline (renderiza sem dependências externas)
- Tipografia legível (fonte ≥ 14px no corpo, ≥ 24px em KPIs principais)
- Hierarquia visual: KPI principal = maior elemento, posição de destaque
- Máximo 8 KPIs por slide executivo

**Score 9-10:** Paleta correta, hierarquia visual clara, legível, máximo 8 KPIs respeitado
**Score 7-8:** Paleta majoritariamente correta; 1-2 violações menores de hierarquia
**Score 4-6:** Paleta inconsistente ou > 8 KPIs em slides executivos; legibilidade comprometida
**Score 1-3:** HTML não renderiza corretamente ou design incompatível com uso executivo

**Trigger de rejeição automática (< 4):** HTML não renderiza ou texto ilegível (< 12px)

---

### 5. Recomendações Acionáveis (peso alto)

**O que avaliar:**
- Cada recomendação tem: ação específica + impacto esperado + confiança + esforço + prioridade
- Recomendações ordenadas por prioridade (Alta primeiro)
- Cada recomendação conecta explicitamente a um insight documentado
- Ações são específicas e executáveis — não vagas

**Score 9-10:** Todas as recomendações com os 5 campos; priorizadas; conectadas a insights; específicas
**Score 7-8:** Maioria com campos completos; 1-2 recomendações um pouco genéricas
**Score 4-6:** Recomendações presentes mas sem priorização ou campos incompletos
**Score 1-3:** Recomendações ausentes ou completamente vagas ("investir mais em IA")

**Trigger de rejeição automática (< 4):** Seção de recomendações ausente ou toda vaga

---

## Regras de Decisão do Reviewer

| Condição | Veredicto |
|---|---|
| Média ≥ 7/10 e nenhum critério < 4/10 | **APROVADO** |
| Média ≥ 7/10 com critérios não-críticos entre 4-6/10 | **APROVADO CONDICIONAL** |
| Média < 7/10 | **REJEITADO** |
| Qualquer critério < 4/10 | **REJEITADO** (trigger automático) |
| 3ª rejeição pelo mesmo problema | **ESCALAR** ao usuário |

---

## Checklist de Auto-Revisão (Diego Dashboard)

Antes de finalizar o slide deck:

- [ ] Capa tem tema, marca e data
- [ ] Sumário executivo tem exatamente 3 bullets e pode ser lido sozinho
- [ ] Todos os slides têm título-conclusão (não título-variável)
- [ ] Máximo 8 KPIs por slide executivo
- [ ] Zero acrônimos não explicados
- [ ] Paleta OMK aplicada consistentemente
- [ ] HTML renderiza sem dependências externas
- [ ] Todos os dados têm fonte visível ou referência ao research brief
- [ ] Seção de recomendações tem mínimo 3 itens priorizados

---

## Benchmarks do Setor para Decks Executivos

- **Tempo de leitura do sumário executivo:** ≤ 60 segundos
- **KPIs por slide executivo:** 5-8 (máximo tolerado: 10)
- **Número de slides para deck executivo:** 4-7 (sem contar capa)
- **Slides com título-conclusão:** 100% (sem exceção)
- **Recomendações por deck:** 3-5 (mais dilui foco)
