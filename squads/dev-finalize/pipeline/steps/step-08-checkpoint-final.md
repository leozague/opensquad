# Step 05 — Checkpoint: Confirmação Final

## Tipo
checkpoint

## Objetivo
Confirmar que tudo foi atualizado corretamente e encerrar o ciclo.

## O que exibir
Resumo do que foi atualizado:
- CHANGELOG.md: entrada adicionada
- STATE.md: atualizado
- Feature movida: `in-progress/{slug}` → `done/{slug}`
- Docs técnicas: atualizadas (ou não precisaram)

## Perguntas

**Pergunta 1:** Está tudo correto?
- **Sim, fechar o ciclo** → encerrar
- **Precisa de ajuste** → volta para Step 04

## Mensagem final
```
✅ Feature finalizada com sucesso!

{feature_slug} → done/
CHANGELOG atualizado: v{versão} ({ambiente})
STATE atualizado: {data}

Próximo passo:
  → Se staging: abrir PR develop → main quando pronto para produção
  → Se produção: criar GitHub Release com tag v{versão}
```
