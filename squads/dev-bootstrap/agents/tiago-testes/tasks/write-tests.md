---
task: "Write Tests"
order: 2
input: |
  - sdd_plan: Specs dos modulos com testes esperados
  - test_strategy: Estrategia definida na task anterior
  - project_dir: Projeto implementado
output: |
  - test_files: Arquivos de teste escritos para todos os modulos
---

# Write Tests

Escrever testes unitarios, de integracao e e2e para todos os modulos do projeto, cobrindo happy paths e edge cases.

## Process

1. Ler `sdd-plan.md` e extrair testes esperados por modulo
2. Para cada modulo, na ordem de dependencia:
   a. Escrever testes unitarios (services, utils, helpers):
      - Happy paths: comportamento esperado com inputs validos
      - Edge cases: inputs vazios, nulos, limites, tipos invalidos
      - Error cases: excecoes esperadas, fallbacks
   b. Escrever testes de integracao (banco, servicos externos):
      - CRUD operations reais contra banco local
      - Transacoes e rollback
      - Constraints e validacoes do banco
   c. Escrever testes e2e (endpoints, fluxos completos):
      - Fluxos criticos: auth, CRUD principal
      - Status codes corretos (200, 201, 400, 401, 403, 404, 422)
      - Response bodies corretos
3. Usar factories e fixtures (nao dados hardcoded)
4. Cada teste segue padrao AAA (Arrange-Act-Assert)
5. Nome do teste descreve comportamento: "deve retornar 404 quando usuario nao existe"
6. Garantir que testes sao independentes (nao dependem de ordem)

## Output Format

```markdown
## Test Files Created

### Modulo: {nome}
- Unit: {N} testes em {paths}
- Integration: {N} testes em {paths}
- E2E: {N} testes em {paths}
- Total: {N} testes

### Resumo Geral
- Total de arquivos de teste: {N}
- Total de test cases: {N}
- Cobertura por tipo: unit ({N}), integration ({N}), e2e ({N})
```

## Output Example

> Use como referencia de qualidade.

```markdown
## Test Files Created

### Modulo: auth
- Unit: 6 testes em src/modules/auth/auth.service.spec.ts
  - deve gerar JWT valido ao registrar
  - deve rejeitar registro com email duplicado
  - deve rejeitar login com senha incorreta
  - deve gerar refresh token com expiracao de 7 dias
  - deve invalidar refresh token apos uso
  - deve lancar UnauthorizedException com token expirado
- Integration: 3 testes em test/integration/auth.spec.ts
  - deve persistir usuario no banco ao registrar
  - deve retornar refresh token valido
  - deve atualizar last_login ao fazer login
- E2E: 4 testes em test/e2e/auth.spec.ts
  - POST /auth/register deve retornar 201 com tokens
  - POST /auth/login deve retornar 200 com tokens
  - POST /auth/login com senha errada deve retornar 401
  - POST /auth/refresh deve retornar novos tokens
- Total: 13 testes

### Resumo Geral
- Total de arquivos de teste: 12
- Total de test cases: 47
- Cobertura por tipo: unit (28), integration (11), e2e (8)
```

## Quality Criteria

- [ ] Testes para todos os modulos do spec
- [ ] Happy paths e edge cases cobertos
- [ ] Error cases cobertos (status codes de erro)
- [ ] Factories/fixtures usadas (sem dados hardcoded)
- [ ] Padrao AAA em todos os testes
- [ ] Nomes descritivos de comportamento
- [ ] Testes independentes (sem dependencia de ordem)

## Veto Conditions

Rejeitar e refazer se:
1. Modulo do spec sem nenhum teste escrito
2. Testes com dados hardcoded ao inves de factories
