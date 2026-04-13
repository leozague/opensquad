---
execution: inline
agent: sofia-sintese
inputFile: squads/youtube-knowledge/output/raw-extraction.md
outputFile: squads/youtube-knowledge/output/vault-note.md
---

# Step 04: Sintese de Conhecimento

## Context Loading

Load these files before executing:
- `squads/youtube-knowledge/output/raw-extraction.md` — metadata + transcricao do video
- `squads/youtube-knowledge/output/video-url.md` — contexto adicional do usuario (se houver)
- `squads/youtube-knowledge/agents/sofia-sintese.agent.md` — persona e instrucoes
- `squads/youtube-knowledge/agents/sofia-sintese/tasks/synthesize-knowledge.md` — task detalhada
- `squads/youtube-knowledge/pipeline/data/domain-framework.md` — framework operacional
- `squads/youtube-knowledge/pipeline/data/output-examples.md` — exemplos de referencia
- `squads/youtube-knowledge/pipeline/data/anti-patterns.md` — erros a evitar

## Instructions

### Process
1. Ler raw-extraction.md completamente (metadata + transcricao)
2. Identificar tema principal, subtemas e conceitos-chave do video
3. Classificar no sistema PARA (Project/Area/Resource/Archive + subpasta)
4. Se necessario, pesquisar termos/pessoas/ferramentas via web_search
5. Gerar vault-note.md com frontmatter YAML completo + todas as secoes
6. Gerar executive-summary.md com TL;DR + bullets + insights + action items
7. Gerar annotated-transcript.md com indice + timestamps + destaques + [NOTA:]
8. Se o usuario forneceu contexto adicional no checkpoint, adaptar os outputs

## Output Format

Tres arquivos separados:

### vault-note.md
```markdown
---
title: "{titulo}"
date: YYYY-MM-DD
source: {url}
channel: "{canal}"
duration: "{duracao}"
tags: [{tag1}, {tag2}, {tag3}]
para: {classificacao}
type: literature-note
---
## Resumo
## Conceitos-chave
## Citacoes
## Conexoes
## Action Items
```

### executive-summary.md
```markdown
# {titulo}
**Canal:** {canal} | **Duracao:** {duracao} | **Views:** {N}
**TL;DR:** {1 paragrafo}
**Pontos-chave:** {bullets}
**Insights nao-obvios:** {observacoes}
**Action items:** {lista priorizada}
```

### annotated-transcript.md
```markdown
# Transcricao: {titulo}
## Indice
1. [{timestamp}] {secao}
---
## [{timestamp}] {secao}
{texto com **destaques** e [NOTA: reflexoes]}
```

## Output Example

```markdown
---
title: "RAG 3.0 — Subagentes + Virtual File System"
date: 2026-04-13
source: https://youtu.be/hgLpzI85-cs
channel: "Ronnald Hawk"
duration: "19:53"
tags: [rag, virtual-file-system, subagentes, busca-semantica, ia-corporativa]
para: 03_Resources/ferramentas
type: literature-note
---

## Resumo
Ronnald Hawk apresenta a evolucao do RAG em 3 geracoes. RAG 1.0 usa busca
por keyword (grep), rapido e barato mas impreciso. RAG 2.0 introduz
embeddings vetoriais com melhor qualidade. RAG 3.0 combina Virtual File
System com subagentes — a mesma arquitetura do Claude Code e Codex.

O insight central: a decisao entre RAG tiers nao e tecnica, e economica.
Busca hibrida (keyword + semantica) oferece o melhor custo-beneficio para
a maioria dos casos de uso.

## Conceitos-chave
- **RAG 1.0**: busca por keyword, rapido e barato, qualidade limitada
- **RAG 2.0**: embeddings vetoriais, melhor qualidade, custo medio
- **RAG 3.0**: VFS + subagentes, qualidade maxima, custo otimizavel
- **Busca hibrida**: keyword + semantica combinados
- **Reranking**: reordenacao pos-busca com retornos decrescentes

## Citacoes
> "No final do dia, RAG e sobre custo versus qualidade"
> "Tem dois tipos de pessoas: quem entende e quem acredita em magica"

## Action Items
- [ ] Avaliar implementacao de busca hibrida no pipeline atual
- [ ] Estudar VFS como camada de abstracao para agentes
- [ ] Comparar custo RAG 2.0 vs 3.0 para o volume atual de documentos
```

## Veto Conditions

Reject and redo if ANY of these are true:
1. Frontmatter YAML ausente ou invalido em vault-note.md
2. Transcricao anotada e copia identica da transcricao bruta sem anotacoes

## Quality Criteria

- [ ] 3 outputs gerados (vault-note, executive-summary, annotated-transcript)
- [ ] Frontmatter completo e valido
- [ ] Classificacao PARA coerente
- [ ] Min 3 conceitos-chave atomicos
- [ ] Min 2 citacoes diretas
- [ ] TL;DR presente no resumo executivo
- [ ] Indice com timestamps na transcricao anotada
- [ ] Action items em pelo menos 2 outputs
