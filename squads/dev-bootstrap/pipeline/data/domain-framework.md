# Domain Framework — Dev Bootstrap

## Metodologia: Spec Driven Development (SDD)

O SDD define que toda implementacao comeca por uma especificacao detalhada antes de qualquer linha de codigo.

### Ciclo SDD

1. **Captura de Requisitos** — Extrair do documento de planejamento: features, stack, versoes, padroes, restricoes
2. **Decomposicao em Modulos** — Quebrar o sistema em modulos independentes com fronteiras claras
3. **Especificacao por Modulo** — Para cada modulo, gerar spec com: responsabilidade, interfaces, dependencias, testes esperados
4. **Ordenacao por Dependencia** — Topological sort: modulos sem dependencia primeiro, depois os que dependem deles
5. **Implementacao Sequencial** — Implementar modulo a modulo, com commit atomico por modulo concluido
6. **Validacao Continua** — Testes rodam apos cada modulo, garantindo que nada quebra

### Principios

- **Spec First** — Nunca implementar sem spec escrito e aprovado
- **One Module, One Commit** — Cada modulo concluido gera exatamente um commit
- **Fail Fast** — Se um modulo falha nos testes, parar e resolver antes de avancar
- **Doc Before Code** — A documentacao da arquitetura e gerada antes do scaffold
- **Version Pinning** — Toda dependencia e instalada na versao exata definida no planejamento

### Estrutura de um Spec SDD

```yaml
module:
  name: "nome-do-modulo"
  description: "O que este modulo faz"
  depends_on: ["modulo-a", "modulo-b"]
  
  interfaces:
    - name: "NomeInterface"
      methods:
        - signature: "metodo(param: Tipo): RetornoTipo"
          description: "O que faz"
  
  files:
    - path: "src/modules/nome/nome.service.ts"
      responsibility: "Logica de negocio do modulo"
    - path: "src/modules/nome/nome.controller.ts"
      responsibility: "Endpoints HTTP"
  
  tests:
    unit:
      - "deve retornar X quando Y"
      - "deve lancar erro quando Z"
    integration:
      - "deve persistir no banco corretamente"
    e2e:
      - "GET /api/nome deve retornar 200 com dados"
  
  acceptance_criteria:
    - "Modulo roda isoladamente com testes passando"
    - "Commit atomico feito com mensagem descritiva"
```

## Arquitetura de Repositorio

### Monorepo
- **Quando usar:** Frontend + Backend no mesmo projeto, libs compartilhadas
- **Ferramentas:** Turborepo, Nx, pnpm workspaces, yarn workspaces
- **Estrutura:** `apps/`, `packages/`, `libs/`

### Multi-repo
- **Quando usar:** Servicos independentes, times separados, deploys desacoplados
- **Ferramentas:** Git submodules, npm private packages
- **Estrutura:** Um repo por servico

### Hibrido
- **Quando usar:** Monorepo para o core, repos separados para servicos auxiliares
- **Ferramentas:** Combinacao das anteriores

## Deploy Pipeline

### Local (desenvolvimento)
- Instalar ferramentas direto na maquina (sem Docker)
- Bancos de dados ja disponiveis: PostgreSQL, MariaDB, MySQL
- Port registry com salto de 10 portas por projeto

### Producao (VPS + Easypanel)
- Docker stack (Dockerfile + docker-compose.yml)
- GitHub Actions para CI/CD
- GHCR (GitHub Container Registry) para imagens
- Webhooks Easypanel para deploy automatico
- Pattern: `EASYPANEL_WEBHOOK_{SERVICE}_{STAGE}`
