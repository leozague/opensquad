# Quality Criteria — Pro Photo

## Criterios de Avaliacao

### Foto Gerada
| Criterio | Peso | Minimo |
|----------|------|--------|
| Semelhanca com foto original (Teste do Espelho) | 10 | 8/10 |
| Naturalidade da pele (Teste da Pele) | 9 | 7/10 |
| Consistencia dos olhos (Teste dos Olhos) | 9 | 7/10 |
| Limpeza das bordas (Teste das Bordas) | 8 | 6/10 |
| Reconhecibilidade (Teste do Video Call) | 10 | 8/10 |
| Resolucao (minimo 1024x1024) | 7 | pass/fail |
| Adequacao ao estilo escolhido | 8 | 7/10 |

### Prompt Crafting
| Criterio | Peso | Minimo |
|----------|------|--------|
| Descricao baseada na foto original | 10 | 9/10 |
| Anchors de naturalidade presentes | 9 | pass/fail |
| Sem keywords empilhadas | 8 | pass/fail |
| Estilo corretamente traduzido | 8 | 7/10 |

## Regras de Veredicto
- **APPROVE**: media >= 7/10 E nenhum criterio < 4/10
- **REJECT**: media < 7/10 OU qualquer criterio < 4/10
- **Hard reject**: Teste do Espelho < 6/10 (pessoa nao reconhecivel)
- **Max revisoes**: 2 ciclos, depois escalar para usuario
