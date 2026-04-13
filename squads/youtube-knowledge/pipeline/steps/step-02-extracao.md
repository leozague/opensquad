---
execution: subagent
agent: teo-transcritor
model_tier: fast
inputFile: squads/youtube-knowledge/output/video-url.md
outputFile: squads/youtube-knowledge/output/raw-extraction.md
---

# Step 02: Extracao do Video

## Context Loading

Load these files before executing:
- `squads/youtube-knowledge/output/video-url.md` — URL do video e contexto do usuario
- `squads/youtube-knowledge/agents/teo-transcritor.agent.md` — persona e instrucoes do agente
- `squads/youtube-knowledge/agents/teo-transcritor/tasks/extract-video.md` — task com processo detalhado

## Instructions

### Process
1. Ler a URL do video do arquivo de input
2. Verificar pre-requisitos CLI (yt-dlp, ffmpeg, whisper)
3. Extrair metadata via yt-dlp (titulo, canal, descricao, views, likes, data, duracao)
4. Tentar baixar legendas (pt > en > auto-generated)
5. Se legendas disponiveis: limpar timestamps e extrair texto
6. Se legendas indisponiveis: baixar audio WAV e transcrever com whisper
7. Montar raw-extraction.md com metadata + descricao + transcricao
8. Limpar arquivos intermediarios

## Output Format

```markdown
# Extracao: {titulo}

**URL:** {url}
**Canal:** {canal}
**Data:** {YYYY-MM-DD}
**Duracao:** {HH:MM:SS}
**Views:** {N} | **Likes:** {N}
**Fonte da transcricao:** {legendas-pt | legendas-en | auto-generated | whisper}

## Descricao
{descricao completa}

## Transcricao
[{nota sobre fonte}]

{transcricao completa limpa}
```

## Output Example

```markdown
# Extracao: O Metodo Militar Para Nunca Mais Desperdicar um Dia

**URL:** https://youtu.be/8nNgxTNd7wc
**Canal:** Ernesto Reis
**Data:** 2025-11-15
**Duracao:** 18:33
**Views:** 263,000 | **Likes:** 23,500
**Fonte da transcricao:** Legendas auto-generated (PT)

## Descricao
Nesse video eu vou te ensinar 5 ferramentas que eu usei nas forcas especiais...

## Transcricao
[Legendas auto-generated — pode conter erros menores]

Voce termina o dia exausto e com a sensacao de que nao fez nada que importava.
Talvez isso ja tenha acontecido com voce...
```

## Veto Conditions

Reject and redo if ANY of these are true:
1. Transcricao vazia ou com menos de 500 caracteres para video > 5min
2. Titulo ou canal nao extraidos

## Quality Criteria

- [ ] Metadata completa (titulo, canal, data, duracao, views, likes)
- [ ] Transcricao presente e substancial
- [ ] Fonte da transcricao indicada
- [ ] Descricao do video incluida
- [ ] Arquivos intermediarios limpos
