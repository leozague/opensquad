# Ports Registry — Registro Central de Portas

> Registro de todas as portas utilizadas por projetos ativos.
> Atualizado automaticamente pelo dev-intake ao registrar novos projetos.

---

## Convenção de Blocos de Porta

Cada projeto recebe um **bloco de 10 portas** baseado no seu índice:

| Bloco | Projeto Index | API | Web | DB (PostgreSQL) |
|-------|---------------|-----|-----|-----------------|
| 0 | Projeto 1 | 3000 | 5173 | 5432 |
| 1 | Projeto 2 | 3010 | 5183 | 5442 |
| 2 | Projeto 3 | 3020 | 5193 | 5452 |
| 3 | Projeto 4 | 3030 | 5203 | 5462 |
| 4 | Projeto 5 | 3040 | 5213 | 5472 |
| 5 | Projeto 6 | 3050 | 5223 | 5482 |

**Fórmula:** `API = 3000 + (index * 10)` | `Web = 5173 + (index * 10)` | `DB = 5432 + (index * 10)`

---

## Projetos Registrados

| Index | Projeto | Código | API | Web | DB | Ambiente |
|-------|---------|--------|-----|-----|----|----------|
| 0 | Gold Letras | gold-letras | 3000 | 5173 | 5432 | docker |

---

## Detalhes por Projeto

### gold-letras — Gold Letras (Projeto 0)

- **Repositório:** `/Users/macbookpro/Documents/FONTES/GOLD/gold-letras`
- **Ambiente local:** Docker + docker-compose
- **API:** http://localhost:3000
- **Web:** http://localhost:5173
- **DB:** postgresql://localhost:5432/gold_letras_dev
- **Swagger:** http://localhost:3000/api/docs
- **Registrado em:** 2026-04-08

---

## Regras

1. **Nunca reutilize uma porta** de projeto já registrado — mesmo que o projeto esteja inativo
2. **Sempre use docker-compose** para subir os serviços localmente
3. **Ao registrar novo projeto** no dev-intake: ler este arquivo, encontrar o próximo index disponível, atribuir o bloco e atualizar este arquivo
4. **Ao remover projeto:** marque como `[INATIVO]` mas mantenha o bloco — não reatribua portas
5. O arquivo `environments.md` de cada projeto deve referenciar as portas definidas aqui

---

## Como Registrar Novo Projeto

No step-01 do dev-intake, quando "Outro projeto" for selecionado:

```
1. Ler este arquivo (ports-registry.md)
2. Encontrar o maior index registrado
3. Incrementar: next_index = max_index + 1
4. Calcular portas:
   api_port  = 3000 + (next_index * 10)
   web_port  = 5173 + (next_index * 10)
   db_port   = 5432 + (next_index * 10)
5. Criar entrada na tabela "Projetos Registrados"
6. Criar seção "Detalhes por Projeto"
7. Criar arquivo environments.md com as portas atribuídas
8. Criar arquivo docker-compose.yml com as portas atribuídas
```
