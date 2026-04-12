# Step 1 — Checkpoint: Projeto e Escopo da Auditoria

## Objetivo

Identificar o projeto e definir o escopo da auditoria de seguranca.

## Perguntas

**Pergunta 1:** Qual projeto sera auditado?
- Listar projetos do registry

**Pergunta 2:** Qual o escopo da auditoria?
- **Auditoria completa pre-release** — varredura total antes de deploy em producao
- **Auditoria focada** — analisar um modulo ou area especifica

**Pergunta 3 (se focada):** Qual modulo ou area?
- Exemplos: "modulo de autenticacao", "endpoints de clientes", "configuracao de infra"

## Output para os subagentes

```json
{
  "project_code": "gold-letras",
  "project_root": "/Users/macbookpro/Documents/FONTES/GOLD/gold-letras",
  "docs_path": "/Users/macbookpro/Documents/_THOTH/01_Projects/gold-letras",
  "escopo": "completo",
  "modulo_foco": null
}
```
