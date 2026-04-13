---
task: "Fetch Framework Docs"
order: 1
input: |
  - frameworks: Lista de frameworks/libs com versoes do planejamento
  - stack: Stack completa definida (backend, frontend, banco, etc.)
output: |
  - doc_cache_files: Um arquivo .md por framework em pipeline/data/doc-cache/
---

# Fetch Framework Docs

Buscar e cachear documentacao oficial de cada framework e biblioteca definida no planejamento, na versao exata especificada.

## Process

1. Ler `input-params.yaml` para extrair a lista de frameworks/libs com versoes
2. Para cada framework/lib:
   a. Construir a URL da doc oficial na versao correta (ex: `docs.nestjs.com/v10/`, `laravel.com/docs/11.x`)
   b. WebFetch na pagina de getting started / installation
   c. WebFetch na pagina de configuracao principal
   d. WebFetch nas paginas de APIs mais relevantes para o projeto
   e. Extrair: setup, configuracao, APIs principais, patterns recomendados, breaking changes
3. Salvar cada framework em `pipeline/data/doc-cache/{framework}-{version}.md`
4. Se a doc nao estiver disponivel online, buscar alternatives (GitHub README, changelog)
5. Reportar gaps: frameworks cuja doc nao foi encontrada ou esta incompleta

## Output Format

```markdown
# {Framework} v{Version} — Doc Cache

> Fonte: {URL oficial}
> Acessado em: {data}

## Getting Started
{resumo de instalacao e setup}

## Configuracao
{configuracao principal, arquivos de config, environment vars}

## APIs Principais
{interfaces, metodos, decorators, hooks mais usados}

### {API/Modulo 1}
```code
{exemplo da doc oficial}
```

### {API/Modulo 2}
```code
{exemplo da doc oficial}
```

## Patterns Recomendados
{padroes recomendados pela doc oficial}

## Breaking Changes (vs versao anterior)
{mudancas que quebram compatibilidade, se aplicavel}

## Gaps
{secoes da doc que nao foram encontradas ou estao incompletas}
```

## Output Example

> Use como referencia de qualidade, nao como template rigido.

```markdown
# NestJS v11.0 — Doc Cache

> Fonte: https://docs.nestjs.com/
> Acessado em: 2026-04-13

## Getting Started
```bash
npm i -g @nestjs/cli@11
nest new project-name
```
Requer Node.js >= 20.0.0. Suporta npm, yarn e pnpm.

## Configuracao
- `nest-cli.json`: configuracao do CLI (compiler, assets, plugins)
- `tsconfig.json`: strict mode recomendado
- `.env` + `@nestjs/config`: ConfigModule.forRoot() com validacao via Joi

### ConfigModule
```typescript
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      validationSchema: Joi.object({
        DATABASE_URL: Joi.string().required(),
        PORT: Joi.number().default(3000),
      }),
    }),
  ],
})
export class AppModule {}
```

## APIs Principais

### Controllers & Routes
```typescript
@Controller('users')
export class UsersController {
  @Get()
  findAll(): Promise<User[]> { ... }

  @Get(':id')
  findOne(@Param('id') id: string): Promise<User> { ... }
}
```

### Providers & Dependency Injection
```typescript
@Injectable()
export class UsersService {
  constructor(private readonly usersRepository: UsersRepository) {}
}
```

## Patterns Recomendados
- Repository pattern para acesso a dados
- DTOs com class-validator para validacao de input
- Guards para autenticacao/autorizacao
- Interceptors para transformacao de response

## Breaking Changes (vs v10)
- Minimo Node.js 20 (antes era 16)
- Express 5 como default (antes Express 4)
- Fastify adapter atualizado para v5

## Gaps
- Doc de migracao v10 → v11 ainda incompleta em modulos de terceiros
```

## Quality Criteria

- [ ] Um arquivo de cache por framework/lib do planejamento
- [ ] Versao exata indicada no titulo e fonte
- [ ] URL fonte e data de acesso presentes
- [ ] Secoes de getting started e configuracao preenchidas
- [ ] Exemplos de codigo da doc oficial (nao inventados)
- [ ] Gaps documentados quando aplicavel

## Veto Conditions

Rejeitar e refazer se:
1. Versao no cache diferente da versao no planejamento
2. Exemplos de codigo inventados (nao extraidos da doc oficial)
