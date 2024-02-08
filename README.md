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

# Planejamento
No Figma, há uma descrição mais detalhada das fases de tratamento.
https://www.figma.com/file/bYS5RYf8ikfThoBvHPQgK2/Projeto_Financeiro-(Copy)?type=whiteboard&node-id=0%3A1&t=QIRxvrQqN67QA4Ts-1
# Tableas Dimensão
- CEP
- TIPO_DESCONTO
- TIPO_ENDERECO
- CONDICAO_PAGAMENTO


# Compras sem tratamento
Abaixo está um exemplo:
![imagem_2024-02-08_143855969](https://github.com/LuisFelipeRodrigo/Data_Analytics/assets/103063554/65fe5a70-6d1c-4449-a8f7-6a78a153345e)

# Compras rejeitadas
Após o tratamento, as compras que não passaram na validação são inseridas em compras rejeitadas com a observação:
![imagem_2024-02-08_144146104](https://github.com/LuisFelipeRodrigo/Data_Analytics/assets/103063554/98fdb913-00c2-47d4-8669-e4d9a14f21e8)


# Load CSV

Você pode fazer o carregamento manual de cada csv, ou utilizar o .bach
```sql
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CEP.csv'
INTO TABLE cep
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
```
# Chamada manual das procedures
Você pode optar por chamalas manualmente ou criar um event:
```sql
CREATE EVENT procedures_event
ON SCHEDULE EVERY 1 DAY
STARTS TIMESTAMP(CURRENT_DATE + INTERVAL 1 DAY) + INTERVAL '00:30' HOUR_MINUTE
DO
BEGIN
    CALL stage.SP_TRATAMENTO_CEP;
    CALL stage.SP_TRATAMENTO_COMPRAS();
    CALL stage.SP_TRATAMENTO_PAGAMENTOS();
    CALL stage.SP_TRATAMENTO_VENDAS();
    CALL stage.SP_TRATAMENTO_RECEBIMENTOS();
    CALL stage.SP_LIMPAR_TBS_TEMP_STAGE();
    CALL stage.SP_LIMPAR_TABELAS_STAGE();
END;
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
