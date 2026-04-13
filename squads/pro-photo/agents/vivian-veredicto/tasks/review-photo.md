---
task: "Review Photo"
order: 1
input: |
  - professional-photo.jpg: Foto profissional gerada
  - generation-report.md: Relatorio da geracao (analise + prompt usado)
  - foto original do usuario (caminho no photo-brief.md)
output: |
  - review-report.md: Relatorio com pontuacoes dos 5 testes e veredicto
---

# Review Photo

Avalia a foto profissional gerada aplicando 5 testes de qualidade e comparando com a foto original. Emite APPROVE ou REJECT.

## Process

1. Ler photo-brief.md para obter caminho da foto original
2. Ler a foto original (Read tool — imagem)
3. Ler a foto gerada (Read tool — imagem)
4. Ler generation-report.md para contexto (estilo, prompt usado)
5. Aplicar 5 testes:
   a. **Teste do Espelho** (peso 10): a pessoa na foto gerada e reconhecivel como a mesma? Comparar feicoes, proporcoes, caracteristicas marcantes
   b. **Teste da Pele** (peso 9): zoom mental — a pele tem textura natural ou aspecto ceroso/artificial? Poros e linhas visiveis?
   c. **Teste dos Olhos** (peso 9): catchlights consistentes nos dois olhos? Mesmo tamanho, mesma posicao relativa? Alinhamento natural?
   d. **Teste das Bordas** (peso 8): transicao cabelo/roupa para fundo limpa? Sem halo, brilho ou blur inconsistente?
   e. **Teste do Video Call** (peso 10): alguem reconheceria a pessoa ao vivo apos ver essa foto?
6. Verificar adequacao ao estilo escolhido
7. Calcular media ponderada
8. Emitir veredicto conforme regras (>= 7/10 e nenhum < 4/10 = APPROVE)
9. Se REJECT: sugerir ajuste especifico no prompt

## Output Format

```yaml
verdict: APPROVE | REJECT
overall_score: float
tests_applied: 5
revision_number: N
required_changes: [list]
prompt_adjustments: [list]
```

## Output Example

```markdown
# Review Report

**Verdict: APPROVE**
**Overall Score: 8.2/10**
**Revision: 1 of 2**

| Teste | Score | Justificativa |
|-------|-------|---------------|
| Espelho | 9/10 | Pessoa claramente reconhecivel — mesmas feicoes, proporcoes e expressao |
| Pele | 8/10 | Textura natural preservada, poros visiveis. Leve suavizacao aceitavel na testa |
| Olhos | 8/10 | Catchlights consistentes nos dois olhos, tamanho e posicao corretos |
| Bordas | 7/10 | Transicao cabelo limpa. Leve suavizacao no ombro direito, aceitavel |
| Video Call | 9/10 | Reconhecimento imediato garantido. Expressao natural e confiante |

**Adequacao ao estilo:** Corporate — fundo neutro, iluminacao profissional, expressao adequada. 9/10

Strength: Semelhanca excelente com a foto original. A foto parece uma versao
com iluminacao de estudio da mesma pessoa, nao uma pessoa diferente.

Strength: Expressao natural e confiante, nao rigida. Micro-expressoes preservadas.

Suggestion (non-blocking): Na proxima iteracao, considerar adicionar
"subtle rim light on hair" ao prompt para separar melhor o cabelo do fundo.
```

## Quality Criteria

- [ ] 5 testes aplicados e pontuados individualmente
- [ ] Cada score tem justificativa de pelo menos 1 frase
- [ ] Comparacao com foto original realizada e documentada
- [ ] Veredicto coerente com scores
- [ ] Pelo menos 1 Strength identificado
- [ ] Se REJECT: sugestao de ajuste de prompt incluida

## Veto Conditions

Reject and redo if ANY are true:
1. Algum teste nao foi aplicado (revisao incompleta)
2. Veredicto contradiz as pontuacoes (APPROVE com media < 7 ou criterio < 4)
