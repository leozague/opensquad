# Delivery Summary: THOTH App

> Entregue em: 2026-04-13
> Projeto: /Users/macbookpro/Documents/FONTES/thoth-app

---

## URLs de Acesso (localhost)

| Servico | URL |
|---------|-----|
| API (NestJS) | http://localhost:3010 |
| Swagger Docs | http://localhost:3010/api/docs |
| Health Check | http://localhost:3010/api/health |
| Frontend (Vue) | http://localhost:5183 |
| Grafana | http://localhost:3011 |

## Credenciais

### Banco de Dados
- **Engine:** PostgreSQL 16
- **Host:** localhost
- **Porta:** 5442
- **Database:** thoth_dev
- **Usuario:** thoth
- **Senha:** thoth
- **Connection string:** `postgresql://thoth:thoth@localhost:5442/thoth_dev`

### Redis
- **Host:** localhost
- **Porta:** 6389

### JWT
- **Secret:** thoth-dev-secret-change-in-prod (definido no .env)
- **Access token TTL:** 900s (15 min)
- **Refresh token TTL:** 604800s (7 dias)

## Portas Registradas

| Servico | Porta | Status |
|---------|-------|--------|
| API | 3010 | Registrado (index 1) |
| Web | 5183 | Registrado (index 1) |
| PostgreSQL | 5442 | Docker |
| Redis | 6389 | Docker |
| PgBouncer | 6442 | Docker |
| Grafana | 3011 | Docker |
| GlitchTip | 3012 | Docker |

## Deploy

- **Servidor:** vps4 (http://217.77.7.199:3000 — Easypanel)
- **Registry:** ghcr.io
- **CI/CD:** GitHub Actions (.github/workflows/ci-cd.yml)

### Secrets para configurar no GitHub

| Secret | Descricao |
|--------|-----------|
| GHCR_TOKEN | Token para push de imagens Docker |
| EASYPANEL_WEBHOOK_API_PROD | Webhook do servico API no Easypanel |
| EASYPANEL_WEBHOOK_WEB_PROD | Webhook do servico Web no Easypanel |

## Comandos Rapidos

| Comando | O que faz |
|---------|-----------|
| `cd infra && docker compose up -d` | Sobe PostgreSQL + Redis + PgBouncer |
| `npm run dev:api` | Inicia backend (porta 3010) |
| `npm run dev:web` | Inicia frontend (porta 5183) |
| `npm run test:api` | Roda testes do backend |
| `npm run test:web` | Roda testes do frontend |
| `npm run build` | Build de todos os workspaces |
| `npm run lint` | Lint de todos os workspaces |

## Setup Inicial

```bash
cd /Users/macbookpro/Documents/FONTES/thoth-app
cp .env.example .env
cd infra && docker compose up -d && cd ..
npm install
npm run dev:api   # Terminal 1
npm run dev:web   # Terminal 2
```

Depois: rodar migrations com `npm run migration:up -w apps/api`

## Estrutura Final

```
thoth-app/                        ~6.700 linhas de codigo
├── apps/
│   ├── api/                      170 arquivos TypeScript
│   │   ├── src/@core/            Entidades + Domain Events
│   │   ├── src/@application/     Use Cases (CQRS)
│   │   ├── src/@infrastructure/  DB, WebSocket, Telemetry
│   │   ├── src/@event-handlers/  Activity log handler
│   │   ├── src/@api/             Controllers
│   │   └── src/common/           Guards, Pipes, Decorators
│   └── web/                      33 arquivos Vue/TS
│       ├── src/components/       Layout, Search, Notifications
│       ├── src/views/            10+ pages
│       ├── src/composables/      TanStack Query hooks
│       └── src/stores/           Pinia stores
├── packages/shared/              Enums compartilhados
├── infra/                        Docker + Observability
└── .github/workflows/            CI/CD
```

## Proximos Passos

1. Subir banco e testar fluxos manualmente (registro, login, criar tarefa)
2. Gerar primeira migration (`npm run migration:create -w apps/api`)
3. Escrever testes unitarios para domain logic (Task.migrate, etc.)
4. Configurar secrets no GitHub para deploy automatico
5. Integrar TipTap no editor de notas
6. Integrar FullCalendar no calendario
7. Configurar dominio e SSL no Easypanel
