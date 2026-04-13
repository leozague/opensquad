# Raw Content: Video hgLpzI85-cs (YouTube)

**Investigated:** 2026-04-13  
**Total contents analyzed:** 1

---

## Content 1: RAG 3.0: Subagentes + Virtual File System | Nova Arquitetura

**Date:** 2026-03-10  
**Duration:** 19:53  
**Metrics:** 8,869 views | 673 likes  
**URL:** https://youtu.be/hgLpzI85-cs  
**Channel:** Ronnald Hawk (rhawk.pro)  

### Title
RAG 3.0: Subagentes + Virtual File System | Nova Arquitetura

### Description
Neste vídeo você vai entender a evolução completa do RAG e aprender a técnica mais avançada da área usando Virtual File System com subagentes — a mesma arquitetura utilizada pelo Claude Code e pelo Codex. Você vai ver na prática como criar um sistema de arquivos virtual com backend em banco de dados, como um agente principal delega pesquisas para um subagente usando comandos de filesystem. 

Você também vai entender as diferenças reais entre RAG 1.0, 2.0 e 3.0, quando usar busca híbrida com reranking, como escolher o modelo certo para chamada de ferramentas, e como equilibrar qualidade de resposta com custo de operação em produção. Para desenvolvedores e profissionais que querem construir soluções de IA corporativa de verdade, com foco em resultado e viabilidade financeira.

### Chapter Markers
- 00:00 Introdução
- 00:24 Explorando a implementação e o file system
- 03:34 RAG 1.0 vs RAG 2.0 vs RAG 3.0
- 08:51 Explorando busca com subagentes + Virtual file System
- 16:35 Quando usar cada geração de RAG

### Full Transcription

Ha é um dos assuntos mais importantes quando a gente fala de a corporativa. E apesar de muito importante, esse é um dos assuntos mais mal compreendidos. Se você ficar até o final do vídeo, você vai aprender uma nova técnica com o Virtual File System e vai ter o poder de comparar essa técnica com as outras e decidir qual é melhor paraa sua solução.

Eu sou o Hulk, eu crio soluções de a, coloco em produção e lucro com isso. Bora pro vídeo. Então, vamos embora aqui pra solução. Já vou fazer uma quer aqui, perguntar quais documentos você tem acesso, tá? E aí eu vou explicando esse agente aqui ao longo do tempo. A gente vai ver que ele vai chamar ferramenta, ele vai listar os documentos e eventualmente ele vai responder pra gente, correto? Você vê que foi tudo muito rápido, você vai entender como isso tá implementado e como isso tá feito e como que ele tá usando o ls, tá? Mas antes de eu entrar daqui paraa frente, é um recado claro.

Existem dois tipos de pessoas nesse mundo de agora. As pessoas que entenderam o jogo e estão se adaptando e as pessoas que acreditam que é mágica. que acontece magicamente, você fica rico. Se você tá no segundo grupo, esse vídeo não é para você. Você tá no primeiro grupo ou quer entrar no primeiro grupo, fica aqui que você vai aprender um monte de coisa. Beleza?

Então vamos lá. O que que aconteceu aqui? Eu fiz uma query aqui, né? Uma pergunta, né? Isso aqui é um chat, tem um agente aqui por baixo, vou mostrar para vocês, mas pensa nisso aqui como um agente. Ele poderia estar no WhatsApp, ele poderia estar no Telegram, ele poderia est onde você quisesse. Beleza? Tá? E eu perguntei quais documentos ele tem acesso. Beleza? E aí você viu que ele deu um LS. E se você não é familiar com isso aqui, eu vou te mostrar já já. E ele listou um PEF. O que que é um PEF? É um caminho, é um lugar, correto? É um lugar no teu computador, por exemplo.

[... continues for full 1663 lines of transcript ...]

você não vai ter tão bons resultados quanto esse aqui, mas você vai conseguir bons resultados. E o que que você pode fazer? Você pode fazer uma regra aqui, 1.5, tá? Você pode fazer 1.5, nada vai te impedir, tá? Você vai adicionar essa técnica aqui de busca híbrida aqui, tá? Então você vai entrar ali, você faz uma busca híbrida aqui logo de cara e integra para LLM já o resultado pronto.

Usando essas técnicas aqui, o teu resultado vai disparar de qualidade. Você vai ver que é absurdamente melhor fazer busca híbrida do que fazer busca semântica apenas. Beleza? Espero que você tenha curtido. Espero que agora você saiba a diferença entre essas três gerações. Beleza? Só recapitulando, reg, tá? Se você tá perdido nesse termo, é retrieval e geração aumentada. O que que é retrieval? É busca.

Então, exatamente isso aqui, tá? Então, reg não tá preso a um banco de dados vetorial, não tá preso a alguma coisa do tipo. É só um método de você pegar o dado, dar para LLM e gerar resposta. No final do dia você quer gerar a resposta correta. Todas essas técnicas têm custo e cabe a você que cria a solução ou que quer criar um negócio ao redor disso, descobrir aonde tá a melhor oportunidade, aonde tá a melhor qualidade e tirar proveito do teu conhecimento. No fim do dia, conhecimento é poder. Valeu, abraço.
