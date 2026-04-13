---
task: "Design Architecture"
order: 3
input: |
  - sdd_specs: Specs dos modulos gerados na task anterior
  - input_params: Parametros do checkpoint (repo type, deploy server, db credentials)
  - ports_registry: Registro de portas do opensquad
output: |
  - architecture: Definicao completa de arquitetura, repo, deploy, testes
  - port_registration: Portas atribuidas ao projeto
  - sdd_plan: Documento final consolidado (sdd-plan.md)
---

# Design Architecture

Definir arquitetura de repositorio, estrutura de pastas, pipeline de deploy, estrategia de testes e registrar portas no port registry. Consolida tudo no documento final `sdd-plan.md`.

## Process

1. Ler `input-params.yaml` para: tipo de repo (mono/multi/hibrido), servidor de deploy, banco + credenciais
2. Ler `_opensquad/_memory/ports-registry.md` para encontrar o proximo indice disponivel
3. Calcular portas: API = 3000 + (index * 10), Web = 5173 + (index * 10), DB = 5432 + (index * 10)
4. Definir estrutura de pastas baseada na stack e tipo de repo:
   - Monorepo: `apps/`, `packages/`, turbo.json ou nx.json
   - Multi-repo: um repo por servico
   - Single: estrutura padrao da stack
5. Definir pipeline de deploy:
   - Dockerfile (multi-stage build)
   - docker-compose.yml para Easypanel
   - GitHub Actions workflow (lint → test → build → deploy)
   - Secrets necessarios (GHCR token, Easypanel webhooks)
6. Definir estrategia de testes: framework, runners, cobertura minima, tipos
7. Consolidar tudo em `sdd-plan.md` — documento unico que o Bruno Bootstrap vai seguir

## Output Format

O output final e o arquivo `sdd-plan.md` com todas as secoes:

```markdown
# SDD Plan: {project_name}

## Visao Geral
{descricao do projeto, stack, tipo}

## Portas Atribuidas
| Servico | Porta |
|---------|-------|
| API | {api_port} |
| Web | {web_port} |
| DB | {db_port} |

## Arquitetura de Repositorio
{tipo: mono/multi/hibrido, ferramentas, estrutura de pastas}

## Estrutura de Pastas
```
{arvore de diretorio completa}
```

## Stack Validada
{tabela com framework, versao, compatibilidade}

## Banco de Dados
{engine, credenciais recebidas, database name, migration strategy}

## Specs dos Modulos
{todos os specs gerados na task anterior, em ordem de execucao}

## Estrategia de Testes
{framework, runners, cobertura minima, tipos de teste}

## Pipeline de Deploy
{Docker, CI/CD, Easypanel, webhooks}

## Checklist de Entrega
{lista de tudo que deve ser entregue ao final}
```

## Output Example

> Exemplo resumido — o real sera muito mais detalhado.

```markdown
# SDD Plan: TaskFlow

## Visao Geral
App web de gestao de projetos para equipes de dev. Fullstack com NestJS 11 (API) + Vue 3.5 (Web) + PostgreSQL 16.

## Portas Atribuidas
| Servico | Porta |
|---------|-------|
| API | 3010 |
| Web | 5183 |
| DB | 5442 (local, ja existente) |

## Arquitetura de Repositorio
Monorepo com pnpm workspaces + Turborepo.

## Estrutura de Pastas
```
taskflow/
├── apps/
│   ├── api/          (NestJS 11)
│   └── web/          (Vue 3.5 + Vite)
├── packages/
│   └── shared/       (tipos e utils compartilhados)
├── turbo.json
├── pnpm-workspace.yaml
├── docker-compose.yml
├── .github/workflows/
│   └── ci-cd.yml
├── .env.example
└── README.md
```

## Estrategia de Testes
- Backend: Jest + Supertest (unit + integration + e2e)
- Frontend: Vitest + Vue Test Utils (unit) + Playwright (e2e)
- Cobertura minima: 80% linhas
- CI roda testes em toda PR

## Pipeline de Deploy
- Dockerfile multi-stage (build + runtime) para API e Web
- docker-compose.yml para Easypanel com servicos: api, web, db
- GitHub Actions: lint → test → build → push GHCR → webhook Easypanel
- Secrets: GHCR_TOKEN, EASYPANEL_WEBHOOK_API_PROD, EASYPANEL_WEBHOOK_WEB_PROD
```

## Quality Criteria

- [ ] Portas registradas no port registry (sem conflito)
- [ ] Estrutura de pastas completa e coerente com a stack
- [ ] Pipeline de deploy definido (Docker + CI/CD + Easypanel)
- [ ] Estrategia de testes definida (frameworks, cobertura, tipos)
- [ ] Documento sdd-plan.md consolidado e completo
- [ ] Todos os specs dos modulos incluidos em ordem de execucao

## Veto Conditions

Rejeitar e refazer se:
1. Portas conflitam com projeto ja registrado no port registry
2. Estrutura de pastas nao segue convencoes da stack escolhida
