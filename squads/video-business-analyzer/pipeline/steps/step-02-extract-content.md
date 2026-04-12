---
execution: subagent
agent: vitor-video
inputFile: squads/video-business-analyzer/output/briefing.md
outputFile: squads/video-business-analyzer/output/roteiro-video.md
model_tier: powerful
---

# Step 02: Extrair Conteúdo do Vídeo

## Context Loading

Load these files before executing:
- `squads/video-business-analyzer/output/briefing.md` — URL do vídeo, contexto do usuário e tipo de vídeo
- `squads/video-business-analyzer/pipeline/data/research-brief.md` — Frameworks de referência
- `squads/video-business-analyzer/pipeline/data/anti-patterns.md` — Erros a evitar na extração

## Instructions

### Process

1. Ler o briefing para obter a URL do vídeo, contexto adicional e tipo de vídeo (software ou geral)
2. Acessar o vídeo via WebFetch na URL do YouTube. Extrair título, canal, descrição e todo o conteúdo falado
3. Executar task `extract-video-content.md`: organizar o conteúdo em roteiro estruturado por seções temáticas. Salvar como `output/roteiro-video.md`
4. Executar task `formulate-business-idea.md`: preencher Lean Canvas, formular hipótese, listar perguntas para pesquisa. Salvar como `output/ideia-de-negocio.md`
5. Se tipo de vídeo = "software": executar task `capture-screenshots.md` usando Playwright para navegar pelo vídeo e capturar screenshots das telas. Salvar em `output/referencias-visuais/`
6. Se tipo de vídeo = "geral": pular task de screenshots

## Output Format

Dois arquivos obrigatórios + um condicional:

```
output/roteiro-video.md          — Transcrição organizada por temas
output/ideia-de-negocio.md       — Lean Canvas + hipótese + perguntas
output/referencias-visuais/      — Screenshots + índice (só se software)
```

## Output Example

Ver exemplos completos nos task files:
- `agents/vitor-video/tasks/extract-video-content.md` → exemplo de roteiro
- `agents/vitor-video/tasks/formulate-business-idea.md` → exemplo de Lean Canvas

## Veto Conditions

Rejeitar e refazer se QUALQUER condição for verdadeira:
1. Roteiro incompleto — seções inteiras do vídeo foram omitidas
2. Lean Canvas sem hipótese falsificável — falta segmento, preço ou razão
3. Lacunas não documentadas — o que o vídeo não aborda não foi listado

## Quality Criteria

- [ ] Roteiro organizado por tema (não cronológico bruto)
- [ ] Citações diretas preservadas entre aspas
- [ ] Lean Canvas com 9 blocos e marcações [inferido]/[não mencionado]
- [ ] Lista de perguntas para pesquisa de mercado (mín. 3)
- [ ] Screenshots capturados (se tipo = software)
