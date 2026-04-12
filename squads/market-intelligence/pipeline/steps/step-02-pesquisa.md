---
execution: subagent
agent: market-intelligence/agents/rafael-rastreador
inputFile: squads/market-intelligence/output/research-focus.md
outputFile: squads/market-intelligence/output/research-brief.md
model_tier: fast
---

# Step 02: Pesquisa de Inteligência

## Context Loading

Load these files before executing:
- `squads/market-intelligence/output/research-focus.md` — foco definido pelo usuário no checkpoint: tema, janela temporal e contexto
- `squads/market-intelligence/pipeline/data/research-brief.md` — padrão e exemplos de research brief de alta qualidade
- `squads/market-intelligence/pipeline/data/domain-framework.md` — metodologia de pesquisa (landscape mapping, focused sweep, deep-dive)
- `squads/market-intelligence/pipeline/data/anti-patterns.md` — erros a evitar durante a pesquisa

## Instructions

### Process

1. **Ler research-focus.md** — extrair tema exato, janela temporal e marca OMK relevante (Kansai / Overmind / Meridiano / grupo)
2. **Mapear categorias de fontes** para o tema: analistas (IDC, Gartner, FGV), portais de notícias (Valor, TechCrunch BR, InfoMoney), redes sociais (LinkedIn Pulse, Twitter/X do setor), sites de concorrentes identificados
3. **Executar buscas focadas** com WebSearch — 3-5 queries por categoria. Exemplo de queries para IA corporativa: "mercado IA corporativa Brasil 2026", "agentes LLM empresas Brasil", "RAG corporativo tendências"
4. **Deep-dive nas 3-5 fontes mais relevantes** com WebFetch para extrair dados específicos, citações e números
5. **Cruzar dados entre fontes** e atribuir níveis de confiança: ALTA (3+ fontes), MÉDIA (2 fontes), BAIXA (1 fonte ou conflito)
6. **Compilar research brief** no formato padrão: Achados, Tendências, Fontes, Lacunas

## Output Format

```
RESEARCH BRIEF
Tema: [do research-focus.md]
Janela Temporal: [do research-focus.md]
Preparado: [data atual]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PRINCIPAIS ACHADOS

1. [Achado com dado quantificado]
   Confiança: ALTA | Fonte: [nome] | URL: [link] | Acessado: [data]

2. [Segundo achado]
   Confiança: MÉDIA — [razão da confiança média]
   Fonte: [nome] | URL: [link] | Acessado: [data]

[3-6 achados no total]

TENDÊNCIAS EMERGENTES

- "[Nome da tendência]" — Ciclo: [emergente/crescimento/maduro/declínio]
  [Descrição em 1-2 linhas. Janela temporal estimada.]

[2-4 tendências]

FONTES

| # | Fonte | Tipo | Relevância | Data |
|---|-------|------|------------|------|
| 1 | [nome] | [analista/mídia/social/oficial] | [X/10] | [mês/ano] |

[5-8 fontes mínimo]

LACUNAS

- [Dado não encontrado]: [razão + tentativas realizadas]
```

## Output Example

Ver `pipeline/data/research-brief.md` seção "Exemplos de Output de Alta Qualidade" para exemplo completo de 80+ linhas.

Resumo do padrão esperado:
- 4-6 achados com nível de confiança e URL
- 2-4 tendências com ciclo de vida e janela temporal
- Tabela de fontes com 5-8 entradas
- Seção de Lacunas com pelo menos 2 gaps documentados

## Veto Conditions

Reject and redo if ANY of these are true:
1. Algum achado marcado como "Confiança: ALTA" não tem pelo menos 2 fontes verificáveis
2. Seção de Lacunas ausente ou vazia

## Quality Criteria

- [ ] Tema do research-focus respeitado — sem desvios de escopo
- [ ] Janela temporal respeitada — sem dados fora do período sem flag
- [ ] Todos os achados com URL e data de acesso
- [ ] Níveis de confiança atribuídos a todos os achados com razão
- [ ] Tendências com ciclo de vida e janela temporal
- [ ] Lacunas documentadas com tentativas realizadas
