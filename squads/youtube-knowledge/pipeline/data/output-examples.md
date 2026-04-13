# Output Examples — YouTube Knowledge Extraction

## Exemplo 1: Video Tecnico (RAG 3.0)

### Nota Vault
```markdown
---
title: "RAG 3.0 — Subagentes + Virtual File System"
date: 2026-04-13
source: https://youtu.be/hgLpzI85-cs
channel: Ronnald Hawk (@rhawk.pro)
duration: "19:53"
tags: [rag, virtual-file-system, subagentes, busca-semantica, ia-corporativa]
para: 03_Resources/ferramentas
type: literature-note
---

## Resumo
Ronnald Hawk apresenta a evolucao do RAG em 3 geracoes: RAG 1.0 (busca por keyword),
RAG 2.0 (embeddings semanticos) e RAG 3.0 (Virtual File System com subagentes). A
arquitetura RAG 3.0 e a mesma usada pelo Claude Code e Codex, onde um agente principal
delega consultas para subagentes especializados que operam sobre um sistema de arquivos
virtual. O valor principal esta na otimizacao custo-qualidade.

## Conceitos-chave
- **RAG 1.0**: busca por keyword (grep), rapido e barato, baixa qualidade
- **RAG 2.0**: embeddings vetoriais, melhor qualidade, custo medio
- **RAG 3.0**: VFS + subagentes, qualidade maxima, custo otimizavel
- **Busca hibrida**: keyword + semantica, melhor resultado sem custo proporcional (~1.5x)
- **Reranking**: reordenacao pos-busca, retornos decrescentes apos 1.5x custo

## Citacoes
> "No final do dia, RAG e sobre custo versus qualidade"
> "Tem dois tipos de pessoas: quem entende e quem acredita em magica"

## Tabela Comparativa
| Aspecto | RAG 1.0 | RAG 2.0 | RAG 3.0 |
|---------|---------|---------|---------|
| Busca | Keyword | Semantica | VFS + Subagentes |
| Qualidade | Baixa | Media | Alta |
| Custo | Baixo | Medio | Otimizavel |
| Uso | Busca simples | Context retrieval | IA em producao |

## Action Items
- [ ] Avaliar implementacao de busca hibrida no projeto atual
- [ ] Estudar VFS como camada de abstracao para agentes
```

### Resumo Executivo
```
# RAG 3.0 — Subagentes + Virtual File System
**Canal:** Ronnald Hawk | **Duracao:** 19:53 | **Views:** 8,869

**TL;DR:** RAG evoluiu em 3 geracoes. RAG 3.0 usa Virtual File System com subagentes
(mesma arquitetura do Claude Code/Codex) para busca de documentos. O diferencial e a
otimizacao custo-qualidade, nao apenas capacidade tecnica.

**Pontos-chave:**
- RAG 1.0 (keyword) e barato mas impreciso
- RAG 2.0 (vetorial) melhora qualidade com custo proporcional
- RAG 3.0 (VFS + subagentes) e a arquitetura de producao atual
- Busca hibrida (keyword + semantica) oferece melhor custo-beneficio
- Reranking tem retornos decrescentes apos ~1.5x de custo
- A decisao nao e tecnica, e economica

**Insights nao-obvios:**
- O gargalo de RAG nao e a busca, e o custo de tokens na janela de contexto
- Empresas devem escolher RAG tier pela margem do produto, nao pela capacidade

**Action items:**
1. Avaliar custo atual de RAG no pipeline → decidir se upgrade vale a pena
2. Testar busca hibrida como upgrade incremental antes de VFS completo
```

## Exemplo 2: Video Produtividade (Metodo Militar)

### Transcricao Anotada (trecho)
```
# Transcricao: O Metodo Militar Para Nunca Mais Desperdicar um Dia

## Indice
1. [0:00] O problema da falsa produtividade
2. [3:00] Background militar e credibilidade
3. [5:30] Ferramenta 1 — Missao Diaria
4. [8:00] Ferramenta 2 — Blocos de Operacao
5. [11:00] Ferramenta 3 — Pomodoro
6. [14:00] Ferramenta 4 — Revisao Semanal
7. [16:30] Ferramenta 5 — Brain Dump
8. [17:00] Fechamento e desafio

---

## [0:00] O problema da falsa produtividade

**Voce termina o dia exausto e com a sensacao de que nao fez nada que importava.**
Talvez isso ja tenha acontecido com voce. Voce acorda, olha o celular, responde
mensagens, apaga incendios, vai de reuniao em reuniao...

[NOTA: Essa abertura espelha exatamente o padrao de "dia reativo" que eu tenho.
O ponto nao e falta de esforco, e falta de direcao.]

E ai chega no final do dia e pensa: "o que eu fiz hoje?" E a resposta e: um monte
de coisa, mas nada que realmente importa.

## [5:30] Ferramenta 1 — Missao Diaria

**A primeira ferramenta e a mais simples e a mais poderosa: definir UMA missao por dia.**

Nao duas, nao tres. Uma. "Uma coisa, so uma."

[NOTA: Isso se conecta com o conceito de "ONE Thing" do Gary Keller.
A restricao a 1 elimina paralisia por opcoes.]

> "Sem missao definida, qualquer tarefa parece urgente"

...
```
