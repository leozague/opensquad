---
execution: subagent
agent: marina-mercado
inputFile: squads/video-business-analyzer/output/ideia-de-negocio.md
outputFile: squads/video-business-analyzer/output/analise-de-mercado.md
model_tier: powerful
---

# Step 04: Pesquisa de Mercado

## Context Loading

Load these files before executing:
- `squads/video-business-analyzer/output/ideia-de-negocio.md` — Lean Canvas com a ideia formulada e perguntas para pesquisa
- `squads/video-business-analyzer/output/roteiro-video.md` — Roteiro do vídeo para contexto adicional
- `squads/video-business-analyzer/pipeline/data/research-brief.md` — Frameworks de pesquisa
- `squads/video-business-analyzer/pipeline/data/quality-criteria.md` — Critérios de qualidade para análise de mercado
- `squads/video-business-analyzer/pipeline/data/anti-patterns.md` — Erros a evitar na pesquisa

## Instructions

### Process

1. Ler a ideia de negócio (Lean Canvas + hipótese + perguntas) e o roteiro do vídeo para contexto completo
2. Identificar o setor e segmento do produto. Definir os termos de pesquisa
3. Executar task `market-research.md`:
   - Pesquisar TAM (Global + Brasil) via WebSearch em fontes como Statista, IBISWorld, relatórios setoriais
   - Narrowar SAM com critérios geográficos e de segmento
   - Estimar SOM conservador para ano 1
   - Mapear concorrentes diretos (mín. 3), indiretos (mín. 2) e substitutos
   - Compilar SWOT com evidências concretas
   - Responder "por que agora?" com dados
   - Endereçar cada pergunta listada pelo extrator
4. Compilar relatório final com fontes, confiança e gaps. Salvar como `output/analise-de-mercado.md`

## Output Format

Arquivo markdown estruturado com seções:
```
# Análise de Mercado: {Nome do Produto}
## Dimensionamento de Mercado (TAM/SAM/SOM)
## Mapa de Concorrentes (diretos, indiretos, substitutos)
## SWOT
## Por Que Agora?
## Respostas às Perguntas da Extração
## Fontes
## Gaps
```

## Output Example

Ver exemplo completo no task file:
- `agents/marina-mercado/tasks/market-research.md` → exemplo de análise completa

## Veto Conditions

Rejeitar e refazer se QUALQUER condição for verdadeira:
1. TAM sem fonte citável — números inventados sem base em relatórios
2. Zero concorrentes mapeados — sempre há competição direta, indireta ou substitutos

## Quality Criteria

- [ ] TAM/SAM/SOM com fontes e URLs
- [ ] Mín. 3 concorrentes diretos mapeados
- [ ] SWOT com itens específicos e evidências
- [ ] Confiança atribuída a cada finding
- [ ] Gaps documentados
- [ ] Todas as perguntas do extrator endereçadas
