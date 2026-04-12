---
execution: inline
agent: reviewer
inputFile: squads/overmind-carrossel/output/carousel-content.md
outputFile: squads/overmind-carrossel/output/review-result.md
on_reject: 6
---

# Step 08: Revisão de Qualidade

## Context Loading

Load these files before executing:
- `squads/overmind-carrossel/output/carousel-content.md` — carrossel completo para revisão
- `squads/overmind-carrossel/pipeline/data/quality-criteria.md` — critérios de avaliação
- `squads/overmind-carrossel/pipeline/data/tone-of-voice.md` — tom de voz (para verificar aderência)
- `squads/overmind-carrossel/pipeline/data/anti-patterns.md` — erros a verificar
- `_opensquad/_memory/brands/overmind.md` — brand voice de referência

## Instructions

### Process
1. Carregar critérios de qualidade e tom de voz.
2. Ler o carrossel completo (todos os slides, caption, hashtags, design).
3. Executar a task `review.md` do Rui Revisão.
4. Avaliar cada um dos 10 critérios (1-10) com justificativa.
5. Calcular média e aplicar regras de decisão (APPROVE >= 7, REJECT < 7 ou hard trigger < 4).
6. Compilar feedback com prefixos (Strength, Required change, Suggestion).
7. Se REJECT: incluir PATH TO APPROVAL com correções específicas.
8. Salvar review no outputFile.

**On Reject:** Pipeline volta ao step 06 (criação do carrossel) com o feedback do revisor.

## Output Format

```markdown
==============================
 REVIEW VERDICT: [APPROVE/REJECT/CONDITIONAL APPROVE]
==============================

Content: "[Título]"
Type: Instagram Carousel (N slides)
Review Date: YYYY-MM-DD
Revision: N of 3

------------------------------
 SCORING TABLE
------------------------------
| Critério              | Score  | Resumo               |
|------------------------|--------|---------------------|
| Hook / Scroll-stop     | X/10   | [justificativa]     |
| ...                    | ...    | ...                 |
------------------------------
 OVERALL: X.X/10
------------------------------

Strength: [...]
Required change: [...]
Suggestion (non-blocking): [...]

PATH TO APPROVAL: (se REJECT)
1. [fix específico]

VERDICT: [APPROVE/REJECT] — [resumo 1 frase]
```

## Output Example

> Ver task `review.md` do Rui Revisão para exemplo completo de review.

## Veto Conditions

Reject and redo if ANY are true:
1. Algum critério pontuado sem justificativa
2. APPROVE emitido com critério abaixo de 4/10

## Quality Criteria

- [ ] 10 critérios avaliados e pontuados
- [ ] Cada score tem justificativa
- [ ] Veredicto consistente com scores
- [ ] Pelo menos 1 Strength presente
- [ ] Required changes são específicos e acionáveis
