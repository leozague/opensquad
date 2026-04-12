# Step 1 — Checkpoint: Projeto e Versão

## Objetivo

Identificar o projeto e a versão de release a ser publicada antes de iniciar a geração.

## Perguntas ao Usuário

Faça as seguintes perguntas usando AskUserQuestion:

**Pergunta 1:** Qual é o projeto?
- Opções: listar projetos conhecidos do `dev-intake/pipeline/data/projects-registry.md` + "Outro"

**Pergunta 2:** Qual versão deseja publicar?
- Orientar o usuário a informar a versão (ex: `v1.1.0`)
- O manifest correspondente deve existir em `releases/{versao}/manifest.md` dentro do diretório de docs do projeto

## Validação

Antes de continuar:

1. Verificar se o arquivo `releases/{versao}/manifest.md` existe no diretório de docs do projeto
   - Se não existir: mostrar o template e orientar o usuário a criar

2. Se o manifest existir, verificar os campos de fluxo:
   - **`staging_validado`**: se for `false`, alertar: "Esta release ainda não foi validada em staging. Deseja gerar as release notes mesmo assim?"
   - **`publicado_producao`**: se for `true`, avisar que essa versão já está em produção

3. Se existir e staging estiver validado: confirmar o caminho e seguir para o Step 2

## Output

Registrar no estado da execução:
```json
{
  "project_code": "gold-letras",
  "project_docs_path": "/Users/macbookpro/Documents/_THOTH/01_Projects/gold-letras",
  "version": "v1.1.0",
  "manifest_path": "/Users/macbookpro/Documents/_THOTH/01_Projects/gold-letras/releases/v1.1.0/manifest.md",
  "sprint": "Sprint 01",
  "staging_validado": true
}
```
