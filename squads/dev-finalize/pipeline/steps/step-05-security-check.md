# Step 05 — Analise de Seguranca

**Agente:** Security Analyst (subagent)

## Objetivo

Analisar o codigo implementado na branch em busca de vulnerabilidades de seguranca introduzidas ou expostas pela mudanca. Foco no diff — nao e uma auditoria completa do sistema (para isso, usar `/opensquad run sec-audit`).

## Contexto a Carregar

- Relatorio da Git Arqueologa (Step 02) — diff por camada
- CLAUDE.md do projeto — regras e stack
- `{docs_path}/.specs/codebase/STACK.md` — versoes instaladas

## Analise por Camada

### Backend — Controle de Acesso

- [ ] Todo endpoint novo ou modificado tem Guard aplicado (`@UseGuards`)?
- [ ] Perfis de acesso (`@Roles`) estao corretamente definidos — nao expostos por padrao?
- [ ] Endpoints que retornam dados de outros usuarios validam se o solicitante tem permissao?
- [ ] Nenhuma rota foi acidentalmente tornada publica (sem guard)?

### Backend — Injecao e Validacao de Entrada

- [ ] Todo dado que entra via HTTP passa por DTO com `class-validator`?
- [ ] Nenhuma query raw foi adicionada com interpolacao de string (SQL Injection)?
- [ ] `EntityManager` / `QueryBuilder` usam parametros vinculados — nunca concatenacao?
- [ ] Uploads de arquivo validam tipo MIME e tamanho no servidor (nao so no frontend)?
- [ ] Nenhum input do usuario e passado diretamente para `exec()`, `spawn()` ou similar?

### Backend — Exposicao de Dados

- [ ] Respostas nao incluem campos sensiveis (password, token, chaves internas)?
- [ ] DTOs de resposta filtram apenas os campos necessarios?
- [ ] Logs nao registram dados sensiveis (senha, CPF, cartao, tokens)?
- [ ] Mensagens de erro nao expõem stack trace, SQL ou estrutura interna em producao?

### Backend — Autenticacao e Tokens

- [ ] JWT nao e armazenado em localStorage no frontend (deve ser httpOnly cookie ou memory)?
- [ ] Tokens tem expiracao definida — nao sao eternos?
- [ ] Refresh tokens sao invalidados no logout?

### Frontend — XSS

- [ ] `v-html` foi usado? Se sim: o conteudo e de fonte confivel e sanitizado?
- [ ] Nenhum dado de usuario e renderizado sem escape?
- [ ] `innerHTML` nao e usado diretamente em JS?

### Frontend — Dados Sensiveis

- [ ] Nenhuma chave de API, token ou segredo esta hardcoded no codigo frontend?
- [ ] Variaveis de ambiente publicas do Vite (`VITE_*`) nao contem segredos reais?
- [ ] Dados sensiveis nao sao salvos em `localStorage` ou `sessionStorage`?

### Comunicacao e Headers

- [ ] CORS esta configurado para aceitar apenas origens conhecidas (nao `*` em producao)?
- [ ] Headers de seguranca estao ativos via Helmet (se configurado)?
- [ ] Todas as chamadas externas usam HTTPS — nenhuma URL `http://` hardcoded?
- [ ] Rate limiting esta configurado nos endpoints publicos (login, registro)?

### Dependencias

- [ ] Alguma nova dependencia foi adicionada? Se sim: verificar se ha vulnerabilidades conhecidas
  - Verificar em: https://security.snyk.io/ ou `npm audit`

## Classificacao dos Achados

- **CRITICO** — vulnerabilidade exploravel diretamente (ex: SQL injection, rota publica nao intencional, segredo exposto)
- **ALTO** — problema serio que precisa ser corrigido antes do deploy
- **MEDIO** — desvio de boas praticas com risco potencial
- **BAIXO** — melhoria de seguranca recomendada, nao bloqueante

## Formato do Relatorio

```
## Analise de Seguranca — {feature_slug}

### Status Geral
[APROVADO] / [APROVADO COM RESSALVAS] / [BLOQUEADO — correcao necessaria]

### Achados

#### [CRITICO / ALTO / MEDIO / BAIXO] — {titulo}
Arquivo: {arquivo}:{linha}
Descricao: {o que foi encontrado}
Risco: {o que um atacante poderia fazer}
Correcao: {como resolver}

### Recomendacao
[Aprovado para seguir] / [Corrigir antes do deploy]
```

## Regras

- Basear-se apenas no diff e no codigo lido — nao inventar vulnerabilidades
- Qualquer achado CRITICO ou ALTO e automaticamente BLOQUEANTE
- Se nao houver achados: registrar "Nenhuma vulnerabilidade identificada na mudanca analisada"
