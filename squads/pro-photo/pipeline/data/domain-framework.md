# Domain Framework — Pro Photo

## Processo Operacional

### Fase 1: Input
1. Receber foto pessoal do usuario
2. Receber escolha de estilo (corporate, tech founder, lifestyle, custom)
3. Receber instrucoes adicionais (se houver)

### Fase 2: Analise
1. Avaliar qualidade da foto (resolucao, iluminacao, visibilidade do rosto)
2. Identificar caracteristicas visiveis (posicao, expressao, enquadramento atual)
3. Determinar viabilidade como referencia (rosto visivel, resolucao minima)
4. Se foto inadequada: informar e pedir nova foto

### Fase 3: Direcao Artistica
1. Baseado no estilo escolhido, definir:
   - Background (tipo, cor, nivel de desfoque)
   - Iluminacao (direcao, intensidade, tipo)
   - Enquadramento (headshot, meio corpo, distancia)
   - Expressao desejada (confiante, acessivel, seria)
2. Craftar prompt detalhado para o modelo de IA
3. Incluir anchors de naturalidade ("natural skin texture", "natural expression")

### Fase 4: Geracao
1. Gerar em modo test primeiro (barato, para validacao)
2. Apresentar resultado ao usuario
3. Se aprovado, gerar em modo production (alta qualidade)
4. Se rejeitado, ajustar prompt e regerar

### Fase 5: Revisao
1. Aplicar 5 testes de qualidade
2. Comparar com foto original (semelhanca)
3. Verificar adequacao para redes sociais
4. Emitir veredicto APPROVE/REJECT

## Estilos Disponiveis

| Estilo | Background | Iluminacao | Roupa | Tom |
|--------|-----------|-----------|-------|-----|
| Corporate | Cinza neutro gradiente | Softbox frontal + fill | Formal/social | Confiante, serio |
| Tech Founder | Escritorio moderno/urbano bokeh | Luz natural lateral | Casual premium | Acessivel, inovador |
| Lifestyle | Externo/cafe bokeh | Luz dourada/golden hour | Smart casual | Descontraido, autentico |
| Custom | Definido pelo usuario | Definido pelo usuario | Definido pelo usuario | Definido pelo usuario |
