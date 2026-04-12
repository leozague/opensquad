# Step 7 — Checkpoint: Resultado da Auditoria

## Tipo
checkpoint

## O que Apresentar

- Status geral: APROVADO / APROVADO COM RESSALVAS / REPROVADO
- Numero de achados por severidade
- Caminho do relatorio gerado
- Se ha itens que bloqueiam o deploy

## Perguntas

**Pergunta 1 (se REPROVADO — ha CRITICOS ou ALTOS):**
Ha vulnerabilidades que bloqueiam o deploy. O que deseja fazer?
- **Corrigir antes de lancar** — nao fazer deploy ate correcao
- **Estou ciente e assumo o risco** — prosseguir com deploy (registrado)

**Pergunta 2 (se APROVADO ou APROVADO COM RESSALVAS):**
O que deseja fazer com os achados menores?
- **Registrar para o proximo ciclo e prosseguir com deploy**
- **Corrigir tudo antes de lancar**

## Pos-Auditoria

Atualizar `squads/sec-audit/_memory/memories.md` com:
- Data da auditoria
- Versao auditada
- Status geral
- Principais achados (resumo)
