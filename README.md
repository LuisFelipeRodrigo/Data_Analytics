# Treinamento de Data Analytics




# Escopo do Projeto

Uma empresa de compra e venda de aço, toda negociação, acontece através de um site na AWS, resultando na geração de quatro arquivos CSV essenciais para o gerenciamento do  negócio:
- Compras
- Vendas
- Pagamentos
- Recebimentos

O processo de Extração, Transformação e Carregamento(ETL) dos Dados usando o mySQL.
Dois bancos de dados, stage para tratamento e projeto financeiro para as tabelas finais.
Desenvolvimento de todo processamento em procedures.


# Load CSV

Você pode fazer o carregamento manual de cada csv, ou utilizar o .bach
```sql
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CEP.csv'
INTO TABLE cep
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
```



### TRUNCATE/DROP.sql
Caso esteja usando MYSQL, ao truncar as tabelas reinicie a conexão com o banco.
```sql
SET foreign_key_checks = 0;
truncate table projeto_financeiro.cep;
truncate table projeto_financeiro.clientes;
truncate table projeto_financeiro.condicao_pagamento;
truncate table projeto_financeiro.enderecos_clientes;
truncate table projeto_financeiro.enderecos_fornecedores;
truncate table projeto_financeiro.fornecedores;
truncate table projeto_financeiro.historico_pagamento;
truncate table projeto_financeiro.historico_recebimento;
truncate table projeto_financeiro.historico_recebimento_divergente;
truncate table projeto_financeiro.notas_fiscais_entrada_;
truncate table projeto_financeiro.notas_fiscais_saida;
truncate table projeto_financeiro.programacao_pagamento;
truncate table projeto_financeiro.programacao_recebimento;
truncate table projeto_financeiro.tipo_desconto;
truncate table projeto_financeiro.tipo_endereco;
SET foreign_key_checks = 1;

TRUNCATE TABLE stage.cep;
TRUNCATE TABLE stage.compras;
TRUNCATE TABLE stage.compras_rejeitadas;
TRUNCATE TABLE stage.pagamentos;
TRUNCATE TABLE stage.pagamentos_rejeitadas;
TRUNCATE TABLE stage.recebimento_rejeitados;
TRUNCATE TABLE stage.recebimentos;
TRUNCATE table stage.tipo_desconto;
TRUNCATE table stage.tipo_endereco;
TRUNCATE table stage.validacao_compras;
TRUNCATE table stage.validacao_vendas;
TRUNCATE TABLE stage.vendas;
TRUNCATE TABLE stage.vendas_rejeitadas;
```
