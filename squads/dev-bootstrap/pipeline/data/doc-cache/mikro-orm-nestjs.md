# MikroORM + @mikro-orm/nestjs — Doc Cache

> Fonte: https://github.com/mikro-orm/nestjs (README.md)
> Acessado em: 2026-04-13

## Getting Started

```bash
npm install @mikro-orm/core @mikro-orm/nestjs @mikro-orm/postgresql
npm install @mikro-orm/migrations @mikro-orm/cli
```

## Configuracao

### MikroOrmModule.forRoot()
```typescript
@Module({
  imports: [
    MikroOrmModule.forRoot({
      entities: ['./dist/entities'],
      entitiesTs: ['./src/entities'],
      dbName: 'thoth_dev',
      type: 'postgresql',
    }),
  ],
})
export class AppModule {}
```

### forRootAsync (com ConfigService)
```typescript
@Module({
  imports: [
    MikroOrmModule.forRootAsync({
      useFactory: (configService: ConfigService) =>
        configService.getOrThrow(ConfigKey.ORM),
      inject: [ConfigService],
      driver: PostgreSqlDriver,
    }),
  ],
})
export class AppModule {}
```

### Auto-load entities
```typescript
MikroOrmModule.forRoot({
  autoLoadEntities: true,
})
```

## Definicao de Entidades

### Novo estilo defineEntity (MikroORM v6+)
```typescript
import { defineEntity, p, MikroORM } from '@mikro-orm/postgresql';

const AuthorSchema = defineEntity({
  name: 'Author',
  properties: {
    id: p.integer().primary(),
    name: p.string(),
    email: p.string(),
    born: p.datetime().nullable(),
    books: () => p.oneToMany(Book).mappedBy('author'),
  },
});

export class Author extends AuthorSchema.class {}
AuthorSchema.setClass(Author);
```

### Estilo decorators (classico)
```typescript
@Entity()
export class User {
  @PrimaryKey()
  id: number;

  @Property()
  name: string;

  @Property({ unique: true })
  email: string;
}
```

## Feature Modules (forFeature)
```typescript
@Module({
  imports: [MikroOrmModule.forFeature([Photo])],
  providers: [PhotoService],
  controllers: [PhotoController],
})
export class PhotoModule {}
```

## Injecao de Repositorios
```typescript
@Injectable()
export class PhotoService {
  constructor(
    @InjectRepository(Photo)
    private readonly photoRepository: EntityRepository<Photo>,
  ) {}
}
```

## EntityManager direto
```typescript
@Injectable()
export class MyService {
  constructor(
    private readonly orm: MikroORM,
    private readonly em: EntityManager,
  ) {}
}
```

## Request Context (automatico)
O modulo registra automaticamente RequestContext middleware para HTTP requests.

Para handlers fora do HTTP (filas, cron):
```typescript
@Injectable()
export class MyService {
  constructor(private readonly orm: MikroORM) {}

  @CreateRequestContext()
  async doSomething() {
    // executa em contexto isolado
  }
}
```

## Custom Repositories
```typescript
@Entity({ customRepository: () => AuthorRepository })
export class Author {
  [EntityRepositoryType]?: AuthorRepository;
}

export class AuthorRepository extends EntityRepository<Author> {
  // metodos customizados
}
```

## Multi Database
```typescript
MikroOrmModule.forRoot({
  contextName: 'db1',
  registerRequestContext: false,
  // config db1
}),
MikroOrmModule.forRoot({
  contextName: 'db2',
  registerRequestContext: false,
  // config db2
}),
MikroOrmModule.forMiddleware(),
```

## Testes (mock)
```typescript
{
  provide: getRepositoryToken(Photo),
  useValue: mockedRepository,
}
```

## Shutdown
```typescript
app.enableShutdownHooks();
```

## Gaps

- Versao exata do @mikro-orm/nestjs nao encontrada no README
- Schema multi-schema nao documentado no README (consultar docs principal)
