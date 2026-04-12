# Step 04 — Gerar Documento de Perguntas ao Solicitante

## Agente
Clara Entrevistadora

## Objetivo
Gerar um documento claro, amigável e pronto para enviar ao solicitante com as perguntas que precisam ser respondidas antes ou durante o desenvolvimento.

Se o usuário escolheu "Continuar sem gerar" no checkpoint anterior, **pular este step** e avançar diretamente para o Step 05.

## Fontes das perguntas
1. Perguntas abertas detectadas por Clara durante a entrevista
2. Perguntas adicionadas manualmente pelo desenvolvedor no checkpoint
3. Combinação de ambas (sem duplicatas)

## Formato do documento

Salvar em `{docs_path}/backlog/{slug}/perguntas-ao-solicitante.md` (ou `in-progress/` se já foi movida).

```markdown
# Perguntas sobre: {título da feature}

Olá{, [nome do solicitante] se disponível}!

Estamos trabalhando na sua solicitação de **{título}** e precisamos
esclarecer alguns pontos antes de avançar no desenvolvimento.

---

## Perguntas

**1. {pergunta}**
{contexto breve se necessário — por que essa pergunta importa}

**2. {pergunta}**
{contexto}

...

---

Assim que responder, podemos dar continuidade.
Obrigado!
```

## Regras

### Linguagem (regra mais importante)
O documento vai para o **cliente/solicitante**, que não tem conhecimento técnico. Escrever como se estivesse conversando com o dono do negócio.

**Nunca usar:** nomes de tecnologias (MySQL, PostgreSQL, Vue.js, NestJS, React, Flutter, Docker, etc.), termos de infraestrutura (deploy, branch, migration, CI/CD, endpoint, API), siglas técnicas (CRUD, ORM, JWT, DTO, REST).

**Usar em vez disso:** o que o usuário vai ver ou sentir. Descrever comportamento, resultado e impacto no negócio.

Exemplos de tradução:
- ❌ "Precisamos saber se a API da Receita Federal pode ser chamada no frontend" → ✅ "O sistema deve buscar os dados automaticamente ou você prefere clicar em um botão para isso?"
- ❌ "Qual o schema esperado para o campo de endereço?" → ✅ "O endereço precisa incluir número e complemento, ou só a rua e cidade são suficientes?"
- ❌ "Haverá paginação nos resultados do endpoint de listagem?" → ✅ "Quando a lista de itens for muito grande, prefere ver tudo de uma vez ou dividida em páginas?"

### Outras regras
- Tom amigável e direto — nunca robótico ou formal em excesso
- Cada pergunta deve ser autoexplicativa — sem pressupor conhecimento técnico
- Máximo 7 perguntas — se houver mais, priorizar as mais bloqueantes
- Agrupar perguntas relacionadas quando fizer sentido

## Após gerar
Exibir o conteúdo do documento no chat para que o desenvolvedor possa revisar antes de enviar.
Informar o caminho do arquivo salvo.

## Retorno ao fluxo
Após gerar (ou pular), continuar para o Step 05 — Checkpoint: Aprovação do Briefing.
