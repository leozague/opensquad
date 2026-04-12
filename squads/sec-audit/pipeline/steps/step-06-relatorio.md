# Step 6 — Compilacao do Relatorio

**Agente:** Report Writer (inline)

## Objetivo

Consolidar os resultados de todos os subagentes em um relatorio unico salvo em `{docs_path}/reference/security-report.md`.

## Estrutura do Relatorio

```markdown
# Relatorio de Seguranca — {project_name}

**Data:** YYYY-MM-DD
**Versao auditada:** {versao ou branch}
**Escopo:** Auditoria completa / Modulo {X}

## Resumo Executivo

Status geral: APROVADO / APROVADO COM RESSALVAS / REPROVADO

| Categoria | Status | Criticos | Altos | Medios | Baixos |
|-----------|--------|----------|-------|--------|--------|
| OWASP Top 10 | ... | ... | ... | ... | ... |
| Autenticacao e Autorizacao | ... | ... | ... | ... | ... |
| Infraestrutura | ... | ... | ... | ... | ... |
| Dependencias | ... | ... | ... | ... | ... |

## Itens que Bloqueiam o Deploy

(Apenas achados CRITICOS e ALTOS)

### [CRITICO] {titulo}
- Categoria: {OWASP A0X}
- Arquivo/Local: {caminho}
- Descricao: {o que foi encontrado}
- Risco: {o que um atacante pode fazer}
- Correcao: {como resolver}

## Itens para Correcao no Proximo Ciclo

(Achados MEDIOS)

## Recomendacoes

(Achados BAIXOS e sugestoes de melhoria)

## Dependencias Vulneraveis

| Dependencia | Versao instalada | CVE | Severidade | Correcao |
|-------------|-----------------|-----|-----------|----------|

## Proxima Auditoria Recomendada

- Pre-release da versao {proxima versao}
- Ou apos implementacao dos modulos: {modulos de alto risco}
```

## Regras

- Sem linguagem tecnica desnecessaria — o relatorio deve ser legivel por quem nao e desenvolvedor
- Achados CRITICOS e ALTOS listados primeiro e com destaque
- Cada achado tem correcao especifica — nunca apenas "melhorar a seguranca"
- Salvar em: `{docs_path}/reference/security-report.md` (sobrescreve o anterior)
- Registrar tambem no `{docs_path}/reference/dependency-alerts.md` os achados de dependencias
