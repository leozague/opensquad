# Anti-Patterns — Dev Bootstrap

## Never Do

1. **Implementar sem spec** — Codigo sem especificacao gera retrabalho, ambiguidade e features incompletas. Sempre escrever o spec antes.

2. **Ignorar versoes do planejamento** — Instalar "latest" ao inves da versao definida causa incompatibilidades. Sempre usar a versao exata especificada.

3. **Commits gigantes** — Um commit com 50 arquivos e impossivel de revisar e reverter. Um commit por modulo/tarefa.

4. **Hardcode de credenciais** — Senhas, tokens e URLs de producao no codigo sao falha de seguranca critica. Usar variaveis de ambiente.

5. **Pular testes** — "Vou testar depois" vira "nunca vou testar". Testes sao parte do modulo, nao um passo separado.

6. **Docker em dev local** — O usuario quer ferramentas instaladas direto na maquina. Docker e apenas para o stack de deploy/producao.

7. **Ignorar o port registry** — Cada projeto tem um bloco de portas reservado. Usar portas aleatorias causa conflitos entre projetos.

8. **Over-engineering** — Patterns complexos (CQRS, Event Sourcing, microservicos) sem necessidade real. Comecar simples, escalar quando necessario.

9. **Dependencias desnecessarias** — Cada pacote extra e um risco de seguranca e manutencao. So instalar o que o planejamento define.

10. **Ignorar erros silenciosamente** — `catch(e) {}` esconde bugs criticos. Sempre logar ou propagar erros.

## Always Do

1. **Consultar docs na versao correta** — Antes de usar qualquer API de framework/lib, buscar a doc da versao instalada. APIs mudam entre versoes.

2. **Validar cada modulo antes de avancar** — Rodar testes do modulo antes de passar para o proximo. Nao acumular divida tecnica.

3. **Registrar portas no port registry** — Antes de iniciar o scaffold, registrar o projeto no `ports-registry.md` e usar as portas atribuidas.

4. **Gerar .env.example** — Todo .env deve ter um .env.example correspondente sem valores sensiveis.

5. **Parar em decisoes nao previstas** — Se surgir uma questao arquitetural importante nao coberta pelo planejamento, interromper e perguntar ao usuario.

6. **Commit messages descritivas** — Sem "fix", "update", "wip". Descrever O QUE e POR QUE.

7. **Seed data com credenciais documentadas** — Ao criar usuario admin ou dados iniciais, documentar no resumo de entrega.
