---
task: "Setup Deploy"
order: 3
input: |
  - sdd_plan: Configuracao de deploy (Docker, CI/CD, Easypanel)
  - project_dir: Projeto implementado
output: |
  - dockerfile: Dockerfile otimizado (multi-stage)
  - docker_compose: docker-compose.yml para Easypanel
  - ci_cd: GitHub Actions workflow
  - env_configs: Arquivos de ambiente para producao
---

# Setup Deploy

Gerar Docker stack completo para deploy no Easypanel e configurar CI/CD via GitHub Actions.

## Process

1. Ler `sdd-plan.md` secao de deploy: servidor alvo, servicos, portas
2. Criar Dockerfile multi-stage para cada servico:
   a. Stage 1 (build): instalar deps, compilar, rodar testes
   b. Stage 2 (runtime): copiar apenas artefatos necessarios, imagem minima
3. Criar `.dockerignore` para excluir node_modules, .git, .env, etc.
4. Criar `docker-compose.yml` para Easypanel com todos os servicos:
   - Servicos de aplicacao (api, web)
   - Banco de dados (se necessario em producao)
   - Variaveis de ambiente via env_file
   - Healthcheck configurado
   - Restart policy: unless-stopped
5. Criar `.github/workflows/ci-cd.yml`:
   - Trigger: push to main
   - Jobs: lint → test → build → push GHCR → webhook Easypanel
   - Secrets: GHCR_TOKEN, EASYPANEL_WEBHOOK_*
6. Criar `.env.production.example` com variaveis de producao (sem valores)
7. Verificar que o Docker build roda sem erros localmente
8. Commit: "feat(deploy): configurar Docker stack e CI/CD para Easypanel"

## Output Format

```markdown
## Deploy Setup Report

### Docker
- Dockerfile: {path} ({N} stages, imagem base: {base})
- docker-compose.yml: {path} ({N} servicos)
- .dockerignore: {path}

### CI/CD
- Workflow: .github/workflows/ci-cd.yml
- Trigger: push to main
- Jobs: lint → test → build → deploy
- Secrets necessarios:
  - GHCR_TOKEN
  - EASYPANEL_WEBHOOK_{SERVICE}_{STAGE}

### Verificacao
- Docker build: PASS / FAIL
- Docker compose config: PASS / FAIL
```

## Output Example

> Use como referencia de qualidade.

```markdown
## Deploy Setup Report

### Docker
- Dockerfile API: apps/api/Dockerfile (2 stages, node:20-alpine)
- Dockerfile Web: apps/web/Dockerfile (2 stages, nginx:alpine)
- docker-compose.yml: ./docker-compose.yml (3 servicos: api, web, db)
- .dockerignore: ./.dockerignore

### CI/CD
- Workflow: .github/workflows/ci-cd.yml
- Trigger: push to main
- Jobs: lint → test → build-api → build-web → deploy
- Secrets necessarios:
  - GHCR_TOKEN
  - EASYPANEL_WEBHOOK_API_PROD
  - EASYPANEL_WEBHOOK_WEB_PROD

### Verificacao
- Docker build API: PASS (imagem: 187MB)
- Docker build Web: PASS (imagem: 23MB)
- Docker compose config: PASS
```

## Quality Criteria

- [ ] Dockerfile multi-stage (build + runtime)
- [ ] .dockerignore presente e completo
- [ ] docker-compose.yml funcional com healthcheck
- [ ] GitHub Actions workflow com lint, test, build, deploy
- [ ] Secrets documentados (nunca hardcoded)
- [ ] Docker build roda sem erros
- [ ] .env.production.example gerado

## Veto Conditions

Rejeitar e refazer se:
1. Credenciais hardcoded no Dockerfile ou docker-compose
2. Docker build falha
