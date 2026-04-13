---
execution: inline
agent: vivian-veredicto
inputFile: squads/pro-photo/output/professional-photo.jpg
outputFile: squads/pro-photo/output/review-report.md
---

# Step 04: Revisao de Qualidade

## Context Loading

Load these files before executing:
- `squads/pro-photo/output/professional-photo.jpg` — foto profissional gerada
- `squads/pro-photo/output/generation-report.md` — relatorio com analise e prompt
- `squads/pro-photo/output/photo-brief.md` — para obter caminho da foto original
- A foto original do usuario (caminho no photo-brief.md)
- `squads/pro-photo/agents/vivian-veredicto.agent.md` — persona e instrucoes
- `squads/pro-photo/agents/vivian-veredicto/tasks/review-photo.md` — task detalhada
- `squads/pro-photo/pipeline/data/quality-criteria.md` — criterios e thresholds

## Instructions

### Process
1. Ler photo-brief.md para obter caminho da foto original
2. Ler foto original (Read tool — imagem)
3. Ler foto gerada (Read tool — imagem)
4. Ler generation-report.md para contexto
5. Aplicar 5 testes de qualidade comparando original vs gerada
6. Verificar adequacao ao estilo escolhido
7. Compilar review-report.md com pontuacoes + veredicto

## Output Format

```markdown
# Review Report

**Verdict: APPROVE | REJECT**
**Overall Score: X.X/10**
**Revision: N of 2**

| Teste | Score | Justificativa |
|-------|-------|---------------|
| Espelho | X/10 | ... |
| Pele | X/10 | ... |
| Olhos | X/10 | ... |
| Bordas | X/10 | ... |
| Video Call | X/10 | ... |

**Adequacao ao estilo:** {estilo} — {descricao}. X/10

Strength: ...
Required change: ... (se REJECT)
Suggestion (non-blocking): ...
```

## Output Example

```markdown
# Review Report

**Verdict: APPROVE**
**Overall Score: 8.2/10**
**Revision: 1 of 2**

| Teste | Score | Justificativa |
|-------|-------|---------------|
| Espelho | 9/10 | Pessoa claramente reconhecivel — mesmas feicoes e proporcoes |
| Pele | 8/10 | Textura natural preservada. Leve suavizacao na testa, aceitavel |
| Olhos | 8/10 | Catchlights consistentes, posicao e tamanho corretos |
| Bordas | 7/10 | Transicao cabelo limpa. Leve blur no ombro direito |
| Video Call | 9/10 | Reconhecimento imediato. Expressao natural |

**Adequacao ao estilo:** Corporate — fundo neutro, iluminacao profissional. 9/10

Strength: Semelhanca excelente. Parece a mesma pessoa com iluminacao de estudio.

Suggestion (non-blocking): Adicionar "subtle rim light on hair" ao prompt
para separar melhor o cabelo do fundo em futuras geracoes.
```

## Veto Conditions

Reject and redo if ANY of these are true:
1. Algum dos 5 testes nao foi aplicado (revisao incompleta)
2. Veredicto contradiz as pontuacoes (APPROVE com media < 7 ou criterio < 4)

## Quality Criteria

- [ ] 5 testes aplicados com tabela de pontuacao
- [ ] Cada score tem justificativa
- [ ] Comparacao com foto original realizada
- [ ] Min 1 Strength identificado
- [ ] Veredicto coerente com scores
