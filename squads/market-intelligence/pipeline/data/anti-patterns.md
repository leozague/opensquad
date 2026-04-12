# Anti-Patterns — Squad de Inteligência de Mercado

> Erros comuns documentados e como evitá-los | 2026-04-08

---

## Anti-Padrões de Pesquisa (Rafael Rastreador)

### 1. Research-to-Shelf Syndrome
**O que é:** Pesquisa documentada mas nunca convertida em decisão ou ação. Insights ficam no arquivo sem owner ou próximo passo.
**Por que é prejudicial:** Desperdiça tokens e tempo do squad. O valor da inteligência está na ativação, não na documentação.
**Como evitar:** Cada achado deve conectar a uma implicação de negócio clara. O brief deve ser acionável pelo analista downstream.

### 2. Fonte Única como Prova
**O que é:** Citar uma fonte apenas e tratá-la como fato confirmado.
**Por que é prejudicial:** Uma fonte é uma hipótese. Dados não corroborados chegam ao deck executivo com falsa autoridade.
**Como evitar:** Atribuir "Confiança: BAIXA" quando há apenas uma fonte. Tentar corroborar antes de elevar para ALTA.

### 3. Escopo Indefinido
**O que é:** Pesquisar sem ter lido e processado o research-focus.md. Buscar "IA no Brasil" quando o foco era "agentes de IA para cobrança B2B".
**Por que é prejudicial:** Gera volume de dados irrelevante que polui o brief e confunde o analista.
**Como evitar:** Sempre ler research-focus.md como primeiro passo. Confirmar internamente o escopo antes de executar qualquer busca.

### 4. Dados Desatualizados Não Sinalizados
**O que é:** Incluir dados de 18+ meses atrás em mercados dinâmicos (IA, software, startups) sem sinalizar a desatualização.
**Por que é prejudicial:** O tomador de decisão age com base em dados obsoletos sem saber.
**Como evitar:** Sempre incluir data de publicação e sinalizar com "⚠️ Dado de [mês/ano] — verificar atualização" quando relevante.

### 5. Ignorar Contradições Entre Fontes
**O que é:** Quando duas fontes dizem coisas diferentes, escolher uma e ignorar a outra.
**Por que é prejudicial:** Suprime informação relevante. A contradição em si é um sinal de mercado importante.
**Como evitar:** Documentar ambas as versões com suas respectivas fontes. Marcar como "Confiança: MÉDIA — fontes divergentes".

---

## Anti-Padrões de Análise (Ana Analítica)

### 6. Restatement Mascarado de Insight
**O que é:** "O mercado de IA cresceu 38% YoY" — isso é um dado, não um insight.
**Por que é prejudicial:** Não adiciona valor ao que já está no research brief. O executivo quer saber o que fazer com o dado.
**Como evitar:** Todo insight deve ter "Isso significa: [implicação de negócio]". Se não há implicação, não é insight, é dado.

### 7. Correlação como Causalidade
**O que é:** "O aumento de posts no LinkedIn causou o crescimento do mercado".
**Por que é prejudicial:** Induz decisões baseadas em relação causal não demonstrada.
**Como evitar:** Usar "correlaciona com", "coincidiu com" ou "acompanhou" em vez de "causou" ou "resultou em".

### 8. Qualificadores Vagos
**O que é:** "Crescimento significativo", "performance expressiva", "demanda considerável".
**Por que é prejudicial:** O executivo não sabe se "significativo" é 2% ou 200%.
**Como evitar:** Quantificar sempre. "Crescimento de 38% YoY" não "crescimento significativo".

### 9. Recomendações Sem Dados de Suporte
**O que é:** "Recomendamos investir mais em IA" — sem citar qual achado sustenta a recomendação.
**Por que é prejudicial:** Parecem opiniões, não análises. Perdem credibilidade imediatamente.
**Como evitar:** Cada recomendação cita o número do insight que a sustenta: "(baseado no Insight 1)".

### 10. Anomalias Ignoradas
**O que é:** Um dado se move 50% sem que o analista sinalize.
**Por que é prejudicial:** Anomalias são os sinais mais valiosos — podem indicar oportunidade ou ameaça crítica.
**Como evitar:** Qualquer movimento >25% é automaticamente marcado como "🚨 Anomalia detectada" e investigado.

---

## Anti-Padrões de Design (Diego Dashboard)

### 11. Títulos-Variável em Vez de Títulos-Conclusão
**O que é:** Slide com título "Análise do Mercado de IA" em vez de "IA no Brasil Cresce 38% YoY — Janela de 6 Meses".
**Por que é prejudicial:** Obriga o executivo a ler o slide inteiro para extrair o insight. Em reuniões, slides sem conclusão explícita são ignorados.
**Como evitar:** Perguntar: "Se o executivo só ler o título, ele sabe o que concluir?" Se não, reescrever.

### 12. Excesso de KPIs
**O que é:** Slide com 15+ métricas, tudo com o mesmo peso visual.
**Por que é prejudicial:** Cognitivamente sobrecarrega o leitor. Executivos não processam >8 KPIs por slide em contexto de reunião.
**Como evitar:** Máximo 8 KPIs por slide executivo. Mover dados adicionais para um slide de detalhes ou anexo.

### 13. HTML com Dependências Externas
**O que é:** Deck que só renderiza com internet (fontes do Google Fonts, imagens de CDN externo).
**Por que é prejudicial:** Falha em ambientes offline, apresentações sem internet, ou quando URLs mudam.
**Como evitar:** CSS 100% inline, sem `<link>` para fontes externas. Usar stack de fontes local como fallback.

### 14. Deck Sem Narrativa (Slides Desconectados)
**O que é:** Cada slide parece um relatório independente sem fio condutor.
**Por que é prejudicial:** O executivo não consegue montar a história na cabeça. Decks sem narrativa não geram ação.
**Como evitar:** Cada slide deve ser a resposta para "E daí?" do slide anterior. Capa → Contexto → Dados → Por quê importa → O que fazer.

---

## Anti-Padrões de Revisão (Vera Veredicto)

### 15. Rubber-Stamp Approval
**O que é:** Aprovar sem ler completamente, ou dar notas altas para evitar conflito.
**Por que é prejudicial:** Manda output de baixa qualidade ao usuário final. Destrói a confiança no processo de revisão.
**Como evitar:** Ler o deck completo antes de qualquer avaliação. Priorizar honestidade sobre conforto.

### 16. Rejeição Sem Caminho de Aprovação
**O que é:** "Rejeitado — qualidade insuficiente" sem especificar o que mudar e como.
**Por que é prejudicial:** Diego Dashboard não sabe o que corrigir. Leva a iterações sem progresso.
**Como evitar:** Cada rejeição tem: "Required change: [Slide X] [O que está errado] [Como corrigir]".

### 17. Feedback em Slide Errado
**O que é:** "O insight está fraco" sem indicar qual slide ou qual insight.
**Por que é prejudicial:** Força Diego a reler tudo para encontrar o problema. Perde iterações.
**Como evitar:** Sempre referenciar por número: "Slide 4, Insight 2: 'RAG corporativo como diferencial' — título não é conclusão, reescrever como '3 competidores lançaram RAG nos últimos 60 dias'".

---

## Checklist de Anti-Padrões para Verificação Rápida

Antes de passar o output para o próximo agente, verificar:

**Rafael:**
- [ ] Todos os dados têm fonte com URL e data de acesso?
- [ ] Nenhuma afirmação genérica sem fonte específica?
- [ ] Lacunas documentadas honestamente?
- [ ] Nenhum dado >12 meses sem flag de desatualização?

**Ana:**
- [ ] Todos os insights têm "Isso significa..."?
- [ ] Nenhum qualificador vago (significativo, expressivo, considerável)?
- [ ] Recomendações citam insights específicos?
- [ ] Anomalias >25% sinalizadas?

**Diego:**
- [ ] Todos os slides com título-conclusão?
- [ ] Máximo 8 KPIs por slide?
- [ ] HTML autossuficiente (sem dependências externas)?
- [ ] Narrativa coerente do início ao fim?

**Vera:**
- [ ] Deck lido completo antes de qualquer score?
- [ ] Cada score tem justificativa específica?
- [ ] Rejeições têm "Required change:" com instrução concreta?
- [ ] Pontos fortes reconhecidos mesmo em rejeições?
