# Step 05 — Weekly Review (Condicional)

## Agente
Ryder

## Condição
Só executa se `review_day = true` (domingo ou segunda-feira).

## Objetivo
Revisar a semana que passou, identificar padrões, e preparar a próxima.

---

## 1. Coletar dados da semana

- Ler todos os daily logs da semana (segunda a domingo)
- Contar por status:
  - `[x]` concluídas
  - `[ ]` pendentes (não migradas)
  - `[>]` migradas
  - `[-]` canceladas
  - `[!]` prioridades abertas
- Contar por quadrante Eisenhower (#q1, #q2, #q3, #q4)
- Contar por projeto (#gold-letras, #visual-sales, etc.)

## 2. Análise de padrões

### Tarefas que migram repetidamente
- Identificar tarefas que apareceram em 3+ daily logs como `[>]`
- Essas precisam de decisão: fazer de vez, delegar, ou eliminar
- Apresentar ao usuário com recomendação

### Distribuição Eisenhower
- Calcular % de tempo em cada quadrante
- Ideal: maioria em Q2 (importante, não urgente = planejamento estratégico)
- Se Q1 domina: excesso de apagar incêndios
- Se Q3 domina: muita interrupção, precisa delegar mais
- Se Q4 existe: eliminar essas tarefas

### Performance por projeto
- Quantas tarefas de cada projeto foram concluídas vs criadas
- Alertar se algum projeto está parado (0 tarefas concluídas na semana)

## 3. Gerar relatório semanal

```markdown
# Revisão — Semana {week_number} ({período})

## Números

| Métrica | Valor |
|---------|-------|
| Tarefas concluídas | {n} |
| Tarefas migradas | {n} |
| Tarefas canceladas | {n} |
| Pendentes restantes | {n} |
| Taxa de conclusão | {%} |

## Distribuição Eisenhower

| Quadrante | Concluídas | Pendentes | % do total |
|-----------|------------|-----------|------------|
| Q1 — Fazer | {n} | {n} | {%} |
| Q2 — Agendar | {n} | {n} | {%} |
| Q3 — Delegar | {n} | {n} | {%} |
| Q4 — Eliminar | {n} | {n} | {%} |

## Por Projeto

| Projeto | Concluídas | Criadas | Saldo |
|---------|------------|---------|-------|
| #gold-letras | {n} | {n} | {+/-} |
| ... | | | |

## Padrões Identificados

{análise de tarefas recorrentes, gargalos, recomendações}

## Recomendações para Semana {week_number + 1}

{sugestões baseadas nos padrões identificados}
```

Salvar em: `{month_dir}/W{week_number}-review.md`

## 4. Verificar garantias e documentos vencendo

- Ler `02_Areas/compras/_index.md` — verificar coluna "Garantia ate"
- Ler `02_Areas/documentos/_index.md` — verificar coluna "Validade"
- Alertar sobre itens vencendo nos proximos 30 dias
- Atualizar secao "Alertas de Garantia" no `compras/_index.md`
- Se houver alertas, incluir no relatorio semanal

## 5. Atualizar weekly spread

- Preencher tabela de resumo diário no weekly spread atual
- Criar weekly spread da próxima semana (se não existir)

## 6. Atualizar monthly log

- Marcar tarefas do mes concluidas na semana
- Adicionar novas tarefas identificadas na revisao

## 7. Apresentar ao usuario

Mostrar o relatório de forma concisa e perguntar:
- Quer definir metas para a próxima semana?
- Tem tarefas recorrentes que quer decidir? (as que migraram 3+ vezes)
