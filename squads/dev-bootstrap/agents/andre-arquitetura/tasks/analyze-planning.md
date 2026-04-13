---
task: "Analyze Planning"
order: 1
input: |
  - planning_file: Caminho do arquivo de planejamento (.md)
  - input_params: Parametros coletados no checkpoint (banco, credenciais, repo type, etc.)
  - doc_cache: Docs cacheadas dos frameworks
  - research_brief: Pesquisa de mercado (opcional)
output: |
  - requirements: Lista estruturada de requisitos funcionais e nao-funcionais
  - stack_validated: Stack validada contra docs (versoes compativeis)
  - modules: Lista preliminar de modulos do sistema
---

# Analyze Planning

Ler o documento de planejamento fornecido pelo usuario e extrair todos os requisitos, validar a stack contra as docs cacheadas, e produzir uma lista preliminar de modulos.

## Process

1. Ler o arquivo de planejamento no caminho indicado em `input-params.yaml`
2. Se houver referencias adicionais (pastas, PDFs, imagens), ler todas
3. Extrair: features, requisitos funcionais, requisitos nao-funcionais, stack, versoes, padroes de projeto
4. Cruzar cada framework/lib com o cache em `doc-cache/` — verificar compatibilidade de versoes entre si
5. Identificar modulos do sistema baseado nas features e na arquitetura definida
6. Se houver `research-brief.md`, cruzar features com gaps de mercado identificados
7. Produzir output estruturado com requisitos validados

## Output Format

```yaml
project:
  name: "{nome do projeto}"
  description: "{descricao}"
  type: "{web app | mobile | api | cli | fullstack | ...}"

stack:
  backend:
    framework: "{nome}"
    version: "{versao}"
    compatible: true | false
    notes: "{notas de compatibilidade}"
  frontend:
    framework: "{nome}"
    version: "{versao}"
    compatible: true | false
  database:
    engine: "{postgres | mariadb | mysql}"
    version: "{versao}"
  additional:
    - name: "{lib/tool}"
      version: "{versao}"
      purpose: "{para que serve}"

requirements:
  functional:
    - id: "RF-001"
      description: "{descricao}"
      priority: "must | should | could"
    # ...
  non_functional:
    - id: "RNF-001"
      description: "{descricao}"
      category: "performance | security | scalability | ..."

modules:
  - name: "{nome-do-modulo}"
    description: "{o que faz}"
    features: ["RF-001", "RF-002"]
    estimated_files: 5
```

## Output Example

> Use como referencia de qualidade.

```yaml
project:
  name: "thoth-app"
  description: "App web segundo cerebro + gestao projetos + portal white-label"
  type: "fullstack"

stack:
  backend:
    framework: "NestJS"
    version: "11.0"
    compatible: true
    notes: "Requer Node >= 20. Express 5 como default."
  frontend:
    framework: "Vue"
    version: "3.5"
    compatible: true
  database:
    engine: "postgres"
    version: "16"
  additional:
    - name: "MikroORM"
      version: "6.4"
      purpose: "ORM para acesso ao banco"
    - name: "TimescaleDB"
      version: "2.17"
      purpose: "Extensao Postgres para time-series"

requirements:
  functional:
    - id: "RF-001"
      description: "Autenticacao com JWT + refresh token"
      priority: "must"
    - id: "RF-002"
      description: "CRUD de projetos com permissoes por role"
      priority: "must"
  non_functional:
    - id: "RNF-001"
      description: "Tempo de resposta < 200ms para APIs principais"
      category: "performance"

modules:
  - name: "auth"
    description: "Autenticacao e autorizacao"
    features: ["RF-001"]
    estimated_files: 8
  - name: "projects"
    description: "Gestao de projetos"
    features: ["RF-002"]
    estimated_files: 10
```

## Quality Criteria

- [ ] Todos os requisitos do planejamento extraidos e categorizados
- [ ] Stack validada contra doc cache (compatibilidade confirmada)
- [ ] Modulos identificados com features vinculadas
- [ ] Requisitos nao-funcionais documentados

## Veto Conditions

Rejeitar e refazer se:
1. Stack tem incompatibilidades detectadas mas nao sinalizadas
2. Features do planejamento nao mapeadas em nenhum modulo
