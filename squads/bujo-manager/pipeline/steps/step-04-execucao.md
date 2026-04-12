# Step 04 — Execução

## Agente
Ryder

## Objetivo
Executar as ações decididas no checkpoint: criar/atualizar daily log, migrar tarefas, processar classificações.

---

## 1. Criar Daily Log (se não existe)

### Template do Daily Log

```markdown
---
note_type: area
created: {today}
updated: {today}
tags: [bujo, daily]
day: "{today}"
week: "W{week_number}"
---

# {today} — {dia da semana}

## Eisenhower

### Q1 — Fazer Agora (urgente + importante)
*(tarefas #q1)*

### Q2 — Agendar (importante, não urgente)
*(tarefas #q2)*

### Q3 — Delegar (urgente, não importante)
*(tarefas #q3)*

## Eventos

*(eventos do dia)*

## Notas

*(observações, registros, insights)*

---

## Migradas de dias anteriores

*(tarefas que vieram de outros dias)*

## Retrospectiva (preencher no final do dia)

*(como foi o dia? o que ficou pendente? por quê?)*
```

Salvar em: `{month_dir}/{today}.md`

### Criar diretório do mês se necessário

Se `{month_dir}` não existir:
1. Criar o diretório
2. Criar `monthly.md` a partir do template

### Criar weekly spread se necessário

Se `{month_dir}/W{week_number}.md` não existir e é segunda-feira:
1. Criar weekly spread com template:

```markdown
---
note_type: area
created: {today}
updated: {today}
tags: [bujo, weekly]
week: "W{week_number}"
period: "{segunda} a {domingo}"
---

# Semana {week_number} — {segunda} a {domingo}

## Metas da Semana

- [ ] ...

## Resumo Diário

| Dia | Concluídas | Pendentes | Destaque |
|-----|------------|-----------|----------|
| Seg | | | |
| Ter | | | |
| Qua | | | |
| Qui | | | |
| Sex | | | |
| Sáb | | | |
| Dom | | | |
```

---

## 2. Registrar Novas Tarefas

Para cada tarefa recebida do checkpoint:

1. Identificar quadrante Eisenhower pela tag (#q1, #q2, #q3, #q4)
2. Se não tem tag: inferir baseado na descrição e perguntar se está correto
3. Adicionar na seção correta do daily log (Q1, Q2, Q3 ou Eventos)
4. Se tem tag de projeto: verificar que o projeto existe em `_memory/projects/_index.md`

---

## 3. Migrar Tarefas

Para cada decisão de migração:

**Se migrar para hoje:**
1. No daily log original: trocar `- [ ]` por `- [>]` e adicionar `→ migrada para {today}`
2. No daily log de hoje: adicionar na seção "Migradas de dias anteriores"

**Se reagendar:**
1. No daily log original: trocar `- [ ]` por `- [<]` e adicionar `→ agendada para {data}`
2. No future-log: adicionar entrada na data especificada

**Se cancelar:**
1. No daily log original: trocar `- [ ]` por `- [-]`

---

## 4. Processar Classificações do Inbox

Para itens que o usuário classificou no checkpoint:
- Aplicar a classificação definida
- Mover para o destino correto
- Remover do inbox

---

## 5. Confirmar

```
Daily log de {today}: {criado/atualizado}
Tarefas registradas: {N} ({n} Q1, {n} Q2, {n} Q3)
Tarefas migradas: {N}
Tarefas canceladas: {N}
Eventos registrados: {N}
Inbox: {N} itens processados
```
