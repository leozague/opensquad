# Step 07 — Checkpoint: Aprovacao do Spec

## Tipo
checkpoint

## Objetivo
Revisao final do spec antes de encerrar o intake. Opcional: iniciar implementacao automaticamente.

## O que apresentar
- Resumo do `spec.md` gerado: numero de tasks, camadas afetadas, complexidade estimada
- Caminho onde os arquivos foram salvos
- Se `perguntas-ao-solicitante.md` existe: exibir aviso com o caminho

## Perguntas

**Pergunta 1:** O spec esta pronto?
- **Aprovado — mover para in-progress** → mover pasta de `backlog/{slug}/` para `in-progress/{slug}/` e atualizar os dois `_index.md`, depois perguntar sobre kickoff automatico
- **Aprovado — manter no backlog** → encerrar sem kickoff
- **Gerar perguntas ao solicitante** → aciona Step 04 agora e retorna aqui
- **Precisa de ajuste** → volta para Step 06

**Pergunta 2 (se "Aprovado — mover para in-progress"):** Deseja iniciar a implementacao automaticamente?
- **Sim — abrir Claude Code no projeto** → executar Step 08 (kickoff automatico)
- **Nao — vou implementar manualmente** → encerrar normalmente

## Ao encerrar sem kickoff, exibir

```
Intake concluido!

Feature:  {titulo}
Branch:   feature/{slug}
Spec:     {docs_path}/in-progress/{slug}/spec.md

Para implementar:
  cd {project_root}
  git checkout -b feature/{slug} develop
  claude --dangerously-skip-permissions
```
