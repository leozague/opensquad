---
task: "Revisão"
order: 1
input: |
  - slide_deck: Arquivo HTML do slide deck gerado por Diego Dashboard
  - quality_criteria: Critérios de qualidade definidos para o squad
output: |
  - review_report: Scorecard completo com veredicto, feedback detalhado e caminho para aprovação
---

# Revisão

Avalia o slide deck final contra os critérios de qualidade objetivos e emite veredicto APROVADO, APROVADO CONDICIONAL ou REJEITADO com feedback acionável.

## Process

1. Carregar `quality-criteria.md` completamente — entender os 5 critérios, escalas e triggers de rejeição automática
2. Ler o slide deck HTML completo do início ao fim — nunca avaliar antes de terminar a leitura
3. Avaliar cada critério individualmente na escala 1-10 com justificativa específica (citar slide por número)
4. Verificar triggers de rejeição automática: critério < 4/10 = REJEITAR independente da média
5. Calcular média e aplicar regras de decisão: ≥7 sem trigger = APROVADO; ≥7 com não-críticos 4-6 = CONDICIONAL; <7 ou trigger = REJEITADO
6. Montar review estruturado: scorecard → feedback detalhado → required changes → suggestions → veredicto
7. Registrar número da revisão — na 3ª rejeição pelo mesmo problema, escalar ao usuário

## Output Format

```
==============================
 VEREDICTO: [APROVADO / APROVADO CONDICIONAL / REJEITADO]
==============================

Conteúdo: [Tema do deck]
Revisora: Vera Veredicto | [data]
Revisão: [N] de 3

------------------------------
 SCORECARD
------------------------------
| Critério | Nota | Resumo |
|---|---|---|
| Precisão dos dados | X/10 | [resumo] |
| Clareza executiva | X/10 | [resumo] |
| Completude | X/10 | [resumo] |
| Design e legibilidade | X/10 | [resumo] |
| Recomendações acionáveis | X/10 | [resumo] |
------------------------------
 MÉDIA: X.X/10
------------------------------

[Se trigger de rejeição: TRIGGER DE REJEIÇÃO AUTOMÁTICA: [critério] = X/10 (abaixo de 4/10)]

FEEDBACK DETALHADO:

Strength: [Ponto específico que funciona bem com referência a slide]

Required change: [Slide X — problema específico — instrução de correção]

Suggestion (não-bloqueante): [Melhoria opcional com referência ao elemento]

[Se REJEITADO:]
CAMINHO PARA APROVAÇÃO:
1. [Mudança obrigatória 1]
2. [Mudança obrigatória 2]
Resubmeter como Revisão [N+1]. Se corrigido, espera-se aprovação.

VEREDICTO: [APROVADO / APROVADO CONDICIONAL / REJEITADO]
```

## Output Example

> Use as quality reference, not as rigid template.

```
==============================
 VEREDICTO: APROVADO
==============================

Conteúdo: Inteligência de Mercado — Overmind | Abril 2026
Revisora: Vera Veredicto | 2026-04-08
Revisão: 1 de 3

------------------------------
 SCORECARD
------------------------------
| Critério | Nota | Resumo |
|---|---|---|
| Precisão dos dados | 9/10 | Todos os KPIs têm fonte referenciada no brief |
| Clareza executiva | 8/10 | Titles-conclusão em todos os slides; Slide 4 levou ~35s |
| Completude | 9/10 | Todas as seções presentes com profundidade adequada |
| Design e legibilidade | 8/10 | Paleta OMK correta, hierarquia visual sólida |
| Recomendações acionáveis | 9/10 | 4 recomendações priorizadas com todos os campos |
------------------------------
 MÉDIA: 8.6/10
------------------------------

FEEDBACK DETALHADO:

Strength: O título da capa "Janela de 6 Meses para Capturar RAG Corporativo" é exemplar —
comunica urgência e insight antes de qualquer leitura do conteúdo. Este padrão está
mantido em 4 dos 5 slides, o que é excelente.

Strength: O slide de recomendações usa badges visuais de prioridade com clareza. Um
executivo consegue, em 10 segundos, identificar as 2 ações de alta prioridade.

Suggestion (não-bloqueante): Slide 4 (Insights) contém 4 insight-cards em sequência sem
separação visual clara entre eles. Considerar adicionar numeração visível (01, 02, 03, 04)
ou espaçamento maior para facilitar referência em discussão ("o insight 3 diz que...").

Suggestion (não-bloqueante): A seção de Metodologia do analysis-report não está refletida
no deck. Considerar adicionar um rodapé no último slide com "Fontes: IDC Q1 2026, ABES 2026"
para dar transparência sem criar um slide novo.

VEREDICTO: APROVADO — Deck atende todos os critérios de qualidade. Sugestões
fornecidas para polimento opcional antes da apresentação.
```

## Quality Criteria

- [ ] Todos os 5 critérios foram avaliados com nota E justificativa
- [ ] Cada feedback cita slide específico por número
- [ ] Required change e Suggestion claramente separados com prefixos corretos
- [ ] Pelo menos 1 Strength reconhecido explicitamente
- [ ] Veredicto é consistente com a média e triggers
- [ ] Número da revisão registrado

## Veto Conditions

Reject and redo if ANY are true:
1. Algum critério tem nota sem justificativa escrita de pelo menos uma frase
2. REJEITADO emitido sem pelo menos 1 "Required change:" com instrução concreta de correção
