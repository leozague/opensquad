# Step 04 — Code Review

**Agente:** Code Reviewer (subagent)

## Objetivo

Verificar se o código implementado está aderente ao que foi especificado na briefing/spec, aos padrões do projeto, e sem problemas de qualidade ou rastreabilidade.

## Instruções

### 1. Carregar contexto

Ler os seguintes arquivos:

**Especificações da feature:**
- `{docs_path}/in-progress/{feature_slug}/briefing.md` (ou `done/` se já foi movido)
- `{docs_path}/in-progress/{feature_slug}/spec.md` (se existir)

**Padrões do projeto:**
- `{docs_path}/.specs/project/PROJECT.md` — visão geral do projeto
- CLAUDE.md do projeto (no `project_root`) — regras de desenvolvimento
- `{docs_path}/.specs/codebase/PATTERNS.md` — padroes arquiteturais e de design do projeto

**O que foi implementado:**
- Relatório da Git Arqueóloga (Step 02) — diff completo e relatório por camada

### 2. Verificar aderência

Comparar o que foi pedido (briefing/spec) com o que foi implementado (git diff):

**Checklist de aderência:**
- [ ] Todos os requisitos funcionais da briefing foram implementados?
- [ ] O escopo foi respeitado? (nada fora do escopo foi adicionado)
- [ ] O fluxo do usuário corresponde ao descrito?
- [ ] Se havia campos a preencher: todos estão presentes?
- [ ] Se havia validações: estão implementadas?
- [ ] Os cenários de teste do spec.md foram cobertos?

**Checklist de qualidade:**
- [ ] Não há console.log ou debug code esquecido
- [ ] Não há credenciais ou dados sensíveis expostos no código
- [ ] Não há arquivos gerados ou temporários commitados
- [ ] A nomenclatura de arquivos/funções segue o padrão do projeto
- [ ] Há tratamento de erro nos pontos críticos

**Checklist de rastreabilidade (regras invioláveis):**
- [ ] Nenhum commit message contém referência a IA, agentes, LLMs ou ferramentas de IA
- [ ] Nenhum título ou descrição de PR contém referência a IA ou agentes
- [ ] Nenhum comentário no código menciona IA, Claude, Copilot ou similares
- [ ] Não há emojis em arquivos que não sejam documentação (.md de docs)

**Checklist de padrões do projeto:**
- [ ] Implementacao segue os padroes documentados em PATTERNS.md
- [ ] Backend: segue padrao Use Case (se modulo com logica complexa)
- [ ] Backend: entity/DTO/module/service corretos
- [ ] Frontend: componente em pasta correta, usa store Pinia se necessário
- [ ] Commits atômicos por tarefa (não um commit gigante)

### 3. Classificar achados

Para cada problema encontrado, classificar como:
- **BLOQUEANTE** — funcionalidade incorreta, requisito não atendido, erro de segurança, referência a IA em código/commits
- **IMPORTANTE** — desvio de padrão, código confuso, falta de tratamento de erro relevante
- **SUGESTAO** — melhoria opcional, não bloqueia a entrega

### 4. Produzir relatório

```
## Code Review — {feature_slug}

### Aderência à Especificação
[OK] Atendido / [PARCIAL] Parcial / [FALHA] Não atendido

[Itens atendidos]
[Itens com desvio e explicação]
[Itens não implementados]

### Rastreabilidade
[OK] Sem referências a IA ou ferramentas de IA nos commits/código
[FALHA] Encontrado em: {arquivo/commit} — {trecho}

### Qualidade do Código
[Achados por categoria: BLOQUEANTE / IMPORTANTE / SUGESTAO]

### Recomendação
[APROVADO] / [RESSALVAS] / [REQUER CORRECAO]
```

## Regras

- Basear-se APENAS no que está no diff e nos arquivos de spec — não inventar problemas
- Distinguir claramente o que é fato vs opinião
- Qualquer referência a IA em commits ou código é automaticamente BLOQUEANTE
- Se spec.md não existir, basear-se apenas no briefing.md

## Output

Relatório de code review apresentado no Step 05.

**Checklist de compatibilidade de versao:**
- [ ] A implementacao usa APIs existentes na versao instalada (verificar STACK.md)?
- [ ] Nenhuma dependencia nova foi adicionada sem estar registrada no STACK.md?
- [ ] Se foi necessario instalar ou atualizar algo: o STACK.md foi atualizado?
