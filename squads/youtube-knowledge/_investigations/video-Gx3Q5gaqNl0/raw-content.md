# Raw Content: Video Gx3Q5gaqNl0 (YouTube)

Investigated: 2026-04-13
Total contents analyzed: 1

---

## Content 1: YouTube Video — 35m 42s | Software Development / AI

**Date:** 2026-02-24
**Metrics:** 32,484 views, 1,621 likes
**URL:** https://youtu.be/Gx3Q5gaqNl0
**Channel:** QuantBrasil
**Creator:** Rafael Quintanilha (@quant_brasil)

### Title
Montei minha própria empresa com IA utilizando o OpenClaw

### Description
Instale o OpenClaw na Hostinger ➡️ https://www.hostg.xyz/SHIuj (10% OFF com o cupom QUANTBRASIL)

Hoje eu mostro meu workflow atualizado com um time de multiagentes. Vou explicar casos de uso reais, como eu configuro, como eu opero via Slack/WhatsApp e quanto custa todo esse setup.

No vídeo:
- O que é "Claw" e por que o foco é "personal assistant"
- Meu setup seguro (máquina local + Tailscale)
- Arquitetura de agentes: orquestrador, analista de dados, engenheiro de software e diretor criativo
- Skills, memória por agente e por que isso economiza tokens

Capítulos:
- 00:00 Intro
- 02:14 O que é o OpenClaw
- 04:55 Utilizando o OpenClaw com multiagentes
- 08:04 Meu setup multiagentes no OpenClaw
- 13:29 O que são as skills
- 15:23 Meu agente analista de dados
- 19:00 Meu agente desenvolvedor
- 20:57 Meu agente de direção de criação
- 22:32 Meu time de agentes na prática
- 34:54 Conclusão

### Transcription

Muito se fala do OpenClaw e pouco sobre seus reais casos de uso. Por isso, no vídeo de hoje, eu quero te mostrar o meu workflow atualizado para rodar um time de multiagentes no OpenClaw. Eu vou te falar casos de usos reais, como você pode fazer para configurar e no final vou te dar uma ideia mais ou menos de quanto custa essa brincadeira toda.

Pessoal, há mais ou menos umas três semanas eu vim aqui no canal apresentar para vocês o Cloud Bot que depois virou Bolt Bot, que depois virou Open Claw e agora finalmente parece que estamos com o nome definitivo. E de lá para cá muita coisa mudou, inclusive o fato de que o OpenClaw foi comprado pela Open AI. Então agora o que parecia um projeto, né, vibe codedor empresa milionária, talvez até bilionária com uma grande empresa por trás.

Ele está falando como ele tem utilizado o OpenClaw três semanas depois, se ainda tem utilizado, se virou só hype, como adequar no seu caso de uso. Pessoal, é importante deixar claro que a vantagem do OpenClaw é você trabalhar como se realmente ele fosse um assistente pessoal e não é necessariamente um assistente de programação, mas é um assistente pessoal. Todo o setup é orientado para esse fim. É como se você tivesse a sua própria empresa e tem os agentes que trabalham nas suas funções específicas.

A arquitetura inclui:
1. **Agente Orquestrador (PEG)** - Roteador principal, roda com Sonet 4.6. Funciona como uma secretária executiva.
2. **Agente Analista de Dados** - Para análise e processamento de dados
3. **Agente Desenvolvedor** - Para tarefas de programação
4. **Agente Diretor Criativo** - Para tarefas criativas

Cada agente tem um conjunto de arquivos locais que descrevem como ele opera. Isso permite ajustar os modelos, economizar tokens através de skills e memória específica por agente.

O setup é rodado em hardware pessoal através de uma máquina local ou Mac Mini, conectado via Tailscale para segurança. Ele demonstra a prática ao longo do vídeo como cada agente é utilizado via Slack/WhatsApp.

Sobre custos: Utilizar modelos como Sonet 4.6 (60% do preço do Opus) ou alternar com 5.3 no plano Pro. API pura é inviável. Codex tem melhor custo-benefício mas escreve mecanicamente. A abordagem utiliza uma combinação de modelos e skills para otimizar custo vs qualidade.

Referências mencionadas:
- Inspiração em vídeo de Brian Casel sobre multiagentes
- Série Mad Men como referência para nomenclatura
- Simon Willson na definição de "claus" (agentes pessoais)
- Andrey Lebedev criador do termo "vibe coding"
- Mention de projetos relacionados: Nano Claw, Pico Claw

O foco principal é demonstrar que OpenClaw não é apenas para desenvolvimento, mas para construir um assistente pessoal que funciona como uma empresa com múltiplas funções especializadas.
