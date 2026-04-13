# @nestjs/cqrs — Doc Cache

> Fonte: https://github.com/nestjs/cqrs (README + docs.nestjs.com/recipes/cqrs)
> Acessado em: 2026-04-13

## Getting Started

```bash
npm install @nestjs/cqrs
```

## Configuracao

```typescript
import { CqrsModule } from '@nestjs/cqrs';

@Module({
  imports: [CqrsModule],
  // registrar handlers como providers
  providers: [
    CreateTaskHandler,
    GetTasksHandler,
    TaskCreatedHandler,
  ],
})
export class TasksModule {}
```

## Commands (escrita)

### Command class (DTO imutavel)
```typescript
export class CreateTaskCommand {
  constructor(
    public readonly title: string,
    public readonly quadrant: string,
    public readonly workspaceId: string,
  ) {}
}
```

### Command Handler
```typescript
import { CommandHandler, ICommandHandler } from '@nestjs/cqrs';

@CommandHandler(CreateTaskCommand)
export class CreateTaskHandler implements ICommandHandler<CreateTaskCommand> {
  constructor(private readonly em: EntityManager) {}

  async execute(command: CreateTaskCommand) {
    const task = this.em.create(Task, {
      title: command.title,
      quadrant: command.quadrant,
    });
    await this.em.flush();
    return task;
  }
}
```

### Executar Command
```typescript
@Controller('tasks')
export class TasksController {
  constructor(private readonly commandBus: CommandBus) {}

  @Post()
  async create(@Body() dto: CreateTaskDto) {
    return this.commandBus.execute(
      new CreateTaskCommand(dto.title, dto.quadrant, dto.workspaceId),
    );
  }
}
```

## Queries (leitura)

### Query class
```typescript
export class GetTasksByQuadrantQuery {
  constructor(
    public readonly quadrant: string,
    public readonly workspaceId: string,
  ) {}
}
```

### Query Handler
```typescript
import { QueryHandler, IQueryHandler } from '@nestjs/cqrs';

@QueryHandler(GetTasksByQuadrantQuery)
export class GetTasksByQuadrantHandler implements IQueryHandler<GetTasksByQuadrantQuery> {
  constructor(private readonly em: EntityManager) {}

  async execute(query: GetTasksByQuadrantQuery) {
    return this.em.find(Task, {
      quadrant: query.quadrant,
      workspace: query.workspaceId,
    });
  }
}
```

### Executar Query
```typescript
@Get()
async findByQuadrant(@Query('q') quadrant: string) {
  return this.queryBus.execute(
    new GetTasksByQuadrantQuery(quadrant, workspaceId),
  );
}
```

## Events (domain events)

### Event class
```typescript
export class TaskCreatedEvent {
  constructor(
    public readonly taskId: string,
    public readonly title: string,
  ) {}
}
```

### Event Handler
```typescript
import { EventsHandler, IEventHandler } from '@nestjs/cqrs';

@EventsHandler(TaskCreatedEvent)
export class TaskCreatedHandler implements IEventHandler<TaskCreatedEvent> {
  async handle(event: TaskCreatedEvent) {
    // registrar activity log, enviar notificacao, etc.
  }
}
```

### Um evento pode ter multiplos handlers
```typescript
@EventsHandler(TaskCreatedEvent)
export class LogTaskCreated implements IEventHandler<TaskCreatedEvent> {
  handle(event: TaskCreatedEvent) { /* log */ }
}

@EventsHandler(TaskCreatedEvent)
export class NotifyTaskCreated implements IEventHandler<TaskCreatedEvent> {
  handle(event: TaskCreatedEvent) { /* notificacao */ }
}
```

### Publicar Event
```typescript
// via EventBus
constructor(private readonly eventBus: EventBus) {}
this.eventBus.publish(new TaskCreatedEvent(task.id, task.title));

// via AggregateRoot (entidades que extendem AggregateRoot)
export class Task extends AggregateRoot {
  complete() {
    this.apply(new TaskCompletedEvent(this.id));
  }
}
```

## Patterns Recomendados

- Commands para escrita (mutacoes), Queries para leitura
- Events para side-effects desacoplados (log, notificacoes, cache invalidation)
- Um handler por command/query, multiplos handlers por event
- Commands e queries sao DTOs imutaveis (readonly properties)
- Nao chamar services de um handler — orquestrar via entities + events

## Gaps

- Doc completa nao carregou via WebFetch (JS-rendered)
- Saga pattern nao documentado aqui
- UnhandledExceptionBus nao coberto
