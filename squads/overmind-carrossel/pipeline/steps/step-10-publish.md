---
execution: inline
agent: creator
inputFile: squads/overmind-carrossel/output/carousel-content.md
outputFile: squads/overmind-carrossel/output/publish-result.md
---

# Step 10: Publicação no Instagram

## Context Loading

Load these files before executing:
- `squads/overmind-carrossel/output/carousel-content.md` — carrossel aprovado
- `squads/overmind-carrossel/output/review-result.md` — resultado da revisão (para confirmar APPROVE)

## Instructions

### Process
1. Verificar que o review-result.md contém veredicto APPROVE ou CONDITIONAL APPROVE.
2. Coletar as imagens renderizadas dos slides (JPEGs).
3. Preparar caption e hashtags do carousel-content.md.
4. Usar a skill `instagram-publisher` para:
   a. Validar formato (JPEG, 1080x1440, 2-10 imagens, caption < 2200 chars)
   b. Apresentar preview completo ao usuário
   c. Executar dry-run
   d. Aguardar confirmação explícita do usuário
   e. Publicar
   f. Reportar URL do post publicado
5. Salvar resultado no outputFile.

**IMPORTANTE:** Nunca publicar sem confirmação explícita do usuário. Dry-run não é permissão para publicar.

## Output Format

```markdown
# Publish Result

## Status: [SUCCESS / FAILED / SKIPPED]
## Platform: Instagram
## Post URL: [URL do post]
## Post ID: [ID]
## Published: [YYYY-MM-DD HH:MM UTC]
## Rate Limit: [X/25 posts used]

## Notes
[Qualquer observação relevante]
```

## Output Example

```markdown
# Publish Result

## Status: SUCCESS
## Platform: Instagram
## Post URL: https://www.instagram.com/p/ABC123xyz/
## Post ID: 17899506834567890
## Published: 2026-04-09 18:32:07 UTC
## Rate Limit: 4/25 posts used in last 24h

## Notes
Carrossel publicado com 8 slides. Todas as validações passaram no dry-run.
```

## Veto Conditions

Reject and redo if ANY are true:
1. Review result não contém APPROVE ou CONDITIONAL APPROVE
2. Publicação executada sem confirmação explícita do usuário

## Quality Criteria

- [ ] Review veredicto verificado antes de publicar
- [ ] Preview apresentado ao usuário
- [ ] Dry-run executado e passado
- [ ] Confirmação explícita recebida
- [ ] URL do post reportada após sucesso
