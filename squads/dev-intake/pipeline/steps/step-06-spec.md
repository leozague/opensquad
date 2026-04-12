# Step 06 — Geração do Spec SDD

## Agente
Sérgio Especificador

## Objetivo
Transformar o briefing aprovado em dois arquivos salvos em `{docs_path}/backlog/{slug}/`:
1. `briefing.md` — briefing consolidado formatado
2. `spec.md` — spec SDD com requisitos, tasks, critérios de aceite e cenários de teste

## Contexto a carregar
1. Ler `{docs_path}/.specs/codebase/STACK.md` — para tasks corretas por camada
2. Ler `{docs_path}/.specs/codebase/ARCHITECTURE.md` — para identificar modulos afetados
3. Ler `{docs_path}/.specs/codebase/PATTERNS.md` — para garantir que o spec segue os padroes do projeto
3. Ler `{docs_path}/in-progress/_index.md` — para verificar dependências com features em andamento

## Processo

### 1. Criar `briefing.md`

```markdown
# Briefing: {título}

> Solicitado por: {usuário}
> Data: {data}
> Tipo: {tipo}
> Urgência: {urgência}

## Descrição Original
{descrição nas palavras do usuário}

## Problema
{problema confirmado na entrevista}

## Solução Esperada
{comportamento esperado + fluxo}

## Módulos Afetados
{lista de módulos/telas}

## Fora do Escopo (Fase 2)
{itens adiados}

## Briefing Consolidado
{síntese clara e acionável}
```

### 2. Criar `spec.md` seguindo SDD

Auto-sizing por complexidade:
- **Simples** (≤3 arquivos): apenas requisitos + critérios de aceite + cenários de teste básicos
- **Médio** (feature clara): requisitos + tasks por camada (DB, Backend, Frontend) + cenários de teste
- **Grande/Complexo**: requisitos + design de arquitetura + tasks detalhadas + plano de testes completo

Estrutura das tasks:
```markdown
## Tasks

### [DB / Backend / Frontend]
| # | Tarefa | Prioridade | Complexidade |
|---|--------|-----------|-------------|
| 1.1 | ... | Alta | Baixa |

## Ordem de Execução
[diagrama de dependências ou lista ordenada]

## Critérios de Aceite
- [ ] ...

## Cenários de Teste

> O desenvolvedor deve garantir que todos os cenários abaixo passam antes de rodar o dev-finalize.

### Cenários Funcionais (o que o usuário vê)
| # | Cenário | Entrada | Resultado Esperado |
|---|---------|---------|-------------------|
| 1 | ... | ... | ... |

### Cenários de Erro (o que acontece quando falha)
| # | Cenário | Entrada | Resultado Esperado |
|---|---------|---------|-------------------|
| 1 | ... | ... | ... |

### Testes Unitários a Escrever
- `{NomeDoService}.{metodo}()`: deve {comportamento esperado}
- `{NomeDoComponent}`: deve exibir erro quando {condição}
```

## Regras para Cenários de Teste

- Cenários funcionais = o fluxo feliz (happy path) — o que deve funcionar
- Cenários de erro = o que o sistema deve fazer quando algo dá errado (input inválido, API fora do ar, campo vazio)
- Descrever em linguagem clara — o que entra, o que sai
- Nunca inventar cenários além do escopo do briefing
- Para features de formulário: sempre incluir validação de campos obrigatórios e formatos inválidos
- Para features com integração externa: sempre incluir cenário de falha da integração

## Regra de Versao de Bibliotecas

Antes de propor tasks de implementacao que envolvam uma biblioteca especifica:
1. Ler `{docs_path}/.specs/codebase/STACK.md` para obter a versao instalada
2. Usar WebFetch para buscar a documentacao da versao instalada (URLs estao no STACK.md)
3. Verificar que a API proposta existe naquela versao — nao assumir que e igual a versao mais recente
4. Se a versao instalada nao suportar o que e necessario: registrar na spec e recomendar avaliacao de upgrade (nunca fazer o upgrade automaticamente)

## Regras Gerais
- Tasks devem ser atômicas (um commit por task)
- Identificar explicitamente dependências entre tasks
- Marcar o que pode ser feito em paralelo com `[P]`
- Nunca inventar requisitos — só o que foi confirmado na entrevista

## Output
Salvar os dois arquivos em `{docs_path}/backlog/{slug}/` e confirmar os caminhos.
