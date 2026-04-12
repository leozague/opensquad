---
execution: inline
agent: raquel-revisao
outputFile: squads/video-business-analyzer/output/review-report.md
on_reject: 5
---

# Step 06: Revisão de Qualidade

## Context Loading

Load these files before executing:
- `squads/video-business-analyzer/output/roteiro-video.md` — Transcrição organizada
- `squads/video-business-analyzer/output/ideia-de-negocio.md` — Lean Canvas e hipótese
- `squads/video-business-analyzer/output/analise-de-mercado.md` — Pesquisa de mercado
- `squads/video-business-analyzer/output/plano-de-negocio.md` — Plano de negócio
- `squads/video-business-analyzer/output/plano-de-execucao.md` — Plano de execução
- `squads/video-business-analyzer/pipeline/data/quality-criteria.md` — Critérios de qualidade

## Instructions

### Process

1. Carregar os critérios de qualidade do squad (`quality-criteria.md`)
2. Ler TODOS os 5 documentos completamente antes de iniciar scoring
3. Executar task `review-all-documents.md`:
   - Avaliar cada documento contra seus critérios específicos (1-10 por critério)
   - Verificar consistência cross-document (números, segmentos, premissas)
   - Identificar forças e problemas
   - Compilar relatório com verdict
4. Se APPROVE ou CONDITIONAL APPROVE: salvar relatório e prosseguir
5. Se REJECT: salvar relatório com path to approval → pipeline volta ao step 5 (on_reject)

## Output Format

```markdown
# Relatório de Revisão: {Nome do Produto}

## Verdict: {APPROVE | CONDITIONAL APPROVE | REJECT}
**Score Geral: X/10**

## {Documento 1} — X/10
Força: ...
Correção obrigatória: ... (se houver)
Sugestão: ... (se houver)

[repetir para cada documento]

## Inconsistências Cross-Document
- ...

## Path to Approval (se REJECT)
- ...
```

## Output Example

Ver exemplo completo no task file:
- `agents/raquel-revisao/tasks/review-all-documents.md` → exemplo de relatório de revisão

## Veto Conditions

Rejeitar e refazer se QUALQUER condição for verdadeira:
1. Algum documento não foi avaliado — todos os 5 devem ter score
2. Verdict contradiz scores — APPROVE com score médio < 7

## Quality Criteria

- [ ] Todos os 5 documentos avaliados individualmente
- [ ] Consistência cross-document verificada
- [ ] Correções separadas de sugestões
- [ ] Forças reconhecidas por documento
- [ ] Verdict coerente com scores
