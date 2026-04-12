# Step 08: Publicar no Vault PARA

## Tipo
inline (executado pelo pipeline runner)

## Objetivo
Após aprovação final, criar uma literature-note consolidada no vault PARA (`03_Resources/negocios/`) com resumo executivo, pontos-chave, mapa mental, timestamps, questionário de revisão e links para os documentos completos no opensquad.

## Dependência
- Step 7 (final-approval) aprovado

## Process

### 1. Montar a nota consolidada

Criar um único arquivo `.md` no vault que sintetiza TODOS os documentos da run em formato de literature-note otimizada para o Obsidian.

**Nome do arquivo:** Derivar do título do vídeo, em minúsculo, sem acentos, separado por hífens.
Exemplo: `sistema-multi-atendimento-whatsapp-data7.md`

### 2. Estrutura da nota

```markdown
---
note_type: literature-note
created: {data-atual}
updated: {data-atual}
tags: [saas, empreendedorismo, ia, estrategia, pricing]
source: "{url-do-video}"
author: "{canal-youtube}"
up: "[[MOC-Negocios]]"
squad_run: "_opensquad/squads/video-business-analyzer/output/{run_id}/v{version}/"
---

# {Título descritivo}

> {Resumo executivo — 3-5 frases cobrindo: o que é o produto, mercado, diferencial, números-chave}

---

## Fonte
{Tabela com tipo, canal, data, duração, URL}

## Pontos-Chave
{7-10 pontos principais extraídos de TODOS os documentos — não apenas do vídeo}

## Mapa Mental
{Mermaid mindmap com 3-4 ramos: Produto, Mercado, Execução, Riscos}

## Argumentação
{Tese central, argumentos, conclusão}

## Timestamps e Citações
{Tabela com momentos-chave do vídeo}

## Questionário de Revisão
{5-7 perguntas com respostas em <details> tags — mix de conceitual, analítica e prática}

## Conceitos Identificados
{Tabela com conceitos, definições e conexões a notas existentes}

## Aplicação Prática
{O que Leonardo/Kansai pode fazer com esse conhecimento — ações concretas}

## Documentos Completos da Análise
{Tabela com todos os documentos, descrições e scores da review}
{Link para a pasta de output no opensquad}

## Conexões
{Links para notas existentes no vault que se relacionam}
```

### 3. Localizar notas relacionadas no vault

Antes de criar a nota:
1. Buscar em `03_Resources/negocios/` por notas com tags similares
2. Buscar em `03_Resources/ia/` se o tema envolver IA
3. Adicionar na seção "Conexões" com razão da conexão

### 4. Atualizar o MOC

1. Ler `03_Resources/_MOCs/MOC-Negocios.md`
2. Adicionar a nova nota na seção "Análises de Negócio"
3. Se o MOC não existir, criar com estrutura padrão

### 5. Destino do arquivo

```
{para_root}/03_Resources/negocios/{nome-arquivo}.md
```

Onde `{para_root}` = `/Users/macbookpro/Documents/_THOTH`

## Output

Nenhum arquivo salvo no opensquad — o output é direto no vault PARA.

Informar ao usuário:
```
Vault:      03_Resources/negocios/{nome-arquivo}.md
PARA:       Resources → negocios
Tipo:       literature-note
Tags:       {tags aplicadas}
MOC:        _MOCs/MOC-Negocios.md → seção "Análises de Negócio"
Conexões:   {N} notas existentes linkadas
Squad run:  _opensquad/squads/video-business-analyzer/output/{run_id}/v{version}/
```
