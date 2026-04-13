---
task: "Define Test Strategy"
order: 1
input: |
  - sdd_plan: Stack, frameworks, modulos do projeto
  - doc_cache: Docs dos frameworks de teste
output: |
  - test_strategy: Estrategia de testes definida (frameworks, config, cobertura)
---

# Define Test Strategy

Definir a estrategia de testes completa com base na stack do projeto: frameworks de teste, configuracao, cobertura minima, tipos de teste por camada.

## Process

1. Ler `sdd-plan.md` para identificar a stack e os modulos
2. Selecionar frameworks de teste adequados para a stack:
   - Node/NestJS: Jest + Supertest (unit/integration) + Playwright/Cypress (e2e)
   - Vue/React: Vitest + Testing Library (unit) + Playwright (e2e)
   - Laravel: PHPUnit + Pest (unit/integration) + Laravel Dusk (e2e)
   - Python: pytest + httpx (unit/integration) + Playwright (e2e)
   - Flutter: flutter_test + integration_test
3. Configurar os frameworks no projeto:
   a. Instalar deps de teste nas versoes corretas
   b. Criar arquivos de configuracao (jest.config, vitest.config, etc.)
   c. Configurar scripts no package.json (ou equivalente)
   d. Configurar cobertura (lcov, html reporter)
4. Criar estrutura de pastas de teste:
   - `__tests__/` ou `test/` conforme convencao da stack
   - Separacao: `unit/`, `integration/`, `e2e/`
5. Criar helpers base: factories, fixtures, test database setup
6. Verificar que o runner de testes funciona: rodar um teste dummy

## Output Format

```yaml
test_strategy:
  frameworks:
    unit: "{framework} v{version}"
    integration: "{framework} v{version}"
    e2e: "{framework} v{version}"
  coverage:
    minimum: 80
    reporter: ["lcov", "text-summary"]
  structure:
    unit: "{path}"
    integration: "{path}"
    e2e: "{path}"
  helpers:
    - "{helper}: {descricao}"
  scripts:
    test: "{comando}"
    test_unit: "{comando}"
    test_integration: "{comando}"
    test_e2e: "{comando}"
    test_coverage: "{comando}"
```

## Output Example

> Use como referencia de qualidade.

```yaml
test_strategy:
  frameworks:
    unit: "Jest v29.7"
    integration: "Jest v29.7 + Supertest v6.3"
    e2e: "Playwright v1.45"
  coverage:
    minimum: 80
    reporter: ["lcov", "text-summary", "html"]
  structure:
    unit: "src/**/*.spec.ts"
    integration: "test/integration/**/*.spec.ts"
    e2e: "test/e2e/**/*.spec.ts"
  helpers:
    - "test/factories/user.factory.ts: gera usuarios de teste com dados fake"
    - "test/helpers/database.ts: setup/teardown do banco de teste"
    - "test/helpers/auth.ts: gera tokens JWT para testes autenticados"
  scripts:
    test: "jest"
    test_unit: "jest --testPathPattern=src"
    test_integration: "jest --testPathPattern=test/integration"
    test_e2e: "playwright test"
    test_coverage: "jest --coverage --coverageThreshold='{\"global\":{\"lines\":80}}'"
```

## Quality Criteria

- [ ] Frameworks de teste adequados para a stack
- [ ] Configuracao funcional (runner executa sem erros)
- [ ] Cobertura minima definida em 80%
- [ ] Estrutura de pastas de teste criada
- [ ] Helpers base implementados (factories, fixtures)
- [ ] Scripts de teste configurados no package.json

## Veto Conditions

Rejeitar e refazer se:
1. Framework de teste incompativel com a stack do projeto
2. Runner de testes nao executa (configuracao incorreta)
