---
task: "Market Research"
order: 1
input: |
  - software_name: Nome do software sendo construido
  - software_description: Descricao do software e suas funcionalidades
  - segment: Segmento/mercado alvo
output: |
  - research_brief: Documento com analise de mercado, concorrentes, gaps e tendencias
---

# Market Research

Pesquisar o mercado do software definido no planejamento: concorrentes diretos e indiretos, proposta de valor, diferenciais, tendencias e oportunidades.

## Process

1. Ler `input-params.yaml` para extrair nome, descricao e segmento do software
2. Fazer WebSearch por concorrentes diretos: "{tipo de software} software {segmento}"
3. Para cada concorrente encontrado (minimo 3), buscar: features, pricing, stack (se publico), publico-alvo
4. Pesquisar tendencias do segmento: "{segmento} trends 2025 2026"
5. Identificar gaps — funcionalidades que nenhum concorrente oferece ou oferece mal
6. Compilar tudo no research brief estruturado

## Output Format

```markdown
# Pesquisa de Mercado: {software_name}

## Segmento
{descricao do segmento e tamanho estimado}

## Concorrentes Diretos

| Nome | URL | Features Principais | Pricing | Stack | Diferencial |
|------|-----|---------------------|---------|-------|-------------|
| ... | ... | ... | ... | ... | ... |

## Concorrentes Indiretos
{ferramentas adjacentes que resolvem o mesmo problema de outra forma}

## Tendencias do Segmento
- {tendencia 1 com timeline}
- {tendencia 2 com timeline}

## Gaps e Oportunidades
- {gap 1: o que ninguem faz bem}
- {oportunidade 1: como o software pode se diferenciar}

## Fontes
- {URL 1} (acessado em {data})
- {URL 2} (acessado em {data})
```

## Output Example

> Use como referencia de qualidade, nao como template rigido.

```markdown
# Pesquisa de Mercado: TaskFlow

## Segmento
Gestao de projetos para equipes de desenvolvimento de software. Mercado global estimado em US$ 7.5 bilhoes (2025), crescimento de 13% ao ano. No Brasil, dominado por ferramentas internacionais com gap de localizacao.

## Concorrentes Diretos

| Nome | URL | Features Principais | Pricing | Stack | Diferencial |
|------|-----|---------------------|---------|-------|-------------|
| Linear | linear.app | Issues, cycles, roadmaps, Git integration | $8/user/mo | React, Node | UX minimalista, velocidade |
| Jira | atlassian.com/jira | Backlog, sprints, reports, marketplace | $7.75/user/mo | Java, React | Ecossistema Atlassian |
| Shortcut | shortcut.com | Stories, epics, iterations, docs | $8.50/user/mo | React, Clojure | Simplicidade vs Jira |

## Concorrentes Indiretos
- Notion: usado como gestao de projeto por equipes menores, sem features nativas de sprint/cycle
- GitHub Projects: integrado ao codigo mas limitado em gestao de projeto avancada

## Tendencias do Segmento
- IA para triagem automatica de bugs e estimativa de esforco (2025-2026)
- Integracao nativa com AI coding assistants (Cursor, Copilot) para criar issues a partir de codigo
- Consolidacao de ferramentas: projeto + docs + comunicacao em um unico produto

## Gaps e Oportunidades
- Gap: nenhum concorrente oferece integracao nativa com IA para estimativa de esforco baseada em codebase real
- Oportunidade: mercado BR carece de ferramenta com UX moderna + suporte a portugues + integracao com sistemas fiscais brasileiros

## Fontes
- https://www.grandviewresearch.com/industry-analysis/project-management-software-market (acessado em 2026-04-13)
- https://linear.app/pricing (acessado em 2026-04-13)
```

## Quality Criteria

- [ ] Minimo 3 concorrentes diretos com tabela comparativa
- [ ] Tendencias com timeline (nao genericas)
- [ ] Gaps concretos e acionaveis
- [ ] Todas as fontes com URL e data de acesso

## Veto Conditions

Rejeitar e refazer se:
1. Menos de 3 concorrentes diretos analisados
2. Fontes nao citadas ou URLs inexistentes
