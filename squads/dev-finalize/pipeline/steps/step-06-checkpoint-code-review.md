# Step 06 — Checkpoint: Code Review e Seguranca

## Tipo
checkpoint

## Objetivo

Apresentar os resultados combinados do Code Review e da Analise de Seguranca para decisao antes de atualizar a documentacao.

## O que Apresentar

**Resultado do Code Review (Step 04):**
- Status de aderencia a spec
- Achados por categoria (BLOQUEANTE / IMPORTANTE / SUGESTAO)
- Rastreabilidade (sem refs a IA)

**Resultado da Analise de Seguranca (Step 05):**
- Status geral de seguranca
- Achados por severidade (CRITICO / ALTO / MEDIO / BAIXO)
- Recomendacao do analista

## Perguntas

**Pergunta 1 (se houver achados CRITICOS ou ALTOS em seguranca):**
Ha vulnerabilidades criticas. O que deseja fazer?
- **Corrigir antes de continuar** — encerrar, corrigir e rodar dev-finalize novamente
- **Estou ciente do risco e quero continuar** — prosseguir (registrado sob responsabilidade)

**Pergunta 2 (se tudo aprovado ou so ressalvas menores):**
Como deseja prosseguir?
- **Aprovado — atualizar documentacao** — seguir para Step 07
- **Ha correcoes a fazer** — encerrar sem atualizar docs
- **Ignorar ressalvas e continuar** — seguir (aceita sob responsabilidade)

**Pergunta 3 (se aprovado):** Qual ambiente foi validado?
- **So staging** — feature em develop, nao foi para producao ainda
- **Producao** — ja foi para main via GitHub Release
