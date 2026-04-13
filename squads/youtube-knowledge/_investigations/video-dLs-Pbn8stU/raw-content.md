# Raw Content: Video dLs-Pbn8stU (YouTube)
Investigated: 2026-04-13
Total contents analyzed: 1

---

## Content 1: YouTube Video | 12:31 | Technology/AI Development

**Date:** 2026-04-10  
**Metrics:** 21,406 views | 1,833 likes  
**URL:** https://youtu.be/dLs-Pbn8stU  
**Video ID:** dLs-Pbn8stU

### Title
Spec Driven chegou no limite — Harness Engineering é o próximo passo

### Description
A próxima fase do desenvolvimento agêntico vai precisar mais do que specs, e eu te mostro como harness engineering quer resolver isso.

🎫 Participe do meu workshop de IA avançado https://tinyurl.com/mr3wyaas

Spec Driven é só metade do caminho. A OpenAI gerou 1 milhão de linhas de código sem escrever nenhuma manualmente. A Anthropic fez agentes construirem apps inteiros em sessões de dias. O segredo? Harness Engineering — o conceito que transforma agentes capazes em agentes confiáveis.

📌 Capítulos:
0:00 O problema dos agentes de IA
1:07 O que é Harness Engineering
2:38 Por que agentes falham sem harness
2:58 Spec Driven já resolve isso?
3:13 Problema 1
3:40 Problema 2
5:38 Problema 3
6:24 Problema 4
8:09 Problema 5
8:53 Harness na prática
11:01 Evaluation e QA automático
12:04 O fundamento de Harness Engineering
12:21 Conclusão

💎 Esteja à frente na transformação da IA, venha para a Tech Leads club https://tinyurl.com/c8uf6h28

Aprenda Spec-Driven Development https://youtu.be/YFDp-smGYqQ

Links mostrados:
- https://openai.com/index/harness-engineering/
- https://www.anthropic.com/engineering/harness-design-long-running-apps
- https://martinfowler.com/articles/harness-engineering.html
- Skill TLC spec-driven https://agent-skills.techleads.club/skills/tlc-spec-driven/
- Get Shit Done 2 - https://github.com/gsd-build/gsd-2

### Transcription

Imagina só essa cena, dá um prompt para um agente de a constrói uma aplicação full stack com autenticação, dashboard e integração com stripe. O agente sai gerando código doidão por 40 minutos. Quando termina, tu abre um DIF de 3.000 linhas alteradas. Metade funciona, metade não compila, tem feature duplicada, ele sobrescreveu um teste, ele deletou teste, ele declarou tudo como pronto e tu gastou um monte de token. Isso não é um bug do modelo. Os modelos de hoje são muito capazes. O problema é que ninguém ensinou ele como trabalhar. E se a gente quer escalar como indústria, além de fazer só funcionalidades com IA para fazer aplicações inteiras, a gente tem que resolver esse problema. E eu vou te mostrar como as grandes empresas estão trabalhando para atacar isso. A Openi acabou de gerar 1 milhão de linhas de código sem nenhuma linha escrita por humano e tudo funcionou. A Antrópic fez agentes construirem apps inteiros em sessões que deram dias. E a diferença entre o que eles fizeram, que a maioria de nós fazemos é Harness Engineering. E nesse vídeo eu não vou só te explicar porque que ser o próximo passo necessário no desenvolvimento com IA, como também vou te mostrar um exemplo de uma ferramenta que implementa harness engineering na prática. Então fica no vídeo que eu vou te mostrar a teoria e a prática para estar pronto pra próxima fase do desenvolvimento com IR. Bom, primeira coisa, o que que é harness? O modelo é a LLM, o cloud, GPT5, o que for. Harness é o todo o resto, a coisas, as coisas que estão na volta, as instruções, a estrutura do repositório, os linters, os testes, os arquivos de progresso, os scripts de setup, é o ambiente operacional que envolve o modelo. Pensa assim, o modelo é um engenheiro, uma pessoa brilhante que acabou de ser contratado. Ele é capaz de escrever qualquer coisa, mas se tu largar ele num repositório sem RIDM, sem arquitetura documentada, sem Cis, sem testes, ele vai fazer bobagem. Não porque ele é burro, mas porque ele não tem contexto. Ele vai fazer baseado na experiência dele e vai errar porque ele não tem o contexto daquele projeto. E o Harnes é o onboard desse engenheiro. É o que transforma um modelo poderoso e um agente confiável, que é o que a gente mais precisa hoje como indústria. Esse conceito explodiu em fevereiro de 2026 com blog e posts da Open AI, da Antropic e agora também no blog do Martin Fler. Eles estão trazendo artigos detalhados sobre o tema que a gente pode entender para onde as coisas estão indo e já preparar o nosso ambiente para isso. E a conclusão de todos eles é a mesma. O gargalo não é mais a inteligência do modelo, é a qualidade do ambiente onde ele opera. Por isso que harness é a chave. Então, olhando para esse diagrama na tela, o harness é todo o ambiente. Então, a gente tem o feed forward, que eu vou falar mais sobre ele, que são os

