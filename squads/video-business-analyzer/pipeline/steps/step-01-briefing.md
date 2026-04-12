---
type: checkpoint
outputFile: squads/video-business-analyzer/output/briefing.md
---

# Step 01: Briefing

Coleta as informações iniciais do usuário antes de iniciar a análise.

## Perguntas ao Usuário

### 1. URL do Vídeo
Qual o link do vídeo do YouTube que você quer analisar?

*(Campo livre — o usuário cola a URL)*

### 2. Contexto Adicional
Você já tem algum contexto sobre esse vídeo ou a ideia de negócio?
Pode ser qualquer informação que ajude na análise — setor, público-alvo, seu interesse específico.

*(Campo livre — o usuário pode digitar contexto ou pular)*

### 3. Tipo de Vídeo
O vídeo mostra telas de um software ou ferramenta?

1. **Sim, é sobre um software** — Vou capturar screenshots das telas como referência visual
2. **Não, é um vídeo geral** — Só extrair o conteúdo e analisar a ideia

### Formato do Briefing Salvo

```markdown
# Briefing: Video Business Analyzer

**URL:** {url}
**Contexto do usuário:** {contexto ou "Nenhum contexto adicional"}
**Tipo de vídeo:** {software | geral}
**Data:** {YYYY-MM-DD}
```
