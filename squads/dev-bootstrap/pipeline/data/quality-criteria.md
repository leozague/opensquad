# Quality Criteria — Dev Bootstrap

## Criterios de Qualidade do Projeto

### Estrutura e Organizacao
- [ ] Estrutura de pastas segue convencoes da stack escolhida
- [ ] Separacao clara de responsabilidades (controllers, services, repositories, etc.)
- [ ] Configuracoes de ambiente separadas (dev, staging, prod)
- [ ] .gitignore configurado corretamente (sem node_modules, .env, builds, etc.)
- [ ] README.md com instrucoes de setup, comandos e arquitetura

### Codigo
- [ ] Sem codigo morto ou comentado
- [ ] Sem console.log ou debug code
- [ ] Sem credenciais hardcoded
- [ ] Tipos definidos (TypeScript strict, type hints Python, etc.)
- [ ] Tratamento de erros consistente
- [ ] Validacao de input nas fronteiras do sistema
- [ ] Nomes de variaveis, funcoes e classes descritivos e consistentes

### Testes
- [ ] Cobertura minima de 80% em linhas de codigo
- [ ] Testes unitarios para toda logica de negocio
- [ ] Testes de integracao para interacoes com banco e servicos externos
- [ ] Testes e2e para fluxos criticos (auth, CRUD principal)
- [ ] Testes rodam com sucesso (zero falhas)
- [ ] Fixtures e factories para dados de teste (sem dados hardcoded)

### Deploy
- [ ] Dockerfile otimizado (multi-stage build, .dockerignore)
- [ ] docker-compose.yml funcional para producao
- [ ] GitHub Actions configurado (lint, test, build, deploy)
- [ ] Secrets configurados no GitHub (nunca em codigo)
- [ ] Webhooks Easypanel configurados
- [ ] Healthcheck endpoint implementado

### Banco de Dados
- [ ] Migrations criadas e funcionais
- [ ] Seeds para dados iniciais (admin user, configs basicas)
- [ ] Indices nas colunas mais consultadas
- [ ] Constraints de integridade (foreign keys, unique, not null)

### Seguranca
- [ ] Autenticacao implementada (se aplicavel)
- [ ] CORS configurado
- [ ] Rate limiting configurado
- [ ] Helmet/headers de seguranca (se web)
- [ ] Input sanitizado contra injection
- [ ] Sem vulnerabilidades conhecidas nas dependencias (audit)

### Documentacao
- [ ] README.md completo
- [ ] .env.example com todas as variaveis necessarias
- [ ] Documento de resumo com URLs, credenciais, portas, comandos
