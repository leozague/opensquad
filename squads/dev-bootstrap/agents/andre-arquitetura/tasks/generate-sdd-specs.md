---
task: "Generate SDD Specs"
order: 2
input: |
  - requirements: Requisitos validados do analyze-planning
  - doc_cache: Docs cacheadas dos frameworks
  - modules: Lista preliminar de modulos
output: |
  - sdd_specs: Specs detalhados por modulo seguindo SDD
  - task_order: Ordem de execucao baseada em dependencias
---

# Generate SDD Specs

Gerar specs detalhados para cada modulo seguindo Spec Driven Development. Cada spec define: interfaces, arquivos, dependencias, testes esperados e acceptance criteria.

## Process

1. Partir da lista de modulos do analyze-planning
2. Para cada modulo, consultar o doc cache do framework relevante para definir interfaces e patterns corretos
3. Definir dependencias entre modulos (ex: "projects" depende de "auth")
4. Executar topological sort para definir ordem de implementacao
5. Para cada modulo, gerar spec completo com: interfaces, arquivos a criar, testes unitarios/integracao/e2e
6. Definir acceptance criteria concretos e verificaveis por modulo
7. Agrupar specs na ordem de execucao

## Output Format

```yaml
execution_order:
  - module: "{nome}"
    order: 1
    depends_on: []
  - module: "{nome}"
    order: 2
    depends_on: ["{modulo anterior}"]

specs:
  - module: "{nome}"
    description: "{o que faz}"
    depends_on: []
    
    interfaces:
      - name: "{NomeInterface}"
        methods:
          - signature: "{metodo(param: Tipo): RetornoTipo}"
            description: "{o que faz}"
    
    files:
      - path: "{caminho relativo}"
        responsibility: "{o que esse arquivo faz}"
        template: "{controller | service | repository | module | dto | entity | test | config}"
    
    tests:
      unit:
        - "{descricao do teste unitario}"
      integration:
        - "{descricao do teste de integracao}"
      e2e:
        - "{descricao do teste e2e}"
    
    acceptance_criteria:
      - "{criterio verificavel}"
    
    commit_message: "{mensagem do commit ao concluir este modulo}"
```

## Output Example

> Use como referencia de qualidade.

```yaml
execution_order:
  - module: "database-setup"
    order: 1
    depends_on: []
  - module: "auth"
    order: 2
    depends_on: ["database-setup"]
  - module: "users"
    order: 3
    depends_on: ["auth", "database-setup"]

specs:
  - module: "database-setup"
    description: "Configuracao do banco de dados, ORM e migrations base"
    depends_on: []
    
    interfaces: []
    
    files:
      - path: "src/database/database.module.ts"
        responsibility: "Modulo de conexao com o banco"
        template: "module"
      - path: "src/database/migrations/0001_initial.ts"
        responsibility: "Migration inicial com tabelas base"
        template: "migration"
      - path: "src/config/database.config.ts"
        responsibility: "Configuracao de conexao (env vars)"
        template: "config"
    
    tests:
      unit: []
      integration:
        - "deve conectar ao banco com credenciais do .env"
        - "deve rodar migrations sem erros"
      e2e: []
    
    acceptance_criteria:
      - "Conexao com banco funcional usando credenciais do .env"
      - "Migrations rodam sem erros em banco limpo"
      - "Rollback de migrations funcional"
    
    commit_message: "feat(database): configurar conexao e migrations iniciais"

  - module: "auth"
    description: "Autenticacao JWT com login, registro e refresh token"
    depends_on: ["database-setup"]
    
    interfaces:
      - name: "AuthService"
        methods:
          - signature: "register(dto: RegisterDto): Promise<TokenPair>"
            description: "Registra novo usuario e retorna tokens"
          - signature: "login(dto: LoginDto): Promise<TokenPair>"
            description: "Autentica usuario e retorna tokens"
          - signature: "refresh(token: string): Promise<TokenPair>"
            description: "Renova access token usando refresh token"
    
    files:
      - path: "src/modules/auth/auth.module.ts"
        responsibility: "Modulo de autenticacao"
        template: "module"
      - path: "src/modules/auth/auth.controller.ts"
        responsibility: "Endpoints de auth (login, register, refresh)"
        template: "controller"
      - path: "src/modules/auth/auth.service.ts"
        responsibility: "Logica de autenticacao"
        template: "service"
      - path: "src/modules/auth/dto/register.dto.ts"
        responsibility: "DTO de registro com validacao"
        template: "dto"
      - path: "src/modules/auth/dto/login.dto.ts"
        responsibility: "DTO de login com validacao"
        template: "dto"
      - path: "src/modules/auth/guards/jwt-auth.guard.ts"
        responsibility: "Guard de autenticacao JWT"
        template: "guard"
    
    tests:
      unit:
        - "deve gerar JWT valido ao registrar"
        - "deve rejeitar registro com email duplicado"
        - "deve rejeitar login com senha incorreta"
      integration:
        - "deve persistir usuario no banco ao registrar"
        - "deve retornar refresh token valido"
      e2e:
        - "POST /auth/register deve retornar 201 com tokens"
        - "POST /auth/login deve retornar 200 com tokens"
        - "POST /auth/login com senha errada deve retornar 401"
        - "POST /auth/refresh deve retornar novos tokens"
    
    acceptance_criteria:
      - "Registro cria usuario e retorna token pair"
      - "Login valida credenciais e retorna token pair"
      - "Refresh renova tokens sem re-login"
      - "Endpoints protegidos rejeitam requests sem token valido"
    
    commit_message: "feat(auth): implementar autenticacao JWT com registro, login e refresh"
```

## Quality Criteria

- [ ] Todo modulo tem spec completo (interfaces, arquivos, testes, acceptance criteria)
- [ ] Ordem de execucao respeita dependencias (topological sort)
- [ ] Nenhuma dependencia circular
- [ ] Testes definidos para cada modulo (unit + integration + e2e quando aplicavel)
- [ ] Commit messages definidos por modulo
- [ ] Paths de arquivos seguem convencoes da stack

## Veto Conditions

Rejeitar e refazer se:
1. Modulo com dependencia nao resolvida (depende de modulo que nao existe)
2. Modulo sem testes definidos
