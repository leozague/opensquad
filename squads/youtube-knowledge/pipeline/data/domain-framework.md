# Domain Framework — YouTube Knowledge Extraction

## Processo Operacional

### Fase 1: Extracao
1. Receber URL do video
2. Extrair metadata (titulo, canal, data, duracao, views, likes)
3. Obter transcricao (legendas PT > EN > auto > whisper)
4. Estruturar dados brutos em formato padrao

### Fase 2: Analise
1. Identificar tema principal e subtemas
2. Mapear conceitos-chave e definicoes
3. Extrair citacoes marcantes (quotes diretas)
4. Identificar referencias (pessoas, ferramentas, frameworks)
5. Classificar no sistema PARA

### Fase 3: Sintese (3 outputs)

**Output 1 — Nota Vault:**
- Frontmatter YAML completo
- Classificacao PARA + tipo Zettelkasten
- Tags especificas (nao genericas)
- Conceitos-chave atomizados
- Citacoes preservadas
- Action items concretos
- Conexoes com notas existentes

**Output 2 — Resumo Executivo:**
- TL;DR de 1 paragrafo
- 5-10 pontos-chave
- 2-3 insights nao-obvios
- Action items priorizados

**Output 3 — Transcricao Anotada:**
- Indice de secoes com timestamps
- Transcricao completa com marcacoes
- Destaques em negrito nos trechos relevantes
- Anotacoes [NOTA: ...] para reflexao
- Secoes semanticas (nao por tempo)

### Fase 4: Revisao
1. Verificar completude de cada output
2. Validar frontmatter YAML
3. Confirmar coerencia entre os 3 outputs
4. Checar quotes contra transcricao original
5. Emitir APPROVE/REJECT

## Criterios de Decisao

### Classificacao PARA
- **01_Projects**: se o video e sobre algo que estou construindo agora
- **02_Areas**: se e sobre responsabilidade continua (saude, financas, ferramentas)
- **03_Resources**: se e conhecimento para referencia futura (tecnico, negocios)
- **04_Archives**: se e conteudo historico ou datado

### Tipo Zettelkasten
- **literature-note**: resumo de conteudo externo (padrao para videos)
- **permanent-note**: insight proprio derivado do video
- **fleeting-note**: ideia rapida para processar depois
