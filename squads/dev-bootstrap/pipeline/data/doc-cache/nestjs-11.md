# NestJS v11 — Doc Cache

> Fonte: https://github.com/nestjs/nest (package.json + releases)
> Acessado em: 2026-04-13
> Versao atual: 11.1.19

## Getting Started

```bash
npm i -g @nestjs/cli@11
nest new project-name --strict
# ou com SWC (build rapido):
nest new project-name --strict -p npm
```

Requer Node.js >= 20.0.0.

## Configuracao

### SWC Compiler (build ~20x mais rapido)
```bash
npm i --save-dev @swc/cli @swc/core
```
Em `nest-cli.json`:
```json
{
  "compilerOptions": {
    "builder": "swc"
  }
}
```

### JSON Logging nativo (v11)
NestJS 11 inclui JSON logging estruturado nativo via ConsoleLogger.

### ConfigModule
```typescript
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: '.env',
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

  @Post()
  create(@Body() dto: CreateUserDto): Promise<User> { ... }
}
```

### Providers & Dependency Injection
```typescript
@Injectable()
export class UsersService {
  constructor(private readonly usersRepository: UsersRepository) {}
}
```

### Guards
```typescript
@Injectable()
export class JwtAuthGuard extends AuthGuard('jwt') {}
```

### Swagger/OpenAPI
```bash
npm install @nestjs/swagger
```
```typescript
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';

const config = new DocumentBuilder()
  .setTitle('API')
  .setVersion('1.0')
  .addBearerAuth()
  .build();
const document = SwaggerModule.createDocument(app, config);
SwaggerModule.setup('api/docs', app, document);
```

### Helmet
```bash
npm install helmet
```
```typescript
import helmet from 'helmet';
app.use(helmet());
```

### Rate Limiting (@nestjs/throttler)
```bash
npm install @nestjs/throttler
```
```typescript
@Module({
  imports: [
    ThrottlerModule.forRoot([{
      ttl: 60000,
      limit: 10,
    }]),
  ],
})
export class AppModule {}
```

## Breaking Changes (vs v10)

- Minimo Node.js 20 (antes era 16)
- Express 5 como default (antes Express 4)
- Fastify adapter atualizado para v5
- Novas tipagens mais fortes em varios modulos

## Gaps

- Doc oficial de migracao v10 → v11 nao carregou via WebFetch (JS-rendered)
- Detalhes especificos do JSON logging nativo precisam de consulta adicional
