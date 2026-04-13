---
task: "Review Project"
order: 1
input: |
  - sdd_plan: Plano SDD completo (fonte de verdade)
  - coverage_report: Relatorio de cobertura de testes
  - project_dir: Projeto completo no caminho do usuario
output: |
  - review_verdict: APROVADO ou REJEITADO com justificativa
  - delivery_summary: Documento de entrega (se aprovado)
---

# Review Project

Validar o projeto completo contra o SDD plan: codigo, testes, deploy, seguranca, documentacao. Emitir veredito e gerar documento de entrega.

## Process

1. **Aderencia ao Spec:**
   - Ler `sdd-plan.md` e verificar que todo modulo foi implementado
   - Verificar que a estrutura de pastas corresponde ao planejado
   - Verificar que as interfaces definidas foram implementadas

2. **Qualidade do Codigo:**
   - Rodar lint: `npm run lint` (ou equivalente)
   - Verificar: sem console.log, sem codigo morto, sem TODO/FIXME
   - Verificar: sem credenciais hardcoded (buscar patterns: password=, secret=, token=)
   - Verificar: tratamento de erros consistente

3. **Testes:**
   - Ler `coverage-report.md`
   - Verificar cobertura >= 80% linhas
   - Rodar suite completa para confirmar zero falhas
   - Verificar que testes e2e cobrem fluxos criticos

4. **Deploy:**
   - Verificar que Dockerfile builda: `docker build .`
   - Verificar que docker-compose.yml e valido: `docker compose config`
   - Verificar que GitHub Actions workflow e valido
   - Verificar que secrets necessarios estao documentados

5. **Seguranca:**
   - .env NAO commitado (verificar .gitignore)
   - CORS configurado
   - Input validation nas fronteiras
   - Dependencias sem vulnerabilidades conhecidas: `npm audit`

6. **Documentacao:**
   - README.md com instrucoes de setup
   - .env.example com todas as variaveis
   - Comandos para iniciar/parar documentados

7. **Emitir Veredito:**
   - Se TODOS os criterios passam: APROVADO
   - Se algum BLOCKER falha: REJEITADO com lista de correcoes
   - Blockers: seguranca, testes falhando, spec nao implementado, build falha
   - Warnings: lint warnings, cobertura entre 75-80%, docs incompletas

8. **Se APROVADO:** Gerar documento de entrega (`delivery-summary.md`)

## Output Format

```markdown
# Review Verdict: {project_name}

## Resultado: APROVADO / REJEITADO

## Checklist

### Aderencia ao Spec
- [x/✗] Todos os modulos implementados
- [x/✗] Estrutura de pastas conforme planejado
- [x/✗] Interfaces implementadas

### Qualidade do Codigo
- [x/✗] Lint passando
- [x/✗] Sem console.log / debug code
- [x/✗] Sem credenciais hardcoded
- [x/✗] Tratamento de erros consistente

### Testes
- [x/✗] Cobertura >= 80%
- [x/✗] Zero testes falhando
- [x/✗] E2E cobrindo fluxos criticos

### Deploy
- [x/✗] Docker build funcional
- [x/✗] docker-compose valido
- [x/✗] CI/CD configurado
- [x/✗] Secrets documentados

### Seguranca
- [x/✗] .env nao commitado
- [x/✗] CORS configurado
- [x/✗] Input validation presente
- [x/✗] npm audit sem high/critical

### Documentacao
- [x/✗] README completo
- [x/✗] .env.example presente
- [x/✗] Comandos documentados

## Blockers (se REJEITADO)
{lista de problemas que devem ser corrigidos}

## Warnings
{lista de problemas menores}

---

# Delivery Summary (se APROVADO)

## URLs de Acesso
| Servico | URL |
|---------|-----|
| API | http://localhost:{port} |
| Web | http://localhost:{port} |

## Banco de Dados
- Engine: {engine}
- Host: localhost
- Porta: {port}
- Database: {name}
- Usuario: {user}

## Dados de Seed
| Tipo | Dados |
|------|-------|
| Admin | email: admin@..., senha: ... |

## GitHub
- Repo: https://github.com/KansaiTechHouse/{project}
- Visibilidade: private

## Portas Atribuidas
| Servico | Porta |
|---------|-------|
| API | {port} |
| Web | {port} |

## Comandos
| Acao | Comando |
|------|---------|
| Iniciar API | {comando} |
| Iniciar Web | {comando} |
| Rodar testes | {comando} |
| Parar tudo | {comando} |

## Cobertura de Testes
| Metrica | Valor |
|---------|-------|
| Lines | {X}% |
| Tests | {N} passando |
```

## Output Example

> Exemplo do delivery summary.

```markdown
# Delivery Summary: TaskFlow

## URLs de Acesso
| Servico | URL |
|---------|-----|
| API | http://localhost:3010 |
| Web | http://localhost:5183 |
| API Docs (Swagger) | http://localhost:3010/api/docs |

## Banco de Dados
- Engine: PostgreSQL 16
- Host: localhost
- Porta: 5432
- Database: taskflow_dev
- Usuario: taskflow
- Senha: taskflow_dev_2026

## Dados de Seed
| Tipo | Dados |
|------|-------|
| Admin | email: admin@taskflow.dev, senha: Admin@2026 |
| User teste | email: user@taskflow.dev, senha: User@2026 |

## GitHub
- Repo: https://github.com/KansaiTechHouse/taskflow
- Visibilidade: private
- Commits: 7

## Portas Atribuidas (Port Registry index: 1)
| Servico | Porta |
|---------|-------|
| API | 3010 |
| Web | 5183 |

## Comandos
| Acao | Comando |
|------|---------|
| Iniciar API | cd apps/api && npm run start:dev |
| Iniciar Web | cd apps/web && npm run dev |
| Iniciar tudo | turbo dev |
| Rodar testes | turbo test |
| Coverage | turbo test:coverage |
| Parar tudo | Ctrl+C |

## Cobertura de Testes
| Metrica | Valor |
|---------|-------|
| Lines | 87.3% |
| Branches | 78.2% |
| Functions | 91.5% |
| Tests | 47 passando, 0 falhando |
```

## Quality Criteria

- [ ] Todos os criterios do checklist verificados (nao fabricados)
- [ ] Blockers identificados impedem aprovacao
- [ ] Delivery summary completo com todas as informacoes necessarias
- [ ] URLs, credenciais e comandos testados e funcionais

## Veto Conditions

Rejeitar e refazer se:
1. Veredito emitido sem executar as verificacoes (lint, testes, docker build)
2. Delivery summary com informacoes incorretas ou placeholders
