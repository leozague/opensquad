---
task: "Capturar Screenshots de Telas"
order: 3
input: |
  - video_url: URL do vídeo no YouTube
  - video_type: Deve ser "software" para esta task executar
output: |
  - referencias-visuais/: Pasta com screenshots + índice
---

# Capturar Screenshots de Telas de Software

**Condicional:** Esta task só executa quando o briefing indica que o vídeo é sobre um software/ferramenta. Se o tipo for "geral", pular esta task.

Navega pelo vídeo do YouTube usando Playwright, pausa em momentos que mostram telas do software e captura screenshots como referência visual para desenvolvimento futuro.

## Process

1. Abrir o vídeo no YouTube via Playwright browser
2. Navegar pelo vídeo identificando momentos onde telas do software são mostradas (transições visuais, demos, walkthroughs)
3. Para cada tela relevante: pausar o vídeo, tirar screenshot em resolução máxima disponível
4. Nomear cada screenshot descritivamente: `tela-NN-descricao.png`
5. Criar um arquivo índice `referencias-visuais/indice.md` catalogando cada screenshot com descrição do que mostra e para que serve no contexto do produto

## Output Format

```yaml
referencias_visuais:
  total: N
  screenshots:
    - arquivo: "tela-01-dashboard.png"
      descricao: "Tela principal do dashboard com métricas"
      funcionalidade: "Dashboard / Home"
      observacoes: "Layout 3 colunas, cards de KPI no topo"
    - arquivo: "tela-02-cadastro.png"
      descricao: "Formulário de cadastro de novo usuário"
      funcionalidade: "Onboarding / Cadastro"
      observacoes: "Campos: nome, email, empresa. Design minimalista"
```

## Output Example

> Use como referência de qualidade, não como template rígido.

```markdown
# Referências Visuais: FinTrack Dashboard

## Screenshots Capturados

| # | Arquivo | Funcionalidade | Descrição |
|---|---------|---------------|-----------|
| 1 | tela-01-dashboard-principal.png | Dashboard | Visão geral com MRR, churn, clientes ativos. 3 cards no topo + gráfico de linha temporal |
| 2 | tela-02-cadastro-usuario.png | Onboarding | Form de 3 steps: dados pessoais → conectar banco → configurar categorias |
| 3 | tela-03-transacoes.png | Transações | Lista de transações com filtros por data, categoria e valor. Categorização por cores |
| 4 | tela-04-relatorio-mensal.png | Relatórios | Relatório mensal com comparativo mês anterior. Gráficos de pizza + barras |
| 5 | tela-05-configuracoes.png | Settings | Painel de configurações com integrações bancárias e notificações |

## Observações de UX
- Design usa dark mode como padrão
- Navegação lateral com ícones + texto
- Padrão de cores: azul primário, verde para positivo, vermelho para alertas
- Mobile-first aparente pela estrutura dos componentes
```

## Quality Criteria

- [ ] Cada screenshot mostra uma tela distinta e relevante do software
- [ ] Nomenclatura descritiva (não "screenshot-1.png")
- [ ] Índice com descrição da funcionalidade de cada tela
- [ ] Observações de UX/design incluídas quando perceptíveis
- [ ] Resolução adequada para servir como referência visual

## Veto Conditions

Rejeitar e refazer se QUALQUER condição for verdadeira:
1. Screenshots ilegíveis ou em resolução muito baixa para servir de referência
2. Sem índice catalogando as screenshots
