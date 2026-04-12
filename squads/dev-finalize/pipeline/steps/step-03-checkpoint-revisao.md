# Step 04 — Checkpoint: Revisão das Mudanças e Testes

## Tipo
checkpoint

## Objetivo
Apresentar o relatório de mudanças (git diff) e o resultado dos testes para validação antes de prosseguir para o code review.

## O que apresentar

**Relatório da Git Arqueóloga:**
- Commits realizados
- O que mudou em cada camada
- Versão sugerida

**Relatório do Test Runner:**
- Status geral: passou / falhou
- Número de testes e resultado
- Cobertura dos arquivos alterados
- Falhas detalhadas (se houver)

## Perguntas

**Pergunta 1:** O relatório de mudanças está correto?
- **Sim, prosseguir para code review** → continua para Step 05
- **Há mudanças não capturadas** → descreva o que falta (free text)
- **Cancelar** → encerrar sem atualizar

**Pergunta 2 (se houver falhas nos testes):** Há testes falhando. Como deseja prosseguir?
- **Corrigir antes de continuar** → encerrar, corrigir e rodar dev-finalize novamente
- **Continuar mesmo assim** → prosseguir (aceita sob responsabilidade)

**Pergunta 3 (se aprovado):** Qual ambiente foi validado?
- **Só staging** — feature em develop, não foi para produção ainda
- **Produção** — já foi para main via GitHub Release
