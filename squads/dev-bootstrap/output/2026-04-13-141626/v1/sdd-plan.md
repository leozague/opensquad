# SDD Plan: THOTH App

> Gerado por Andre Arquitetura em 2026-04-13
> Baseado no planejamento: /Users/macbookpro/Documents/_THOTH/01_Projects/thoth-app/README.md
> Fase alvo: Fase 0 — Setup + Fase 1 — MVP Core

---

## Visao Geral

App web completo para gestao de conhecimento pessoal e profissional (segundo cerebro digital).
Implementa metodos BuJo, Eisenhower, PARA e Metas SMART. Substitui o Obsidian como interface principal do vault.

- **Tipo:** Fullstack (monorepo)
- **Backend:** NestJS 11 + MikroORM + PostgreSQL 16 + Redis
- **Frontend:** Vue 3.5 + Vite + Tailwind CSS 4 + Reka UI
- **Arquitetura:** Clean Architecture + DDD + Event-Driven + CQRS

---

## Portas Atribuidas

| Servico | Porta | Nota |
|---------|-------|------|
| API (NestJS) | 3010 | Index 1 no port registry |
| Web (Vite dev) | 5183 | Index 1 no port registry |
| PostgreSQL | 5442 | Docker local |
| Redis | 6389 | Offset para nao conflitar com default 6379 |
| PgBouncer | 6442 | Pool de conexoes |
| Grafana | 3011 | Observabilidade |
| GlitchTip | 3012 | Error tracking |

---

## Arquitetura de Repositorio

**Tipo:** Monorepo com npm workspaces

```
thoth-app/
├── apps/
│   ├── api/                    # NestJS 11 backend
│   └── web/                    # Vue 3.5 frontend
├── packages/
│   └── shared/                 # Tipos, enums, DTOs compartilhados
├── infra/
│   ├── docker/
│   │   ├── Dockerfile.api      # Multi-stage build API
│   │   ├── Dockerfile.web      # Multi-stage build Web
│   │   └── pgbouncer/
│   │       └── pgbouncer.ini
│   ├── docker-compose.yml      # Stack completa (dev local)
│   ├── docker-compose.prod.yml # Stack producao (Easypanel)
│   └── observability/
│       ├── alloy-config.yaml
│       ├── prometheus.yml
│       └── grafana/
│           └── provisioning/
├── .github/
│   └── workflows/
│       └── ci-cd.yml
├── package.json                # Root workspace config
├── tsconfig.base.json          # Config TS compartilhada
├── .env.example
├── .gitignore
└── README.md
```

---

## Estrutura Backend (apps/api/)

```
apps/api/
├── src/
│   ├── main.ts
│   ├── app.module.ts
│   │
│   ├── @core/                       # Camada de dominio (zero deps externas)
│   │   ├── entities/                # Entidades MikroORM com logica
│   │   ├── events/                  # Domain events (classes imutaveis)
│   │   │   ├── task/
│   │   │   ├── daily-log/
│   │   │   ├── note/
│   │   │   ├── goal/
│   │   │   └── ...
│   │   └── ports/                   # Interfaces (contratos)
│   │       ├── repositories/
│   │       ├── notification.port.ts
│   │       ├── embedding.port.ts
│   │       └── search.port.ts
│   │
│   ├── @application/                # Use cases (commands + queries)
│   │   ├── tasks/
│   │   │   ├── commands/
│   │   │   └── queries/
│   │   ├── daily-logs/
│   │   ├── notes/
│   │   ├── goals/
│   │   └── ...
│   │
│   ├── @infrastructure/             # Implementacoes concretas
│   │   ├── database/
│   │   │   ├── mikro-orm.config.ts
│   │   │   ├── migrations/
│   │   │   └── subscribers/
│   │   ├── repositories/
│   │   ├── cache/
│   │   └── ...
│   │
│   ├── @event-handlers/            # Reacoes a domain events
│   │   ├── activity/
│   │   ├── notifications/
│   │   └── ...
│   │
│   ├── @api/                        # Controllers (HTTP)
│   │   ├── auth/
│   │   ├── tasks/
│   │   └── ...
│   │
│   ├── @cron/                       # Jobs agendados
│   │
│   └── common/
│       ├── decorators/
│       ├── filters/
│       ├── guards/
│       └── pipes/
│
├── test/
│   ├── unit/
│   ├── integration/
│   └── e2e/
│
├── nest-cli.json
├── tsconfig.json
├── tsconfig.build.json
├── .env.example
└── package.json
```

---

## Estrutura Frontend (apps/web/)

```
apps/web/
├── src/
│   ├── main.ts
│   ├── App.vue
│   ├── assets/
│   │   └── index.css               # Tema THOTH + @import tailwindcss
│   ├── components/
│   │   ├── layout/                 # Sidebar, header (base nowa)
│   │   ├── ui/                     # Componentes base (base nowa)
│   │   └── shared/
│   ├── composables/
│   │   ├── useAuth.ts
│   │   └── ...
│   ├── stores/
│   │   ├── auth.ts
│   │   ├── theme.ts
│   │   └── sidebar.ts
│   ├── views/
│   │   ├── auth/
│   │   │   ├── Login.vue
│   │   │   └── Register.vue
│   │   └── dashboard/
│   │       └── Dashboard.vue
│   ├── router/
│   │   └── index.ts
│   └── lib/
│       └── api.ts                  # Axios/fetch wrapper
│
├── index.html
├── vite.config.ts
├── tsconfig.json
├── tsconfig.app.json
└── package.json
```

---

## Stack Validada

| Camada | Framework | Versao | Compativel | Notas |
|--------|-----------|--------|------------|-------|
| Backend | NestJS | 11.x | OK | Node >= 20, Express 5, SWC compiler |
| ORM | MikroORM | 6.x | OK | @mikro-orm/nestjs, defineEntity ou decorators |
| CQRS | @nestjs/cqrs | latest | OK | Commands, Queries, Events nativos |
| DB | PostgreSQL | 16 | OK | + pgvector + TimescaleDB como extensoes |
| Pool | PgBouncer | latest | OK | Transaction mode |
| Cache/Queue | Redis + BullMQ | latest | OK | Cache, filas, rate limiting store |
| Frontend | Vue | 3.5 | OK | Composition API, script setup |
| Build | Vite | 6.x | OK | @tailwindcss/vite plugin |
| CSS | Tailwind CSS | 4.x | OK | CSS-first config, @theme, sem tailwind.config.js |
| UI | Reka UI | 2.9 | OK | Headless components |
| State (client) | Pinia | latest | OK | Tema, sidebar, auth |
| State (server) | TanStack Query | latest | OK | @tanstack/vue-query |
| Forms | Vee-Validate + Zod | latest | OK | Schema-first validation |
| Testes | Vitest | latest | OK | Unit + integration |
| Testes DB | Testcontainers | latest | OK | Integration com banco real |
| API Docs | @nestjs/swagger | latest | OK | Swagger/OpenAPI |
| Security | Helmet + @nestjs/throttler | latest | OK | Headers + rate limiting |
| Observability | OpenTelemetry | latest | OK | Auto-instrumentacao |
| Errors | GlitchTip | latest | OK | Sentry-compatible, self-hosted |

---

## Banco de Dados

- **Engine:** PostgreSQL 16 (Docker)
- **Host:** localhost
- **Port:** 5442
- **User:** thoth
- **Password:** thoth
- **Database:** thoth_dev
- **Extensions:** pgvector (busca semantica), TimescaleDB (time series)
- **Pooler:** PgBouncer (transaction mode, port 6442)
- **Migration strategy:** MikroORM migrations (up/down)
- **Schemas:** core, projects, portal (multi-schema via MikroORM)

---

## Specs dos Modulos (Fase 0 — Setup + Fase 1 — MVP Core)

### Ordem de Execucao (Topological Sort)

```
--- FASE 0: Setup ---
1.  monorepo-scaffold        — estrutura do monorepo, workspaces, configs
2.  backend-scaffold         — NestJS 11 com SWC, configs base
3.  database-setup           — MikroORM + PostgreSQL + migrations
4.  cqrs-setup               — @nestjs/cqrs com bus de commands/queries/events
5.  auth-module              — JWT RS256, login, register, refresh token
6.  frontend-scaffold        — Vue 3.5 + Vite + Tailwind 4 + Reka UI (base nowa)
7.  docker-stack             — Docker Compose completo (dev + prod)
8.  ci-cd-pipeline           — GitHub Actions (lint, test, build, deploy)
9.  observability-setup      — OpenTelemetry + Grafana stack + GlitchTip
10. test-infrastructure      — Vitest + Testcontainers configurados

--- FASE 1: MVP Core (Backend) ---
11. core-entities            — Todas as entidades de dominio (Fase 1)
12. workspaces-module        — CRUD workspaces + membros
13. notes-module             — CRUD notas PARA + domain events
14. tasks-module             — CRUD tarefas + Eisenhower + domain events
15. daily-logs-module        — CRUD daily logs + habitos + domain events
16. events-module            — CRUD eventos + recorrencia
17. ideas-module             — CRUD ideias + converter para tarefa
18. goals-module             — CRUD metas SMART + progresso
19. search-module            — Busca full-text (tsvector)
20. attachments-module       — Upload de arquivos (BYTEA)
21. trash-module             — Listagem, restore, exclusao definitiva
22. activity-log-module      — Event handlers para activity_log
23. websocket-module         — Gateway WebSocket (Socket.io) + broadcast
24. notifications-module     — Sistema de notificacoes in-app

--- FASE 1: MVP Core (Frontend) ---
25. frontend-layout          — Layout completo (sidebar THOTH, menu role-based)
26. frontend-auth            — Paginas de auth conectadas ao backend
27. frontend-dashboard       — Dashboard customizavel com widgets
28. frontend-bujo            — BuJo Today (daily log, habitos, humor, retrospectiva)
29. frontend-eisenhower      — Board Eisenhower (kanban 4 colunas, drag and drop)
30. frontend-notes           — Notas PARA + editor markdown (TipTap/Milkdown)
31. frontend-events          — Eventos + calendario (FullCalendar)
32. frontend-ideas           — Listagem de ideias + converter
33. frontend-search          — Busca global (Cmd+K)
34. frontend-notifications   — Bell + painel dropdown
35. frontend-trash           — Trash view com restaurar
36. frontend-realtime        — WebSocket updates em tempo real
```

---

### Spec 1: monorepo-scaffold

```yaml
module:
  name: "monorepo-scaffold"
  description: "Criar estrutura do monorepo com npm workspaces"
  depends_on: []

  files:
    - path: "package.json"
      responsibility: "Root package com workspaces config"
    - path: "tsconfig.base.json"
      responsibility: "Config TypeScript compartilhada (strict, paths)"
    - path: "apps/api/package.json"
      responsibility: "Package do backend NestJS"
    - path: "apps/web/package.json"
      responsibility: "Package do frontend Vue"
    - path: "packages/shared/package.json"
      responsibility: "Package de tipos compartilhados"
    - path: "packages/shared/src/index.ts"
      responsibility: "Export barrel dos tipos"
    - path: ".gitignore"
      responsibility: "Ignorar node_modules, dist, .env, .DS_Store"
    - path: ".env.example"
      responsibility: "Template de variaveis de ambiente"
    - path: "README.md"
      responsibility: "Instrucoes de setup e arquitetura"

  tests:
    unit: []
    integration: []
    e2e: []

  acceptance_criteria:
    - "npm install na raiz instala deps de todos os workspaces"
    - "Imports entre apps/ e packages/shared funcionam"
    - ".gitignore cobre todos os artefatos"
    - ".env.example lista todas as variaveis necessarias"

  commit_message: "feat: scaffold monorepo com npm workspaces"
```

---

### Spec 2: backend-scaffold

```yaml
module:
  name: "backend-scaffold"
  description: "Setup NestJS 11 com SWC, configs base, Swagger, Helmet, throttler"
  depends_on: ["monorepo-scaffold"]

  interfaces:
    - name: "AppModule"
      methods:
        - signature: "bootstrap(): Promise<void>"
          description: "Inicializar app NestJS com configs globais"

  files:
    - path: "apps/api/src/main.ts"
      responsibility: "Bootstrap do NestJS (Swagger, CORS, Helmet, validation pipe)"
    - path: "apps/api/src/app.module.ts"
      responsibility: "Root module com imports globais"
    - path: "apps/api/nest-cli.json"
      responsibility: "Config do NestJS CLI (SWC compiler)"
    - path: "apps/api/tsconfig.json"
      responsibility: "TypeScript config do backend"
    - path: "apps/api/tsconfig.build.json"
      responsibility: "TypeScript config de build"
    - path: "apps/api/src/common/filters/all-exceptions.filter.ts"
      responsibility: "Exception filter global"
    - path: "apps/api/src/common/pipes/zod-validation.pipe.ts"
      responsibility: "Validation pipe com Zod"
    - path: "apps/api/src/common/decorators/current-user.decorator.ts"
      responsibility: "Decorator @CurrentUser"
    - path: "apps/api/src/common/decorators/public.decorator.ts"
      responsibility: "Decorator @Public para rotas sem auth"
    - path: "apps/api/src/@api/health/health.controller.ts"
      responsibility: "Healthcheck endpoint GET /api/health"

  tests:
    unit: []
    integration:
      - "deve iniciar app sem erros"
    e2e:
      - "GET /api/health deve retornar 200"

  acceptance_criteria:
    - "npm run dev no backend inicia na porta 3010"
    - "SWC compiler ativo (build < 3s)"
    - "Swagger disponivel em /api/docs"
    - "Helmet headers presentes nas respostas"
    - "Rate limiting ativo"
    - "GET /api/health retorna 200"

  commit_message: "feat(api): scaffold NestJS 11 com SWC, Swagger, Helmet e healthcheck"
```

---

### Spec 3: database-setup

```yaml
module:
  name: "database-setup"
  description: "MikroORM + PostgreSQL 16 + migrations + multi-schema + soft delete"
  depends_on: ["backend-scaffold"]

  interfaces:
    - name: "DatabaseModule"
      methods:
        - signature: "forRoot(): DynamicModule"
          description: "Configurar MikroORM com PostgreSQL"

  files:
    - path: "apps/api/src/@infrastructure/database/mikro-orm.config.ts"
      responsibility: "Configuracao MikroORM (entities, dbName, schemas)"
    - path: "apps/api/src/@infrastructure/database/database.module.ts"
      responsibility: "Modulo NestJS para MikroORM"
    - path: "apps/api/src/@infrastructure/database/subscribers/soft-delete.subscriber.ts"
      responsibility: "Subscriber global para soft delete (deleted_at)"
    - path: "apps/api/src/@core/entities/base.entity.ts"
      responsibility: "Entidade base com id, created_at, updated_at, deleted_at"
    - path: "apps/api/src/@core/entities/user.entity.ts"
      responsibility: "Entidade User (primeira entidade do sistema)"
    - path: "apps/api/src/@core/entities/workspace.entity.ts"
      responsibility: "Entidade Workspace"
    - path: "apps/api/mikro-orm.config.ts"
      responsibility: "Config para CLI de migrations"

  tests:
    unit: []
    integration:
      - "deve conectar ao PostgreSQL com credenciais do .env"
      - "deve criar schema e rodar migrations sem erros"
      - "soft delete deve setar deleted_at ao inves de deletar"
    e2e: []

  acceptance_criteria:
    - "MikroORM conecta ao PostgreSQL na porta 5442"
    - "Migrations CLI funcional (create, up, down)"
    - "Entidades base criadas com soft delete"
    - "Multi-schema configurado (core, projects)"

  commit_message: "feat(database): configurar MikroORM, PostgreSQL, migrations e soft delete"
```

---

### Spec 4: cqrs-setup

```yaml
module:
  name: "cqrs-setup"
  description: "Setup @nestjs/cqrs com CommandBus, QueryBus, EventBus"
  depends_on: ["database-setup"]

  files:
    - path: "apps/api/src/@core/events/base.event.ts"
      responsibility: "Classe base para domain events"
    - path: "apps/api/src/@event-handlers/activity/log-activity.handler.ts"
      responsibility: "Handler generico que loga qualquer evento no activity_log"

  tests:
    unit:
      - "deve publicar evento via EventBus"
      - "handler deve receber evento publicado"
    integration: []
    e2e: []

  acceptance_criteria:
    - "CqrsModule importado no AppModule"
    - "CommandBus, QueryBus, EventBus injetaveis"
    - "Evento publicado e recebido pelo handler"

  commit_message: "feat(cqrs): configurar @nestjs/cqrs com buses e activity handler base"
```

---

### Spec 5: auth-module

```yaml
module:
  name: "auth-module"
  description: "Autenticacao JWT RS256 + refresh token rotation + API keys"
  depends_on: ["database-setup", "cqrs-setup"]

  interfaces:
    - name: "AuthController"
      methods:
        - signature: "register(dto: RegisterDto): Promise<TokenPair>"
          description: "Registra usuario e retorna tokens"
        - signature: "login(dto: LoginDto): Promise<TokenPair>"
          description: "Autentica e retorna tokens"
        - signature: "refresh(dto: RefreshDto): Promise<TokenPair>"
          description: "Renova tokens via refresh token"
        - signature: "logout(): Promise<void>"
          description: "Invalida refresh token"

  files:
    - path: "apps/api/src/@api/auth/auth.controller.ts"
      responsibility: "Endpoints HTTP de auth"
    - path: "apps/api/src/@application/auth/commands/register.command.ts"
      responsibility: "Command de registro"
    - path: "apps/api/src/@application/auth/commands/register.handler.ts"
      responsibility: "Handler de registro"
    - path: "apps/api/src/@application/auth/commands/login.command.ts"
      responsibility: "Command de login"
    - path: "apps/api/src/@application/auth/commands/login.handler.ts"
      responsibility: "Handler de login"
    - path: "apps/api/src/@application/auth/commands/refresh.command.ts"
      responsibility: "Command de refresh"
    - path: "apps/api/src/@application/auth/commands/refresh.handler.ts"
      responsibility: "Handler de refresh"
    - path: "apps/api/src/common/guards/jwt-auth.guard.ts"
      responsibility: "Guard de autenticacao JWT"
    - path: "apps/api/src/common/guards/roles.guard.ts"
      responsibility: "Guard de roles"
    - path: "apps/api/src/@core/entities/refresh-token.entity.ts"
      responsibility: "Entidade de refresh token"

  tests:
    unit:
      - "deve gerar JWT RS256 valido ao registrar"
      - "deve rejeitar registro com email duplicado"
      - "deve rejeitar login com senha incorreta"
      - "deve rotacionar refresh token"
    integration:
      - "deve persistir usuario no banco ao registrar"
      - "deve invalidar refresh token antigo apos rotacao"
    e2e:
      - "POST /api/auth/register deve retornar 201 com tokens"
      - "POST /api/auth/login deve retornar 200 com tokens"
      - "POST /api/auth/login com senha errada deve retornar 401"
      - "POST /api/auth/refresh deve retornar novos tokens"
      - "Endpoint protegido sem token deve retornar 401"

  acceptance_criteria:
    - "Registro cria usuario e retorna token pair (access + refresh)"
    - "Login valida credenciais com bcrypt e retorna tokens"
    - "JWT usa RS256 (chaves publica/privada)"
    - "Refresh token rotation com deteccao de reuso"
    - "Guard global protege todos os endpoints (exceto @Public)"

  commit_message: "feat(auth): implementar JWT RS256, registro, login e refresh token rotation"
```

---

### Spec 6: frontend-scaffold

```yaml
module:
  name: "frontend-scaffold"
  description: "Vue 3.5 + Vite + Tailwind CSS 4 + Reka UI baseado no nowa-tailwind"
  depends_on: ["monorepo-scaffold"]

  files:
    - path: "apps/web/vite.config.ts"
      responsibility: "Config Vite com @tailwindcss/vite plugin"
    - path: "apps/web/src/main.ts"
      responsibility: "Bootstrap Vue com Pinia, Router, TanStack Query"
    - path: "apps/web/src/App.vue"
      responsibility: "Root component com layout"
    - path: "apps/web/src/assets/index.css"
      responsibility: "CSS com @import tailwindcss e @theme (cores THOTH)"
    - path: "apps/web/src/router/index.ts"
      responsibility: "Vue Router com rotas base (login, dashboard)"
    - path: "apps/web/src/stores/auth.ts"
      responsibility: "Pinia store de autenticacao"
    - path: "apps/web/src/stores/theme.ts"
      responsibility: "Pinia store de tema (dark/light)"
    - path: "apps/web/src/stores/sidebar.ts"
      responsibility: "Pinia store do sidebar (collapsed/expanded)"
    - path: "apps/web/src/lib/api.ts"
      responsibility: "HTTP client com interceptors (auth, refresh)"
    - path: "apps/web/src/composables/useAuth.ts"
      responsibility: "Composable de auth (login, logout, isAuthenticated)"
    - path: "apps/web/src/components/layout/AppLayout.vue"
      responsibility: "Layout principal (sidebar + header + content)"
    - path: "apps/web/src/components/layout/AppSidebar.vue"
      responsibility: "Sidebar colapsavel"
    - path: "apps/web/src/components/layout/AppHeader.vue"
      responsibility: "Header com user menu, notificacoes, busca"
    - path: "apps/web/src/views/auth/Login.vue"
      responsibility: "Pagina de login"
    - path: "apps/web/src/views/auth/Register.vue"
      responsibility: "Pagina de registro"
    - path: "apps/web/src/views/dashboard/Dashboard.vue"
      responsibility: "Dashboard placeholder"
    - path: "apps/web/index.html"
      responsibility: "HTML base"
    - path: "apps/web/tsconfig.json"
      responsibility: "TypeScript config frontend"

  tests:
    unit: []
    integration: []
    e2e:
      - "Pagina de login deve carregar"
      - "Login com credenciais validas deve redirecionar para dashboard"

  acceptance_criteria:
    - "npm run dev no frontend inicia na porta 5183"
    - "Tailwind CSS 4 com @theme configurado (cores THOTH)"
    - "Layout com sidebar colapsavel funcionando"
    - "Dark mode toggle funcionando"
    - "Login e registro conectados ao backend"
    - "TanStack Query configurado para server state"
    - "Pinia configurado para client state"

  commit_message: "feat(web): scaffold Vue 3.5 com Tailwind 4, Reka UI e layout base"
```

---

### Spec 7: docker-stack

```yaml
module:
  name: "docker-stack"
  description: "Docker Compose para dev local e producao (Easypanel)"
  depends_on: ["backend-scaffold", "frontend-scaffold", "database-setup"]

  files:
    - path: "infra/docker/Dockerfile.api"
      responsibility: "Multi-stage build do backend"
    - path: "infra/docker/Dockerfile.web"
      responsibility: "Multi-stage build do frontend"
    - path: "infra/docker-compose.yml"
      responsibility: "Stack dev (postgres, redis, pgbouncer)"
    - path: "infra/docker-compose.prod.yml"
      responsibility: "Stack producao (api, web, postgres, redis, pgbouncer)"
    - path: "infra/docker/pgbouncer/pgbouncer.ini"
      responsibility: "Config PgBouncer (transaction mode)"
    - path: "infra/docker/.dockerignore"
      responsibility: "Ignorar node_modules, .git, etc."

  tests:
    unit: []
    integration:
      - "docker compose up deve subir todos os servicos"
      - "API deve responder em localhost:3010"
      - "PostgreSQL deve aceitar conexoes na porta 5442"
    e2e: []

  acceptance_criteria:
    - "docker compose up sobe: postgres, redis, pgbouncer"
    - "Dockerfile.api gera imagem funcional"
    - "Dockerfile.web gera imagem funcional com nginx"
    - "PgBouncer em transaction mode na porta 6442"

  commit_message: "feat(infra): docker compose com PostgreSQL, Redis, PgBouncer"
```

---

### Spec 8: ci-cd-pipeline

```yaml
module:
  name: "ci-cd-pipeline"
  description: "GitHub Actions para CI/CD com deploy no Easypanel"
  depends_on: ["docker-stack"]

  files:
    - path: ".github/workflows/ci-cd.yml"
      responsibility: "Pipeline: lint → test → build → push GHCR → deploy Easypanel"

  tests:
    unit: []
    integration: []
    e2e: []

  acceptance_criteria:
    - "Push para main dispara pipeline"
    - "Pipeline roda lint, testes, build"
    - "Build gera imagem Docker e pusha para GHCR"
    - "Webhook Easypanel dispara deploy em vps4"
    - "Secrets documentados: GHCR_TOKEN, EASYPANEL_WEBHOOK_*"

  commit_message: "feat(ci): GitHub Actions com lint, test, build e deploy Easypanel"
```

---

### Spec 9: observability-setup

```yaml
module:
  name: "observability-setup"
  description: "OpenTelemetry + Grafana + Loki + Tempo + Prometheus + GlitchTip"
  depends_on: ["backend-scaffold", "docker-stack"]

  files:
    - path: "apps/api/src/@infrastructure/telemetry/otel.ts"
      responsibility: "Setup OpenTelemetry SDK (auto-instrumentacao)"
    - path: "infra/observability/alloy-config.yaml"
      responsibility: "Grafana Alloy (coleta logs, traces, metricas)"
    - path: "infra/observability/prometheus.yml"
      responsibility: "Config Prometheus"
    - path: "infra/observability/grafana/provisioning/datasources.yml"
      responsibility: "Datasources do Grafana (Loki, Tempo, Prometheus)"

  tests:
    unit: []
    integration:
      - "OpenTelemetry deve exportar traces"
    e2e: []

  acceptance_criteria:
    - "Traces de requests HTTP visiveis no Grafana/Tempo"
    - "Logs estruturados (JSON) coletados pelo Loki"
    - "Metricas basicas no Prometheus"
    - "GlitchTip capturando erros"

  commit_message: "feat(observability): OpenTelemetry, Grafana stack e GlitchTip"
```

---

### Spec 10: test-infrastructure

```yaml
module:
  name: "test-infrastructure"
  description: "Vitest + Testcontainers para testes com banco real"
  depends_on: ["database-setup"]

  files:
    - path: "apps/api/vitest.config.ts"
      responsibility: "Config Vitest para backend"
    - path: "apps/api/test/setup.ts"
      responsibility: "Setup global de testes (Testcontainers PostgreSQL)"
    - path: "apps/api/test/helpers/test-db.ts"
      responsibility: "Helper para criar/limpar banco de teste"
    - path: "apps/web/vitest.config.ts"
      responsibility: "Config Vitest para frontend"

  tests:
    unit:
      - "Vitest deve rodar testes de exemplo"
    integration:
      - "Testcontainers deve subir PostgreSQL e rodar migration"
    e2e: []

  acceptance_criteria:
    - "npm test roda testes de todos os workspaces"
    - "Testcontainers sobe PostgreSQL automaticamente"
    - "Migrations rodam no container de teste"
    - "Testes usam banco real, nao mocks"

  commit_message: "feat(test): Vitest + Testcontainers com PostgreSQL real"
```

---

---

## === FASE 1: MVP Core — Backend ===

---

### Spec 11: core-entities

```yaml
module:
  name: "core-entities"
  description: "Todas as entidades de dominio da Fase 1 com MikroORM decorators"
  depends_on: ["database-setup"]

  files:
    - path: "apps/api/src/@core/entities/note.entity.ts"
      responsibility: "Entidade Note (PARA, hierarquia, tags, embedding)"
    - path: "apps/api/src/@core/entities/note-link.entity.ts"
      responsibility: "Links entre notas (Zettelkasten)"
    - path: "apps/api/src/@core/entities/note-version.entity.ts"
      responsibility: "Historico de versoes de notas"
    - path: "apps/api/src/@core/entities/task.entity.ts"
      responsibility: "Entidade Task (Eisenhower, status, migracao, domain events)"
    - path: "apps/api/src/@core/entities/daily-log.entity.ts"
      responsibility: "Daily log (missao, humor, sono, habitos, retrospectiva)"
    - path: "apps/api/src/@core/entities/event.entity.ts"
      responsibility: "Eventos do calendario"
    - path: "apps/api/src/@core/entities/goal.entity.ts"
      responsibility: "Metas SMART (tipo, semestre, quarter, progresso)"
    - path: "apps/api/src/@core/entities/idea.entity.ts"
      responsibility: "Ideias (actionable, converter para tarefa)"
    - path: "apps/api/src/@core/entities/attachment.entity.ts"
      responsibility: "Attachments (BYTEA, polimorficos)"
    - path: "apps/api/src/@core/entities/activity-log.entity.ts"
      responsibility: "Log de atividades"
    - path: "apps/api/src/@core/entities/notification.entity.ts"
      responsibility: "Notificacoes (tipo, canal, lida)"
    - path: "apps/api/src/@core/entities/workspace-member.entity.ts"
      responsibility: "Membros do workspace (role, permissoes)"
    - path: "apps/api/src/@core/events/task/task-created.event.ts"
      responsibility: "Evento TaskCreated"
    - path: "apps/api/src/@core/events/task/task-completed.event.ts"
      responsibility: "Evento TaskCompleted"
    - path: "apps/api/src/@core/events/task/task-migrated.event.ts"
      responsibility: "Evento TaskMigrated"
    - path: "apps/api/src/@core/events/task/task-stagnant.event.ts"
      responsibility: "Evento TaskStagnant (migration >= 3)"
    - path: "apps/api/src/@core/events/note/note-created.event.ts"
      responsibility: "Evento NoteCreated"
    - path: "apps/api/src/@core/events/note/note-updated.event.ts"
      responsibility: "Evento NoteUpdated"
    - path: "apps/api/src/@core/events/daily-log/daily-log-created.event.ts"
      responsibility: "Evento DailyLogCreated"
    - path: "apps/api/src/@core/events/daily-log/habit-completed.event.ts"
      responsibility: "Evento HabitCompleted"
    - path: "apps/api/src/@core/events/idea/idea-converted.event.ts"
      responsibility: "Evento IdeaConvertedToTask"

  tests:
    unit:
      - "Task.migrate() deve incrementar migrationCount e disparar evento"
      - "Task.isStagnant() deve retornar true quando migrationCount >= 3"
      - "Task.complete() deve setar status e completedAt"
    integration:
      - "Todas as entidades devem gerar migrations validas"
      - "Soft delete deve funcionar em todas as entidades com deleted_at"
    e2e: []

  acceptance_criteria:
    - "Migration gera todas as tabelas no PostgreSQL"
    - "Entidades com logica de dominio (Task.migrate, Task.complete)"
    - "Domain events definidos como classes imutaveis"
    - "Soft delete subscriber funciona em todas as entidades"

  commit_message: "feat(entities): criar entidades de dominio e domain events da Fase 1"
```

---

### Spec 12: workspaces-module

```yaml
module:
  name: "workspaces-module"
  description: "CRUD de workspaces + convite de membros"
  depends_on: ["core-entities", "auth-module"]

  interfaces:
    - name: "WorkspacesController"
      methods:
        - signature: "create(dto: CreateWorkspaceDto): Promise<Workspace>"
        - signature: "findAll(): Promise<Workspace[]>"
        - signature: "addMember(id, dto: AddMemberDto): Promise<WorkspaceMember>"

  files:
    - path: "apps/api/src/@api/workspaces/workspaces.controller.ts"
    - path: "apps/api/src/@application/workspaces/commands/create-workspace.handler.ts"
    - path: "apps/api/src/@application/workspaces/queries/get-workspaces.handler.ts"

  tests:
    unit:
      - "deve criar workspace vinculado ao usuario logado"
    integration:
      - "deve persistir workspace no banco"
    e2e:
      - "POST /api/workspaces deve retornar 201"
      - "GET /api/workspaces deve retornar workspaces do usuario"

  acceptance_criteria:
    - "CRUD funcional via CQRS"
    - "Workspace criado com owner = usuario logado"

  commit_message: "feat(workspaces): CRUD workspaces via CQRS"
```

---

### Spec 13: notes-module

```yaml
module:
  name: "notes-module"
  description: "CRUD notas PARA com categorias, tags, hierarquia e domain events"
  depends_on: ["core-entities", "workspaces-module", "cqrs-setup"]

  interfaces:
    - name: "NotesController"
      methods:
        - signature: "create(dto: CreateNoteDto): Promise<Note>"
        - signature: "findAll(query: NotesFilterDto): Promise<Note[]>"
        - signature: "findOne(id: string): Promise<Note>"
        - signature: "update(id, dto: UpdateNoteDto): Promise<Note>"
        - signature: "delete(id: string): Promise<void>"
        - signature: "move(id, dto: MoveNoteDto): Promise<Note>"
        - signature: "getVersions(id: string): Promise<NoteVersion[]>"

  files:
    - path: "apps/api/src/@api/notes/notes.controller.ts"
    - path: "apps/api/src/@application/notes/commands/create-note.handler.ts"
    - path: "apps/api/src/@application/notes/commands/update-note.handler.ts"
    - path: "apps/api/src/@application/notes/commands/move-note.handler.ts"
    - path: "apps/api/src/@application/notes/queries/get-notes-by-category.handler.ts"
    - path: "apps/api/src/@application/notes/queries/get-note-detail.handler.ts"

  tests:
    unit:
      - "deve criar nota com categoria inbox por default"
      - "deve mover nota entre categorias PARA"
      - "deve criar versao ao atualizar"
    integration:
      - "deve persistir nota e tags no banco"
      - "NoteCreated event deve ser disparado"
    e2e:
      - "POST /api/notes deve retornar 201"
      - "GET /api/notes?category=inbox deve filtrar"
      - "POST /api/notes/:id/move deve mudar categoria"

  acceptance_criteria:
    - "CRUD completo com filtros por category, tags, search"
    - "Versionamento automatico ao atualizar"
    - "Domain events disparados (NoteCreated, NoteUpdated, NoteMoved)"

  commit_message: "feat(notes): CRUD notas PARA com versionamento e domain events"
```

---

### Spec 14: tasks-module

```yaml
module:
  name: "tasks-module"
  description: "CRUD tarefas com Eisenhower, migracao, domain events"
  depends_on: ["core-entities", "workspaces-module", "cqrs-setup"]

  interfaces:
    - name: "TasksController"
      methods:
        - signature: "create(dto: CreateTaskDto): Promise<Task>"
        - signature: "findAll(query: TasksFilterDto): Promise<Task[]>"
        - signature: "findOne(id: string): Promise<Task>"
        - signature: "update(id, dto: UpdateTaskDto): Promise<Task>"
        - signature: "delete(id: string): Promise<void>"
        - signature: "complete(id: string): Promise<Task>"
        - signature: "migrate(id, dto: MigrateTaskDto): Promise<Task>"
        - signature: "bulkMigrate(dto: BulkMigrateDto): Promise<Task[]>"

  files:
    - path: "apps/api/src/@api/tasks/tasks.controller.ts"
    - path: "apps/api/src/@application/tasks/commands/create-task.handler.ts"
    - path: "apps/api/src/@application/tasks/commands/complete-task.handler.ts"
    - path: "apps/api/src/@application/tasks/commands/migrate-task.handler.ts"
    - path: "apps/api/src/@application/tasks/queries/get-tasks-by-quadrant.handler.ts"
    - path: "apps/api/src/@application/tasks/queries/get-task-detail.handler.ts"

  tests:
    unit:
      - "deve criar tarefa com quadrante especificado"
      - "migrate() deve incrementar migrationCount"
      - "isStagnant() deve retornar true apos 3 migracoes"
      - "complete() deve setar completedAt"
    integration:
      - "TaskCreated, TaskCompleted, TaskMigrated events disparados"
      - "TaskStagnant disparado quando migrationCount >= 3"
    e2e:
      - "POST /api/tasks deve retornar 201"
      - "GET /api/tasks?quadrant=q1 deve filtrar"
      - "POST /api/tasks/:id/complete deve setar status done"
      - "POST /api/tasks/:id/migrate deve mover para outro dia"

  acceptance_criteria:
    - "CRUD completo com filtros (status, quadrant, date, tags)"
    - "Migracao com tracking de count"
    - "Todos os domain events disparados corretamente"
    - "Bulk migrate funcional"

  commit_message: "feat(tasks): CRUD tarefas Eisenhower com migracao e domain events"
```

---

### Spec 15: daily-logs-module

```yaml
module:
  name: "daily-logs-module"
  description: "CRUD daily logs com habitos, humor, sono, retrospectiva"
  depends_on: ["core-entities", "workspaces-module"]

  files:
    - path: "apps/api/src/@api/daily-logs/daily-logs.controller.ts"
    - path: "apps/api/src/@application/daily-logs/commands/create-daily-log.handler.ts"
    - path: "apps/api/src/@application/daily-logs/commands/toggle-habit.handler.ts"
    - path: "apps/api/src/@application/daily-logs/queries/get-today-log.handler.ts"
    - path: "apps/api/src/@application/daily-logs/queries/get-week-logs.handler.ts"

  tests:
    unit:
      - "deve criar daily log com data de hoje"
      - "toggle-habit deve alternar valor no JSONB"
    integration:
      - "DailyLogCreated event disparado"
      - "HabitCompleted event disparado ao toggle true"
    e2e:
      - "POST /api/daily-logs deve retornar 201"
      - "GET /api/daily-logs/:date deve retornar log do dia"

  acceptance_criteria:
    - "CRUD com unique constraint (workspace + user + date)"
    - "Habitos como JSONB toggleable"
    - "Domain events disparados"

  commit_message: "feat(daily-logs): CRUD daily logs com habitos e domain events"
```

---

### Spec 16: events-module

```yaml
module:
  name: "events-module"
  description: "CRUD eventos do calendario"
  depends_on: ["core-entities", "workspaces-module"]

  files:
    - path: "apps/api/src/@api/events/events.controller.ts"
    - path: "apps/api/src/@application/events/commands/create-event.handler.ts"
    - path: "apps/api/src/@application/events/queries/get-events.handler.ts"
    - path: "apps/api/src/@application/events/queries/get-future-log.handler.ts"

  tests:
    e2e:
      - "POST /api/events deve retornar 201"
      - "GET /api/events?from=X&to=Y deve filtrar por range"
      - "GET /api/events/future-log deve agrupar por mes"

  acceptance_criteria:
    - "CRUD com filtro por date range"
    - "Future log agrupado por mes"

  commit_message: "feat(events): CRUD eventos com future log"
```

---

### Spec 17: ideas-module

```yaml
module:
  name: "ideas-module"
  description: "CRUD ideias com flag actionable e conversao para tarefa"
  depends_on: ["core-entities", "tasks-module"]

  files:
    - path: "apps/api/src/@api/ideas/ideas.controller.ts"
    - path: "apps/api/src/@application/ideas/commands/create-idea.handler.ts"
    - path: "apps/api/src/@application/ideas/commands/convert-to-task.handler.ts"

  tests:
    e2e:
      - "POST /api/ideas deve retornar 201"
      - "POST /api/ideas/:id/convert-to-task deve criar tarefa e vincular"

  acceptance_criteria:
    - "Conversao cria tarefa e atualiza converted_to_task_id"
    - "IdeaConvertedToTask event disparado"

  commit_message: "feat(ideas): CRUD ideias com conversao para tarefa"
```

---

### Spec 18: goals-module

```yaml
module:
  name: "goals-module"
  description: "CRUD metas SMART com progresso automatico"
  depends_on: ["core-entities", "tasks-module"]

  files:
    - path: "apps/api/src/@api/goals/goals.controller.ts"
    - path: "apps/api/src/@application/goals/commands/create-goal.handler.ts"
    - path: "apps/api/src/@application/goals/commands/update-goal-progress.handler.ts"
    - path: "apps/api/src/@application/goals/queries/get-goals-by-quarter.handler.ts"

  tests:
    e2e:
      - "POST /api/goals deve retornar 201"
      - "GET /api/goals?quarter=q2 deve filtrar"
      - "GET /api/goals/:id/tasks deve retornar tarefas vinculadas"

  acceptance_criteria:
    - "Progresso calculado baseado em tarefas vinculadas"
    - "Filtro por quarter e semester"

  commit_message: "feat(goals): CRUD metas SMART com progresso"
```

---

### Spec 19: search-module

```yaml
module:
  name: "search-module"
  description: "Busca full-text via PostgreSQL tsvector"
  depends_on: ["notes-module", "tasks-module"]

  files:
    - path: "apps/api/src/@api/search/search.controller.ts"
    - path: "apps/api/src/@application/search/queries/full-text-search.handler.ts"

  tests:
    integration:
      - "deve encontrar nota por termo parcial"
      - "deve encontrar tarefa por titulo"
    e2e:
      - "GET /api/search?q=termo deve retornar resultados"

  acceptance_criteria:
    - "Busca em notas, tarefas, ideias"
    - "Ranking por relevancia (tsvector)"

  commit_message: "feat(search): busca full-text com PostgreSQL tsvector"
```

---

### Spec 20: attachments-module

```yaml
module:
  name: "attachments-module"
  description: "Upload de arquivos armazenados em BYTEA"
  depends_on: ["core-entities"]

  files:
    - path: "apps/api/src/@api/attachments/attachments.controller.ts"
    - path: "apps/api/src/@application/attachments/commands/upload-attachment.handler.ts"

  tests:
    e2e:
      - "POST /api/attachments deve aceitar arquivo e retornar 201"
      - "GET /api/attachments/:id deve retornar arquivo"

  acceptance_criteria:
    - "Upload polimorfico (note, task, event, goal, daily_log)"
    - "Checksum SHA-256 verificado"

  commit_message: "feat(attachments): upload de arquivos com BYTEA e checksum"
```

---

### Spec 21: trash-module

```yaml
module:
  name: "trash-module"
  description: "Listagem de itens deletados, restore e exclusao definitiva"
  depends_on: ["core-entities"]

  files:
    - path: "apps/api/src/@api/trash/trash.controller.ts"
    - path: "apps/api/src/@application/trash/queries/get-trash.handler.ts"
    - path: "apps/api/src/@application/trash/commands/restore-item.handler.ts"
    - path: "apps/api/src/@application/trash/commands/hard-delete-item.handler.ts"

  tests:
    e2e:
      - "GET /api/trash deve listar itens com deleted_at != null"
      - "POST /api/trash/:type/:id/restore deve limpar deleted_at"
      - "DELETE /api/trash/:type/:id deve excluir definitivamente"

  acceptance_criteria:
    - "Lista todos os tipos de entidade com soft delete"
    - "Restore limpa deleted_at"
    - "Hard delete remove do banco"

  commit_message: "feat(trash): listagem, restore e exclusao definitiva de itens"
```

---

### Spec 22: activity-log-module

```yaml
module:
  name: "activity-log-module"
  description: "Event handlers que registram atividades automaticamente"
  depends_on: ["core-entities", "cqrs-setup"]

  files:
    - path: "apps/api/src/@event-handlers/activity/log-activity.handler.ts"
      responsibility: "Handler generico que registra qualquer domain event"
    - path: "apps/api/src/@api/activity/activity.controller.ts"
      responsibility: "GET /api/activity com filtros"

  tests:
    integration:
      - "TaskCreated deve gerar entrada no activity_log"
      - "NoteUpdated deve gerar entrada no activity_log"
    e2e:
      - "GET /api/activity deve retornar feed filtrado"

  acceptance_criteria:
    - "Registra action, entity_type, entity_id, changes, source"
    - "Feed filtrado por entity, user, date"

  commit_message: "feat(activity): event handlers para activity log automatico"
```

---

### Spec 23: websocket-module

```yaml
module:
  name: "websocket-module"
  description: "Gateway WebSocket com Socket.io para real-time"
  depends_on: ["backend-scaffold", "cqrs-setup"]

  files:
    - path: "apps/api/src/@infrastructure/websocket/events.gateway.ts"
      responsibility: "WebSocket gateway (autenticado via JWT)"
    - path: "apps/api/src/@infrastructure/websocket/rooms.service.ts"
      responsibility: "Gerencia rooms por workspace"
    - path: "apps/api/src/@event-handlers/realtime/broadcast-event.handler.ts"
      responsibility: "Propaga domain events via WebSocket"

  tests:
    integration:
      - "Cliente WebSocket deve conectar com JWT valido"
      - "Evento task:updated deve ser recebido pelo cliente"
    e2e: []

  acceptance_criteria:
    - "Conexao WebSocket autenticada via JWT"
    - "Rooms por workspace (isolamento)"
    - "Broadcast de: task:updated, task:created, notification:new, daily:updated"

  commit_message: "feat(websocket): gateway Socket.io com broadcast de domain events"
```

---

### Spec 24: notifications-module

```yaml
module:
  name: "notifications-module"
  description: "Sistema de notificacoes in-app"
  depends_on: ["core-entities", "websocket-module"]

  files:
    - path: "apps/api/src/@api/notifications/notifications.controller.ts"
    - path: "apps/api/src/@application/notifications/queries/get-notifications.handler.ts"
    - path: "apps/api/src/@application/notifications/commands/mark-as-read.handler.ts"
    - path: "apps/api/src/@infrastructure/notifications/notification.service.ts"
      responsibility: "Engine de notificacoes (cria + envia via canal)"
    - path: "apps/api/src/@infrastructure/notifications/channels/in-app.channel.ts"

  tests:
    e2e:
      - "GET /api/notifications deve listar notificacoes do usuario"
      - "PATCH /api/notifications/:id/read deve marcar como lida"
      - "POST /api/notifications/read-all deve marcar todas"

  acceptance_criteria:
    - "Notificacoes criadas automaticamente por event handlers"
    - "Canal in-app funcional (Fase 1 — outros canais depois)"
    - "Contagem de nao-lidas disponivel"

  commit_message: "feat(notifications): sistema de notificacoes in-app"
```

---

## === FASE 1: MVP Core — Frontend ===

---

### Spec 25: frontend-layout

```yaml
module:
  name: "frontend-layout"
  description: "Layout completo baseado no nowa-tailwind adaptado para THOTH"
  depends_on: ["frontend-scaffold"]

  files:
    - path: "apps/web/src/components/layout/AppLayout.vue"
      responsibility: "Layout wrapper (sidebar + header + content area)"
    - path: "apps/web/src/components/layout/AppSidebar.vue"
      responsibility: "Sidebar com menu THOTH (BuJo, Tarefas, Notas, Metas, etc.)"
    - path: "apps/web/src/components/layout/AppHeader.vue"
      responsibility: "Header com busca, notificacoes, user menu, theme toggle"
    - path: "apps/web/src/components/layout/UserMenu.vue"
      responsibility: "Dropdown do usuario (perfil, settings, logout)"

  acceptance_criteria:
    - "Sidebar colapsavel com icones Lucide"
    - "Menu items: Dashboard, BuJo, Tarefas, Notas, Metas, Ideias, Eventos, Busca, Settings"
    - "Dark mode toggle funcional"
    - "Responsivo (mobile: sidebar como drawer)"

  commit_message: "feat(web): layout completo com sidebar THOTH e header"
```

---

### Spec 26: frontend-auth

```yaml
module:
  name: "frontend-auth"
  description: "Paginas de auth conectadas ao backend"
  depends_on: ["frontend-layout", "auth-module"]

  files:
    - path: "apps/web/src/views/auth/Login.vue"
    - path: "apps/web/src/views/auth/Register.vue"
    - path: "apps/web/src/views/auth/ForgotPassword.vue"
    - path: "apps/web/src/composables/useAuth.ts"
    - path: "apps/web/src/stores/auth.ts"
    - path: "apps/web/src/router/guards/auth.guard.ts"

  acceptance_criteria:
    - "Login e registro funcionais com o backend"
    - "Token armazenado e renovado automaticamente"
    - "Route guard redireciona para login se nao autenticado"
    - "Logout limpa tokens e redireciona"

  commit_message: "feat(web): paginas de auth com login, registro e route guards"
```

---

### Spec 27: frontend-dashboard

```yaml
module:
  name: "frontend-dashboard"
  description: "Dashboard customizavel com grid de widgets"
  depends_on: ["frontend-layout"]

  files:
    - path: "apps/web/src/views/dashboard/Dashboard.vue"
    - path: "apps/web/src/components/dashboard/WidgetGrid.vue"
    - path: "apps/web/src/components/dashboard/WidgetPicker.vue"
    - path: "apps/web/src/components/dashboard/widgets/TasksTodayWidget.vue"
    - path: "apps/web/src/components/dashboard/widgets/EventsWidget.vue"
    - path: "apps/web/src/components/dashboard/widgets/GoalsProgressWidget.vue"
    - path: "apps/web/src/components/dashboard/widgets/InboxCounterWidget.vue"

  acceptance_criteria:
    - "Grid de widgets draggable"
    - "Widget picker para adicionar/remover"
    - "Widgets base: tarefas hoje, eventos, metas, inbox"

  commit_message: "feat(web): dashboard customizavel com widgets draggable"
```

---

### Spec 28: frontend-bujo

```yaml
module:
  name: "frontend-bujo"
  description: "BuJo Today — daily log completo"
  depends_on: ["frontend-layout", "daily-logs-module"]

  files:
    - path: "apps/web/src/views/bujo/Today.vue"
    - path: "apps/web/src/components/bujo/DailyLog.vue"
    - path: "apps/web/src/components/bujo/TaskItem.vue"
    - path: "apps/web/src/components/bujo/HabitTracker.vue"
    - path: "apps/web/src/components/bujo/MoodSlider.vue"
    - path: "apps/web/src/components/bujo/Retrospective.vue"
    - path: "apps/web/src/composables/useDailyLog.ts"

  acceptance_criteria:
    - "Daily log de hoje com missao, humor, sono"
    - "Habitos toggleable com visual claro"
    - "Tarefas do dia com status e quadrante"
    - "Retrospectiva editavel"

  commit_message: "feat(web): BuJo Today com daily log, habitos e retrospectiva"
```

---

### Spec 29: frontend-eisenhower

```yaml
module:
  name: "frontend-eisenhower"
  description: "Board Eisenhower com 4 colunas e drag and drop"
  depends_on: ["frontend-layout", "tasks-module"]

  files:
    - path: "apps/web/src/views/tasks/Eisenhower.vue"
    - path: "apps/web/src/components/eisenhower/EisenhowerBoard.vue"
    - path: "apps/web/src/components/eisenhower/QuadrantColumn.vue"
    - path: "apps/web/src/components/shared/QuadrantBadge.vue"
    - path: "apps/web/src/composables/useTasks.ts"

  acceptance_criteria:
    - "4 colunas (Q1-Q4) com drag and drop entre colunas"
    - "Criar tarefa inline"
    - "Badge colorido por quadrante"
    - "Mover tarefa muda quadrante via API"

  commit_message: "feat(web): board Eisenhower com drag and drop"
```

---

### Spec 30: frontend-notes

```yaml
module:
  name: "frontend-notes"
  description: "Notas PARA com tabs, listagem e editor markdown"
  depends_on: ["frontend-layout", "notes-module"]

  files:
    - path: "apps/web/src/views/notes/Notes.vue"
    - path: "apps/web/src/views/notes/NoteDetail.vue"
    - path: "apps/web/src/components/para/NoteEditor.vue"
    - path: "apps/web/src/components/para/NoteCard.vue"
    - path: "apps/web/src/components/para/CategoryTabs.vue"
    - path: "apps/web/src/composables/useNotes.ts"

  acceptance_criteria:
    - "Tabs: Inbox, Projects, Areas, Resources, Archive"
    - "Editor markdown funcional (TipTap ou Milkdown)"
    - "Mover nota entre categorias"
    - "Tags editaveis"

  commit_message: "feat(web): notas PARA com editor markdown e categorias"
```

---

### Spec 31: frontend-events

```yaml
module:
  name: "frontend-events"
  description: "Eventos com listagem e calendario FullCalendar"
  depends_on: ["frontend-layout", "events-module"]

  files:
    - path: "apps/web/src/views/bujo/Calendar.vue"
    - path: "apps/web/src/views/bujo/FutureLog.vue"

  acceptance_criteria:
    - "Calendario mensal com FullCalendar"
    - "Criar evento ao clicar no dia"
    - "Future log agrupado por mes"

  commit_message: "feat(web): calendario com FullCalendar e future log"
```

---

### Spec 32: frontend-ideas

```yaml
module:
  name: "frontend-ideas"
  description: "Listagem de ideias com conversao para tarefa"
  depends_on: ["frontend-layout", "ideas-module"]

  files:
    - path: "apps/web/src/views/ideas/Ideas.vue"

  acceptance_criteria:
    - "Listagem de ideias com tags"
    - "Botao converter para tarefa"
    - "Flag actionable visivel"

  commit_message: "feat(web): listagem de ideias com conversao para tarefa"
```

---

### Spec 33: frontend-search

```yaml
module:
  name: "frontend-search"
  description: "Busca global com Cmd+K"
  depends_on: ["frontend-layout", "search-module"]

  files:
    - path: "apps/web/src/components/search/GlobalSearch.vue"
    - path: "apps/web/src/components/search/SearchResults.vue"
    - path: "apps/web/src/composables/useSearch.ts"

  acceptance_criteria:
    - "Cmd+K abre modal de busca"
    - "Busca em notas, tarefas, ideias, eventos"
    - "Resultados com highlight e tipo"
    - "Navegacao por teclado"

  commit_message: "feat(web): busca global Cmd+K com full-text"
```

---

### Spec 34: frontend-notifications

```yaml
module:
  name: "frontend-notifications"
  description: "Bell no header + painel dropdown de notificacoes"
  depends_on: ["frontend-layout", "notifications-module"]

  files:
    - path: "apps/web/src/components/notifications/NotificationBell.vue"
    - path: "apps/web/src/components/notifications/NotificationPanel.vue"
    - path: "apps/web/src/components/notifications/NotificationItem.vue"

  acceptance_criteria:
    - "Badge com contagem de nao-lidas"
    - "Dropdown com listagem"
    - "Marcar como lida ao clicar"
    - "Marcar todas como lidas"

  commit_message: "feat(web): notificacoes com bell, painel e mark-as-read"
```

---

### Spec 35: frontend-trash

```yaml
module:
  name: "frontend-trash"
  description: "Trash view com itens deletados e restore"
  depends_on: ["frontend-layout", "trash-module"]

  files:
    - path: "apps/web/src/views/settings/Trash.vue"

  acceptance_criteria:
    - "Lista todos os itens com deleted_at"
    - "Botao restaurar por item"
    - "Tipo de entidade visivel (nota, tarefa, etc.)"

  commit_message: "feat(web): trash view com listagem e restore"
```

---

### Spec 36: frontend-realtime

```yaml
module:
  name: "frontend-realtime"
  description: "WebSocket client para updates em tempo real"
  depends_on: ["frontend-layout", "websocket-module"]

  files:
    - path: "apps/web/src/lib/websocket.ts"
      responsibility: "Socket.io client com reconexao e auth"
    - path: "apps/web/src/composables/useRealtime.ts"
      responsibility: "Composable para ouvir eventos WebSocket"

  acceptance_criteria:
    - "Conecta automaticamente ao logar"
    - "Reconecta ao perder conexao"
    - "task:updated atualiza board Eisenhower em tempo real"
    - "notification:new incrementa badge"

  commit_message: "feat(web): WebSocket client com reconexao e real-time updates"
```

---

## Estrategia de Testes

| Tipo | Framework | Escopo | Cobertura |
|------|-----------|--------|-----------|
| Unit | Vitest | Use cases, domain logic | 80%+ |
| Integration | Vitest + Testcontainers | Database, repositories | Fluxos criticos |
| E2E | Playwright | Auth, CRUD principal | Golden path |

- Backend: Vitest + Testcontainers (PostgreSQL real)
- Frontend: Vitest + Vue Test Utils (unit) + Playwright (e2e)
- CI roda todos os testes em cada PR

---

## Pipeline de Deploy

```
Push para main
    ↓
GitHub Actions
    ↓
Lint (ESLint) → Type Check (tsc) → Test (Vitest) → Build (Docker)
    ↓
Push imagens para GHCR (ghcr.io/leozague/thoth-app-api, thoth-app-web)
    ↓
Webhook para Easypanel (vps4 — http://217.77.7.199:3000)
    ↓
Easypanel puxa imagem e faz deploy
```

### Secrets necessarios no GitHub

| Secret | Descricao |
|--------|-----------|
| GHCR_TOKEN | Token para push de imagens |
| EASYPANEL_WEBHOOK_API_PROD | Webhook do servico API |
| EASYPANEL_WEBHOOK_WEB_PROD | Webhook do servico Web |

---

## Checklist de Entrega (Fase 0 + Fase 1)

### Fase 0 — Setup
- [ ] Monorepo funcional com npm workspaces
- [ ] Backend NestJS 11 rodando com SWC na porta 3010
- [ ] MikroORM + PostgreSQL 16 com migrations
- [ ] CQRS configurado (@nestjs/cqrs)
- [ ] Auth JWT RS256 com refresh token rotation
- [ ] Frontend Vue 3.5 + Tailwind 4 rodando na porta 5183
- [ ] Docker Compose com PostgreSQL + Redis + PgBouncer
- [ ] GitHub Actions CI/CD configurado
- [ ] OpenTelemetry + Grafana stack
- [ ] Vitest + Testcontainers configurados
- [ ] README.md com instrucoes de setup
- [ ] .env.example completo
- [ ] Projeto registrado no port registry

### Fase 1 — MVP Core Backend
- [ ] Todas as entidades de dominio com migrations
- [ ] CRUD workspaces + notas + tarefas + daily logs + eventos + ideias + metas
- [ ] Domain events funcionais (CQRS)
- [ ] Busca full-text (tsvector)
- [ ] Upload de attachments
- [ ] Trash (soft delete + restore + hard delete)
- [ ] Activity log automatico
- [ ] WebSocket gateway com broadcast
- [ ] Notificacoes in-app

### Fase 1 — MVP Core Frontend
- [ ] Layout completo com sidebar THOTH
- [ ] Auth (login, registro, route guards)
- [ ] Dashboard customizavel com widgets
- [ ] BuJo Today (daily log completo)
- [ ] Board Eisenhower com drag and drop
- [ ] Notas PARA com editor markdown
- [ ] Calendario com FullCalendar
- [ ] Ideias com conversao
- [ ] Busca global Cmd+K
- [ ] Notificacoes (bell + painel)
- [ ] Trash view
- [ ] Real-time via WebSocket

---

## Decisoes Arquiteturais

1. **npm workspaces (nao Turborepo/Nx):** Projeto pessoal, complexidade de Turbo/Nx nao justificada. npm workspaces nativo resolve.
2. **MikroORM com decorators (nao defineEntity):** O planejamento ja define entidades com decorators. defineEntity e novo e ainda nao e padrao na comunidade NestJS.
3. **Zod (nao class-validator):** O planejamento especifica Zod. ZodValidationPipe customizado no NestJS.
4. **Tailwind v4 CSS-first:** Sem tailwind.config.js. Configuracao via @theme no CSS.
5. **Docker apenas para infra (dev local):** Bancos e servicos em Docker. NestJS e Vue rodam direto na maquina (npm run dev).
6. **PgBouncer em transaction mode:** Essencial com WebSocket + BullMQ para nao esgotar conexoes.
