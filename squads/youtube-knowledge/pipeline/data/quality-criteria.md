# Quality Criteria — YouTube Knowledge Extraction

## Criterios por Output

### Nota Vault (Output 1)
| Criterio | Peso | Minimo |
|----------|------|--------|
| Frontmatter YAML valido | 10 | 8/10 |
| Classificacao PARA correta | 9 | 7/10 |
| Tags especificas (nao genericas) | 8 | 7/10 |
| Conceitos-chave atomicos | 9 | 7/10 |
| Citacoes sao quotes reais | 10 | 9/10 |
| Action items concretos | 8 | 6/10 |
| Nota autonoma (compreensivel sem video) | 9 | 7/10 |

### Resumo Executivo (Output 2)
| Criterio | Peso | Minimo |
|----------|------|--------|
| TL;DR captura essencia | 10 | 8/10 |
| Pontos-chave cobrem temas principais | 9 | 7/10 |
| Insights nao-obvios presentes | 8 | 6/10 |
| Action items priorizados | 7 | 6/10 |
| Concisao (sem enrolacao) | 8 | 7/10 |

### Transcricao Anotada (Output 3)
| Criterio | Peso | Minimo |
|----------|------|--------|
| Indice de secoes presente | 9 | 8/10 |
| Timestamps nos momentos-chave | 8 | 7/10 |
| Destaques nao excessivos (<20% do texto) | 8 | 7/10 |
| Anotacoes [NOTA:] agregam valor | 7 | 6/10 |
| Secoes semanticas coerentes | 8 | 7/10 |

## Regras de Veredicto
- **APPROVE**: media >= 7/10 E nenhum criterio < 4/10
- **REJECT**: media < 7/10 OU qualquer criterio < 4/10
- **Max revisoes**: 2 ciclos, depois escalar para usuario
