# Step 01 — Checkpoint: Projeto e Solicitação

## Tipo
checkpoint

## Objetivo
Identificar o projeto alvo e receber a descrição inicial da solicitação.

## Perguntas

### Pergunta 1 — Projeto
Qual projeto recebeu a solicitação?

Opções dinâmicas: ler `_opensquad/_memory/projects/_index.md` e listar os projetos ativos.
Sempre incluir "Outro projeto" como opção adicional.

### Pergunta 2 — Tipo de solicitação
Qual é o tipo?

- **Nova funcionalidade** — algo que não existe ainda
- **Melhoria** — algo que existe mas precisa evoluir
- **Bug / Comportamento inesperado** — algo que está errado
- **Dúvida ou ajuste** — pergunta ou mudança pequena

### Pergunta 3 — Descrição
Descreva a solicitação com as palavras do usuário.

Exemplos de opções para guiar:
- "Quero que o sistema faça X quando Y acontecer"
- "O módulo Z não está funcionando corretamente"
- "Precisamos de uma tela para gerenciar W"

## Registro de Novo Projeto

Se "Outro projeto" for selecionado, executar antes de continuar:

1. Perguntar: nome do projeto, código (slug), caminho do repositório local, ambiente preferido (Docker / local)
2. Ler `_opensquad/_memory/ports-registry.md`
3. Calcular próximo bloco disponível:
   - `next_index = max_index_registrado + 1`
   - `api_port = 3000 + (next_index * 10)`
   - `web_port = 5173 + (next_index * 10)`
   - `db_port  = 5432 + (next_index * 10)`
4. Registrar o projeto no ports-registry.md (tabela + seção de detalhes)
5. Informar ao usuário as portas atribuídas
6. Criar `_THOTH/01_Projects/[projeto]/reference/environments.md` com as portas atribuídas
7. Se ambiente = Docker: copiar `squads/dev-intake/templates/docker-compose.template.yml` para a raiz do repositório do projeto, substituindo os placeholders pelas portas atribuídas e código do projeto
8. Registrar em `_opensquad/_memory/projects/_index.md`

## Output para o próximo step
Passar para Clara Entrevistadora:
- `projeto`: nome/código do projeto selecionado
- `tipo`: tipo da solicitação
- `descricao_original`: texto da descrição
- `docs_path`: caminho da documentação do projeto em `_THOTH/01_Projects/[projeto]/`
- `api_port`: porta da API (do port registry)
- `web_port`: porta do frontend (do port registry)
