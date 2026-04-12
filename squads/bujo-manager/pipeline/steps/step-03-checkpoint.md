# Step 03 — Checkpoint: Ação do Dia

## Tipo
checkpoint

## Objetivo
Apresentar o estado do dia ao usuário e perguntar o que quer fazer.

## Contexto a apresentar

Mostrar o resumo do auto-check (step-01) e resultado do inbox (step-02).

## Pergunta 1 — O que quer fazer agora?

- **Registrar tarefas/eventos** — Adicionar itens novos ao daily log de hoje
- **Migrar pendências** — Revisar tarefas de dias anteriores (mover ou cancelar)
- **Classificar item do inbox** — Itens pendentes que precisam de input (se houver)
- **Só o resumo, obrigado** — Não precisa fazer mais nada agora

## Pergunta 2 — Migração de pendências (se houver)

Para cada tarefa pendente de dias anteriores, apresentar:

```
Tarefa: [descrição] (#qX #projeto)
Origem: [data do daily log original]
```

Opções por tarefa:
- **Migrar para hoje** — Move para o daily log de hoje
- **Reagendar** — Move para data específica (perguntar qual)
- **Cancelar** — Marca como `[-]` no log original

## Pergunta 3 — Novas tarefas (se selecionou "Registrar")

Quais tarefas quer adicionar ao dia de hoje?

Exemplos:
- "Revisar PR do módulo de clientes #q1 #gold-letras"
- "Reunião com designer às 14h #q2 #pessoal"
- "Pesquisar ferramentas de CI/CD #q3 #kansai"

## Output

Passar para execução (step-04):
- `action`: register | migrate | classify | none
- `new_tasks`: lista de novas tarefas com Eisenhower
- `migration_decisions`: lista de {tarefa, decisão: migrar|reagendar|cancelar}
- `inbox_decisions`: lista de {item, classificação}
