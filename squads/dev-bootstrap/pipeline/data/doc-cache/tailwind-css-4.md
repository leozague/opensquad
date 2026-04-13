# Tailwind CSS v4 — Doc Cache

> Fonte: https://github.com/tailwindlabs/tailwindcss (CHANGELOG.md)
> Acessado em: 2026-04-13

## Getting Started (Vite)

```bash
npm install tailwindcss @tailwindcss/vite
```

### Vite Plugin (novo em v4)
```typescript
// vite.config.ts
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [tailwindcss()],
})
```

### CSS (unica linha necessaria)
```css
@import "tailwindcss";
```

## BREAKING CHANGES (v3 → v4)

### 1. CSS-First Configuration
- **Removido**: `tailwind.config.js` nao e mais necessario
- **Novo**: Configuracao via `@theme` directives em CSS
- **Novo**: Design tokens expostos como CSS custom properties nativas

### 2. PostCSS Plugin mudou
```bash
# v3
npm install tailwindcss postcss autoprefixer
# v4
npm install @tailwindcss/postcss
```

### 3. Content Detection automatica
- **Removido**: Array `content` no config
- **Novo**: Tailwind detecta templates automaticamente (sem configuracao)

### 4. Cores em Display P3
- Paleta padrao agora usa Display P3 color space (cores mais vibrantes)

## Configuracao (novo estilo v4)

### @theme (substitui tailwind.config.js)
```css
@import "tailwindcss";

@theme {
  --color-primary: #3b82f6;
  --font-sans: ui-sans-serif, system-ui;
  --breakpoint-2xl: 96rem;
  --color-brand-500: oklch(60% 0.2 250);
  --spacing-custom: 2.5rem;
}
```

### Tema separado
```css
/* input.css */
@import "tailwindcss";
@import "./theme.css";

@layer components {
  .btn { @apply px-4 py-2 rounded; }
}
```

```css
/* theme.css */
@theme {
  --font-sans: ui-sans-serif, system-ui;
  --breakpoint-2xl: 96rem;
  --color-brand-500: oklch(60% 0.2 250);
}
```

## Novas Features

- **Container Queries** nativas (sem plugin)
- **Dynamic utility generation** via CSS variables
- **color-mix()** e gradientes avancados (radial, conic)
- **@import com layers**: `@import "tailwindcss" layer(theme, base, components, utilities);`

## Patterns Recomendados

- Usar `@theme` para design tokens ao inves de tailwind.config.js
- CSS custom properties ficam disponiveis via `var(--color-primary)` em qualquer lugar
- Usar `@tailwindcss/vite` plugin ao inves de PostCSS para projetos Vite

## Gaps

- Migracao automatica de tailwind.config.js → @theme nao documentada no changelog
- Compatibilidade com Reka UI v2.9 nao verificada
