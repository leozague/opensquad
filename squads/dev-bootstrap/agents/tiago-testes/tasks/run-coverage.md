---
task: "Run Coverage"
order: 3
input: |
  - test_files: Todos os testes escritos
  - project_dir: Projeto com testes
output: |
  - coverage_report: Relatorio de cobertura com breakdown por modulo
  - test_results: Resultado da execucao completa
---

# Run Coverage

Executar a suite completa de testes, gerar relatorio de cobertura e corrigir falhas.

## Process

1. Rodar suite completa de testes unitarios: `npm run test:unit` (ou equivalente)
2. Se houver falhas:
   a. Diagnosticar cada falha (erro no teste ou bug no codigo)
   b. Se bug no codigo: reportar ao Bruno Bootstrap para correcao (on_fail → step 6)
   c. Se erro no teste: corrigir o teste e re-executar
3. Rodar suite de integracao: `npm run test:integration`
4. Rodar suite e2e: `npm run test:e2e`
5. Gerar relatorio de cobertura: `npm run test:coverage`
6. Verificar cobertura minima de 80% em linhas
7. Se cobertura < 80%: identificar modulos com baixa cobertura e escrever testes adicionais
8. Re-executar ate atingir cobertura minima
9. Salvar relatorio final em `coverage-report.md`

## Output Format

```markdown
# Coverage Report: {project_name}

## Resultado da Execucao

| Tipo | Total | Passando | Falhando | Tempo |
|------|-------|----------|----------|-------|
| Unit | {N} | {N} | {N} | {Xs} |
| Integration | {N} | {N} | {N} | {Xs} |
| E2E | {N} | {N} | {N} | {Xs} |
| **Total** | **{N}** | **{N}** | **{N}** | **{Xs}** |

## Cobertura

| Metrica | Valor | Minimo | Status |
|---------|-------|--------|--------|
| Lines | {X}% | 80% | PASS/FAIL |
| Branches | {X}% | 70% | PASS/FAIL |
| Functions | {X}% | 80% | PASS/FAIL |
| Statements | {X}% | 80% | PASS/FAIL |

## Cobertura por Modulo

| Modulo | Lines | Branches | Functions |
|--------|-------|----------|-----------|
| {modulo} | {X}% | {X}% | {X}% |

## Falhas Corrigidas
{lista de falhas encontradas e como foram corrigidas, se houver}
```

## Output Example

> Use como referencia de qualidade.

```markdown
# Coverage Report: TaskFlow

## Resultado da Execucao

| Tipo | Total | Passando | Falhando | Tempo |
|------|-------|----------|----------|-------|
| Unit | 28 | 28 | 0 | 3.2s |
| Integration | 11 | 11 | 0 | 8.7s |
| E2E | 8 | 8 | 0 | 22.1s |
| **Total** | **47** | **47** | **0** | **34.0s** |

## Cobertura

| Metrica | Valor | Minimo | Status |
|---------|-------|--------|--------|
| Lines | 87.3% | 80% | PASS |
| Branches | 78.2% | 70% | PASS |
| Functions | 91.5% | 80% | PASS |
| Statements | 86.9% | 80% | PASS |

## Cobertura por Modulo

| Modulo | Lines | Branches | Functions |
|--------|-------|----------|-----------|
| auth | 92.1% | 85.0% | 95.0% |
| users | 88.5% | 76.3% | 90.2% |
| projects | 84.2% | 72.1% | 88.7% |
| database | 78.9% | 71.0% | 85.0% |

## Falhas Corrigidas
- auth.service.spec.ts: teste "deve invalidar refresh token" falhava por timeout — aumentado timeout para 10s
- users.controller.spec.ts: mock do AuthGuard estava incompleto — adicionado mock correto
```

## Quality Criteria

- [ ] Todos os testes executados (zero skipped)
- [ ] Zero testes falhando
- [ ] Cobertura >= 80% em linhas
- [ ] Cobertura >= 70% em branches
- [ ] Relatorio de cobertura gerado com breakdown por modulo
- [ ] Testes rodam em tempo razoavel (< 60s unit, < 120s total)

## Veto Conditions

Rejeitar e refazer se:
1. Testes falhando (nao corrigidos)
2. Cobertura de linhas < 80% apos tentativa de correcao
