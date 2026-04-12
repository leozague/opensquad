# Step 4 — Geração do HTML

**Agente:** Release Writer (inline)

## Objetivo

Montar o arquivo HTML de release notes a partir do conteúdo aprovado no Step 3.

## Verificar Template

1. Verificar se existe um template HTML em `squads/release-publish/templates/release-notes.html`
2. **Se existir:** usar o template, substituindo os placeholders pelo conteúdo gerado
3. **Se não existir:** usar o template padrão abaixo (placeholder até o template real ser fornecido)

## Template Padrão (Placeholder)

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{TITULO_RELEASE}} — {{NOME_PROJETO}}</title>
  <style>
    body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; max-width: 800px; margin: 0 auto; padding: 40px 20px; color: #1a1a1a; }
    header { border-bottom: 2px solid #e5e7eb; padding-bottom: 24px; margin-bottom: 32px; }
    h1 { font-size: 28px; font-weight: 700; margin: 0 0 8px; }
    .version-badge { display: inline-block; background: #f3f4f6; border: 1px solid #d1d5db; border-radius: 6px; padding: 4px 12px; font-size: 14px; color: #374151; }
    .date { color: #6b7280; font-size: 14px; margin-top: 8px; }
    .section { margin-bottom: 32px; }
    .section-title { font-size: 18px; font-weight: 600; color: #111827; border-left: 4px solid #4f46e5; padding-left: 12px; margin-bottom: 16px; }
    .feature-card { background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 20px; margin-bottom: 12px; }
    .feature-title { font-weight: 600; font-size: 16px; margin: 0 0 8px; }
    .feature-desc { color: #374151; margin: 0 0 8px; line-height: 1.6; }
    .feature-benefit { color: #059669; font-size: 14px; }
    .feature-how { color: #6b7280; font-size: 14px; margin-top: 8px; border-top: 1px solid #e5e7eb; padding-top: 8px; }
    footer { margin-top: 48px; padding-top: 24px; border-top: 1px solid #e5e7eb; color: #9ca3af; font-size: 13px; text-align: center; }
  </style>
</head>
<body>

  <header>
    <h1>{{TITULO_RELEASE}}</h1>
    <span class="version-badge">Versão {{VERSAO}}</span>
    <p class="date">Publicado em {{DATA_FORMATADA}}</p>
  </header>

  {{SECOES_CONTENT}}

  <footer>
    <p>{{NOME_PROJETO}} · Atualização {{VERSAO}}</p>
  </footer>

</body>
</html>
```

## Placeholders a Substituir

| Placeholder | Valor |
|-------------|-------|
| `{{TITULO_RELEASE}}` | `manifest.title` |
| `{{VERSAO}}` | `manifest.version` |
| `{{DATA_FORMATADA}}` | data por extenso (ex: "8 de abril de 2026") |
| `{{NOME_PROJETO}}` | nome amigável do projeto |
| `{{SECOES_CONTENT}}` | HTML das seções gerado dinamicamente |

## Geração das Seções

Agrupar features por tipo:

```html
<!-- Para cada grupo: Novidades, Melhorias, Correções -->
<div class="section">
  <h2 class="section-title">✨ Novidades</h2>

  <!-- Para cada feature do grupo -->
  <div class="feature-card">
    <p class="feature-title">[O que mudou — título curto]</p>
    <p class="feature-desc">[o_que_mudou]</p>
    <p class="feature-benefit">✔ [beneficio]</p>
    <!-- Se houver como_usar: -->
    <p class="feature-how">Como usar: [como_usar]</p>
  </div>
</div>
```

Ícones por tipo:
- Novidade: ✨
- Melhoria: ⚡
- Correção: 🔧

## Salvar o Arquivo

Salvar o HTML gerado em:
```
{project_docs_path}/releases/{versao}/release-notes.html
```

Exemplo: `/Users/macbookpro/Documents/_THOTH/01_Projects/gold-letras/releases/v1.1.0/release-notes.html`

## Output

Informar ao usuário o caminho do arquivo gerado.
