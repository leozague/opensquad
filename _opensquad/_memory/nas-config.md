# NAS Configuration — TrueNAS

> Configuracao central do NAS. Usado pelo para-classifier (Atlas) e bujo-manager (Ryder) para rotear arquivos.

---

## Conexao

- **Tipo:** TrueNAS via SMB
- **IP:** `192.168.0.210`
- **Share:** `data`
- **Ponto de montagem:** `/Volumes/data`
- **Capacidade:** 7,85 TB (5,78 TB disponivel)
- **Status:** Nao montado permanentemente — verificar disponibilidade antes de copiar
- **Verificar:** `ls /Volumes/data/ 2>/dev/null`

## Comando para montar (se necessario)

```bash
open "smb://192.168.0.210/data"
```

---

## Estrutura de Pastas (PARA)

```
/Volumes/data/
│
├── 01_Projects/                              Projetos ativos
│   └── {projeto}/
│       ├── assets/
│       ├── backups/
│       └── entregas/
│
├── 02_Areas/
│   ├── media/                                Midia pessoal
│   │   ├── fotos/YYYY/MM/
│   │   └── videos/YYYY/
│   │
│   ├── documentos/                           Todos os documentos
│   │   ├── pessoal/                          RG, CPF, passaporte
│   │   ├── familia/                          Docs de familiares
│   │   ├── veiculos/{veiculo}/               CRV, CRLV, seguro
│   │   ├── imoveis/                          Escritura, IPTU
│   │   ├── contratos/                        Plano, internet, assinaturas
│   │   ├── trabalho/                         CNPJ, alvara, propostas
│   │   ├── saude/YYYY/                       Exames, laudos, receitas
│   │   └── compras/{categoria}/{produto}/    NF + garantia + manual
│   │
│   ├── financeiro/YYYY/                      Movimentacao fiscal
│   │   ├── recibos/
│   │   ├── notas-fiscais/                    NFs de SERVICO (nao produto)
│   │   ├── extratos/
│   │   └── impostos/                         IRPF, DAS, guias
│   │
│   ├── trabalho/                             Assets criativos
│   │   ├── clientes/{nome}/
│   │   └── midias/                           Logos, branding
│   │
│   └── bujo-scans/YYYY/MM/                   Fotos BuJo fisico
│
├── 03_Resources/
│   ├── cursos/{nome}/
│   ├── certificados/
│   ├── livros/
│   ├── podcasts/
│   └── musica/
│
├── 04_Archives/                              Arquivo morto
│   ├── projetos/{nome}/                      Projetos encerrados
│   ├── dispositivos/{nome}/                  Backups de devices
│   ├── software/{categoria}/                 Instaladores, ISOs, licencas
│   └── legado/                               Conteudo migrado de _PESS/_WORK
│
├── _meta/
│   └── _index.md                             Mapa geral do NAS
│
├── _PESS/                                    [LEGADO] Migrar gradualmente
└── _WORK/                                    [LEGADO] Migrar gradualmente
```

---

## Tabela de Roteamento

### Midia pessoal

| Conteudo detectado | Destino NAS | note_type | Nota no vault |
|-------------------|-------------|-----------|---------------|
| Foto pessoal / familia / evento | 02_Areas/media/fotos/YYYY/MM/ | nas-reference | 02_Areas/familia/ |
| Foto de viagem | 02_Areas/media/fotos/YYYY/MM/ | nas-reference | 02_Areas/familia/ |
| Video pessoal | 02_Areas/media/videos/YYYY/ | nas-reference | 02_Areas/familia/ |

### Documentos

| Conteudo detectado | Destino NAS | note_type | Nota no vault |
|-------------------|-------------|-----------|---------------|
| Doc pessoal (RG, CPF, passaporte) | 02_Areas/documentos/pessoal/ | nas-reference | 02_Areas/documentos/ |
| Doc de familiar | 02_Areas/documentos/familia/ | nas-reference | 02_Areas/documentos/ |
| Doc veiculo (CRV, seguro, multa) | 02_Areas/documentos/veiculos/{v}/ | nas-reference | 02_Areas/documentos/ |
| Doc imovel (escritura, IPTU) | 02_Areas/documentos/imoveis/ | nas-reference | 02_Areas/documentos/ |
| Contrato (plano, internet, seguro) | 02_Areas/documentos/contratos/ | nas-reference | 02_Areas/documentos/ |
| Doc trabalho (CNPJ, alvara) | 02_Areas/documentos/trabalho/ | nas-reference | 02_Areas/documentos/ |
| Exame / laudo medico | 02_Areas/documentos/saude/YYYY/ | nas-reference | 02_Areas/documentos/ |

### Compras

| Conteudo detectado | Destino NAS | note_type | Nota no vault |
|-------------------|-------------|-----------|---------------|
| Produto que quero comprar | — (nao vai pro NAS) | area | 02_Areas/bujo/collections/wishlist.md |
| NF de produto comprado | 02_Areas/documentos/compras/{cat}/{prod}/ | nas-reference | 02_Areas/compras/ |
| Termo de garantia | 02_Areas/documentos/compras/{cat}/{prod}/ | nas-reference | 02_Areas/compras/ |
| Manual de produto | 02_Areas/documentos/compras/{cat}/{prod}/ | nas-reference | 02_Areas/compras/ |

### Financeiro

| Conteudo detectado | Destino NAS | note_type | Nota no vault |
|-------------------|-------------|-----------|---------------|
| Recibo / comprovante pagamento | 02_Areas/financeiro/YYYY/recibos/ | nas-reference | 02_Areas/financeiro/ |
| NF de servico | 02_Areas/financeiro/YYYY/notas-fiscais/ | nas-reference | 02_Areas/financeiro/ |
| Extrato bancario | 02_Areas/financeiro/YYYY/extratos/ | nas-reference | 02_Areas/financeiro/ |
| IRPF / DAS / guia fiscal | 02_Areas/financeiro/YYYY/impostos/ | nas-reference | 02_Areas/financeiro/ |

### Trabalho

| Conteudo detectado | Destino NAS | note_type | Nota no vault |
|-------------------|-------------|-----------|---------------|
| Asset de cliente | 02_Areas/trabalho/clientes/{nome}/ | nas-reference | 01_Projects/{projeto}/ |
| Logo / branding / marketing | 02_Areas/trabalho/midias/ | nas-reference | 02_Areas/trabalho/ |
| Foto BuJo fisico | 02_Areas/bujo-scans/YYYY/MM/ | area | 02_Areas/bujo/ (transcreve) |

### Conhecimento

| Conteudo detectado | Destino NAS | note_type | Nota no vault |
|-------------------|-------------|-----------|---------------|
| Material de curso | 03_Resources/cursos/{nome}/ | nas-reference | 03_Resources/{tema}/ |
| Certificado | 03_Resources/certificados/ | nas-reference | 02_Areas/dev-pessoal/ |
| eBook / PDF grande (> 5MB) | 03_Resources/livros/ | nas-reference | 03_Resources/{tema}/ |
| Podcast | 03_Resources/podcasts/ | nas-reference | 03_Resources/{tema}/ |

### Arquivo morto

| Conteudo detectado | Destino NAS | note_type | Nota no vault |
|-------------------|-------------|-----------|---------------|
| Backup dispositivo | 04_Archives/dispositivos/{nome}/ | nas-reference | — (so cataloga) |
| Instalador / ISO | 04_Archives/software/{cat}/ | nas-reference | — (so cataloga) |
| Projeto encerrado | 04_Archives/projetos/{nome}/ | nas-reference | 04_Archives/projects/ |

### Fica so no vault (NAO vai pro NAS)

| Conteudo detectado | note_type | Destino no vault |
|-------------------|-----------|-----------------|
| Screenshot tecnico | reference | {destino}/assets/ |
| Diagrama / mapa mental | reference | {destino}/assets/ |
| PDF tecnico < 5MB | reference | 03_Resources/{tema}/ |
| Wireframe / mockup | reference | 01_Projects/{projeto}/assets/ |
| Produto que quero comprar | area | wishlist.md |

---

## Regras

1. **NAS indisponivel:** Salvar em `/Users/macbookpro/Documents/_THOTH/00_Inbox/_pending-nas/` com arquivo `.meta` (JSON). Criar nota com `storage_status: pending-transfer`. Cron `nas-sync.sh` transfere a cada 30 min.
2. **Convencao de nomes:** `{YYYY-MM-DD}_{descricao-curta}.{ext}` — ex: `2026-04-08_exame-sangue-hemograma.pdf`
3. **Nunca deletar original** ate confirmar que esta no NAS (verificacao de tamanho).
4. **Screenshots e refs visuais pequenas** ficam no vault em `assets/` — nao vao pro NAS.
5. **PDFs tecnicos:** vault se < 5MB, NAS se maiores.
6. **Compras:** NF + garantia + manual SEMPRE juntos na mesma pasta `{produto}/`.
7. **Financeiro vs Compras:** NF de servico -> financeiro. NF de produto -> compras.
8. **Ciclo de vida projetos:** ativo em `01_Projects/`, encerrado migra para `04_Archives/projetos/`.
9. **Legado:** `_PESS/` e `_WORK/` permanecem ate migracao completa, depois vao para `04_Archives/legado/`.

---

## Categorias de compras (para subpasta)

| Categoria | Exemplos |
|-----------|----------|
| eletronicos | TV, notebook, celular, fone, tablet, console |
| eletrodomesticos | Geladeira, fogao, microondas, maquina de lavar |
| moveis | Sofa, mesa, cadeira, estante, cama |
| outros | Ferramentas, roupas, acessorios, brinquedos |
