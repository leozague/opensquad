# Step 2 — OWASP Top 10 Audit

**Agente:** OWASP Auditor (subagent)

## Objetivo

Varrer o codebase contra as 10 categorias de vulnerabilidade do OWASP Top 10 (2021).

## Categorias a Auditar

### A01 — Broken Access Control
- Listar todos os controllers e verificar se cada endpoint tem guard definido
- Verificar se endpoints de escrita (POST, PATCH, DELETE) exigem perfil adequado
- Checar se recursos de um usuario nao sao acessiveis por outro sem validacao

Comandos:
```bash
# Endpoints sem @UseGuards
grep -rn "@Get\|@Post\|@Patch\|@Delete\|@Put" {project_root}/apps/api/src/modules/ --include="*.ts" -l
# Verificar cada controller encontrado
```

### A02 — Cryptographic Failures
- Senhas estao sendo hasheadas com bcrypt (salt adequado >= 10)?
- Dados sensiveis (CPF, CNPJ, dados financeiros) sao transmitidos apenas via HTTPS?
- Nenhum dado sensivel armazenado em texto plano no banco?
- JWT secret e forte (nao padrao/vazio)?

### A03 — Injection
- Queries raw com interpolacao de string?
- Inputs de usuario passados para funcoes de sistema (exec, spawn)?
- Parametros de URL/query usados diretamente em queries sem sanitizacao?

Comandos:
```bash
# Procurar raw queries com interpolacao
grep -rn "createQueryBuilder\|em.getConnection\|em.execute" {project_root}/apps/api/src/ --include="*.ts"
grep -rn "exec\|spawn\|eval" {project_root}/apps/api/src/ --include="*.ts"
```

### A04 — Insecure Design
- Logica de negocio permite burlar limites (ex: preco negativo, quantidade zero)?
- Fluxos de estado podem ser pulados (ex: aprovar proposta sem enviar)?
- Rate limiting existe em endpoints de autenticacao?

### A05 — Security Misconfiguration
- CORS aceita `*` (qualquer origem)?
- Helmet ou headers de seguranca equivalentes estao configurados?
- Modo debug/swagger esta desabilitado em producao?
- Variaveis de ambiente tem valores padrao sensiveis?

Comandos:
```bash
grep -rn "origin.*\*\|AllowAll\|enableCors" {project_root}/apps/api/src/ --include="*.ts"
grep -rn "NODE_ENV\|SwaggerModule\|DocumentBuilder" {project_root}/apps/api/src/ --include="*.ts"
```

### A06 — Vulnerable Components
- Registrar versoes instaladas (sera tratado em detail no Step 5)

### A07 — Identification and Authentication Failures
- JWT tem expiracao definida?
- Refresh tokens sao invalidados no logout?
- Nao ha limite de tentativas de login (brute force)?
- Senha fraca aceita (sem validacao de complexidade)?

### A08 — Software and Data Integrity Failures
- Dependencias vem de fontes confiaveis (npm registry oficial)?
- Scripts de CI/CD usam versoes fixadas ou hashes — nao `latest`?

### A09 — Security Logging and Monitoring Failures
- Falhas de autenticacao sao logadas?
- Acessos a dados sensiveis sao auditados?
- Logs nao incluem dados sensiveis (senhas, tokens)?

### A10 — SSRF (Server-Side Request Forgery)
- Ha endpoints que fazem requisicoes a URLs fornecidas pelo usuario?
- Integracao com APIs externas (ex: BrasilAPI) valida o destino?

Comandos:
```bash
grep -rn "axios.get\|fetch\|http.request" {project_root}/apps/api/src/ --include="*.ts"
```

## Output

Relatorio por categoria com achados classificados: CRITICO / ALTO / MEDIO / BAIXO / OK
