# Step 01 — Auto-Check Diário

## Agente
Ryder

## Objetivo
Verificação automática do estado do BuJo ao iniciar o dia. Roda silenciosamente e apresenta um resumo ao usuário.

---

## Processo

### 1. Verificar data atual e contexto

```
bujo_root = /Users/macbookpro/Documents/_THOTH/02_Areas/bujo
today = data atual (YYYY-MM-DD)
month_dir = bujo_root/2026/MM-mes/
week_number = número ISO da semana
day_of_week = dia da semana (seg=1, dom=7)
```

### 2. Verificar se daily log de hoje existe

- Ler `{month_dir}/{today}.md`
- Se não existir: criar a partir do template (step-04 faz isso)
- Marcar flag: `daily_exists = true/false`

### 3. Buscar tarefas pendentes de dias anteriores

- Ler daily logs dos últimos 3 dias úteis
- Filtrar linhas com `- [ ]` (pendentes) e `- [!]` (prioridades)
- Montar lista de pendências para migração
- Contar: total pendentes, por quadrante Eisenhower (#q1, #q2, #q3, #q4)

### 4. Verificar future-log

- Ler `bujo_root/future-log.md`
- Buscar eventos com data de hoje ou amanhã
- Buscar tarefas agendadas para esta semana

### 5. Verificar weekly spread

- Ler `{month_dir}/W{week_number}.md` (se existir)
- Listar metas da semana não concluídas

### 6. Verificar monthly log

- Ler `{month_dir}/monthly.md`
- Listar metas do mês não concluídas

### 7. Apresentar resumo

Formato do resumo:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  BuJo — {today} ({dia da semana})
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Daily log:     {existe / precisa criar}
Pendências:    {N} tarefas de dias anteriores
  Q1 (fazer):  {n}
  Q2 (agendar):{n}
  Q3 (delegar):{n}
Prioridades:   {N} tarefas [!] abertas
Eventos hoje:  {lista ou "nenhum"}
Eventos amanhã:{lista ou "nenhum"}
Inbox:         {N} itens não processados

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Se `day_of_week` for domingo(7) ou segunda(1): adicionar flag `review_day = true`

### 8. Verificar transferências pendentes para NAS

- NAS mount point: `/Volumes/data`
- Verificar se o NAS esta montado: `ls /Volumes/data/ 2>/dev/null`
- Se NAS disponivel: verificar `_THOTH/00_Inbox/_pending-nas/`
  - Se tem arquivos pendentes: transferir para o destino correto no NAS
  - Atualizar as notas correspondentes: trocar `storage_status: pending-transfer` por `storage: truenas` + `path: {caminho final}`
  - Deletar os arquivos de `_pending-nas/` após confirmação
  - Reportar: "NAS: {N} arquivos transferidos"
- Se NAS indisponível: reportar quantos arquivos estão pendentes

### 9. Passar dados para próximo step

- `daily_exists`: boolean
- `pending_tasks`: lista de tarefas pendentes com metadata
- `today_events`: eventos de hoje
- `tomorrow_events`: eventos de amanhã
- `inbox_count`: itens no inbox
- `review_day`: boolean
- `week_number`: número da semana
- `month_dir`: caminho do mês atual
