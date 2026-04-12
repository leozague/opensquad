---
task: "Formular Ideia de Negócio"
order: 2
input: |
  - roteiro-video.md: Roteiro estruturado do vídeo
output: |
  - ideia-de-negocio.md: Lean Canvas preenchido + conceito formulado como hipótese
---

# Formular Ideia de Negócio

Transforma o conteúdo extraído do vídeo em uma ideia de negócio estruturada usando o framework Lean Canvas, formulada como hipótese falsificável.

## Process

1. Ler o roteiro completo e identificar a ideia de negócio central. Se houver múltiplas ideias, selecionar a principal e listar as secundárias
2. Preencher o Lean Canvas (9 blocos) usando APENAS dados do vídeo. Marcar com "[inferido]" quando deduzir algo e "[não mencionado]" quando faltar informação
3. Formular a ideia como hipótese falsificável: "Segmento X pagará Y por Z porque [razão]"
4. Mapear o Value Proposition Canvas: Jobs-to-be-done, Dores e Ganhos do cliente
5. Compilar lista de perguntas não respondidas que a pesquisa de mercado precisa endereçar

## Output Format

```yaml
hipotese: "Segmento X pagará Y por Z porque..."

lean_canvas:
  problema: ["Problema 1", "Problema 2", "Problema 3"]
  solucao: ["Solução 1", "Solução 2", "Solução 3"]
  proposta_valor: "Frase única que resume o valor"
  vantagem_injusta: "O que não pode ser facilmente copiado"
  segmentos: ["Segmento primário", "Segmento secundário"]
  canais: ["Canal 1", "Canal 2"]
  receita: ["Fonte 1", "Fonte 2"]
  custos: ["Custo 1", "Custo 2"]
  metricas: ["Métrica 1", "Métrica 2"]

value_proposition:
  jobs: ["Job 1", "Job 2"]
  dores: ["Dor 1", "Dor 2"]
  ganhos: ["Ganho 1", "Ganho 2"]

perguntas_para_pesquisa:
  - "Pergunta que precisa de pesquisa de mercado"
```

## Output Example

> Use como referência de qualidade, não como template rígido.

```markdown
# Ideia de Negócio: FinSimples

## Hipótese
Brasileiros de 25-45 anos, classe B/C, com renda entre R$3k-R$10k/mês,
pagarão R$14,90/mês por um app que automatiza controle financeiro via foto
de extrato, porque os apps existentes são complexos demais e 67% não controlam
suas finanças (IBGE).

## Lean Canvas

| Bloco | Conteúdo | Fonte |
|-------|----------|-------|
| **Problema** | 1. 67% não controlam finanças 2. Apps existentes complexos 3. Categorização manual é tediosa | Vídeo (IBGE) |
| **Solução** | 1. Foto → categorização IA 2. Meta visual gamificada 3. Alerta de gasto | Vídeo |
| **Proposta de Valor** | "Controle suas finanças com uma foto. Sem planilhas, sem complicação." | Vídeo |
| **Vantagem Injusta** | Integração Open Finance [inferido: se executado primeiro, cria switching cost] | Inferido |
| **Segmentos** | Brasileiros 25-45, classe B/C, renda R$3k-R$10k | Vídeo (parcial) |
| **Canais** | [não mencionado] | — |
| **Receita** | Freemium: grátis (1 conta) / R$14,90/mês (multi-banco) | Vídeo |
| **Custos** | Open Finance, IA, infra cloud, dev mobile | Parcial |
| **Métricas** | Conversão free→paid (benchmark: 3-5%) | Vídeo |

## Value Proposition Canvas

**Jobs-to-be-done:**
- Saber quanto gastei este mês sem esforço
- Economizar para um objetivo específico
- Evitar surpresas na conta no fim do mês

**Dores:**
- Apps atuais exigem cadastro manual de cada gasto
- Categorias pré-definidas não refletem a vida real
- Sensação de culpa sem visibilidade

**Ganhos:**
- Controle instantâneo com uma foto
- Sensação de progresso visual (gamificação)
- Alertas antes de estourar o limite

## Perguntas para Pesquisa de Mercado
1. Qual o custo real de integração Open Finance para startups?
2. Quais concorrentes diretos existem (Mobills, Organizze, GuiaBolso)?
3. Qual a taxa de conversão real de apps de finanças no Brasil?
4. Existem barreiras regulatórias para acesso a dados bancários?
5. Qual o CAC médio para apps financeiros no Brasil?
```

## Quality Criteria

- [ ] Hipótese formulada como frase falsificável com segmento, preço e razão
- [ ] Lean Canvas com 9 blocos preenchidos (marcações [inferido] e [não mencionado] quando aplicável)
- [ ] Value Proposition Canvas com Jobs, Dores e Ganhos
- [ ] Lista de perguntas para pesquisa de mercado (mín. 3)
- [ ] Fonte indicada para cada item (vídeo, inferido, não mencionado)

## Veto Conditions

Rejeitar e refazer se QUALQUER condição for verdadeira:
1. Hipótese não é falsificável — falta segmento, preço ou razão
2. Lean Canvas incompleto — blocos em branco sem marcação de [não mencionado]
