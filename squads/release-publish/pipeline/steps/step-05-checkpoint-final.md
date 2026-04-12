# Step 5 — Checkpoint: Aprovação Final

## Objetivo

Confirmar a conclusão da geração do release notes e registrar a execução.

## Apresentação

Exibir ao usuário:
- Caminho do arquivo HTML gerado
- Versão publicada
- Número de features incluídas
- Eventuais avisos (ex: briefings não encontrados)

## Perguntas ao Usuário

Use AskUserQuestion:

**Pergunta:** O que deseja fazer agora?
- **Concluir** — Encerrar o squad
- **Regenerar com ajustes** — Reiniciar a partir do Step 2 se houver algo a corrigir
- **Abrir o arquivo** — Mostrar o caminho para abrir no navegador

## Após Concluir

1. Atualizar `squads/release-publish/_memory/memories.md` com:
   - Data de execução
   - Projeto e versão publicados
   - Observações relevantes

2. Informar o usuário do encerramento.
