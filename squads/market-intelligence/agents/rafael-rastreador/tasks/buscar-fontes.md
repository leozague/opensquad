---
task: "Buscar Fontes"
order: 1
input: |
  - research_focus: Tema da pesquisa, janela temporal e contexto da empresa (de research-focus.md)
output: |
  - raw_sources: Lista de fontes coletadas com URL, data, tipo e excerto relevante
  - confidence_map: Nível de confiança atribuído a cada achado com razão
---

# Buscar Fontes

Coleta dados brutos das fontes definidas no foco da pesquisa, aplicando o método de landscape mapping seguido de busca focada e deep-dive nas fontes mais relevantes.

## Process

1. Ler `research-focus.md` completamente — extrair: tema exato, janela temporal, contexto da empresa (OMK/Kansai/Overmind/Meridiano)
2. Mapear categorias de fontes relevantes para o tema: analistas do setor, portais de notícias, redes sociais, sites de concorrentes, APIs públicas
3. Executar busca focada em cada categoria com 3-5 queries específicos por categoria (usar WebSearch)
4. Coletar 5-10 fontes candidatas por categoria; para cada uma registrar: URL, data, tipo de fonte, trecho relevante
5. Selecionar as 3-5 mais promissoras por categoria e fazer deep-dive (usar WebFetch para extrair conteúdo completo)
6. Verificar data de publicação de cada fonte — sinalizar como "⚠️ Desatualizado" qualquer dado com >12 meses em mercados dinâmicos (IA, software, startups)
7. Para cada achado, atribuir nível de confiança: ALTA (3+ fontes independentes), MÉDIA (2 fontes), BAIXA (1 fonte ou conflito)

## Output Format

```yaml
sources_collected:
  - url: "https://..."
    title: "Título do artigo/página"
    date: "AAAA-MM-DD"
    type: "analista | mídia | social | oficial | api"
    relevance_score: 8
    excerpt: "Trecho mais relevante do conteúdo..."
    confidence: "ALTA | MÉDIA | BAIXA"
    confidence_reason: "Razão do nível de confiança atribuído"
    
raw_findings:
  - finding: "Achado principal com dado quantificado"
    sources: ["url1", "url2"]
    confidence: "ALTA"
    
gaps_detected:
  - "Dado que não foi encontrado e tentativas realizadas"
```

## Output Example

> Use as quality reference, not as rigid template.

```
FONTES COLETADAS — Pesquisa: IA Corporativa Brasil | Janela: 01-08/04/2026

CATEGORIA: Analistas e Relatórios do Setor
1. IDC Brazil AI Services Market Q1 2026
   URL: https://www.idc.com/brazil/ai-q1-2026
   Data: 2026-04-05 | Tipo: Analista | Relevância: 9/10
   Confiança: ALTA — relatório primário, metodologia publicada
   Excerto: "O mercado brasileiro de serviços de IA cresceu 38% YoY no Q1 2026,
   liderado por demanda em agentes autônomos para operações B2B..."

2. ABES Relatório IA nas Empresas 2026
   URL: https://abes.org.br/relatorio-ia-2026
   Data: 2026-03-15 | Tipo: Associação | Relevância: 7/10
   Confiança: MÉDIA — metodologia não completamente detalhada
   Excerto: "62% das novas contratações de serviços de IA vêm de empresas de
   50-500 funcionários..."

CATEGORIA: Portais de Notícias
3. TechCrunch BR — "Três agências lançam RAG corporativo em 60 dias"
   URL: https://techcrunch.com/br/2026/04/02/rag-corporativo
   Data: 2026-04-02 | Tipo: Mídia | Relevância: 8/10
   Confiança: ALTA — corroborado por LinkedIn oficial das empresas
   Excerto: "Mesha, Doutores da IA e Altera.ai anunciaram ofertas de RAG
   corporativo no trimestre..."

ACHADOS COM CONFIANÇA MAPEADA
- Crescimento 38% YoY do mercado de IA BR: Confiança ALTA (2 fontes independentes)
- 62% demanda de PMEs: Confiança MÉDIA (1 fonte com metodologia parcial)
- RAG: 3 players em 60 dias: Confiança ALTA (mídia + LinkedIn oficial)

LACUNAS DETECTADAS
- Receita dos competidores: todas as empresas são privadas, dados não disponíveis
- NPS de clientes de agências de IA: nenhum estudo independente encontrado
```

## Quality Criteria

- [ ] Cada fonte tem URL completa e data de publicação
- [ ] Nível de confiança atribuído a cada achado com razão documentada
- [ ] Mínimo 3 fontes de tipos diferentes (diversidade de perspectivas)
- [ ] Fontes >12 meses em mercado dinâmico sinalizadas com "⚠️ Desatualizado"
- [ ] Seção de lacunas preenchida com tentativas realizadas

## Veto Conditions

Reject and redo if ANY are true:
1. Algum achado marcado como "Confiança: ALTA" tem apenas 1 fonte — elevar requer corroboração
2. Mais de 50% das fontes não têm URL verificável ou data de publicação
