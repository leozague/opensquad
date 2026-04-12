---
task: "Create Instagram Feed Carousel"
order: 2
input: |
  - selected_angle: O ângulo selecionado pelo usuário (de angles.md)
  - tone: Tom de voz escolhido pelo usuário
  - brand_context: Identidade visual e tom Overmind
  - format_rules: Regras de instagram-feed (injetadas automaticamente pelo Pipeline Runner)
output: |
  - carousel_content: Copy completo de todos os slides + caption + hashtags
  - html_files: Arquivos HTML de cada slide (self-contained, 1080x1440)
  - rendered_images: Screenshots dos slides renderizados
---

# Create Instagram Feed Carousel

Cria o carrossel completo para Instagram: copy de cada slide, caption, hashtags, design system e slides HTML renderizáveis. Segue o ângulo e tom aprovados pelo usuário.

## Process

1. **Diagnóstico pré-escrita:**
   - Awareness level do público (Schwartz)
   - Market sophistication level
   - Big Idea: enemy, new mechanism, unique promise
   - Driver psicológico dominante (do ângulo selecionado)

2. **Ler tone-of-voice.md** e recomendar um tom. Apresentar as opções ao usuário. Esperar escolha antes de prosseguir.

3. **Escolher formato de carrossel** baseado no ângulo (Editorial, Listicle, Tutorial, Mito vs Realidade, Antes/Depois, Storytelling, Problema/Solução).

4. **Gerar 3 hooks** para o slide 1:
   - Cada hook usa driver psicológico E formato estrutural diferente
   - Max 20 palavras por hook
   - Incluir rationale de 1 linha para cada
   - Apresentar ao usuário e esperar escolha

5. **Escrever copy de todos os slides** seguindo o formato escolhido:
   - Slide 1 (Cover): Título bold (max 20 palavras) + direção de foto/background
   - Slides intermediários: Headline bold + Supporting text (40-80 palavras total por slide)
   - Último slide (CTA): CTA específico e acionável
   - Total: 7-10 slides

6. **Escrever caption:**
   - Primeiros 125 chars: hook que funciona standalone (antes do "...mais")
   - Body: expansão do argumento com line breaks
   - Closing: pergunta provocativa ou CTA
   - Hashtags: 5-8, mix niche + broad

7. **Definir design system:**
   - Cores: paleta Overmind (roxo profundo #1A0A2E, branco, accent)
   - Tipografia: Inter ou Montserrat, escala hero/heading/body/caption
   - Grid: 1080x1440, margens, espaçamento
   - Visual elements: border radius, overlays, accent highlights

8. **Gerar HTML de cada slide:**
   - Um arquivo por slide (slide-01.html, slide-02.html, etc.)
   - Self-contained: inline CSS, sem dependências externas (exceto Google Fonts @import)
   - Respeitar tamanhos mínimos: hero 58px, heading 43px, body 34px, caption 24px
   - Sem contadores de slide (Instagram tem indicadores nativos)

9. **Renderizar slide 1** e verificar visualmente antes de gerar os demais.

10. **Renderizar todos os slides** e apresentar ao usuário.

## Output Format

```markdown
# Carrossel: [Título]

## Diagnóstico
- Awareness: [level]
- Sophistication: [level]
- Big Idea: [enemy / mechanism / promise]
- Driver: [driver psicológico]

## Tom escolhido: [tom]

## Formato: [formato de carrossel]

## Slides

=== FORMAT ===
[Nome do formato]

=== SLIDES ===
Slide 1 (Cover):
  Title: [...]
  Background: [...]

Slide 2 ([Role]):
  Headline: [...]
  Supporting text: [...]
  Accent keywords: [...]
  Background: [...]

... (todos os slides)

=== CAPTION ===
[caption completa]

=== HASHTAGS ===
[hashtags]

## Design System
[documentação da paleta, tipografia, grid]

## Arquivos HTML
- slide-01.html
- slide-02.html
- ...
```

## Output Example

> Ver `pipeline/data/output-examples.md` para exemplos completos de carrosséis finalizados.

## Quality Criteria

- [ ] Diagnóstico pré-escrita documentado
- [ ] Tom de voz escolhido pelo usuário (não assumido)
- [ ] 3 hooks apresentados e aprovados antes do body
- [ ] 7-10 slides com 40-80 palavras cada
- [ ] Caption: primeiros 125 chars funcionam como hook independente
- [ ] CTA específico no último slide E na caption
- [ ] 5-8 hashtags (mix niche + broad)
- [ ] Design system documentado
- [ ] HTML self-contained, fontes >= mínimo da plataforma
- [ ] Slide 1 verificado visualmente antes do batch

## Veto Conditions

Reject and redo if ANY are true:
1. Body foi escrito sem o hook ter sido aprovado pelo usuário
2. Algum slide tem menos de 40 palavras ou mais de 80 palavras
3. HTML usa dependências externas (exceto Google Fonts @import)
