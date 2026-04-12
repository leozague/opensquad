---
task: "Generate Angles"
order: 1
input: |
  - selected_news: A notícia selecionada pelo usuário (de research-results.md, filtrada pelo checkpoint)
  - brand_context: Tom de voz Overmind e público-alvo
output: |
  - angles: 5 ângulos distintos com hook, driver psicológico e preview do arco narrativo
---

# Generate Angles

Gera 5 ângulos distintos sobre a MESMA notícia selecionada. Cada ângulo é uma lente emocional/perspectiva diferente que produz um carrossel completamente diferente.

## Process

1. **Ler a notícia selecionada** e extrair: dado âncora, fonte, implicação para o público Overmind.

2. **Identificar os 5 drivers psicológicos** mais relevantes para esta notícia:
   - Medo/Perda: "Se você não fizer X, vai perder Y"
   - Oportunidade: "Essa é sua janela antes que todos descubram"
   - Educacional: "Testei/analisei X. Veja o que descobri"
   - Contrário: "Todo mundo diz X. Mas na verdade..."
   - Inspiracional: "Imagine um mundo onde..."

3. **Para cada ângulo, gerar:**
   - Título do ângulo (2-4 palavras)
   - Driver psicológico principal
   - Hook de exemplo (max 10 palavras, como ficaria no slide 1)
   - Preview do arco narrativo (3 frases descrevendo o caminho do carrossel)
   - Formato de carrossel sugerido (Editorial, Listicle, Tutorial, etc.)

4. **Garantir diversidade real:** Se dois ângulos parecem iguais com palavras diferentes, descartar um e criar outro genuinamente diferente.

5. **Formatar e apresentar** para o usuário escolher.

## Output Format

```markdown
# Ângulos — [Título da Notícia]

> Fonte: [fonte] | Dado âncora: [dado]

## Ângulo 1: [Título]
**Driver:** [driver psicológico]
**Hook:** "[hook de exemplo]"
**Arco:** [preview em 3 frases]
**Formato sugerido:** [formato de carrossel]

## Ângulo 2: [Título]
...

(repetir para os 5 ângulos)
```

## Output Example

```markdown
# Ângulos — Zendesk: IA no suporte eleva NPS em 34%

> Fonte: Zendesk CX Trends 2026 | Dado âncora: NPS +34% com IA

## Ângulo 1: O Abismo
**Driver:** Medo/Perda
**Hook:** "Seu atendimento vai perder clientes em 2026."
**Arco:** Mostra o gap entre expectativa do consumidor (5 min) e realidade das PMEs (47 min). Agrava com dados de churn. Apresenta IA como o caminho inevitável.
**Formato sugerido:** Editorial / Tese

## Ângulo 2: A Janela
**Driver:** Oportunidade
**Hook:** "Enquanto seus concorrentes dormem, automatize."
**Arco:** Posiciona o momento atual como janela de vantagem competitiva. Mostra que poucos adotaram. Quem chegar primeiro domina.
**Formato sugerido:** Problema → Solução

## Ângulo 3: O Teste
**Driver:** Educacional
**Hook:** "Testamos IA no atendimento de 3 clientes. Resultado:"
**Arco:** Case prático com números reais. Antes vs. depois. Passo a passo do que foi implementado.
**Formato sugerido:** Antes e Depois

## Ângulo 4: O Mito
**Driver:** Contrário
**Hook:** "IA no atendimento não funciona. Será?"
**Arco:** Desmonta objeções comuns (é frio, não entende contexto, clientes odeiam). Apresenta dados que contradizem cada mito.
**Formato sugerido:** Mito vs Realidade

## Ângulo 5: O Futuro Próximo
**Driver:** Inspiracional
**Hook:** "Imagine seu time só resolvendo problemas que importam."
**Arco:** Pinta a visão de um time de suporte onde IA cuida do repetitivo e humanos cuidam do complexo. Conecta com propósito e satisfação do time.
**Formato sugerido:** Storytelling / Narrativa
```

## Quality Criteria

- [ ] Exatamente 5 ângulos apresentados
- [ ] Cada ângulo usa um driver psicológico genuinamente diferente
- [ ] Todos os ângulos são sobre a MESMA notícia (não 5 notícias diferentes)
- [ ] Hooks têm máximo 10 palavras e passam no scroll-stop test
- [ ] Formatos de carrossel sugeridos são variados (não todos Editorial)
- [ ] Arcos narrativos são previews concretos, não descrições vagas

## Veto Conditions

Reject and redo if ANY are true:
1. Dois ou mais ângulos usam o mesmo driver psicológico
2. Algum ângulo é sobre uma notícia diferente da selecionada
