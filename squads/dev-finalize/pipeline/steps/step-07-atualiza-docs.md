# Step 06 — Atualização da Documentação

## Agente
Doc Sintetizador

## Objetivo
Atualizar todos os artefatos de documentação com base no relatório de mudanças aprovado.

## Ações a executar (nesta ordem)

### 1. Atualizar `CHANGELOG.md`
Arquivo: `{docs_path}/releases/CHANGELOG.md`

Adicionar nova entrada no topo:
```markdown
## [{versão}] — {data} — {ambiente}

### {Camada afetada}
- {mudança 1}
- {mudança 2}
```

Se ambiente = staging: adicionar em `[Unreleased]` ou criar entrada datada.
Se ambiente = produção: criar entrada com versão completa.

### 2. Atualizar `STATE.md`
Arquivo: `{docs_path}/.specs/project/STATE.md`

- Mover feature de "Trabalho em Andamento" para fora (ou remover)
- Registrar decisões técnicas tomadas durante o desenvolvimento (se houver)
- Registrar lições aprendidas (se houver)
- Atualizar data de "Status Atual"

### 3. Mover feature de `in-progress/` para `done/`
- Mover pasta `{docs_path}/in-progress/{feature_slug}/` para `{docs_path}/done/{feature_slug}/`
- Adicionar campos ao topo do `briefing.md`: `entregue_em`, `versão`, `ambiente`

### 4. Atualizar índices
- `{docs_path}/in-progress/_index.md` — remover a feature
- `{docs_path}/done/_index.md` — adicionar a feature com data e versão

### 5. Verificar se docs técnicas precisam atualizar
Se houve mudanças em:
- Entidades/schema → verificar `{docs_path}/.specs/codebase/ARCHITECTURE.md`
- Stack/dependências → verificar `{docs_path}/.specs/codebase/STACK.md`
- Git/CI/CD → verificar `{docs_path}/.specs/codebase/GIT-FLOW.md`

Atualizar se necessário; se não precisar, ignorar.

### 6. Atualizar `AGENTS.md` na raiz do projeto

Arquivo: `{project_root}/AGENTS.md`

Este arquivo garante compatibilidade com outros editores e LLMs (Cursor, Windsurf, Copilot).
Deve listar os agentes disponíveis via Opensquad dev-team para este projeto.

Se o arquivo não existir, criar com o seguinte template:

```markdown
# AGENTS.md — {nome_do_projeto}

> Agentes especializados disponíveis para desenvolvimento neste projeto.
> Para acionar: /opensquad run dev-team

## Time de Desenvolvimento

| Agente | Função | Quando acionar |
|--------|--------|---------------|
| Business Owner | Validação de negócio e priorização | Antes de iniciar qualquer feature — valida se faz sentido de negócio |
| Product Manager | User stories e critérios de aceite | Na especificação — quando o briefing precisar de detalhamento |
| Arquiteto | Decisões técnicas e padrões | Ao criar novos módulos ou decidir padrões de código |
| DBA | Banco de dados e migrations | Ao criar/alterar entidades, migrations ou queries complexas |
| Backend Developer | API, services, módulos | Durante implementação do backend |
| Frontend Developer | UI, componentes, stores | Durante implementação do frontend |
| QA Engineer | Testes e qualidade | Para revisar cenários de teste e cobertura |
| DevOps Engineer | Deploy e infraestrutura | Ao mexer em CI/CD, Docker, variáveis de ambiente |
| Tech Writer | Documentação | Ao atualizar docs técnicos e release notes |

## Regras deste projeto

- Nunca commitar para `main` sem instrução explícita
- Nunca referenciar IA, agentes ou LLMs em commits, PRs ou código
- Nunca rodar comandos destrutivos em produção sem autorização explícita
- Commits atômicos por tarefa
- Toda feature: branch → implement → commit → review → PR para develop
```

Se o arquivo já existir, apenas atualizar a tabela de agentes se necessário — não reescrever o conteúdo existente.

## Regras
- Nunca inventar o que foi feito — só o que o relatório de mudanças confirmou
- Datas sempre no formato YYYY-MM-DD
- Versão semântica: PATCH (bug), MINOR (feature), MAJOR (breaking change)
- AGENTS.md não deve conter emojis — é um arquivo técnico de raiz
