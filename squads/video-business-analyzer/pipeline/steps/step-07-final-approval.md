---
type: checkpoint
---

# Step 07: Aprovação Final

Checkpoint final para o usuário revisar todos os documentos produzidos pelo squad e aprovar ou solicitar ajustes.

## Apresentação ao Usuário

Mostrar resumo de todos os outputs:

1. **Roteiro do Vídeo** — Título, canal, número de seções extraídas
2. **Ideia de Negócio** — Hipótese formulada (1 frase)
3. **Análise de Mercado** — TAM/SAM/SOM resumidos, número de concorrentes mapeados
4. **Plano de Negócio** — Modelo de receita, unit economics (LTV/CAC)
5. **Plano de Execução** — MVP scope, número de fases, budget total estimado
6. **Relatório de Revisão** — Verdict e score geral
7. **Referências Visuais** (se houver) — Número de screenshots capturados

Informar os caminhos dos arquivos para o usuário poder abrir e revisar:
```
squads/video-business-analyzer/output/
├── roteiro-video.md
├── ideia-de-negocio.md
├── analise-de-mercado.md
├── plano-de-negocio.md
├── plano-de-execucao.md
├── review-report.md
└── referencias-visuais/ (se aplicável)
```

## Perguntas ao Usuário

1. Resultado aprovado?
   - Sim, tudo certo — finalizar
   - Quero ajustar algum documento — solicitar correções
   - Rodar novamente com outro vídeo
