# Opensquad — Catalogo de Squads

> Documento gerado em 2026-04-13. Referencia completa de todos os squads configurados.

---

## Indice

1. [bujo-manager](#bujo-manager) — Gerenciamento do BuJo digital
2. [dev-intake](#dev-intake) — Intake de demandas de desenvolvimento
3. [dev-team](#dev-team) — Consultoria com especialistas de dev
4. [dev-finalize](#dev-finalize) — Finalizacao de features
5. [market-intelligence](#market-intelligence) — Inteligencia de mercado
6. [overmind-carrossel](#overmind-carrossel) — Carrosseis Instagram Overmind
7. [release-publish](#release-publish) — Release notes para clientes
8. [sec-audit](#sec-audit) — Auditoria de seguranca
9. [video-business-analyzer](#video-business-analyzer) — Analise de videos para ideias de negocio
10. [youtube-knowledge](#youtube-knowledge) — Extracao de conhecimento de videos YouTube
11. [pro-photo](#pro-photo) — Fotos profissionais a partir de fotos pessoais
12. [dev-bootstrap](#dev-bootstrap) — Bootstrap de projetos a partir de planejamento

---

## bujo-manager

**Descricao:** Gerencia o Bullet Journal digital integrado ao PARA. Cria daily logs, processa inbox, migra tarefas, classifica pela Matriz de Eisenhower e faz revisoes semanais.

**Skills:** file_read, file_write

| Agente | Titulo | Execucao |
|--------|--------|----------|
| Ryder | Organizador BuJo | inline |

**Pipeline (5 steps):**

| Step | Nome | Tipo | Model Tier |
|------|------|------|------------|
| 1 | auto-check | agent (Ryder) | sessao |
| 2 | processar-inbox | agent (Ryder) | sessao |
| 3 | checkpoint-acao-do-dia | checkpoint | — |
| 4 | execucao | agent (Ryder) | sessao |
| 5 | weekly-review (opcional) | agent (Ryder) | sessao |

---

## dev-intake

**Descricao:** Recebe solicitacoes de usuarios, conduz entrevista de clarificacao e gera briefing + spec SDD prontos para desenvolvimento.

**Skills:** file_read, file_write | **Locking:** sim

| Agente | Titulo | Execucao |
|--------|--------|----------|
| Clara Entrevistadora | Analista de Requisitos | inline |
| Sergio Especificador | Especificador SDD | inline |

**Pipeline (8 steps):**

| Step | Nome | Tipo | Model Tier |
|------|------|------|------------|
| 1 | checkpoint-projeto-e-solicitacao | checkpoint | — |
| 2 | entrevista-clarificacao | agent (Clara) | sessao |
| 3 | checkpoint-perguntas-solicitante | checkpoint | — |
| 4 | gerar-perguntas-solicitante | agent (Clara) | sessao |
| 5 | checkpoint-briefing-aprovado | checkpoint | — |
| 6 | geracao-spec-sdd | agent (Sergio) | sessao |
| 7 | checkpoint-spec-aprovado | checkpoint | — |
| 8 | kickoff-automatico (opcional) | inline | sessao |

---

## dev-team

**Descricao:** Time de desenvolvimento especializado para consulta. Selecione o especialista e descreva sua duvida ou contexto.

**Skills:** file_read, file_write, bash

| Agente | Titulo | Execucao |
|--------|--------|----------|
| Business Owner | Dono do Produto | inline |
| Product Manager | Gerente de Produto | inline |
| Arquiteto | Arquiteto de Software | inline |
| DBA | Especialista em Banco de Dados | inline |
| Backend Developer | Desenvolvedor Backend | inline |
| Frontend Developer | Desenvolvedor Frontend | inline |
| QA Engineer | Engenheira de Qualidade | inline |
| DevOps Engineer | Engenheiro de Infraestrutura | inline |
| Tech Writer | Redatora Tecnica | inline |
| Design Patterns Expert | Especialista em Padroes de Projeto | inline |
| Tech Stack Validator | Especialista em Versoes e Compatibilidade | inline |

**Pipeline (3 steps):**

| Step | Nome | Tipo | Model Tier |
|------|------|------|------------|
| 1 | checkpoint-selecao-especialista | checkpoint | — |
| 2 | consulta-especialista | agent (selecionado) | sessao |
| 3 | checkpoint-proxima-acao | checkpoint | — |

---

## dev-finalize

**Descricao:** Ao finalizar o desenvolvimento de uma feature: le o git diff, atualiza CHANGELOG e STATE, e move a feature de in-progress para done.

**Skills:** file_read, file_write, bash | **Locking:** sim

| Agente | Titulo | Execucao |
|--------|--------|----------|
| Git Arqueologa | Analista de Mudancas | subagent |
| Code Reviewer | Revisora de Codigo | subagent |
| Security Analyst | Analista de Seguranca | subagent |
| Doc Sintetizador | Atualizador de Documentacao | inline |

**Pipeline (8 steps):**

| Step | Nome | Tipo | Model Tier |
|------|------|------|------------|
| 1 | checkpoint-projeto-e-feature | checkpoint | — |
| 2 | analise-git-diff | subagent (Git Arqueologa) | trivial (Haiku) |
| 3 | checkpoint-revisao-mudancas | checkpoint | — |
| 4 | code-review | subagent (Code Reviewer) | execution (Sonnet) |
| 5 | security-check | subagent (Security Analyst) | execution (Sonnet) |
| 6 | checkpoint-code-review-e-seguranca | checkpoint | — |
| 7 | atualizacao-documentacao | inline (Doc Sintetizador) | sessao |
| 8 | checkpoint-confirmacao-final | checkpoint | — |

---

## market-intelligence

**Descricao:** Pesquisa, analisa e reporta inteligencia competitiva e de mercado para o grupo OMK em formato de slide deck executivo HTML.

**Skills:** web_search, web_fetch, apify

| Agente | Titulo | Execucao |
|--------|--------|----------|
| Rafael Rastreador | Pesquisador de Inteligencia | subagent |
| Ana Analitica | Analista de Inteligencia de Mercado | subagent |
| Diego Dashboard | Criador de Relatorios Executivos | inline |
| Vera Veredicto | Revisora de Qualidade | inline |

**Pipeline (7 steps):**

| Step | Nome | Tipo | Model Tier |
|------|------|------|------------|
| 1 | checkpoint-foco-pesquisa | checkpoint | — |
| 2 | pesquisa | subagent (Rafael) | fast (Haiku) |
| 3 | analise | subagent (Ana) | powerful (Opus) |
| 4 | criacao-slides | inline (Diego) | sessao |
| 5 | checkpoint-aprovar-conteudo | checkpoint | — |
| 6 | revisao | inline (Vera) | sessao |
| 7 | checkpoint-aprovacao-final | checkpoint | — |

---

## overmind-carrossel

**Descricao:** Criacao e publicacao de carrosseis Instagram para a marca Overmind.

**Skills:** web_search, web_fetch, image-creator, instagram-publisher

| Agente | Titulo | Execucao |
|--------|--------|----------|
| Nico Noticia | Pesquisador de Tendencias | subagent |
| Clara Carrossel | Criadora de Carrosseis Instagram | inline |
| Rui Revisao | Revisor de Qualidade | inline |

**Pipeline (10 steps):**

| Step | Nome | Tipo |
|------|------|------|
| 1 | research-focus | checkpoint |
| 2 | research | agent (Nico) |
| 3 | news-selection | checkpoint |
| 4 | generate-angles | agent |
| 5 | angle-selection | checkpoint |
| 6 | create-carousel | agent (Clara) |
| 7 | content-approval | checkpoint |
| 8 | review | agent (Rui) |
| 9 | final-approval | checkpoint |
| 10 | publish | agent |

---

## release-publish

**Descricao:** Le o manifest de uma release e as briefings das features incluidas, e gera um documento HTML de release notes em linguagem de negocio para o cliente.

**Skills:** file_read, file_write | **Locking:** sim

| Agente | Titulo | Execucao |
|--------|--------|----------|
| Release Writer | Redatora de Releases para Clientes | inline |

**Pipeline (5 steps):**

| Step | Nome | Tipo | Model Tier |
|------|------|------|------------|
| 1 | checkpoint-projeto-e-versao | checkpoint | — |
| 2 | leitura-manifest-e-briefings | inline (Release Writer) | sessao |
| 3 | checkpoint-conteudo-revisao | checkpoint | — |
| 4 | geracao-html | inline (Release Writer) | sessao |
| 5 | checkpoint-aprovacao-final | checkpoint | — |

---

## sec-audit

**Descricao:** Auditoria completa de seguranca pre-release: OWASP Top 10, autenticacao, autorizacao, comunicacao, configuracao de infra e dependencias vulneraveis.

**Skills:** file_read, bash, web_fetch | **Locking:** sim

| Agente | Titulo | Execucao |
|--------|--------|----------|
| OWASP Auditor | Auditora OWASP Top 10 | subagent |
| Infra Auditor | Auditor de Infraestrutura | subagent |
| Auth Auditor | Auditora de Autenticacao e Autorizacao | subagent |
| Dependency Auditor | Auditor de Dependencias | subagent |
| Report Writer | Redator do Relatorio de Seguranca | inline |

**Pipeline (7 steps):**

| Step | Nome | Tipo | Model Tier |
|------|------|------|------------|
| 1 | checkpoint-projeto-e-escopo | checkpoint | — |
| 2 | owasp-top10-audit | subagent (OWASP Auditor) | execution (Sonnet) |
| 3 | auth-autorizacao-audit | subagent (Auth Auditor) | execution (Sonnet) |
| 4 | infra-configuracao-audit | subagent (Infra Auditor) | trivial (Haiku) |
| 5 | dependency-audit | subagent (Dependency Auditor) | trivial (Haiku) |
| 6 | compilacao-relatorio | inline (Report Writer) | sessao |
| 7 | checkpoint-resultado-final | checkpoint | — |

---

## video-business-analyzer

**Descricao:** Analisa videos do YouTube para extrair ideias de negocio, pesquisar mercado e montar planos de negocio e execucao.

**Skills:** web_search, web_fetch

| Agente | Titulo | Execucao |
|--------|--------|----------|
| Vitor Video | Extrator de Conteudo | subagent |
| Marina Mercado | Pesquisadora de Mercado | subagent |
| Pablo Plano | Estrategista de Negocios | inline |
| Raquel Revisao | Revisora de Qualidade | inline |

**Pipeline (8 steps):**

| Step | Nome | Tipo |
|------|------|------|
| 1 | briefing | checkpoint |
| 2 | extract-content | subagent (Vitor) |
| 3 | validate-idea | checkpoint |
| 4 | market-research | subagent (Marina) |
| 5 | business-strategy | inline (Pablo) |
| 6 | review | inline (Raquel) |
| 7 | final-approval | checkpoint |
| 8 | publish-vault | inline |

---

## youtube-knowledge

**Descricao:** Extrai conhecimento de videos do YouTube e produz nota para o vault, resumo executivo e transcricao anotada.

**Skills:** web_search, web_fetch, apify

| Agente | Titulo | Execucao |
|--------|--------|----------|
| Teo Transcritor | Extrator de Conteudo YouTube | subagent |
| Sofia Sintese | Sintetizadora de Conhecimento | inline |
| Rita Revisao | Revisora de Qualidade | inline |

**Pipeline (7 steps):**

| Step | Nome | Tipo | Model Tier |
|------|------|------|------------|
| 1 | checkpoint-url-video | checkpoint | — |
| 2 | extracao-video | subagent (Teo) | fast (Haiku) |
| 3 | checkpoint-validar-transcricao | checkpoint | — |
| 4 | sintese-conhecimento | inline (Sofia) | sessao |
| 5 | checkpoint-aprovar-conteudo | checkpoint | — |
| 6 | revisao-qualidade | inline (Rita) | sessao |
| 7 | checkpoint-aprovacao-final | checkpoint | — |

---

## pro-photo

**Descricao:** Transforma fotos pessoais em fotos profissionais naturais para redes sociais usando IA. Suporta estilos corporate, tech founder, lifestyle e custom.

**Skills:** image-ai-generator

| Agente | Titulo | Execucao |
|--------|--------|----------|
| Fabricio Fotografia | Diretor de Foto Profissional | inline |
| Vivian Veredicto | Revisora de Qualidade Fotografica | inline |

**Pipeline (5 steps):**

| Step | Nome | Tipo | Model Tier |
|------|------|------|------------|
| 1 | checkpoint-foto-e-estilo | checkpoint | — |
| 2 | geracao-foto | agent (Fabricio) | sessao |
| 3 | checkpoint-aprovar-foto | checkpoint | — |
| 4 | revisao-qualidade | agent (Vivian) | sessao |
| 5 | checkpoint-aprovacao-final | checkpoint | — |

---

## dev-bootstrap

**Descricao:** Recebe planejamento de software e entrega projeto inicializado, testado, no GitHub e rodando em localhost com Docker stack para deploy em Easypanel.

**Skills:** file_read, file_write, bash, web_fetch, web_search | **Locking:** sim

| Agente | Titulo | Execucao |
|--------|--------|----------|
| Pablo Pesquisa | Pesquisador de Mercado | subagent |
| Diana Docs | Especialista em Documentacao | subagent |
| Andre Arquitetura | Analista e Planejador SDD | inline |
| Bruno Bootstrap | Executor de Projeto | inline |
| Tiago Testes | Engenheiro de Testes | inline |
| Victor Validacao | Revisor e Validador | inline |

**Pipeline (9 steps):**

| Step | Nome | Tipo | Model Tier |
|------|------|------|------------|
| 1 | checkpoint-input | checkpoint | — |
| 2 | market-research (opcional) | subagent (Pablo) | fast |
| 3 | fetch-docs | subagent (Diana) | fast |
| 4 | analyze-and-plan | inline (Andre) | powerful |
| 5 | checkpoint-plan-approval | checkpoint | — |
| 6 | execute-bootstrap | inline (Bruno) | powerful |
| 7 | test-suite | inline (Tiago) | powerful |
| 8 | review-project | inline (Victor) | powerful |
| 9 | checkpoint-delivery | checkpoint | — |

---

## Tabela de Comandos

| Comando | Descricao |
|---------|-----------|
| `/opensquad` | Menu principal |
| `/opensquad list` | Listar todos os squads |
| `/opensquad run bujo-manager` | Executar BuJo Manager |
| `/opensquad run dev-intake` | Executar Dev Intake |
| `/opensquad run dev-team` | Executar Dev Team |
| `/opensquad run dev-finalize` | Executar Dev Finalize |
| `/opensquad run market-intelligence` | Executar Inteligencia de Mercado |
| `/opensquad run overmind-carrossel` | Executar Overmind Carrossel |
| `/opensquad run release-publish` | Executar Release Publish |
| `/opensquad run sec-audit` | Executar Sec Audit |
| `/opensquad run video-business-analyzer` | Executar Video Business Analyzer |
| `/opensquad run youtube-knowledge` | Executar YouTube Knowledge Extractor |
| `/opensquad run pro-photo` | Executar Pro Photo |
| `/opensquad run dev-bootstrap` | Executar Dev Bootstrap |
| `/opensquad edit <nome>` | Editar um squad |
| `/opensquad delete <nome>` | Deletar um squad |
| `/opensquad create <descricao>` | Criar novo squad |
| `/opensquad skills` | Gerenciar skills |
| `/opensquad show-company` | Ver perfil da empresa |
| `/opensquad edit-company` | Editar perfil da empresa |
| `/opensquad settings` | Configuracoes |
| `/opensquad help` | Ajuda |

---

## Legenda de Model Tiers

| Tier | Modelo | Uso |
|------|--------|-----|
| **trivial** | Haiku | Tarefas simples: leitura, organizacao, parsing |
| **fast** | Haiku | Pesquisa e coleta rapida de dados |
| **execution** | Sonnet | Analise com julgamento, code review, seguranca |
| **powerful** | Opus | Analise profunda, estrategia, decisoes complexas |
| **sessao** | (modelo da sessao) | Agentes inline usam o modelo ativo na conversa |

---

## Resumo Quantitativo

| Metrica | Total |
|---------|-------|
| Squads | 12 |
| Agentes unicos | 46 |
| Steps de pipeline | 82 |
| Checkpoints | 34 |
| Squads com locking | 5 (dev-intake, dev-finalize, dev-bootstrap, release-publish, sec-audit) |
| Squads com subagents | 8 (dev-bootstrap, dev-finalize, market-intelligence, overmind-carrossel, sec-audit, video-business-analyzer, youtube-knowledge) |
