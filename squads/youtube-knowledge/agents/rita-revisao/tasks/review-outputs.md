---
task: "Review Outputs"
order: 1
input: |
  - vault-note.md: Nota estruturada para o vault
  - executive-summary.md: Resumo executivo
  - annotated-transcript.md: Transcricao anotada
  - raw-extraction.md: Transcricao original (para verificar quotes)
output: |
  - review-report.md: Relatorio com pontuacoes e veredicto
---

# Review Outputs

Revisa os 3 outputs da sintese contra criterios de qualidade e emite APPROVE ou REJECT.

## Process

1. Ler quality-criteria.md para carregar criterios e thresholds
2. Ler raw-extraction.md (transcricao original) para referencia
3. Para cada output (vault-note, executive-summary, annotated-transcript):
   a. Ler o output completamente
   b. Avaliar cada criterio com pontuacao 1-10 e justificativa
   c. Verificar citacoes contra transcricao original
   d. Identificar pontos fortes e problemas
4. Calcular media geral e verificar hard rejection triggers (<4/10)
5. Compilar review-report.md com veredicto final

## Output Format

```yaml
verdict: APPROVE | REJECT
overall_score: float
outputs_reviewed: 3
revision_number: N
required_changes: [list]
suggestions: [list]
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
| Frontmatter YAML | 9/10 | Completo e valido, todos campos presentes |
| Classificacao PARA | 8/10 | 03_Resources/ferramentas correto para tutorial tecnico |
| Tags | 8/10 | 5 tags especificas, nenhuma generica |
| Conceitos-chave | 9/10 | 6 conceitos atomicos com definicoes claras |
| Citacoes | 8/10 | 3 quotes verificadas contra transcricao |
| Action items | 8/10 | 2 items concretos e verificaveis |
| Autonomia da nota | 9/10 | Compreensivel sem assistir video |

Strength: Os conceitos-chave estao bem atomizados — cada um tem
definicao independente que funciona como mini-nota Zettelkasten.

Suggestion (non-blocking): Considerar adicionar campo `related:`
no frontmatter para linkar com notas existentes sobre RAG.

## Resumo Executivo (7.8/10)

| Criterio | Score | Justificativa |
|----------|-------|---------------|
| TL;DR | 8/10 | Captura essencia em 1 paragrafo conciso |
| Pontos-chave | 8/10 | 7 bullets cobrindo todos os temas principais |
| Insights | 7/10 | 2 insights presentes, poderiam ser mais profundos |
| Action items | 8/10 | Priorizados e concretos |

Strength: TL;DR excelente — captura a tese central em 3 linhas.

## Transcricao Anotada (8.3/10)

| Criterio | Score | Justificativa |
|----------|-------|---------------|
| Indice | 9/10 | 6 secoes com timestamps corretos |
| Destaques | 8/10 | ~15% do texto em negrito, proporcao adequada |
| Anotacoes | 8/10 | 4 [NOTA:] que agregam reflexao genuina |
| Secoes semanticas | 8/10 | Divisao por tema, nao por tempo |

Strength: As anotacoes [NOTA:] conectam o conteudo com contexto pessoal
do usuario — exatamente o proposito da camada 4 de progressive summarization.
```

## Quality Criteria

- [ ] Todos os 3 outputs avaliados com tabela de pontuacao
- [ ] Cada pontuacao tem justificativa de pelo menos 1 frase
- [ ] Quotes verificadas contra transcricao original
- [ ] Pelo menos 1 Strength por output
- [ ] Veredicto coerente (APPROVE se >= 7/10 e nenhum < 4/10)

## Veto Conditions

Reject and redo if ANY are true:
1. Algum output nao foi lido/avaliado (revisao incompleta)
2. Veredicto contradiz as pontuacoes (APPROVE com media < 7)
