---
type: checkpoint
---

# Step 05: Aprovacao Final

Apresentar o veredicto da revisao e opcoes finais.

## O que mostrar

1. **Veredicto** da Vivian Veredicto (APPROVE/REJECT + score)
2. **Pontos fortes** identificados
3. **Sugestoes** (non-blocking) se houver

## Se APPROVE — Perguntar

"A foto foi aprovada (score X.X/10). O que quer fazer?"
1. Salvar — manter na pasta de output
2. Gerar em alta qualidade (production) — se ainda esta em modo test
3. Gerar para outra foto — iniciar novamente com foto diferente

## Se REJECT — Perguntar

"A revisao identificou problemas. O que quer fazer?"
1. Ajustar e regerar — volta para step 2 com feedback da revisao
2. Aceitar como esta
3. Cancelar
