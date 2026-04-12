# Step 03 — Checkpoint: Perguntas ao Solicitante

## Tipo
checkpoint

## Objetivo
Decidir se é necessário gerar um documento de perguntas para o solicitante antes de continuar. Este checkpoint sempre aparece — independente de Clara ter detectado perguntas abertas ou não.

## O que apresentar

Se Clara detectou perguntas abertas, exibir:
```
🎙️ Clara identificou pontos que precisam ser esclarecidos com o solicitante:

• [pergunta 1]
• [pergunta 2]
• [...]
```

Se Clara não detectou nenhuma pergunta aberta:
```
🎙️ Clara não identificou perguntas pendentes para o solicitante.
```

Em ambos os casos, apresentar as opções abaixo.

## Perguntas do checkpoint

**Pergunta 1:** O que fazer com perguntas ao solicitante?
- **Gerar documento agora** — Clara monta o documento pronto para enviar (WhatsApp, email, etc.)
- **Continuar sem gerar** — prosseguir direto para o briefing e spec
- **Adicionar minhas próprias perguntas** — você quer incluir perguntas além das que Clara sugeriu

Se o usuário escolher "Adicionar minhas próprias perguntas":
**Pergunta 2:** Quais perguntas você quer incluir?
(free text — exemplos: "Qual é o prazo esperado?", "Precisa funcionar no mobile?", "Há integração com sistema externo?")

## Nota importante
Esta opção também estará disponível nos checkpoints seguintes (Briefing e Spec). A qualquer momento do intake você pode solicitar a geração do documento.
