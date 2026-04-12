---
execution: subagent
agent: market-intelligence/agents/ana-analitica
inputFile: squads/market-intelligence/output/research-brief.md
outputFile: squads/market-intelligence/output/analysis-report.md
model_tier: powerful
---

# Step 03: Análise de Inteligência

## Context Loading

Load these files before executing:
- `squads/market-intelligence/output/research-brief.md` — brief de pesquisa compilado por Rafael
- `squads/market-intelligence/pipeline/data/domain-framework.md` — framework analítico (SWOT, gap analysis, insight synthesis)
- `squads/market-intelligence/pipeline/data/quality-criteria.md` — critérios de qualidade do output final
- `squads/market-intelligence/pipeline/data/anti-patterns.md` — erros a evitar na análise
- `squads/market-intelligence/_memory/memories.md` — aprendizados de execuções anteriores (se houver)
- `squads/market-intelligence/_opensquad/_memory/company.md` — contexto do grupo OMK

## Instructions

### Process

1. **Ler o research-brief.md completo** — mapear todos os achados, tendências, fontes e lacunas
2. **Identificar os 3 maiores movimentos** do período — ordenar por magnitude e confiança; sinalizar anomalias (>25%) com 🚨
3. **Aplicar análise SWOT** em relação à posição da marca/grupo OMK relevante ao tema pesquisado
4. **Sintetizar 4-6 insights** usando estrutura obrigatória: O que aconteceu → Por que importa → "Isso significa:" [implicação de negócio]
5. **Gerar 3-5 recomendações priorizadas** por impacto × confiança × esforço, com todos os 5 campos obrigatórios
6. **Escrever sumário executivo** de exatamente 3 bullets autossuficientes
7. **Adicionar Metodologia** com período, fontes principais e exclusões

## Output Format

```
ANÁLISE DE INTELIGÊNCIA DE MERCADO
Tema: [do research-focus]
Período: [período]
Preparado: [data]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

SUMÁRIO EXECUTIVO
• [KPI principal com comparativo e implicação — 1 frase]
• [Ameaça ou oportunidade crítica com janela temporal — 1 frase]
• [Recomendação de maior impacto — 1 frase]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

INSIGHTS

1. [Título assertivo — conclusão, não tema]
   [Dado com magnitude e contexto]
   Isso significa: [implicação de negócio específica]
   Confiança: [ALTA/MÉDIA/BAIXA] — [razão]

[4-6 insights no total]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

RECOMENDAÇÕES

1. [Ação específica e executável]
   [Razão baseada em insight citado]
   Prioridade: [ALTA] | Confiança: [ALTA] | Esforço: [MÉDIO]
   Impacto esperado: [resultado]

[3-5 recomendações, ordenadas por prioridade]

METODOLOGIA
- Período: [datas]
- Fontes principais: [lista]
- Exclusões: [o que foi excluído e por quê]
```

## Output Example

Ver `pipeline/data/output-examples.md` seção "Analysis Report: Padrão Esperado" para exemplo completo de 100+ linhas incluindo 4 insights completos e 4 recomendações priorizadas.

## Veto Conditions

Reject and redo if ANY of these are true:
1. Algum insight não tem "Isso significa:" com implicação de negócio concreta
2. Alguma recomendação não tem os 5 campos: ação, impacto, confiança, esforço, prioridade

## Quality Criteria

- [ ] Sumário executivo tem exatamente 3 bullets e pode ser lido isoladamente
- [ ] Todos os insights têm "Isso significa:" com implicação de negócio
- [ ] Nenhum qualificador vago — toda afirmação quantificada ou com nível de confiança
- [ ] Recomendações ordenadas por prioridade (ALTA primeiro)
- [ ] Anomalias (>25%) sinalizadas com 🚨
- [ ] Metodologia presente com período, fontes e exclusões
