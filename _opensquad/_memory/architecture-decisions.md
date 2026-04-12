# Registos de Arquitetura e Integrações OMK

> Documento base para regras de interação entre o motor Opensquad, Dados Sensíveis, e Software OMK (Tauri/Nest).
> Atualizado em: 2026-04-08

---

## 1. Topologia do Sistema
O ecossistema é formado por dois cérebros que não competem, antes se complementam:

1. **Camada Operacional (App Tauri/Nest/Postgres)**
   - É a **SOT (Source of Truth)**. 
   - Controla o Financeiro, o CRM (Acessos, Contratos), o Controlo Sensível, e Agenda tarefas (Cron).

2. **Camada Cérebro (Motor Opensquad + Claude Code)**
   - Onde residem as Marcas (`brands/`), Identidades, Textos, Qualificação Tática e Processos (`pipeline/`). 
   - Recebe atualizações e é despoletado pela App Tauri.

---

## 2. Modelos por Etapa (Model Tiering)
O Opensquad utilizará parâmetros diferentes e eficientes mediante as requisições por agente, baseando-se no ficheiro de pipeline:
- Tarefas de análise pesada e lógica: **Claude Opus**
- Processamento diário, criação de código / Redação: **Claude Sonnet**
- Web Scraping, Checklists Rápidas ou Revisões: **Claude Haiku** (Mais barato e muito veloz)

*Integração:* O App Tauri envia no ambiente o terminal com a designação de "flag" do modelo: `claude --model claude-haiku-4-5 -p "/opensquad..."` garantindo isolamento paralelo e redução massiva de custos em queries simples.

---

## 3. Integração App Tauri x Opensquad
A interação de ambos não altera as bases do opensquad. Tudo se integra visualmente.

- **Frontend Gráfico:** O seu sistema servirá como ecossistema central, podendo listar squads lendo YAML's, interagir nos *Checkpoints Humanos*, e iniciar runs nativamente pela linguagem Shell/FS do macOS.
- O App exportará recortes base em Markdown sobre os novos Clientes captados, para inserir dentro da pasta `_memory/clients/`, de forma a que os agentes saibam "tom de voz e preferências" desse cliente recém-fechado para produzir relatórios.

---

## 4. Política de Acesso e Múltiplas MCPs
Os agentes Opensquad têm livre percurso nas integrações de sistema herdadas do utilizador central. (Ferramentas já configuradas no Claude Code, GitHub MCP, Navegadores Chromium Playwright, ou Web Searcher).

---

## 5. Arquitetura de Dados Sensíveis e Segurança (A Regra de Ouro)
**NENHUM DADO SENSÍVEL DEVE EXISTIR NESTE PROJETO OPENSQUAD EM .MD.**

- Apenas existirá acesso referencial. Um agente irá ler no contexto: *Para a ferramenta de dados do Cliente X, aceda à chave que se encontra no 1Password da Holding*.
- A Aplicação Tauri tem uma Gateway de comunicação com `Security-Framework-Keychain`. 
- AES-256 no backend central guarda toda a informação estrutural da Mão-de-Obra da Holding. Textos, Passwords, Chaves API nunca fluem no motor LLM publicamente.
