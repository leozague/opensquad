---
execution: inline
agent: dev-bootstrap/agents/victor-validacao
inputFile: squads/dev-bootstrap/output/sdd-plan.md
outputFile: squads/dev-bootstrap/output/review-verdict.md
---

# Step 08: Review Project

## Context Loading

Load these files before executing:
- `squads/dev-bootstrap/output/sdd-plan.md` — plano SDD (fonte de verdade para validacao)
- `squads/dev-bootstrap/output/build-log.md` — log de implementacao
- `squads/dev-bootstrap/output/coverage-report.md` — relatorio de cobertura
- `squads/dev-bootstrap/output/input-params.yaml` — parametros (caminho do projeto, credenciais)
- `squads/dev-bootstrap/pipeline/data/quality-criteria.md` — criterios de qualidade
- Projeto no caminho definido em `input-params.yaml`

## Instructions

### Process
1. Executar task `review-project.md` do agente Victor Validacao
2. Verificar: aderencia ao spec, codigo, testes, deploy, seguranca, documentacao
3. Emitir veredito: APROVADO ou REJEITADO

### on_reject
Se REJEITADO, retornar ao Step 6 (Bruno Bootstrap) ou Step 7 (Tiago Testes) dependendo do tipo de problema:
- Problema de codigo/implementacao → Step 6
- Problema de testes/cobertura → Step 7
- Problema de deploy config → Step 6

Incluir lista detalhada de correcoes necessarias no `review-verdict.md`.

### Se APROVADO
Gerar `delivery-summary.md` com:
- URLs de acesso (localhost)
- Credenciais do banco
- Dados de seed (admin user, etc.)
- GitHub repo URL
- Portas atribuidas
- Comandos para iniciar/parar
- Relatorio de cobertura resumido

## Output Format

O output e `review-verdict.md` seguindo o formato da task `review-project.md`.
Se aprovado, tambem gera `delivery-summary.md`.

## Output Example

Ver exemplo na task `review-project.md` do agente Victor Validacao.

## Veto Conditions

Rejeitar e refazer se:
1. Veredito emitido sem executar verificacoes (lint, testes, docker build)
2. Blocker identificado mas veredito APROVADO

## Quality Criteria

- [ ] Todos os criterios do checklist verificados
- [ ] Veredito coerente com resultados das verificacoes
- [ ] Delivery summary completo (se aprovado)
- [ ] Lista de correcoes clara (se rejeitado)
