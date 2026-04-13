---
execution: inline
agent: fabricio-fotografia
inputFile: squads/pro-photo/output/photo-brief.md
outputFile: squads/pro-photo/output/professional-photo.jpg
---

# Step 02: Geracao da Foto Profissional

## Context Loading

Load these files before executing:
- `squads/pro-photo/output/photo-brief.md` — foto do usuario, estilo e instrucoes
- `squads/pro-photo/agents/fabricio-fotografia.agent.md` — persona e instrucoes
- `squads/pro-photo/agents/fabricio-fotografia/tasks/analyze-and-generate.md` — task detalhada
- `squads/pro-photo/pipeline/data/research-brief.md` — melhores praticas de prompts
- `squads/pro-photo/pipeline/data/output-examples.md` — exemplos de referencia
- `squads/pro-photo/pipeline/data/anti-patterns.md` — erros a evitar

## Instructions

### Process
1. Ler photo-brief.md para obter caminho da foto, estilo e instrucoes
2. Ler a foto original usando Read tool (visualizar a imagem)
3. Analisar: rosto, iluminacao, pose, background, roupa, viabilidade
4. Definir direcao artistica baseada no estilo escolhido
5. Craftar prompt otimizado (com anchors de naturalidade, sem keywords empilhadas)
6. Gerar foto em modo test via image-ai-generator com --reference
7. Verificar resultado visualmente
8. Salvar generation-report.md e a foto gerada

## Output Format

```markdown
# Generation Report

## Analise da Foto Original
- Rosto: {visibilidade, angulo, resolucao}
- Iluminacao: {tipo, direcao}
- Expressao: {descricao}
- Background: {descricao}
- Roupa: {descricao}
- Viabilidade: {ADEQUADA | INADEQUADA + motivo}

## Direcao Artistica ({estilo})
- Background: {descricao}
- Iluminacao: {descricao}
- Enquadramento: {descricao}
- Expressao: {descricao}
- Lente: {descricao}

## Prompt Usado
"{prompt completo}"

## Geracao
- Modo: test | production
- Modelo: {nome do modelo}
- Custo estimado: ~R${valor}
```

## Output Example

```markdown
# Generation Report

## Analise da Foto Original
- Rosto: visivel, frontal, resolucao ~1200x1600
- Iluminacao: luz natural lateral, sombra leve no lado direito
- Expressao: sorriso casual, olhar para camera
- Background: sala de estar, desfocado
- Roupa: camisa polo azul marinho
- Viabilidade: ADEQUADA para referencia

## Direcao Artistica (Corporate)
- Background: cinza neutro gradiente, leve vinheta
- Iluminacao: softbox principal 45 graus esquerda, fill direita, rim light sutil
- Enquadramento: headshot busto, centralizado, 15% espaco acima
- Expressao: confiante, leve sorriso profissional, olhar direto
- Lente: 85mm f/2.8

## Prompt Usado
"Professional corporate headshot portrait, soft studio lighting from upper left
at 45 degrees with gentle fill from right side, subtle rim light,
neutral gray gradient background with slight vignette,
confident natural smile, direct eye contact, relaxed shoulders,
natural skin texture with visible pores, natural expression,
hyper realistic, professional photography, clean composition,
portrait 1:1 aspect ratio, shot with 85mm lens at f/2.8"

## Geracao
- Modo: test
- Modelo: sourceful/riverflow-v2-fast
- Custo estimado: ~R$0.02
```

## Veto Conditions

Reject and redo if ANY of these are true:
1. Prompt contem "perfect skin", "flawless" ou mais de 3 keywords de qualidade empilhadas
2. Foto nao foi gerada (script retornou erro)

## Quality Criteria

- [ ] Analise da foto original documentada com todos os campos
- [ ] Direcao artistica alinhada ao estilo escolhido
- [ ] Prompt contem "natural skin texture" e "natural expression"
- [ ] Foto gerada com sucesso
- [ ] Generation report salvo
