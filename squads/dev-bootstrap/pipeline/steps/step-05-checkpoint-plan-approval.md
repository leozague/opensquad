---
type: checkpoint
---

# Step 05: Aprovacao do Plano SDD

## O que apresentar ao usuario

Ler `squads/dev-bootstrap/output/sdd-plan.md` e apresentar um resumo executivo contendo:

### 1. Visao Geral
- Nome do projeto, tipo, stack

### 2. Arquitetura
- Tipo de repo (mono/multi/single)
- Estrutura de pastas (arvore resumida)

### 3. Modulos e Ordem de Execucao
Para cada modulo, na ordem:
- Nome e descricao
- Numero de arquivos a criar
- Testes planejados (unit/integration/e2e)
- Commit message

### 4. Deploy
- Docker stack previsto
- CI/CD pipeline
- Servidor Easypanel alvo

### 5. Portas
- Portas atribuidas do port registry

### 6. Estimativa
- Total de modulos
- Total estimado de arquivos
- Total estimado de commits

### Opcoes para o usuario
1. **Aprovar** — prosseguir com a execucao autonoma
2. **Ajustar** — indicar o que mudar antes de executar
3. **Cancelar** — abortar o bootstrap

Se o usuario pedir ajustes, voltar ao Step 4 para o Andre Arquitetura reprocessar.

Apos aprovacao, a execucao e 100% autonoma ate o Step 9 (entrega final), com excecao de interrupcoes por decisoes nao previstas.

### Arquivo de referencia
Indicar ao usuario que o plano completo esta em:
`squads/dev-bootstrap/output/sdd-plan.md`
