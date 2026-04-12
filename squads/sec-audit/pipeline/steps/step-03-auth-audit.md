# Step 3 — Auth e Autorizacao Audit

**Agente:** Auth Auditor (subagent)

## Objetivo

Auditoria especifica do sistema de autenticacao dual (usuarios internos + clientes) e controle de acesso por perfil.

## Verificacoes

### JWT e Sessao
- [ ] Secret do JWT nao e string padrao nem vazia (ler .env ou configuracao)
- [ ] Access token tem expiracao curta (recomendado: 15min a 1h)
- [ ] Refresh token tem expiracao mais longa mas definida (recomendado: 7-30 dias)
- [ ] Refresh tokens sao armazenados de forma segura (nao em localStorage)
- [ ] Logout invalida o refresh token no servidor

### Separacao dos Dois Sistemas
- [ ] Tokens de usuarios internos nao funcionam nas rotas de clientes e vice-versa
- [ ] Guards verificam o `type` do token antes de autorizar
- [ ] Nao ha endpoint que aceita ambos os tipos sem validacao explicita

### Controle de Acesso por Perfil
- Mapear: qual endpoint aceita qual Role
- Verificar se ha endpoints que deveriam ser ADMIN mas aceitam OPERATOR
- Verificar se clientes podem acessar dados de outros clientes

Comandos:
```bash
grep -rn "@Roles\|RolesGuard\|JwtAuthGuard" {project_root}/apps/api/src/modules/ -A 2 --include="*.ts"
```

### Protecao de Rotas Criticas
- [ ] Rota de criacao de usuario: apenas ADMIN?
- [ ] Rota de alterar perfil/role: apenas ADMIN?
- [ ] Rota de dados financeiros: apenas MANAGER ou acima?
- [ ] Rota de exclusao: protegida adequadamente?

### Frontend
- [ ] Token JWT nao armazenado em localStorage (vulneravel a XSS)
- [ ] Token enviado apenas via header Authorization — nunca em query string
- [ ] Rotas protegidas no Vue Router verificam autenticacao localmente (guard de rota)?

## Output

Mapa de cobertura de autorizacao + achados classificados
