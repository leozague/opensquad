---
execution: inline
agent: market-intelligence/agents/vera-veredicto
inputFile: squads/market-intelligence/output/slide-deck.html
outputFile: squads/market-intelligence/output/review-report.md
on_reject: 4
---

# Step 06: Revisão de Qualidade

## Context Loading

Load these files before executing:
- `squads/market-intelligence/output/slide-deck.html` — slide deck completo gerado por Diego
- `squads/market-intelligence/pipeline/data/quality-criteria.md` — 5 critérios de avaliação com escalas e triggers
- `squads/market-intelligence/pipeline/data/anti-patterns.md` — padrões problemáticos a identificar

## Instructions

### Process

1. **Ler quality-criteria.md** completamente antes de abrir o slide deck — entender os 5 critérios e triggers de rejeição
2. **Ler o HTML completo do início ao fim** — nunca avaliar antes de terminar a leitura
3. **Avaliar cada critério individualmente** na escala 1-10 com justificativa (citar slide por número)
4. **Verificar triggers**: algum critério < 4? → REJEITAR imediatamente independente da média
5. **Calcular média** e aplicar regras: ≥7 sem trigger = APROVADO; ≥7 com não-críticos 4-6 = CONDICIONAL; <7 ou trigger = REJEITADO
6. **Montar review estruturado** no formato padrão
7. Se REJEITADO: feedback retorna ao Step 4 (Diego) com `review-report.md` como input

## Output Format

```
==============================
 VEREDICTO: [APROVADO / APROVADO CONDICIONAL / REJEITADO]
==============================

Conteúdo: [Tema do deck]
Revisora: Vera Veredicto | [data]
Revisão: [N] de 3

------------------------------
 SCORECARD
------------------------------
| Critério | Nota | Resumo |
|---|---|---|
| Precisão dos dados | X/10 | [resumo em 1 frase] |
| Clareza executiva | X/10 | [resumo] |
| Completude | X/10 | [resumo] |
| Design e legibilidade | X/10 | [resumo] |
| Recomendações acionáveis | X/10 | [resumo] |
------------------------------
 MÉDIA: X.X/10
------------------------------

[Se trigger: TRIGGER DE REJEIÇÃO: [critério] = X/10 — abaixo do mínimo de 4/10]

FEEDBACK DETALHADO:

Strength: [Ponto específico — slide e elemento citados]

Required change: [Slide X — problema — instrução de correção]

Suggestion (não-bloqueante): [Melhoria opcional com referência]

[Se REJEITADO:]
CAMINHO PARA APROVAÇÃO:
1. [Mudança obrigatória com instrução concreta]
2. [Segunda mudança]
Resubmeter como Revisão [N+1].

VEREDICTO: [APROVADO / APROVADO CONDICIONAL / REJEITADO]
```

## Output Example

Ver `pipeline/data/output-examples.md` e o `review.md` task de Vera para exemplos completos de APROVADO e REJEITADO.

Padrão esperado:
- Scorecard com todos os 5 critérios preenchidos
- Cada nota acompanhada de justificativa de 1+ frase
- Mínimo 1 Strength reconhecido
- Se REJEITADO: "Required change:" com slide número + problema + instrução

## Veto Conditions

Reject and redo if ANY of these are true:
1. Algum dos 5 critérios não foi avaliado (score ausente)
2. REJEITADO emitido sem pelo menos 1 "Required change:" com instrução concreta

## Quality Criteria

- [ ] Todos os 5 critérios avaliados com score e justificativa
- [ ] Veredicto é consistente com média e triggers
- [ ] Feedback cita slides específicos por número
- [ ] Required change e Suggestion separados com prefixos corretos
- [ ] Pelo menos 1 Strength reconhecido
- [ ] Revisão [N] de 3 registrada
