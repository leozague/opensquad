---
task: "Setup GitHub"
order: 4
input: |
  - project_dir: Projeto completo com deploy configurado
  - sdd_plan: Nome do projeto, org, visibilidade
output: |
  - github_repo: Repo criado no GitHub (KansaiTechHouse, privado)
  - push: Codigo pushado para o repo
---

# Setup GitHub

Criar repositorio privado na organizacao KansaiTechHouse no GitHub e fazer push do codigo.

## Process

1. Verificar que `gh` CLI esta autenticado: `gh auth status`
2. Criar repo privado: `gh repo create KansaiTechHouse/{project-name} --private --source=. --push`
3. Se monorepo com multi-repo: criar um repo por servico
4. Configurar branch protection na main (opcional, se pedido no spec)
5. Verificar que o push foi bem-sucedido: `gh repo view KansaiTechHouse/{project-name}`
6. Adicionar descricao ao repo: `gh repo edit --description "{descricao}"`
7. Documentar URL do repo para o documento de entrega

## Output Format

```markdown
## GitHub Setup Report

### Repositorio
- URL: https://github.com/KansaiTechHouse/{project-name}
- Visibilidade: private
- Branch default: main
- Commits: {N}

### Verificacao
- Repo criado: PASS / FAIL
- Push: PASS / FAIL
- Branch protection: CONFIGURADO / NAO APLICAVEL
```

## Output Example

> Use como referencia de qualidade.

```markdown
## GitHub Setup Report

### Repositorio
- URL: https://github.com/KansaiTechHouse/taskflow
- Visibilidade: private
- Branch default: main
- Commits: 7

### Verificacao
- Repo criado: PASS
- Push: PASS
- Branch protection: NAO APLICAVEL (configurar apos primeiro release)
```

## Quality Criteria

- [ ] Repo criado na org KansaiTechHouse
- [ ] Visibilidade: private
- [ ] Codigo pushado com todos os commits
- [ ] .env NAO commitado (apenas .env.example)
- [ ] URL do repo documentada

## Veto Conditions

Rejeitar e refazer se:
1. Repo criado como publico
2. .env com credenciais commitado no repo
