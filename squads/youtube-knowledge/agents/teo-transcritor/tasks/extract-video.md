---
task: "Extract Video"
order: 1
input: |
  - video_url: URL do video YouTube (youtu.be ou youtube.com/watch)
output: |
  - raw-extraction.md: Arquivo com metadata + descricao + transcricao completa
---

# Extract Video

Extrai metadata e transcricao completa de um video YouTube usando yt-dlp e whisper.

## Process

1. Verificar pre-requisitos (yt-dlp, ffmpeg, whisper) via bash
2. Extrair metadata com yt-dlp:
   ```bash
   yt-dlp --print title --print description --print view_count --print like_count --print upload_date --print duration --print channel --skip-download "{url}"
   ```
3. Tentar baixar legendas (prioridade: pt > en > auto-generated):
   ```bash
   yt-dlp --write-auto-sub --sub-lang "pt,en" --skip-download -o "{output_dir}/%(id)s" "{url}"
   ```
4. Se legendas disponíveis: ler .vtt, limpar timestamps, extrair texto puro
5. Se legendas indisponiveis: baixar audio e transcrever:
   ```bash
   yt-dlp -x --audio-format wav -o "{output_dir}/%(id)s.%(ext)s" "{url}"
   whisper "{output_dir}/{id}.wav" --model small --output_dir "{output_dir}/" --output_format txt --language pt
   ```
6. Montar raw-extraction.md com estrutura padrao
7. Limpar arquivos intermediarios (.vtt, .srt, .wav, .txt)

## Output Format

```yaml
title: "Titulo do video"
channel: "Nome do canal"
date: "YYYY-MM-DD"
duration: "HH:MM:SS"
views: N
likes: N
url: "https://..."
transcription_source: "legendas-pt | legendas-en | auto-generated | whisper"
```

## Output Example

```markdown
# Extracao: RAG 3.0 — Subagentes + Virtual File System

**URL:** https://youtu.be/hgLpzI85-cs
**Canal:** Ronnald Hawk (@rhawk.pro)
**Data:** 2026-03-10
**Duracao:** 19:53
**Views:** 8,869 | **Likes:** 673
**Fonte da transcricao:** Legendas auto-generated (PT)

## Descricao
Nesse video eu vou te mostrar a evolucao do RAG...
[descricao completa do video]

## Transcricao
[Legendas auto-generated — pode conter erros menores]

Fala pessoal, beleza? Hoje eu vou falar sobre RAG 3.0...
[transcricao completa limpa]
```

## Quality Criteria

- [ ] Titulo e canal extraidos corretamente
- [ ] Metricas presentes (views, likes, data, duracao)
- [ ] Transcricao com pelo menos 500 caracteres
- [ ] Fonte da transcricao explicitada
- [ ] Descricao completa incluida

## Veto Conditions

Reject and redo if ANY are true:
1. Transcricao esta vazia ou contem apenas timestamps sem texto
2. Metadata essencial ausente (titulo ou canal nao extraidos)
