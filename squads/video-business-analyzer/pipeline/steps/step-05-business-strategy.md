---
execution: inline
agent: pablo-plano
inputFile: squads/video-business-analyzer/output/analise-de-mercado.md
outputFile: squads/video-business-analyzer/output/plano-de-negocio.md
---

# Step 05: Plano de Negócio e Execução

## Context Loading

Load these files before executing:
- `squads/video-business-analyzer/output/ideia-de-negocio.md` — Lean Canvas e conceito do produto
- `squads/video-business-analyzer/output/analise-de-mercado.md` — Pesquisa de mercado completa
- `squads/video-business-analyzer/output/roteiro-video.md` — Roteiro original para contexto
- `squads/video-business-analyzer/pipeline/data/research-brief.md` — Frameworks de referência
- `squads/video-business-analyzer/pipeline/data/quality-criteria.md` — Critérios de qualidade
- `squads/video-business-analyzer/pipeline/data/anti-patterns.md` — Erros a evitar

## Instructions

### Process

1. Ler todos os documentos anteriores: ideia de negócio, análise de mercado, roteiro. Sintetizar os dados-chave
2. Executar task `business-plan.md`:
   - Redigir sumário executivo standalone
   - Detalhar modelo de negócio e pricing
   - Calcular unit economics com premissas
   - Definir go-to-market concreto
   - Projetar financeiro 12 meses
   - Documentar riscos e mitigações
   - Salvar como `output/plano-de-negocio.md`
3. Executar task `execution-plan.md`:
   - Definir MVP via MoSCoW
   - Criar roadmap faseado (3 phases)
   - Estimar recursos por fase
   - Sugerir tech stack
   - Definir kill criteria
   - Salvar como `output/plano-de-execucao.md`

## Output Format

Dois arquivos markdown:
```
output/plano-de-negocio.md    — Sumário executivo + modelo + financeiro + riscos
output/plano-de-execucao.md   — MVP + roadmap + recursos + tech stack
```

## Output Example

Ver exemplos completos nos task files:
- `agents/pablo-plano/tasks/business-plan.md` → exemplo de plano de negócio
- `agents/pablo-plano/tasks/execution-plan.md` → exemplo de plano de execução

## Veto Conditions

Rejeitar e refazer se QUALQUER condição for verdadeira:
1. Projeções sem premissas — números sem justificativa
2. MVP com feature creep — inclui "nice to have" como obrigatório
3. Sem kill criteria em nenhuma fase

## Quality Criteria

- [ ] Sumário executivo standalone
- [ ] Unit economics com premissas explícitas
- [ ] Go-to-market específico
- [ ] MVP com MoSCoW
- [ ] 3 fases com métricas de sucesso
- [ ] Kill criteria por fase
- [ ] Riscos documentados com mitigações
