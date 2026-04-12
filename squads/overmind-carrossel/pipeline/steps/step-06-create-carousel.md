---
execution: inline
agent: creator
format: instagram-feed
inputFile: squads/overmind-carrossel/output/angles.md
outputFile: squads/overmind-carrossel/output/carousel-content.md
---

# Step 06: Criação do Carrossel

## Context Loading

Load these files before executing:
- `squads/overmind-carrossel/output/angles.md` — ângulos gerados (filtrar pelo selecionado)
- `squads/overmind-carrossel/pipeline/data/tone-of-voice.md` — opções de tom de voz
- `squads/overmind-carrossel/pipeline/data/output-examples.md` — exemplos de referência
- `squads/overmind-carrossel/pipeline/data/anti-patterns.md` — erros a evitar
- `_opensquad/_memory/brands/overmind.md` — identidade visual e tom da marca
- Format file `instagram-feed` (injetado automaticamente pelo Pipeline Runner)

## Instructions

### Process
1. Identificar o ângulo selecionado pelo usuário no checkpoint anterior.
2. Executar a task `create-instagram-feed.md` da Clara Carrossel.
3. Fazer diagnóstico pré-escrita (awareness, sophistication, Big Idea, driver).
4. Apresentar opções de tom de voz (de tone-of-voice.md) e esperar escolha.
5. Escolher formato de carrossel baseado no ângulo.
6. Gerar 3 hooks e apresentar ao usuário. Esperar seleção.
7. Escrever copy de todos os slides (7-10 slides, 40-80 palavras cada).
8. Escrever caption (hook 125 chars + body + CTA + hashtags).
9. Definir design system (cores Overmind, tipografia, grid 1080x1440).
10. Gerar HTML de cada slide (self-contained).
11. Renderizar slide 1 e verificar. Depois renderizar todos.
12. Salvar tudo no outputFile.

## Output Format

```markdown
# Carrossel: [Título]

## Diagnóstico
- Awareness: [level]
- Sophistication: [level]
- Big Idea: [enemy / mechanism / promise]
- Driver: [driver]

## Tom: [tom escolhido]
## Formato: [formato]

=== SLIDES ===
Slide 1 (Cover):
  Title: [...]
  Background: [...]

Slide N ([Role]):
  Headline: [...]
  Supporting text: [...]
  Accent keywords: [...]
  Background: [...]

=== CAPTION ===
[caption completa]

=== HASHTAGS ===
[hashtags]

## Design System
[paleta, tipografia, grid]

## HTML Files
[lista de arquivos gerados]
```

## Output Example

> Ver `pipeline/data/output-examples.md` para exemplos completos.

## Veto Conditions

Reject and redo if ANY are true:
1. Hooks não foram apresentados antes do body
2. Algum slide tem < 40 ou > 80 palavras
3. HTML usa dependências externas

## Quality Criteria

- [ ] Diagnóstico pré-escrita documentado
- [ ] Tom escolhido pelo usuário
- [ ] 3 hooks apresentados e aprovados
- [ ] 7-10 slides, 40-80 palavras cada
- [ ] Caption com hook nos primeiros 125 chars
- [ ] CTA específico no último slide e na caption
- [ ] Design system documentado
- [ ] HTML self-contained
- [ ] Fontes >= tamanho mínimo
