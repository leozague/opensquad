# Step 5 — Dependency Audit

**Agente:** Dependency Auditor (subagent)

## Objetivo

Verificar vulnerabilidades conhecidas nas dependencias instaladas e identificar dependencias desatualizadas com impacto de seguranca.

## Execucao

### 1. npm audit
```bash
cd {project_root}
npm audit --json 2>/dev/null || pnpm audit 2>/dev/null
```

Classificar achados por severidade: critical / high / moderate / low

### 2. Verificar dependencias com EOL
Para cada dependencia principal em `STACK.md`:
- Verificar se a versao instalada ainda recebe patches de seguranca
- Node.js: verificar em https://nodejs.org/en/about/previous-releases
- NestJS, MikroORM: verificar changelog de seguranca no GitHub

### 3. Licencas
```bash
# Verificar se ha dependencias com licencas restritivas (GPL, AGPL) em projeto comercial
cat {project_root}/apps/api/package.json | python3 -c "import json,sys; d=json.load(sys.stdin); print(list(d.get('dependencies',{}).keys()))"
```

## Output

- Lista de vulnerabilidades por severidade com CVE quando disponivel
- Lista de dependencias fora de suporte de seguranca
- Recomendacoes de atualizacao ordenadas por prioridade
