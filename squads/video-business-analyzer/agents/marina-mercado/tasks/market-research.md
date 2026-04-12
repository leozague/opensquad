---
task: "Pesquisa de Mercado"
order: 1
input: |
  - ideia-de-negocio.md: Lean Canvas com a ideia formulada
  - perguntas_para_pesquisa: Lista de perguntas do extrator
output: |
  - analise-de-mercado.md: Relatório completo de mercado
---

# Pesquisa de Mercado

Realiza pesquisa de mercado completa (Brasil + Global) para a ideia de negócio extraída: dimensionamento TAM/SAM/SOM, mapeamento de concorrentes, análise SWOT e tendências.

## Process

1. Ler a ideia de negócio (Lean Canvas) e a lista de perguntas para pesquisa. Identificar o setor, segmento e tipo de produto
2. **TAM/SAM/SOM** — Pesquisar via WebSearch em fontes como Statista, IBISWorld, relatórios setoriais. TAM global + TAM Brasil. Narrowar SAM com critérios geográficos e de segmento. Estimar SOM conservador para ano 1 com premissas explícitas
3. **Concorrentes** — Mapear mínimo 3 diretos + 2 indiretos + substitutos. Para cada: nome, modelo, pricing, diferenciais, fraquezas. Usar WebSearch para encontrar players do mercado
4. **SWOT** — Compilar com base em dados coletados. Cada item deve ser específico e ter evidência
5. **Timing** — Responder "por que agora?" com dados concretos (regulação, tendência tecnológica, mudança de comportamento)
6. **Responder perguntas** — Endereçar cada pergunta listada pelo extrator
7. **Compilar relatório** — Formato estruturado com fontes, confiança e gaps

## Output Format

```yaml
mercado:
  tam:
    global: "Valor + fonte"
    brasil: "Valor + fonte"
  sam: "Valor + critérios de narrowing"
  som: "Valor + premissas para ano 1"

concorrentes:
  diretos:
    - nome: "..."
      modelo: "..."
      pricing: "..."
      diferenciais: ["..."]
      fraquezas: ["..."]
  indiretos: [...]
  substitutos: [...]

swot:
  forcas: ["Item específico com evidência"]
  fraquezas: ["Item específico"]
  oportunidades: ["Item com dados"]
  ameacas: ["Item com dados"]

timing: "Por que agora — resposta com dados"
respostas_perguntas: [...]
gaps: ["O que não foi possível encontrar"]
fontes: [...]
```

## Output Example

> Use como referência de qualidade, não como template rígido.

```markdown
# Análise de Mercado: FinSimples — App de Finanças Pessoais

## Dimensionamento de Mercado

### TAM (Total Addressable Market)
- **Global:** US$1.57 trilhão (mercado global de fintech, Statista 2025)
  - Segmento Personal Finance: US$135 bilhões
- **Brasil:** R$45.8 bilhões (mercado de fintech BR, ABFintechs 2025)
  Confiança: ALTA — fonte primária, relatório anual

### SAM (Serviceable Addressable Market)
- **Critérios de narrowing:** Apps de finanças pessoais mobile, mercado BR,
  público classe B/C, 25-45 anos
- **Estimativa:** R$2.1 bilhões
  Confiança: MÉDIA — calculado a partir de dados IBGE (população alvo) ×
  willingness-to-pay médio do segmento

### SOM (Serviceable Obtainable Market)
- **Ano 1:** R$1.07M (6.000 assinantes × R$14,90/mês × 12)
- **Premissas:** 150k downloads orgânicos, 4% conversão, 10% churn mensal
  Confiança: BAIXA — premissas não validadas, baseadas em benchmarks genéricos

## Mapa de Concorrentes

### Concorrentes Diretos
| Nome | Modelo | Pricing | Users (est.) | Diferencial | Fraqueza |
|------|--------|---------|-------------|-------------|----------|
| Mobills | Freemium | Grátis / R$16,90/mês | 12M+ downloads | Base instalada grande, marca reconhecida | UX complexa, muitas features |
| Organizze | Freemium | Grátis / R$12,90/mês | 5M+ downloads | Design clean, boa UX | Sem integração Open Finance |
| GuiaBolso | Free + serviços | Grátis (monetiza via crédito) | 8M+ downloads | Integração bancária pioneira | Foco mudou para crédito |

### Concorrentes Indiretos
- **Planilhas do Google/Excel** — Gratuitas, customizáveis, mas exigem disciplina
- **Nubank/Inter** — Features financeiras dentro do banco digital

### Substitutos
- **Não fazer nada** — 67% da população não controla finanças ativamente

## SWOT

| | Positivo | Negativo |
|---|---------|----------|
| **Interno** | **Forças:** UX simplificada (foto→categorização) diferencia de apps complexos; Open Finance permite automação real | **Fraquezas:** Sem base de usuários; custo de integração Open Finance estimado em R$50-100k; dependência de API de terceiros |
| **Externo** | **Oportunidades:** Open Finance BR em expansão (800+ instituições conectadas, BCB 2025); 67% sem controle = mercado inexplorado | **Ameaças:** Bancos digitais adicionando features similares; concentração em poucos players; custo de aquisição alto (CAC R$15-40 para apps financeiros) |

## Por Que Agora?
1. **Open Finance maturo:** 800+ instituições conectadas no Brasil (BCB, 2025)
2. **Fadiga de apps complexos:** Tendência global de "app-minimalismo" em finanças
3. **IA acessível:** Custo de processamento de imagem caiu 70% desde 2023

## Fontes
| # | Fonte | Tipo | Confiança | Acesso |
|---|-------|------|-----------|--------|
| 1 | Statista Global Fintech Report 2025 | Relatório | Alta | 2026-04-09 |
| 2 | ABFintechs Relatório Anual 2025 | Associação | Alta | 2026-04-09 |
| 3 | IBGE PNAD Contínua 2025 | Governo | Alta | 2026-04-09 |
| 4 | BCB Dados Open Finance | Regulador | Alta | 2026-04-09 |

## Gaps
- Dados de CAC específicos para apps de finanças pessoais no Brasil não encontrados
- Taxa de conversão freemium especifica do segmento sem fonte primária confiável
- Dados de retenção de longo prazo (12+ meses) indisponíveis para o mercado BR
```

## Quality Criteria

- [ ] TAM sourced com URL e data
- [ ] SAM narrowed com critérios explícitos
- [ ] SOM com premissas declaradas
- [ ] Mín. 3 concorrentes diretos + 2 indiretos mapeados
- [ ] SWOT com evidências específicas (não genérico)
- [ ] "Por que agora?" respondido com dados
- [ ] Confiança atribuída a cada finding
- [ ] Gaps documentados
- [ ] Todas as fontes citadas com URL e data

## Veto Conditions

Rejeitar e refazer se QUALQUER condição for verdadeira:
1. TAM sem fonte citável — números inventados ou "estimativa própria" sem base
2. Zero concorrentes mapeados — sempre há concorrentes diretos, indiretos ou substitutos
