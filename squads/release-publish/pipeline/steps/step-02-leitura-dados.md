# Step 2 — Leitura do Manifest e Briefings

**Agente:** Release Writer (inline)

## Objetivo

Ler o manifest da release e os briefings de cada feature listada, e preparar o conteúdo em linguagem de negócio.

## Instruções

### 1. Ler o manifest

Leia o arquivo `manifest.md` da versão informada no Step 1. Extraia:
- `version`: versão da release
- `date`: data de publicação
- `title`: título da release (nome amigável)
- `features`: lista de slugs das features incluídas
- `notes`: notas adicionais do publicador (se houver)

### 2. Para cada feature no manifest

Localizar e ler `{project_docs_path}/done/{feature-slug}/briefing.md`.

Se o arquivo não existir:
- Registrar aviso: "briefing não encontrado para `{feature-slug}`"
- Continuar com as demais features

De cada briefing, extrair:
- **Descrição Original** — o que o usuário pediu
- **Problema** — qual dor resolve
- **Solução Esperada** — o que o sistema faz agora
- **Módulos Afetados** — contexto de onde a mudança ocorre (traduzir para linguagem de negócio)

### 3. Traduzir para linguagem de negócio

Para cada feature, redigir:

```
[TIPO]: Novidade | Melhoria | Correção

O que mudou:
[1-2 frases descrevendo a mudança do ponto de vista do usuário]

Benefício:
[Por que isso é bom — tempo economizado, erro eliminado, mais controle, etc.]

Como usar (se aplicável):
[Instrução simples se houver nova ação para o usuário]
```

**REGRA ABSOLUTA:** Nenhum termo técnico pode aparecer no texto final.

### 4. Apresentar rascunho ao usuário

Antes de gerar o HTML, mostrar o conteúdo redigido em formato texto simples para aprovação no Step 3.

## Output

Registrar no estado da execução:
```json
{
  "manifest": { ... },
  "features_content": [
    {
      "slug": "feature-cnpj-autofill",
      "type": "Novidade",
      "o_que_mudou": "...",
      "beneficio": "...",
      "como_usar": "..."
    }
  ],
  "warnings": []
}
```
