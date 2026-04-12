# Template — Manifest de Release

> Copie este arquivo para `releases/{versao}/manifest.md` no diretório de docs do projeto.
> Preencha os campos antes de rodar `/opensquad run release-publish`.

---

```markdown
# Manifest — v1.x.x

## Identificação

version: v1.x.x
date: 2026-MM-DD
title: "Nome amigável da release (ex: Cadastros Mais Rápidos)"
project: gold-letras
sprint: "Sprint 06 — Nome da Sprint"  # opcional

## Fluxo de Publicação

staging_validado: false       # marcar true após testar em staging
staging_validado_em: ~        # data de validação em staging (YYYY-MM-DD)
publicado_producao: false     # marcar true após deploy em produção
publicado_producao_em: ~      # data de publicação em produção (YYYY-MM-DD)

## Features incluídas nesta release

> Liste os slugs das pastas em `done/`. O squad vai ler o briefing de cada uma.

- feature-cnpj-autofill
- feature-cadastro-produtos
# adicionar mais conforme necessário

## Notas do publicador (opcional)

> Mensagem adicional para o cliente sobre esta versão.
> Use linguagem de negócio — sem termos técnicos.

Esta atualização foca em agilidade no cadastro e redução de retrabalho.
```

---

## Como usar

1. Crie a pasta `releases/v1.x.x/` no diretório de docs do projeto
2. Salve este arquivo preenchido como `manifest.md` dentro dessa pasta
3. Certifique-se que cada feature listada tem um `briefing.md` em `done/{feature-slug}/`
4. **Antes de publicar:** valide em staging e marque `staging_validado: true`
5. Rode `/opensquad run release-publish` para gerar o HTML de release notes
6. Após deploy em produção: marque `publicado_producao: true` e adicione a data

## Ciclo de vida de uma release

```
1. Planejamento   → Criar manifest.md com as features da sprint
2. Desenvolvimento → Features implementadas via dev-intake + dev-finalize
3. Staging        → Testar, marcar staging_validado: true
4. Release Notes  → Rodar /opensquad run release-publish → gera HTML
5. Produção       → Deploy via GitHub Release, marcar publicado_producao: true
```
