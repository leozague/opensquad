---
task: "Synthesize Knowledge"
order: 1
input: |
  - raw-extraction.md: Metadata + descricao + transcricao do video
output: |
  - vault-note.md: Nota estruturada para o vault _THOTH
  - executive-summary.md: Resumo executivo com pontos-chave
  - annotated-transcript.md: Transcricao com anotacoes e destaques
---

# Synthesize Knowledge

Analisa a transcricao bruta e gera 3 outputs estruturados para alimentar o segundo cerebro.

## Process

1. Ler raw-extraction.md completamente
2. Identificar tema principal, subtemas e conceitos-chave
3. Classificar no sistema PARA:
   - 01_Projects: algo em construcao agora
   - 02_Areas: responsabilidade continua
   - 03_Resources: conhecimento para referencia futura
   - 04_Archives: conteudo historico/datado
4. Se necessario, pesquisar termos/pessoas/ferramentas via web_search
5. Gerar OUTPUT 1 — vault-note.md:
   - Frontmatter YAML (title, date, source, channel, duration, tags, para, type: literature-note)
   - Resumo (3-5 paragrafos autonomos)
   - Conceitos-chave (lista atomica com definicoes)
   - Citacoes marcantes (quotes diretas)
   - Conexoes (links para conceitos relacionados)
   - Action items concretos
6. Gerar OUTPUT 2 — executive-summary.md:
   - Titulo + metadata (canal, duracao, views)
   - TL;DR (1 paragrafo)
   - Pontos-chave (5-10 bullets)
   - Insights nao-obvios (2-3 observacoes de segundo nivel)
   - Action items priorizados
7. Gerar OUTPUT 3 — annotated-transcript.md:
   - Indice de secoes com timestamps
   - Transcricao completa com secoes semanticas
   - Destaques em **negrito** nos trechos relevantes (<20% do texto)
   - Anotacoes [NOTA: ...] nos pontos que merecem reflexao
   - Marcacao de citacoes com >

## Output Format

```yaml
# vault-note.md
frontmatter:
  title: string
  date: YYYY-MM-DD
  source: url
  channel: string
  duration: string
  tags: [string]
  para: string  # ex: 03_Resources/ferramentas
  type: literature-note
sections:
  - Resumo
  - Conceitos-chave
  - Citacoes
  - Conexoes
  - Action Items
```

## Output Example

```markdown
---
title: "Harness Engineering — Infraestrutura para Agentes Confiaveis"
date: 2026-04-13
source: https://youtu.be/dLs-Pbn8stU
channel: Tech Lead
duration: "12:31"
tags: [harness-engineering, agentes-ia, spec-driven, testes-automatizados]
para: 03_Resources/ferramentas
type: literature-note
---

## Resumo
Harness Engineering e a camada de infraestrutura que transforma modelos de IA
poderosos em agentes confiaveis. O conceito principal e que o gargalo nao esta
na inteligencia do modelo, mas na qualidade do ambiente onde ele opera.

O video apresenta 5 problemas que agentes enfrentam sem harness (geracao sem
restricoes, falta de contexto, sem feedback loops, duplicacao, desperdicio de
tokens) e demonstra o framework Get Shit Done 2 como solucao pratica.

## Conceitos-chave
- **Harness**: ambiente estruturado que guia o agente (specs, testes, contratos)
- **Spec-Driven Development**: especificacoes como contratos entre agentes
- **Evaluation Gates**: checkpoints automatizados de qualidade
- **Self-Correction Loops**: agentes corrigindo erros iterativamente

## Citacoes
> "Imagina so essa cena: da um prompt para um agente e ele sai gerando
> codigo doidao por 40 minutos"
> "Isso nao e um bug do modelo, e um bug do ambiente"

## Action Items
- [ ] Criar SPEC.md para o proximo projeto com agentes
- [ ] Implementar progress.json para tracking de estado
```

## Quality Criteria

- [ ] Frontmatter YAML valido com todos os campos obrigatorios
- [ ] Classificacao PARA coerente com o tema
- [ ] Min 3 tags especificas (nenhuma generica)
- [ ] Min 3 conceitos-chave atomicos
- [ ] Min 2 citacoes diretas preservadas
- [ ] TL;DR captura essencia em 1 paragrafo
- [ ] Transcricao anotada tem indice de secoes

## Veto Conditions

Reject and redo if ANY are true:
1. Frontmatter ausente ou YAML invalido
2. Transcricao anotada e copia identica da transcricao bruta sem anotacoes
