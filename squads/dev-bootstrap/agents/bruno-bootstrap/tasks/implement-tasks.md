---
task: "Implement Tasks"
order: 2
input: |
  - sdd_plan: Specs dos modulos em ordem de execucao
  - doc_cache: Docs cacheadas dos frameworks
  - project_dir: Projeto scaffoldado
output: |
  - implemented_modules: Modulos implementados com commits atomicos
  - build_log: Log de progresso da implementacao
---

# Implement Tasks

Implementar cada modulo do SDD spec em ordem de dependencia. Um modulo por vez, commit atomico ao concluir, testes do modulo rodando antes de avancar.

## Process

1. Ler `sdd-plan.md` e extrair a lista de modulos na ordem de execucao
2. Para cada modulo, na ordem definida:
   a. Ler o spec do modulo (interfaces, arquivos, testes, acceptance criteria)
   b. Consultar doc cache do framework relevante para APIs corretas
   c. Criar os arquivos definidos no spec
   d. Implementar as interfaces definidas
   e. Rodar lint e verificar compilacao
   f. Rodar testes unitarios do modulo (se definidos no spec)
   g. Se todos passam: commit atomico com a mensagem definida no spec
   h. Se algo falha: diagnosticar e corrigir antes de avancar
3. **INTERRUPCAO**: Se surgir uma decisao nao prevista no spec (ex: padrao de autenticacao nao definido, conflito de dependencias, ambiguidade de requisito), PARAR e perguntar ao usuario apresentando: contexto, opcoes e recomendacao
4. Atualizar `build-log.md` com progresso apos cada modulo

## Output Format

```markdown
## Build Log

### Modulo: {nome}
- Status: DONE / IN PROGRESS / BLOCKED
- Commit: {hash} — {mensagem}
- Testes: {X} passando, {Y} falhando
- Notas: {observacoes relevantes}

### Modulo: {nome}
...

## Resumo
- Modulos concluidos: {N}/{total}
- Commits feitos: {N}
- Testes totais: {X} passando
- Interrupcoes: {N} (detalhes acima)
```

## Output Example

> Use como referencia de qualidade.

```markdown
## Build Log

### Modulo: database-setup (1/5)
- Status: DONE
- Commit: a1b2c3d — feat(database): configurar conexao e migrations iniciais
- Testes: 2 passando, 0 falhando
- Notas: Usando PostgreSQL local na porta 5442

### Modulo: auth (2/5)
- Status: DONE
- Commit: e4f5g6h — feat(auth): implementar autenticacao JWT com registro, login e refresh
- Testes: 8 passando, 0 falhando
- Notas: Bcrypt para hash de senha, JWT expira em 15min, refresh em 7d

### Modulo: users (3/5)
- Status: BLOCKED — INTERRUPCAO
- Motivo: Spec define CRUD de usuarios mas nao especifica se soft delete ou hard delete
- Opcoes apresentadas ao usuario:
  1. Soft delete (coluna deleted_at) — recomendado para auditoria
  2. Hard delete — mais simples, sem historico
- Recomendacao: Soft delete

## Resumo
- Modulos concluidos: 2/5
- Commits feitos: 2
- Testes totais: 10 passando
- Interrupcoes: 1 (soft delete vs hard delete)
```

## Quality Criteria

- [ ] Modulos implementados na ordem de dependencia
- [ ] Commit atomico por modulo concluido
- [ ] Mensagens de commit descritivas (sem referencia a IA)
- [ ] Sem console.log ou debug code commitado
- [ ] Lint passando apos cada modulo
- [ ] Testes unitarios do modulo passando antes de avancar
- [ ] Build log atualizado apos cada modulo

## Veto Conditions

Rejeitar e refazer se:
1. Modulo commitado com testes falhando
2. Decisao arquitetural importante tomada sem perguntar ao usuario
