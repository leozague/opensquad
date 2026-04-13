---
execution: inline
agent: rita-revisao
inputFile: squads/youtube-knowledge/output/vault-note.md
outputFile: squads/youtube-knowledge/output/review-report.md
---

# Step 06: Revisao de Qualidade

## Context Loading

Load these files before executing:
- `squads/youtube-knowledge/output/vault-note.md` — nota para o vault
- `squads/youtube-knowledge/output/executive-summary.md` — resumo executivo
- `squads/youtube-knowledge/output/annotated-transcript.md` — transcricao anotada
- `squads/youtube-knowledge/output/raw-extraction.md` — transcricao original (para verificar quotes)
- `squads/youtube-knowledge/agents/rita-revisao.agent.md` — persona e instrucoes
- `squads/youtube-knowledge/agents/rita-revisao/tasks/review-outputs.md` — task detalhada
- `squads/youtube-knowledge/pipeline/data/quality-criteria.md` — criterios e thresholds

## Instructions

### Process
1. Carregar criterios de qualidade do quality-criteria.md
2. Ler raw-extraction.md como referencia para verificacao de quotes
3. Ler e avaliar vault-note.md contra criterios especificos da nota
4. Ler e avaliar executive-summary.md contra criterios do resumo
5. Ler e avaliar annotated-transcript.md contra criterios da transcricao
6. Verificar cada citacao contra transcricao original
7. Compilar review-report.md com pontuacoes + veredicto

## Output Format

```markdown
# Review Report

**Verdict: APPROVE | REJECT**
**Overall Score: X.X/10**
**Revision: N of 2**

## Nota Vault (X.X/10)
| Criterio | Score | Justificativa |
...
Strength: ...
Required change: ... (se REJECT)
Suggestion (non-blocking): ...

## Resumo Executivo (X.X/10)
...

## Transcricao Anotada (X.X/10)
...
```

## Output Example

```markdown
# Review Report

**Verdict: APPROVE**
**Overall Score: 8.2/10**
**Revision: 1 of 2**

## Nota Vault (8.5/10)

| Criterio | Score | Justificativa |
|----------|-------|---------------|
| Frontmatter | 9/10 | YAML valido, todos campos presentes |
| PARA | 8/10 | 03_Resources/ferramentas correto |
| Tags | 8/10 | 5 tags especificas |
| Conceitos | 9/10 | 6 atomicos com definicoes |
| Citacoes | 8/10 | 3 verificadas contra transcricao |
| Action items | 8/10 | Concretos e verificaveis |
| Autonomia | 9/10 | Compreensivel sem video |

Strength: Conceitos-chave bem atomizados com definicoes independentes.

Suggestion (non-blocking): Adicionar campo `related:` no frontmatter.

## Resumo Executivo (7.8/10)
| Criterio | Score | Justificativa |
|----------|-------|---------------|
| TL;DR | 8/10 | Captura essencia em 1 paragrafo |
| Bullets | 8/10 | 7 pontos cobrindo temas principais |
| Insights | 7/10 | 2 presentes, poderiam ir mais fundo |
| Actions | 8/10 | Priorizados e concretos |

Strength: TL;DR excelente e conciso.

## Transcricao Anotada (8.3/10)
| Criterio | Score | Justificativa |
|----------|-------|---------------|
| Indice | 9/10 | 6 secoes com timestamps |
| Destaques | 8/10 | ~15% em negrito, proporcao boa |
| Anotacoes | 8/10 | 4 [NOTA:] com reflexao genuina |
| Secoes | 8/10 | Divisao semantica coerente |

Strength: Anotacoes [NOTA:] conectam conteudo com contexto pessoal.
```

## Veto Conditions

Reject and redo if ANY of these are true:
1. Algum output nao foi avaliado (revisao incompleta)
2. Veredicto contradiz as pontuacoes

## Quality Criteria

- [ ] 3 outputs avaliados com tabela de pontuacao
- [ ] Cada score tem justificativa
- [ ] Quotes verificadas contra transcricao
- [ ] Min 1 Strength por output
- [ ] Veredicto coerente com scores
