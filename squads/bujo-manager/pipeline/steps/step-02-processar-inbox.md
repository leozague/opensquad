# Step 02 — Processar Inbox

## Agente
Ryder

## Objetivo
Ler todos os itens em `00_Inbox/`, classificar cada um e distribuir para o lugar correto.

---

## Processo

### 1. Ler o Inbox

```
inbox_path = /Users/macbookpro/Documents/_THOTH/00_Inbox/
```

- Listar todos os arquivos .md no inbox
- Para cada arquivo: ler conteúdo e frontmatter

### 2. Classificar cada item

Para cada item no inbox, determinar o tipo:

| Se o conteúdo é... | Ação | Destino |
|---------------------|------|---------|
| Tarefa / to-do / lembrete | Adicionar ao daily log de hoje | `02_Areas/bujo/{today}.md` |
| URL / artigo / vídeo para processar | Passar para squad `para-classifier` | Atlas + Iris processam |
| Nota de projeto (menciona projeto ativo) | Mover para docs do projeto | `01_Projects/{projeto}/` |
| Ideia solta | Adicionar a collections/ideias.md | `02_Areas/bujo/collections/ideias.md` |
| Evento com data | Adicionar ao future-log ou monthly | `02_Areas/bujo/future-log.md` |
| Não consegue classificar | Manter no inbox com flag `status: pending-review` | `00_Inbox/` |

### 3. Aplicar Matriz de Eisenhower (para tarefas)

Ao mover tarefa para o daily log, classificar:

- **Tem deadline hoje/amanhã + é importante?** → `#q1`
- **Importante mas sem urgência?** → `#q2`
- **Urgente mas não é estratégico?** → `#q3`
- **Nem urgente nem importante?** → `#q4` (sugerir eliminar)

Se não conseguir determinar: perguntar ao usuário no checkpoint (step-03).

### 4. Mover / arquivar items processados

- Itens processados: deletar do inbox OU mover para `04_Archives/old/inbox-processado/`
- Itens que viraram notas PARA: deletar do inbox (a nota já foi criada no destino)
- Itens pendentes: manter com `status: pending-review`

### 5. Reportar

```
Inbox processado: {N} itens
  → {n} tarefas adicionadas ao daily log
  → {n} itens enviados para para-classifier
  → {n} notas movidas para projetos
  → {n} ideias adicionadas à collection
  → {n} itens pendentes (precisam de input)
```

Se houver itens pendentes, listar no checkpoint (step-03) para o usuário decidir.
