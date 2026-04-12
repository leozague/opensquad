---
task: "Review Carousel"
order: 1
input: |
  - carousel_content: Conteúdo completo do carrossel (copy + slides + caption)
  - quality_criteria: Critérios de qualidade do squad
  - tone_of_voice: Tom de voz escolhido para este carrossel
output: |
  - review_result: Scoring detalhado + veredicto APPROVE/REJECT + feedback acionável
---

# Review Carousel

Avalia o carrossel completo contra critérios objetivos de copy, design e brand voice. Emite veredicto estruturado com scoring e feedback acionável.

## Process

1. **Carregar critérios** de `pipeline/data/quality-criteria.md` e `pipeline/data/tone-of-voice.md`.

2. **Ler o carrossel completo** (todos os slides, caption, hashtags, design system). Leitura completa antes de qualquer pontuação.

3. **Avaliar cada critério individualmente** (1-10) com justificativa escrita:

   **Copy (peso 40%):**
   - Hook / Scroll-stop (mín 6/10)
   - Clareza e concisão (mín 5/10)
   - Estrutura narrativa (mín 5/10)
   - CTA efetivo (mín 5/10)

   **Brand Voice (peso 30%):**
   - Tom Overmind (mín 6/10)
   - Anti-commodity (mín 5/10)
   - Vocabulário (mín 5/10)

   **Design (peso 30%):**
   - Hierarquia visual (mín 5/10)
   - Consistência (mín 5/10)
   - Legibilidade (mín 6/10)

4. **Calcular média** e aplicar regras de decisão:
   - >= 7/10 e nenhum critério < 4/10 → APPROVE
   - >= 7/10 com critério não-crítico 4-6/10 → CONDITIONAL APPROVE
   - < 7/10 ou qualquer critério < 4/10 → REJECT

5. **Compilar feedback** com prefixos claros:
   - `Strength:` para pontos positivos (mín 1)
   - `Required change:` para correções obrigatórias (com localização e fix)
   - `Suggestion (non-blocking):` para melhorias opcionais

6. **Formatar e entregar** o review completo.

## Output Format

```markdown
==============================
 REVIEW VERDICT: [APPROVE/REJECT/CONDITIONAL APPROVE]
==============================

Content: "[Título do carrossel]"
Type: Instagram Carousel ({N} slides)
Review Date: YYYY-MM-DD
Revision: {N} of 3

------------------------------
 SCORING TABLE
------------------------------
| Critério              | Score  | Resumo                    |
|------------------------|--------|--------------------------|
| Hook / Scroll-stop     | X/10   | [justificativa curta]    |
| Clareza e concisão     | X/10   | [justificativa curta]    |
| ...                    | ...    | ...                      |
------------------------------
 OVERALL: X.X/10
------------------------------

DETAILED FEEDBACK:

Strength: [ponto positivo específico com referência ao slide/trecho]

Required change: [o que está errado, onde, e como corrigir]

Suggestion (non-blocking): [melhoria opcional]

PATH TO APPROVAL: (apenas para REJECT)
1. [correção específica]
2. [correção específica]

VERDICT: [APPROVE/REJECT] — [resumo em 1 frase]
```

## Output Example

```markdown
==============================
 REVIEW VERDICT: CONDITIONAL APPROVE
==============================

Content: "Seu atendimento vai perder clientes em 2026"
Type: Instagram Carousel (8 slides)
Review Date: 2026-04-09
Revision: 1 of 3

------------------------------
 SCORING TABLE
------------------------------
| Critério              | Score  | Resumo                                          |
|------------------------|--------|-------------------------------------------------|
| Hook / Scroll-stop     | 9/10   | Hook provocativo forte, para o scroll            |
| Clareza e concisão     | 7/10   | Slides 2-6 dentro do limite, slide 7 repetitivo |
| Estrutura narrativa    | 8/10   | Arco editorial bem construído                    |
| CTA efetivo            | 8/10   | CTA específico com keyword "ATENDIMENTO"         |
| Tom Overmind           | 8/10   | Confiante e direto, sem jargão                   |
| Anti-commodity         | 7/10   | Ponto de vista claro, não genérico               |
| Vocabulário            | 9/10   | Usa vocabulário preferido, evita proibidos        |
| Hierarquia visual      | 7/10   | Headlines bold, mas slide 5 tem contrast baixo   |
| Consistência           | 8/10   | Design system aplicado uniformemente              |
| Legibilidade           | 6/10   | Slide 5: texto branco sobre fundo claro           |
------------------------------
 OVERALL: 7.7/10
------------------------------

DETAILED FEEDBACK:

Strength: O hook do slide 1 ("Seu atendimento vai perder clientes em 2026") é provocativo e direto. Funciona nos primeiros 125 chars da caption. Scroll-stop test passed.

Strength: O uso de dados concretos (73%, 47 min, 34% NPS) ao longo do carrossel cria credibilidade e segue o padrão Overmind de falar em resultados.

Required change: Slide 5 — o fundo light (#F0F0F0) com texto branco (#FFFFFF) não passa no teste de contraste WCAG AA. Trocar o fundo para dark (#1A0A2E) ou o texto para dark (#191919).

Suggestion (non-blocking): Slide 7 repete a ideia do slide 6 com palavras diferentes ("market share" vs "vantagem competitiva"). Considerar fundir em um slide ou substituir o slide 7 por um dado adicional.

VERDICT: CONDITIONAL APPROVE — Corrigir contraste do slide 5 antes de publicar. Demais critérios atendem o padrão.
```

## Quality Criteria

- [ ] Todos os 10 critérios avaliados e pontuados
- [ ] Cada score tem justificativa escrita
- [ ] Veredicto consistente com os scores
- [ ] Pelo menos 1 "Strength:" presente
- [ ] Required changes são específicos (onde + como corrigir)
- [ ] Número da revisão rastreado

## Veto Conditions

Reject and redo if ANY are true:
1. Algum critério foi pontuado sem justificativa
2. APPROVE emitido com critério abaixo de 4/10
