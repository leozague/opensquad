# Output Examples — Pro Photo

## Exemplo 1: Estilo Corporate

### Analise
```
## Analise da Foto Original
- Rosto: visivel, frontal, boa resolucao (~1200x1600)
- Iluminacao atual: luz natural lateral, sombra leve no lado direito
- Expressao: sorriso casual, olhar para camera
- Background atual: sala de estar, desfocado
- Roupa: camiseta azul
- Viabilidade: ADEQUADA para referencia

## Direcao Artistica (Corporate)
- Background: cinza neutro gradiente, leve vinheta
- Iluminacao: softbox principal a 45 graus esquerda, fill a direita, rim light sutil
- Enquadramento: headshot busto, centralizado, espaco 15% acima da cabeca
- Expressao: confiante, leve sorriso profissional, olhar direto
- Roupa: manter como esta (modelo nao altera roupa de forma confiavel)
```

### Prompt Gerado
```
Professional corporate headshot portrait, soft studio lighting from upper left
at 45 degrees with gentle fill from right side, subtle rim light,
neutral gray gradient background with slight vignette,
confident natural smile, direct eye contact, relaxed shoulders,
natural skin texture with visible pores, natural expression,
hyper realistic, professional photography, clean composition,
portrait 1:1 aspect ratio, shot with 85mm lens at f/2.8
```

### Comando de Geracao
```bash
python3 skills/image-ai-generator/scripts/generate.py \
  --prompt "Professional corporate headshot portrait..." \
  --output "squads/pro-photo/output/{run_id}/v1/professional-photo.jpg" \
  --reference "/path/to/user-photo.jpg" \
  --mode test
```

## Exemplo 2: Estilo Tech Founder

### Direcao Artistica
```
## Direcao Artistica (Tech Founder)
- Background: escritorio moderno com bokeh suave, tons quentes
- Iluminacao: luz natural de janela lateral, suave e difusa
- Enquadramento: headshot meio corpo, leve angulo, espaco criativo
- Expressao: acessivel, sorriso genuino, olhar confiante
- Ambiente: sugere inovacao sem ser artificial
```

### Prompt Gerado
```
Professional headshot portrait of a tech entrepreneur,
natural window light from left side creating soft shadows,
modern office background with warm bokeh,
genuine approachable smile, confident direct eye contact,
natural skin texture with visible pores, relaxed natural pose,
hyper realistic, editorial photography style, clean composition,
portrait 1:1 aspect ratio, shot with 50mm lens at f/1.8
```
