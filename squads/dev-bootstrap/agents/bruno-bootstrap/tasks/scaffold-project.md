---
task: "Scaffold Project"
order: 1
input: |
  - sdd_plan: Plano SDD completo com estrutura de pastas, stack, versoes
  - doc_cache: Docs cacheadas dos frameworks
output: |
  - project_dir: Diretorio do projeto criado com estrutura base
  - dependencies: Dependencias instaladas nas versoes corretas
---

# Scaffold Project

Criar a estrutura inicial do projeto no caminho definido pelo usuario: diretorios, arquivos de configuracao, instalar dependencias nas versoes exatas, configurar ferramentas de repo (monorepo tools, linting, formatting).

## Process

1. Ler `sdd-plan.md` para extrair: caminho do projeto, estrutura de pastas, stack, versoes, tipo de repo
2. Criar o diretorio raiz no caminho definido pelo usuario
3. Se monorepo: configurar ferramentas (Turborepo/Nx, workspaces) antes dos apps
4. Para cada app/servico na estrutura:
   a. Usar o CLI oficial do framework para scaffold (ex: `nest new`, `npm create vue@latest`)
   b. Se o CLI nao existir ou nao for adequado, criar estrutura manualmente
5. Instalar dependencias adicionais nas versoes exatas do spec: `npm install package@version`
6. Configurar linting (ESLint), formatting (Prettier), e TypeScript (se aplicavel)
7. Criar `.env` com as credenciais do banco fornecidas e portas do port registry
8. Criar `.env.example` sem valores sensiveis
9. Criar `.gitignore` adequado para a stack
10. Inicializar git repo local: `git init`, commit inicial
11. Verificar que o projeto compila/builda sem erros

## Output Format

```markdown
## Scaffold Report

### Diretorio Criado
{caminho completo}

### Estrutura
```
{output de tree ou ls -R}
```

### Dependencias Instaladas
| Pacote | Versao Spec | Versao Instalada | Status |
|--------|-------------|-------------------|--------|
| ... | ... | ... | OK / WARN |

### Configuracoes
- [x] .env criado com credenciais do banco
- [x] .env.example criado
- [x] .gitignore configurado
- [x] Linting configurado
- [x] Git inicializado

### Verificacao
- Build: PASS / FAIL
- Lint: PASS / FAIL
```

## Output Example

> Use como referencia de qualidade.

```markdown
## Scaffold Report

### Diretorio Criado
/Users/macbookpro/Projects/taskflow

### Estrutura
```
taskflow/
├── apps/
│   ├── api/
│   │   ├── src/
│   │   │   ├── app.module.ts
│   │   │   └── main.ts
│   │   ├── package.json
│   │   └── tsconfig.json
│   └── web/
│       ├── src/
│       │   ├── App.vue
│       │   └── main.ts
│       ├── package.json
│       └── vite.config.ts
├── packages/
│   └── shared/
│       └── package.json
├── turbo.json
├── pnpm-workspace.yaml
├── .env
├── .env.example
├── .gitignore
└── package.json
```

### Dependencias Instaladas
| Pacote | Versao Spec | Versao Instalada | Status |
|--------|-------------|-------------------|--------|
| @nestjs/core | 11.0.0 | 11.0.0 | OK |
| vue | 3.5.0 | 3.5.0 | OK |
| typescript | 5.6.0 | 5.6.0 | OK |

### Verificacao
- Build: PASS
- Lint: PASS
```

## Quality Criteria

- [ ] Diretorio criado no caminho correto
- [ ] Todas as dependencias nas versoes exatas do spec
- [ ] .env com credenciais do banco e portas do registry
- [ ] .env.example sem valores sensiveis
- [ ] .gitignore completo para a stack
- [ ] Projeto compila/builda sem erros
- [ ] Git inicializado com commit inicial

## Veto Conditions

Rejeitar e refazer se:
1. Dependencia instalada em versao diferente da especificada no spec
2. Projeto nao compila apos scaffold
