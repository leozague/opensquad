---
task: "Revisão de Todos os Documentos"
order: 1
input: |
  - roteiro-video.md: Transcrição organizada
  - ideia-de-negocio.md: Lean Canvas e hipótese
  - analise-de-mercado.md: Pesquisa de mercado
  - plano-de-negocio.md: Plano de negócio
  - plano-de-execucao.md: Plano de execução
  - quality-criteria.md: Critérios de qualidade do squad
output: |
  - review-report.md: Relatório de revisão com verdict
---

# Revisão de Todos os Documentos

Avalia os 5 documentos produzidos pelo squad: verifica consistência cross-document, viabilidade das conclusões, completude das análises e qualidade geral. Produz relatório com scoring por critério e verdict APPROVE/REJECT.

## Process

1. Ler o arquivo `quality-criteria.md` do squad para carregar os critérios de avaliação
2. Ler TODOS os 5 documentos completamente antes de iniciar qualquer scoring
3. Verificar **consistência cross-document**: números do plano de negócio batem com a análise de mercado? O MVP cobre as features do Lean Canvas? Os riscos refletem as ameaças do SWOT?
4. Avaliar cada documento contra seus critérios específicos (do quality-criteria.md), pontuando 1-10 por critério com justificativa
5. Identificar inconsistências, lacunas e pontos fortes
6. Compilar relatório estruturado com verdict, scoring, feedback detalhado e path to approval (se REJECT)

## Output Format

```yaml
verdict: "APPROVE | CONDITIONAL APPROVE | REJECT"
score_geral: "X/10"
documentos:
  - nome: "roteiro-video.md"
    score: "X/10"
    criterios:
      - criterio: "..."
        score: "X/10"
        justificativa: "..."
    forcas: ["..."]
    correcoes_obrigatorias: ["..."]
    sugestoes: ["..."]
inconsistencias: ["..."]
path_to_approval: "..." # só em caso de REJECT
```

## Output Example

> Use como referência de qualidade, não como template rígido.

```markdown
# Relatório de Revisão: FinSimples

## Verdict: CONDITIONAL APPROVE
**Score Geral: 7.4/10**

---

## Roteiro do Vídeo — 8/10

**Força:** Organização temática excelente. Seção de lacunas completa e útil
para direcionar a pesquisa de mercado.

**Sugestão (não-bloqueante):** Adicionar timestamps aproximados para facilitar
referência futura ao vídeo original.

## Ideia de Negócio — 7/10

**Força:** Hipótese bem formulada como frase falsificável. Lean Canvas
completo com marcações claras de [inferido] e [não mencionado].

**Correção obrigatória:** O bloco "Canais" do Lean Canvas está marcado como
[não mencionado] mas o vídeo menciona "Instagram e comunidades de freelancers"
no minuto ~14. Atualizar o Lean Canvas com esta informação.

## Análise de Mercado — 8/10

**Força:** TAM/SAM/SOM bem fundamentados com fontes citadas. Mapa de
concorrentes completo com diretos, indiretos e substitutos.

**Sugestão (não-bloqueante):** Adicionar comparativo visual (tabela) de
features entre os 3 concorrentes diretos e o FinSimples.

## Plano de Negócio — 7/10

**Força:** Unit economics calculados com premissas explícitas. Riscos
documentados honestamente com mitigações concretas.

**Correção obrigatória:** O LTV/CAC ratio no sumário executivo (21:1)
diverge do calculado na tabela de unit economics (8.7:1). Corrigir o
sumário para refletir o valor correto.

## Plano de Execução — 7/10

**Força:** MVP genuinamente mínimo. Kill criteria definidos por fase.
Tech stack justificado com razões práticas.

**Sugestão (não-bloqueante):** O budget de Fase 3 (R$400k) parece alto
para 6 meses com 7.5 pessoas. Detalhar a distribuição (salários,
infraestrutura, marketing).

---

## Inconsistências Cross-Document
1. ❌ LTV/CAC ratio diverge entre sumário executivo (21:1) e tabela (8.7:1)
2. ⚠️ Canais no Lean Canvas marcados como [não mencionado] mas vídeo menciona
3. ✅ TAM/SAM/SOM consistente entre análise de mercado e plano de negócio

## Path to Approval
Corrigir as 2 correções obrigatórias acima. As sugestões são opcionais.
Após correções, o score estimado sobe para 7.8/10 → APPROVE.
```

## Quality Criteria

- [ ] Todos os 5 documentos avaliados com score e justificativa
- [ ] Consistência cross-document verificada (mín. 3 checks)
- [ ] Correções obrigatórias separadas de sugestões
- [ ] Pelo menos 1 força reconhecida por documento
- [ ] Verdict coerente com scores (>= 7 e nenhum < 4 = APPROVE)
- [ ] Path to approval descrito em caso de REJECT

## Veto Conditions

Rejeitar e refazer se QUALQUER condição for verdadeira:
1. Algum documento não foi lido/avaliado — todos os 5 devem ter score
2. Verdict contradiz scores — APPROVE com score < 7 ou critério < 4
