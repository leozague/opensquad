---
execution: inline
agent: dev-bootstrap/agents/tiago-testes
inputFile: squads/dev-bootstrap/output/sdd-plan.md
outputFile: squads/dev-bootstrap/output/coverage-report.md
---

# Step 07: Test Suite

## Context Loading

Load these files before executing:
- `squads/dev-bootstrap/output/sdd-plan.md` — specs com testes esperados por modulo
- `squads/dev-bootstrap/output/build-log.md` — log de implementacao (modulos concluidos)
- `squads/dev-bootstrap/pipeline/data/doc-cache/` — docs dos frameworks de teste
- `squads/dev-bootstrap/pipeline/data/quality-criteria.md` — criterios de cobertura
- Projeto no caminho definido em `input-params.yaml`

## Instructions

### Process
1. Executar task `define-test-strategy.md`:
   - Selecionar frameworks de teste para a stack
   - Configurar runners e cobertura
   - Criar helpers base (factories, fixtures)
2. Executar task `write-tests.md`:
   - Testes unitarios para logica de negocio
   - Testes de integracao para banco
   - Testes e2e para fluxos criticos
3. Executar task `run-coverage.md`:
   - Rodar suite completa
   - Gerar relatorio de cobertura
   - Se cobertura < 80%: escrever testes adicionais
   - Se testes falhando por bug no codigo: reportar (on_fail → step 6)

### on_fail
Se testes falham por bug no codigo (nao no teste), retornar ao Step 6 com report:
- Quais testes falharam
- Qual o erro
- Qual modulo afetado
O Bruno Bootstrap corrige e o Tiago Testes re-executa.

## Output Format

O output e `coverage-report.md` com resultados e cobertura por modulo.
Ver formato na task `run-coverage.md`.

## Output Example

Ver exemplo na task `run-coverage.md` do agente Tiago Testes.

## Veto Conditions

Rejeitar e refazer se:
1. Modulos sem nenhum teste
2. Cobertura < 80% apos tentativa de correcao

## Quality Criteria

- [ ] Testes para todos os modulos do spec
- [ ] Zero testes falhando
- [ ] Cobertura >= 80% linhas
- [ ] Relatorio de cobertura gerado
- [ ] Factories/fixtures implementadas
