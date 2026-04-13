# Research Brief — Pro Photo

## Prompts para Headshots Profissionais

### Parametros Essenciais
- **Iluminacao**: "soft studio lighting from upper left with gentle fill from right" — funciona universalmente
- **Expressao**: "slight natural smile, direct eye contact, relaxed and confident"
- **Background**: simples e neutro. Corporate = cinza gradiente. Tech = escritorio desfocado. Lifestyle = externo bokeh
- **Roupa**: comunica setor e senioridade instantaneamente. Nao precisa descrever em detalhe
- **Enquadramento**: headshot de busto, centralizado, espaco acima da cabeca

### Qualidade do Prompt
- 1-2 anchors de qualidade suficientes: "hyper realistic, professional photography"
- Nunca empilhar: "8K ultra HD photorealistic 4K masterpiece" causa aspecto artificial
- Sempre incluir: "natural skin texture with visible pores" — previne pele cerosa
- Sempre incluir: "natural expression" — previne rigidez

### Uso de Referencia
- A foto pessoal do usuario e passada via --reference ao image-ai-generator
- O prompt descreve a DIRECAO ARTISTICA, nao a pessoa
- Descrever apenas o que e visivel na foto original — nunca inventar caracteristicas

## Anti-Patterns do Dominio

1. **Pele cerosa/perfeita**: AI overcorrige e remove textura natural. Poros e linhas de expressao sao essenciais
2. **Poses rigidas**: perda de micro-expressoes = aspecto mannequin
3. **Catchlights inconsistentes**: reflexos nos olhos com tamanho/posicao diferente = sinal de IA
4. **Halos nas bordas**: brilho/blur entre pessoa e fundo = artefato mais comum
5. **Input ruim**: sombras duras, flash, filtros Instagram confundem o modelo

## Criterios de Qualidade (5 Testes)

1. **Teste do Espelho**: "voce com boa luz" = pass. "Nao e voce" = fail
2. **Teste da Pele**: zoom 200% mostra textura natural, nao cera
3. **Teste dos Olhos**: catchlights consistentes nos dois olhos, fisicamente plausiveis
4. **Teste das Bordas**: transicao cabelo/roupa limpa, sem halo
5. **Teste do Video Call**: reconhecimento ao vivo apos ver a foto

## Benchmarks de Mercado

| Servico | Forte | Fraco |
|---------|-------|-------|
| BetterPic | 4K, edicao humana, maior realismo | Mais lento |
| Aragon AI | 15min turnaround, 90% usavel | Resolucao base |
| HeadshotPro | Volume ($0.39/headshot) | Qualidade variavel |

Resolucao minima: 1024x1024 para LinkedIn/web.
