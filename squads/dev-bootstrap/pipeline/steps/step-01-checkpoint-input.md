---
type: checkpoint
outputFile: squads/dev-bootstrap/output/input-params.yaml
---

# Step 01: Input e Parametros

Coletar do usuario todas as informacoes necessarias para iniciar o bootstrap do projeto.

## Informacoes a Coletar

### 1. Arquivo de Planejamento
Perguntar o caminho do arquivo de planejamento principal (.md) e arquivos/pastas de referencia adicionais (PDFs, imagens, tabelas).

### 2. Caminho do Projeto
Onde o codigo fonte sera criado. Ex: `/Users/macbookpro/Projects/meu-projeto`

### 3. Banco de Dados
- Qual banco usar: PostgreSQL, MariaDB ou MySQL (todos disponiveis localmente)
- Credenciais: host (default localhost), porta, usuario, senha
- Nome do database a criar

### 4. Arquitetura de Repositorio
- Monorepo, multi-repo ou hibrido
- Ferramentas preferidas (Turborepo, Nx, workspaces, etc.) ou deixar a squad decidir

### 5. Servidor de Deploy
Qual servidor Easypanel usar para deploy:
1. kansai02 (kansai02.duckdns.org:5001)
2. kansai04 (kansai04.duckdns.org:5002)
3. vps3 (217.216.52.134:3000)

### 6. Pesquisa de Mercado
Ativar pesquisa de mercado antes do planejamento tecnico? (opcional)

### 7. Requisitos Adicionais
Algum requisito adicional nao coberto pelo planejamento? (testes especificos, padroes, restricoes)

## Formato de Saida

Salvar as respostas em `input-params.yaml`:

```yaml
planning:
  main_file: "{caminho do .md principal}"
  references:
    - "{caminho de referencia adicional}"

project:
  path: "{caminho onde criar o projeto}"
  name: "{nome do projeto (inferido do planejamento)}"

database:
  engine: "postgres | mariadb | mysql"
  host: "localhost"
  port: 5432
  user: "{usuario}"
  password: "{senha}"
  database_name: "{nome do banco}"

repository:
  type: "monorepo | multi-repo | single"
  tools: ["{ferramenta}"]

deploy:
  server: "{nome do servidor}"
  url: "{url do easypanel}"

market_research: true | false

additional_requirements:
  - "{requisito adicional}"
```
