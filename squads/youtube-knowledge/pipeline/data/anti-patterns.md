# Anti-Patterns — YouTube Knowledge Extraction

## Erros na Extracao

1. **Fabricar transcricao**: Nunca inventar conteudo quando a extracao falha. Reportar erro e tentar metodo alternativo (legendas → whisper → manual).

2. **Truncar sem avisar**: Se a transcricao for parcial, indicar claramente "[TRANSCRICAO PARCIAL — {motivo}]" no inicio do arquivo.

3. **Ignorar metadata**: Views, likes, data e duracao sao contexto essencial. Sem eles, a nota perde valor de referencia.

## Erros na Sintese

4. **Copiar transcricao como resumo**: A nota vault NAO e a transcricao reformatada. E uma sintese com conceitos atomizados, classificacao e action items.

5. **Tags genericas**: Tags como "video", "youtube", "interessante" nao tem valor. Usar tags especificas: "rag", "produtividade", "harness-engineering".

6. **Frontmatter incompleto**: Toda nota PRECISA de: title, date, source, channel, tags, para, type. Campos faltantes quebram queries no Dataview.

7. **Action items vagos**: "Estudar mais sobre o assunto" nao e acionavel. "Implementar busca hibrida no pipeline de RAG do projeto X" e acionavel.

8. **Parafrasear quotes**: Citacoes devem ser preservadas exatamente como foram ditas. Se o criador disse "beleza?", manter "beleza?" na quote.

## Erros na Revisao

9. **Aprovar sem ler**: Cada output exige leitura completa. Uma nota com frontmatter quebrado que passa pela revisao e pior que uma nota rejeitada.

10. **Rejeitar sem instrucoes**: "A nota precisa melhorar" nao e feedback. "O campo `para:` esta classificado como 02_Areas mas o conteudo e referencia tecnica — deveria ser 03_Resources/ferramentas" e feedback.

## Erros na Classificacao

11. **Confundir Area com Resource**: Areas sao responsabilidades continuas (saude, financas). Resources sao conhecimento para referencia (tutoriais, frameworks).

12. **Nao classificar**: Toda nota PRECISA de endereco PARA. Notas sem classificacao se perdem no vault.
