---
execution: inline
agent: creator
inputFile: squads/overmind-carrossel/output/research-results.md
outputFile: squads/overmind-carrossel/output/angles.md
---

# Step 04: Geração de Ângulos

## Context Loading

Load these files before executing:
- `squads/overmind-carrossel/output/research-results.md` — notícias rankeadas (filtrar pela selecionada)
- `_opensquad/_memory/brands/overmind.md` — contexto da marca
- `squads/overmind-carrossel/pipeline/data/tone-of-voice.md` — opções de tom

## Instructions

### Process
1. Identificar qual notícia foi selecionada pelo usuário no checkpoint anterior.
2. Executar a task `generate-angles.md` da Clara Carrossel.
3. Gerar 5 ângulos distintos sobre a mesma notícia, cada um com driver psicológico diferente.
4. Cada ângulo inclui: título, driver, hook de exemplo, preview do arco, formato sugerido.
5. Apresentar os 5 ângulos ao usuário para seleção.
6. Salvar todos os ângulos no outputFile (o selecionado será marcado no próximo checkpoint).

## Output Format

```markdown
# Ângulos — [Título da Notícia]

> Fonte: [fonte] | Dado âncora: [dado]

## Ângulo 1: [Título]
**Driver:** [driver psicológico]
**Hook:** "[hook]"
**Arco:** [preview 3 frases]
**Formato:** [formato de carrossel]

(repetir para 5 ângulos)
```

## Output Example

```markdown
# Ângulos — IA no suporte eleva NPS em 34%

> Fonte: Zendesk CX Trends 2026 | Dado: NPS +34%

## Ângulo 1: O Abismo
**Driver:** Medo/Perda
**Hook:** "Seu atendimento vai perder clientes em 2026."
**Arco:** Gap entre expectativa (5 min) e realidade (47 min). Dados de churn. IA como caminho inevitável.
**Formato:** Editorial / Tese

## Ângulo 2: A Janela
**Driver:** Oportunidade
**Hook:** "Enquanto seus concorrentes dormem, automatize."
**Arco:** Momento como vantagem competitiva. Poucos adotaram. Quem chegar primeiro domina.
**Formato:** Problema → Solução

## Ângulo 3: O Teste
**Driver:** Educacional
**Hook:** "Testamos IA no atendimento de 3 clientes."
**Arco:** Case prático. Antes vs. depois. Implementação passo a passo.
**Formato:** Antes e Depois

## Ângulo 4: O Mito
**Driver:** Contrário
**Hook:** "IA no atendimento não funciona. Será?"
**Arco:** Desmonta objeções. Dados contradizem cada mito.
**Formato:** Mito vs Realidade

## Ângulo 5: O Futuro Próximo
**Driver:** Inspiracional
**Hook:** "Imagine seu time só resolvendo o que importa."
**Arco:** Visão de time com IA no repetitivo e humanos no complexo.
**Formato:** Storytelling
```

## Veto Conditions

Reject and redo if ANY are true:
1. Menos de 5 ângulos
2. Dois ângulos com o mesmo driver psicológico

## Quality Criteria

- [ ] 5 ângulos com drivers diferentes
- [ ] Todos sobre a mesma notícia
- [ ] Hooks passam no scroll-stop test
- [ ] Formatos variados
