# Anti-Patterns — Pro Photo

## Erros na Analise

1. **Inventar caracteristicas**: Descrever cor dos olhos, formato do rosto ou detalhes nao visiveis na foto. O modelo gera pessoa diferente se a descricao nao bater.

2. **Aceitar foto inadequada**: Foto com rosto nao visivel, resolucao muito baixa (<400px) ou filtros pesados nao serve como referencia. Informar o usuario e pedir outra.

## Erros no Prompt

3. **Empilhar keywords de qualidade**: "8K ultra HD photorealistic 4K masterpiece best quality" causa aspecto artificial e ceroso. Usar 1-2 anchors: "hyper realistic, professional photography".

4. **Pedir "perfect skin"**: Remove textura natural (poros, linhas). Sempre usar "natural skin texture with visible pores".

5. **Descrever roupa diferente**: Modelos de IA nao trocam roupa de forma confiavel. Manter a roupa da foto ou nao mencionar.

6. **Prompt generico**: "Make this photo professional" nao produz bons resultados. Precisa de direcao artistica especifica (iluminacao, background, enquadramento).

## Erros na Geracao

7. **Ir direto para production**: Modo production custa 5-7x mais. Sempre testar em modo test primeiro.

8. **Gerar multiplas variacoes**: "Vou gerar 5 opcoes" desperdia tokens. Gerar 1, avaliar, ajustar prompt se necessario.

## Erros na Revisao

9. **Aprovar sem comparar**: Sempre colocar foto original e gerada lado a lado. Foto bonita mas nao reconhecivel e inutil.

10. **Avaliar por estetica pessoal**: Usar os 5 testes objetivos, nao gosto pessoal. Uma foto "menos bonita" mas mais natural e melhor que uma "perfeita" mas artificial.

11. **Ignorar bordas**: Halos e brilhos nas bordas sao o artefato mais comum e mais perceptivel em perfis pequenos (profile pictures).

12. **Nao verificar olhos**: Catchlights inconsistentes sao o sinal mais claro de foto gerada por IA. Verificar sempre.
