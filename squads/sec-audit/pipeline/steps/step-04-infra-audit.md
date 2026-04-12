# Step 4 — Infra e Configuracao Audit

**Agente:** Infra Auditor (subagent)

## Objetivo

Auditar configuracao de infraestrutura, variaveis de ambiente, headers HTTP e exposicao de servicos.

## Verificacoes

### Variaveis de Ambiente
```bash
cat {project_root}/.env.example
# Verificar se todos os segredos sao variaveis — nunca hardcoded
grep -rn "password\|secret\|key\|token" {project_root}/apps/api/src/ --include="*.ts" | grep -v "env\|process\|config\|dto\|entity\|type"
```

- [ ] `.env` esta no `.gitignore`?
- [ ] `.env.example` existe e documenta todas as variaveis necessarias (sem valores reais)?
- [ ] Nenhuma credencial hardcoded no codigo?
- [ ] JWT_SECRET nao e string padrao (ex: "secret", "changeme", vazio)?

### CORS
```bash
grep -rn "enableCors\|CorsOptions\|origin" {project_root}/apps/api/src/ --include="*.ts"
```
- [ ] Origens permitidas sao explicitas (nao `*`)?
- [ ] Metodos HTTP permitidos sao apenas os necessarios?
- [ ] Credentials sao tratadas corretamente (`allowedHeaders`)?

### Security Headers (Helmet)
```bash
grep -rn "helmet\|Helmet" {project_root}/apps/api/src/ --include="*.ts"
```
- [ ] Helmet esta instalado e configurado?
- [ ] Headers minimos presentes: `X-Content-Type-Options`, `X-Frame-Options`, `Strict-Transport-Security`?

### Swagger em Producao
```bash
grep -rn "SwaggerModule\|DocumentBuilder\|NODE_ENV" {project_root}/apps/api/src/main.ts
```
- [ ] Swagger desabilitado em producao (verificar condicional `NODE_ENV`)?

### Docker e Rede
```bash
cat {project_root}/docker-compose.yml
```
- [ ] Banco de dados nao esta com porta exposta para a internet (apenas rede interna Docker)?
- [ ] Servicos internos nao tem portas mapeadas para `0.0.0.0` desnecessariamente?
- [ ] Imagens Docker tem versoes fixadas (nao `:latest`)?

### Rate Limiting
```bash
grep -rn "ThrottlerModule\|RateLimit\|throttle" {project_root}/apps/api/src/ --include="*.ts"
```
- [ ] Rate limiting configurado no modulo de autenticacao?
- [ ] Endpoints publicos tem protecao contra abuso?

## Output

Relatorio de configuracao com achados e recomendacoes
