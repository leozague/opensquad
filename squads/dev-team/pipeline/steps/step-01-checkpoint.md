# Step 1 — Checkpoint: Selecao do Especialista

## Objetivo

Identificar qual especialista do time deve ser consultado e qual o contexto da consulta.

## Perguntas ao Usuário

**Pergunta 1:** Qual especialista voce quer consultar?
- **Business Owner** — Validar se a feature/decisao faz sentido de negocio
- **Product Manager** — Refinar user stories, criterios de aceite, priorizacao
- **Arquiteto** — Decisoes de arquitetura, padroes tecnicos, estrutura de modulos
- **DBA** — Design de schema, migrations, queries, performance de banco

(Se o usuario escolher "mais opcoes", apresentar segunda rodada:)
- **Backend Developer** — Duvidas de implementacao API, NestJS, services
- **Frontend Developer** — Duvidas de implementacao Vue 3, Pinia, componentes
- **QA Engineer** — Cenarios de teste, cobertura, estrategia de qualidade
- **DevOps Engineer** — CI/CD, Docker, variaveis de ambiente, infra
- **Tech Writer** — Documentacao tecnica, como documentar uma decisao

**Pergunta 2 (free text):** Descreva o contexto e o que voce quer saber.
- Exemplos: "Estou criando o modulo de pedidos. Qual seria a melhor estrutura de schema?"
- "Tenho um briefing pronto. Voce pode revisar os criterios de aceite?"
- "Preciso validar se vale a pena implementar X antes do Y"

## Output

Registrar no estado:
```json
{
  "especialista": "DBA",
  "agent_id": "dev-team/agents/dba",
  "contexto": "descricao do usuario",
  "project_docs_path": "(se informado)"
}
```
