---
task: "Plano de Execução"
order: 2
input: |
  - ideia-de-negocio.md: Lean Canvas e conceito do produto
  - analise-de-mercado.md: Pesquisa de mercado completa
  - plano-de-negocio.md: Plano de negócio com unit economics
output: |
  - plano-de-execucao.md: Roadmap faseado com MVP, recursos e timeline
---

# Plano de Execução

Cria o roadmap de implementação: definição de MVP via MoSCoW, fases com métricas de sucesso, estimativa de recursos, sugestão de tech stack e kill criteria.

## Process

1. Ler os 3 documentos anteriores. Extrair: funcionalidades core da solução, budget estimado, segmento-alvo, modelo de receita
2. Definir **MVP** via MoSCoW: listar todas as features mencionadas e classificar em Must/Should/Could/Won't para Fase 1
3. Criar **Roadmap Faseado**: Fase 1 (MVP, 0-3m), Fase 2 (PMF, 3-6m), Fase 3 (Scale, 6-12m). Cada fase com escopo, métrica de sucesso e kill criteria
4. Estimar **Recursos**: equipe mínima por fase, budget por fase, ferramentas/serviços necessários
5. Sugerir **Tech Stack**: baseado em velocidade de entrega e complexidade do produto. Justificar cada escolha
6. Definir **Kill Criteria** por fase: condições mensuráveis para go/no-go

## Output Format

```yaml
mvp:
  must: ["Feature essencial 1", "Feature essencial 2"]
  should: ["Feature desejável 1"]
  could: ["Feature opcional 1"]
  wont: ["Feature descartada para MVP"]

roadmap:
  fase_1:
    nome: "MVP"
    periodo: "Meses 1-3"
    escopo: [...]
    metrica_sucesso: "..."
    kill_criteria: "..."
    budget: "R$..."
  fase_2: ...
  fase_3: ...

recursos:
  equipe: [...]
  ferramentas: [...]
  budget_total: "..."

tech_stack:
  frontend: "..."
  backend: "..."
  banco: "..."
  infra: "..."
  justificativa: "..."
```

## Output Example

> Use como referência de qualidade, não como template rígido.

```markdown
# Plano de Execução: FinSimples

## Definição do MVP (MoSCoW)

### MUST (Fase 1 — obrigatório para lançar)
- Cadastro e autenticação (email + Google)
- Upload de foto/PDF de extrato bancário
- Categorização automática via IA (mín. 80% precisão)
- Dashboard com saldo e gastos por categoria
- Meta de economia simples (um objetivo ativo)

### SHOULD (Fase 1 — incluir se possível)
- Notificação push de gasto acima do limite
- Importação manual de transações
- Relatório mensal básico (PDF)

### COULD (Fase 2)
- Integração Open Finance (1 banco piloto)
- Histórico comparativo mês-a-mês
- Gamificação (badges, streaks)

### WON'T (não agora)
- App desktop/web
- Relatório fiscal IRPF
- Marketplace de serviços financeiros
- Multi-moeda

## Roadmap

### Fase 1 — MVP | Meses 1-3 | Budget: R$120k
**Objetivo:** Validar demand com 50 beta testers
**Escopo:** Features MUST + SHOULD do MoSCoW
**Equipe:** 1 dev full-stack + 1 dev mobile + 1 designer (part-time)
**Entregas:**
- Mês 1: Protótipo navegável + validação com 10 usuários
- Mês 2: App funcional com upload de extrato + IA
- Mês 3: Beta fechado com 50 testadores

**Métrica de sucesso:** 50 testers com NPS > 40 e uso semanal > 60%
**Kill criteria:** < 20 testers interessados após 30 dias de divulgação em comunidades-alvo

### Fase 2 — Product-Market Fit | Meses 4-6 | Budget: R$180k
**Objetivo:** 500 assinantes pagantes
**Escopo:** Open Finance, notificações inteligentes, onboarding guiado
**Equipe:** +1 dev backend (Open Finance) + 1 growth
**Entregas:**
- Mês 4: Lançamento público em app stores
- Mês 5: Open Finance com 1 banco piloto
- Mês 6: Iteração baseada em feedback + campanha de aquisição

**Métrica de sucesso:** MRR R$7.5k, churn < 10%/mês, 500 pagantes
**Kill criteria:** < 200 pagantes após 60 dias de lançamento público

### Fase 3 — Scale | Meses 7-12 | Budget: R$400k
**Objetivo:** 5.000 assinantes, breakeven
**Escopo:** Multi-banco, relatório fiscal, gamificação, app web
**Equipe:** +2 devs + 1 suporte + 1 marketing
**Entregas:**
- Mês 7-8: Multi-banco Open Finance (5 bancos)
- Mês 9-10: Tier Premium com relatório fiscal
- Mês 11-12: Web app + programa de indicação

**Métrica de sucesso:** MRR R$87k, churn < 6%/mês
**Kill criteria:** < 2.000 pagantes no mês 10

## Recursos Totais

| Recurso | Fase 1 | Fase 2 | Fase 3 | Total |
|---------|--------|--------|--------|-------|
| Budget | R$120k | R$180k | R$400k | R$700k |
| Equipe | 2.5 pessoas | 4.5 pessoas | 7.5 pessoas | — |
| Duração | 3 meses | 3 meses | 6 meses | 12 meses |

## Tech Stack Sugerido

| Camada | Tecnologia | Justificativa |
|--------|-----------|---------------|
| Mobile | React Native | Cross-platform, ecossistema maduro, velocidade de entrega |
| Backend | Node.js + NestJS | Async-friendly para integrações, TypeScript end-to-end |
| Banco | PostgreSQL | Robusto para dados financeiros, bom com JSON |
| IA/OCR | Google Vision API + OpenAI | Vision para OCR de extratos, GPT para categorização |
| Infra | AWS (ECS + RDS) | Escalável, compliance-ready para dados financeiros |
| CI/CD | GitHub Actions | Simples, integrado ao repo |
```

## Quality Criteria

- [ ] MVP com classificação MoSCoW completa
- [ ] Roadmap com 3 fases e períodos definidos
- [ ] Cada fase com métrica de sucesso mensurável
- [ ] Kill criteria definidos por fase
- [ ] Budget estimado por fase
- [ ] Equipe mínima estimada por fase
- [ ] Tech stack justificado (não por hype)

## Veto Conditions

Rejeitar e refazer se QUALQUER condição for verdadeira:
1. MVP não é mínimo — inclui features "nice to have" como obrigatórias
2. Sem kill criteria — nenhuma fase define quando parar ou pivotar
