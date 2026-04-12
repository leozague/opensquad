# Step 05 — Checkpoint: Aprovação do Briefing

## Tipo
checkpoint

## Objetivo
Apresentar o briefing consolidado para aprovação antes de criar o spec SDD.

## O que apresentar
Exibir o briefing completo:
- **Título sugerido** para a feature
- **Problema:** o que resolve e para quem
- **Solução:** comportamento esperado
- **Módulos afetados**
- **Urgência:** bloqueante / importante / nice-to-have
- **Fora do escopo (fase 2):** se houver

Se `perguntas-ao-solicitante.md` foi gerado no Step 04, exibir aviso:
> 📋 Documento de perguntas gerado em `{slug}/perguntas-ao-solicitante.md`

## Perguntas do checkpoint

**Pergunta 1:** O briefing está correto?
- **Sim, criar o spec** — continua para Step 06
- **Precisa de ajuste** — volta para Step 02 (re-entrevista)
- **Gerar perguntas ao solicitante** — aciona Step 04 agora e retorna aqui
- **Cancelar** — encerra o pipeline

**Pergunta 2 (se aprovado):** Qual slug para esta feature?
Sugerir automaticamente baseado no título (ex: `cadastro-de-produtos` → `feature-cadastro-de-produtos`).
Exemplos como opções: slug-sugerido, versão-alternativa.
