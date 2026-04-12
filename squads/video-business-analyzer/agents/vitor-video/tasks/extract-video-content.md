---
task: "Extrair Conteúdo do Vídeo"
order: 1
input: |
  - video_url: URL do vídeo no YouTube
  - user_context: Contexto adicional do usuário sobre o vídeo (opcional)
  - video_type: Tipo do vídeo (software/ferramenta ou geral)
output: |
  - roteiro-video.md: Transcrição organizada por seções temáticas
---

# Extrair Conteúdo do Vídeo

Acessa o vídeo do YouTube, extrai todo o conteúdo falado e visual, e organiza em um roteiro estruturado por temas.

## Process

1. Acessar o vídeo via WebFetch na URL do YouTube. Extrair o título, canal, descrição e conteúdo completo
2. Organizar o conteúdo em seções temáticas (não cronológicas): agrupar partes relacionadas do vídeo sob headers descritivos
3. Preservar citações diretas do apresentador para trechos impactantes ou dados específicos
4. Destacar separadamente: números citados, ferramentas mencionadas, referências externas, e claims de mercado
5. Identificar e listar explicitamente o que o vídeo NÃO aborda (modelo de receita, custos, concorrentes, etc.)

## Output Format

```yaml
titulo: "Título do Vídeo"
canal: "Nome do Canal"
url: "URL completa"
duracao: "Duração estimada"
data_publicacao: "Data ou período"

secoes:
  - nome: "Nome da Seção Temática"
    conteudo: "Conteúdo organizado"
    citacoes: ["Citações diretas relevantes"]

dados_citados:
  - dado: "Número ou estatística mencionada"
    contexto: "Como foi apresentado"
    fonte_citada: "Se o apresentador citou uma fonte"

ferramentas_mencionadas:
  - nome: "Nome da ferramenta"
    contexto: "Para que foi mencionada"

lacunas:
  - "O que não foi abordado no vídeo"
```

## Output Example

> Use como referência de qualidade, não como template rígido.

```markdown
# Roteiro: "Como Criar um SaaS de Finanças Pessoais em 2026"
**Canal:** Tech Founders BR | **URL:** https://youtube.com/watch?v=abc123
**Duração:** ~22 min | **Publicação:** Março 2026

## O Problema Identificado
O apresentador abre com dados do IBGE: "67% dos brasileiros não controlam suas
finanças mensais". Argumenta que apps existentes são complexos demais para o
público leigo. Cita experiência própria: "Testei 8 apps de finanças e desisti
de todos em menos de 2 semanas."

## A Solução Proposta
App mobile-first com 3 funcionalidades core:
1. Foto do extrato → categorização automática via IA
2. Meta de economia visual (gamificação simples)
3. Alerta de gasto excessivo por categoria

Ênfase em simplicidade: "Se precisa de tutorial, já falhou."

## Modelo de Negócio Mencionado
Freemium: gratuito com limite de 1 conta bancária, premium R$14,90/mês para
multi-banco e relatórios avançados. Citou benchmark: "Apps de finanças
convertem 3-5% de free para paid."

## Stack Técnica
React Native (mobile), Node.js (backend), integração Open Finance.
"Open Finance no Brasil já permite acesso a 90% das contas bancárias."

## Dados Citados
| Dado | Contexto | Fonte |
|------|----------|-------|
| 67% não controlam finanças | Abertura do vídeo | IBGE (sem ano) |
| 3-5% conversão freemium | Benchmark de apps | Não citou fonte |
| R$14,90/mês | Preço sugerido | Análise própria |

## Lacunas Identificadas
- Custo de integração Open Finance não mencionado
- Não abordou concorrentes específicos (Mobills, Organizze, GuiaBolso)
- CAC e estratégia de aquisição não discutidos
- Não mencionou regulamentação ou compliance financeiro
```

## Quality Criteria

- [ ] Conteúdo completo — nenhum trecho significativo omitido
- [ ] Organizado por tema, não cronologicamente
- [ ] Citações diretas preservadas entre aspas
- [ ] Dados citados tabulados com fonte (quando disponível)
- [ ] Lacunas listadas explicitamente

## Veto Conditions

Rejeitar e refazer se QUALQUER condição for verdadeira:
1. Conteúdo incompleto — seções inteiras do vídeo foram omitidas
2. Sem seção de lacunas — o que não foi dito não foi documentado
