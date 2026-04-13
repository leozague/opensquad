---
task: "Analyze and Generate"
order: 1
input: |
  - photo_path: Caminho para a foto pessoal do usuario
  - style: Estilo escolhido (corporate, tech-founder, lifestyle, custom)
  - instructions: Instrucoes adicionais do usuario (opcional)
output: |
  - professional-photo.jpg: Foto profissional gerada via IA
  - generation-report.md: Relatorio com analise, direcao artistica e prompt usado
---

# Analyze and Generate

Analisa a foto pessoal do usuario, define direcao artistica conforme o estilo escolhido, crafta prompt otimizado e gera a foto profissional via image-ai-generator.

## Process

1. Ler o photo-brief.md para obter caminho da foto, estilo e instrucoes
2. Ler a foto original usando o Read tool (imagem) para analisar visualmente:
   - Rosto: visibilidade, angulo, resolucao
   - Iluminacao: tipo, direcao, qualidade
   - Expressao: natural, forçada, neutra
   - Background: tipo, complexidade
   - Roupa: formal, casual, esportiva
3. Avaliar viabilidade como referencia:
   - Rosto visivel e frontal/semi-frontal? Se nao: informar usuario
   - Resolucao aceitavel (>400px largura)? Se nao: informar usuario
4. Definir direcao artistica baseada no estilo:
   - Corporate: fundo cinza gradiente, softbox frontal + fill, expressao confiante
   - Tech Founder: fundo escritorio/urbano bokeh, luz natural lateral, expressao acessivel
   - Lifestyle: fundo externo/cafe bokeh, luz dourada, expressao descontraida
   - Custom: seguir instrucoes do usuario
5. Craftar prompt com:
   - Descricao do cenario e iluminacao desejados
   - "natural skin texture with visible pores, natural expression"
   - "hyper realistic, professional photography"
   - Lente simulada (85mm f/2.8 para corporate, 50mm f/1.8 para lifestyle)
   - Aspecto 1:1 para versatilidade multi-plataforma
6. Gerar em modo test:
   ```bash
   python3 skills/image-ai-generator/scripts/generate.py \
     --prompt "{prompt}" \
     --output "{output_path}" \
     --reference "{photo_path}" \
     --mode test
   ```
7. Verificar resultado visualmente (Read tool na imagem gerada)
8. Salvar generation-report.md com analise + direcao + prompt

## Output Format

```yaml
files:
  - professional-photo.jpg  # foto gerada
  - generation-report.md    # relatorio
report_structure:
  - Analise da Foto Original
  - Direcao Artistica
  - Prompt Usado
  - Modo de Geracao
  - Observacoes
```

## Output Example

```markdown
# Generation Report

## Analise da Foto Original
- Rosto: visivel, frontal, resolucao ~1200x1600
- Iluminacao: luz natural lateral, sombra leve no lado direito
- Expressao: sorriso casual, olhar para camera
- Background: sala de estar, desfocado
- Roupa: camisa polo azul
- Viabilidade: ADEQUADA para referencia

## Direcao Artistica (Corporate)
- Background: cinza neutro gradiente, leve vinheta
- Iluminacao: softbox principal 45 graus esquerda, fill direita, rim light sutil
- Enquadramento: headshot busto, centralizado
- Expressao: confiante, leve sorriso profissional
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

## Quality Criteria

- [ ] Analise da foto original esta documentada
- [ ] Direcao artistica alinhada ao estilo escolhido
- [ ] Prompt contem "natural skin texture" e "natural expression"
- [ ] Prompt NAO contem keywords empilhadas (max 2 anchors de qualidade)
- [ ] Foto gerada tem resolucao >= 1024x1024
- [ ] Generation report salvo com todos os campos

## Veto Conditions

Reject and redo if ANY are true:
1. Foto original nao tem rosto visivel e nao foi possivel gerar resultado reconhecivel
2. Prompt contem "perfect skin", "flawless" ou mais de 3 keywords de qualidade empilhadas
