CREATE SCHEMA IF NOT EXISTS `stage` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `stage` ;

-- -----------------------------------------------------
-- Table `stage`.`cep`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stage`.`cep` (
  `cep` VARCHAR(45) NULL DEFAULT NULL,
  `uf` VARCHAR(45) NULL DEFAULT NULL,
  `cidade` VARCHAR(255) NULL DEFAULT NULL,
  `bairro` VARCHAR(255) NULL DEFAULT NULL,
  `logradouro` VARCHAR(255) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stage`.`compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stage`.`compras` (
  `nome_fornecedor` VARCHAR(255) NULL DEFAULT NULL,
  `cnpj_fornecedor` VARCHAR(45) NULL DEFAULT NULL,
  `email_fornecedor` VARCHAR(45) NULL DEFAULT NULL,
  `telefone_fornecedor` VARCHAR(45) NULL DEFAULT NULL,
  `numero_nf` VARCHAR(45) NULL DEFAULT NULL,
  `data_emissao` DATE NULL DEFAULT NULL,
  `valor_net` DECIMAL(10,2) NULL DEFAULT NULL,
  `valor_tributo` DECIMAL(10,2) NULL DEFAULT NULL,
  `valor_total` DECIMAL(10,2) NULL DEFAULT NULL,
  `nome_item` VARCHAR(255) NULL DEFAULT NULL,
  `qtd_item` INT NULL DEFAULT NULL,
  `condicao_pagamento` VARCHAR(45) NULL DEFAULT NULL,
  `cep` VARCHAR(45) NULL DEFAULT NULL,
  `num_endereco` VARCHAR(45) NULL DEFAULT NULL,
  `complemento` VARCHAR(45) NULL DEFAULT NULL,
  `tipo_endereco` VARCHAR(45) NULL DEFAULT NULL,
  `data_processamento` DATE NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stage`.`compras_rejeitadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stage`.`compras_rejeitadas` (
  `nome_fornecedor` VARCHAR(255) NULL DEFAULT NULL,
  `cnpj_fornecedor` VARCHAR(45) NULL DEFAULT NULL,
  `email_fornecedor` VARCHAR(45) NULL DEFAULT NULL,
  `telefone_fornecedor` VARCHAR(45) NULL DEFAULT NULL,
  `numero_nf` VARCHAR(45) NULL DEFAULT NULL,
  `data_emissao` DATE NULL DEFAULT NULL,
  `valor_net` DECIMAL(10,2) NULL DEFAULT NULL,
  `valor_tributo` DECIMAL(10,2) NULL DEFAULT NULL,
  `valor_total` DECIMAL(10,2) NULL DEFAULT NULL,
  `nome_item` VARCHAR(255) NULL DEFAULT NULL,
  `qtd_item` INT NULL DEFAULT NULL,
  `condicao_pagamento` VARCHAR(45) NULL DEFAULT NULL,
  `cep` VARCHAR(45) NULL DEFAULT NULL,
  `num_endereco` VARCHAR(45) NULL DEFAULT NULL,
  `complemento` VARCHAR(45) NULL DEFAULT NULL,
  `data_processamento` DATE NULL DEFAULT NULL,
  `tipo_endereco` VARCHAR(45) NULL DEFAULT NULL,
  `motivo` TEXT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stage`.`pagamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stage`.`pagamentos` (
  `id_nf_entrada` VARCHAR(255) NULL DEFAULT NULL,
  `data_vencimento` VARCHAR(10) NULL DEFAULT NULL,
  `data_pgt_efetuado` VARCHAR(10) NULL DEFAULT NULL,
  `valor_parcela_pago` VARCHAR(10) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stage`.`pagamentos_rejeitadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stage`.`pagamentos_rejeitadas` (
  `id_nf_entrada` VARCHAR(50) NULL DEFAULT NULL,
  `data_vencimento` VARCHAR(10) NULL DEFAULT NULL,
  `data_pgt_efetuado` VARCHAR(10) NULL DEFAULT NULL,
  `valor_parcela_pago` VARCHAR(10) NULL DEFAULT NULL,
  `motivo` TEXT NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stage`.`recebimento_rejeitados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stage`.`recebimento_rejeitados` (
  `numero_nf` VARCHAR(45) NULL DEFAULT NULL,
  `valor_recebido` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `data_vencimento` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `data_recebimento` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `data_processamento` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `motivo` VARCHAR(255) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `stage`.`recebimentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stage`.`recebimentos` (
  `numero_nf` VARCHAR(45) NULL DEFAULT NULL,
  `valor_recebido` VARCHAR(45) NULL DEFAULT NULL,
  `data_vencimento` VARCHAR(45) NULL DEFAULT NULL,
  `data_recebimento` VARCHAR(45) NULL DEFAULT NULL,
  `data_processamento` VARCHAR(45) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stage`.`tipo_desconto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stage`.`tipo_desconto` (
  `id_desconto` INT NULL DEFAULT NULL,
  `descricao` VARCHAR(45) NULL DEFAULT NULL,
  `minimo_dias` INT NULL DEFAULT NULL,
  `maximo_dias` INT NULL DEFAULT NULL,
  `minimo_porcento` DECIMAL(10,2) NULL DEFAULT NULL,
  `maximo_porcento` DECIMAL(10,2) NULL DEFAULT NULL,
  `aprovador` VARCHAR(45) NULL DEFAULT NULL,
  `data_aprovacao` DATE NULL DEFAULT NULL,
  `tipo_desconto` VARCHAR(45) NULL DEFAULT NULL,
  `status_aprovacao` VARCHAR(45) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stage`.`tipo_endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stage`.`tipo_endereco` (
  `id_tipo_endereco` INT NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `sigla` VARCHAR(45) NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stage`.`validacao_compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stage`.`validacao_compras` (
  `data_processamento` DATE NOT NULL,
  `data_emissao` DATE NOT NULL,
  `num_nf` VARCHAR(45) NOT NULL,
  `cnpj_fornecedor` VARCHAR(45) NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stage`.`validacao_vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stage`.`validacao_vendas` (
  `data_processamento` DATE NOT NULL,
  `data_emissao` DATE NOT NULL,
  `numero_nf` VARCHAR(45) NOT NULL,
  `cnpj_cliente` VARCHAR(45) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stage`.`vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stage`.`vendas` (
  `nome_cliente` VARCHAR(255) NULL DEFAULT NULL,
  `cnpj_cliente` VARCHAR(45) NULL DEFAULT NULL,
  `email_cliente` VARCHAR(45) NULL DEFAULT NULL,
  `telefone_cliente` VARCHAR(45) NULL DEFAULT NULL,
  `numero_nf` VARCHAR(45) NOT NULL,
  `data_emissao` DATE NOT NULL,
  `valor_net` DECIMAL(10,2) NULL DEFAULT NULL,
  `valor_tributo` DECIMAL(10,2) NULL DEFAULT NULL,
  `valor_total` DECIMAL(10,2) NULL DEFAULT NULL,
  `nome_item` VARCHAR(255) NULL DEFAULT NULL,
  `qtd_item` INT NULL DEFAULT NULL,
  `condicao_pagamento` VARCHAR(45) NULL DEFAULT NULL,
  `cep` VARCHAR(45) NULL DEFAULT NULL,
  `num_endereco` VARCHAR(45) NULL DEFAULT NULL,
  `complemento` VARCHAR(45) NULL DEFAULT NULL,
  `tipo_endereco` VARCHAR(45) NULL DEFAULT NULL,
  `data_processamento` DATE NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stage`.`vendas_rejeitadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stage`.`vendas_rejeitadas` (
  `nome_cliente` VARCHAR(255) NULL DEFAULT NULL,
  `cnpj_cliente` VARCHAR(45) NULL DEFAULT NULL,
  `email_cliente` VARCHAR(45) NULL DEFAULT NULL,
  `telefone_cliente` VARCHAR(45) NULL DEFAULT NULL,
  `numero_nf` VARCHAR(45) NULL DEFAULT NULL,
  `data_emissao` DATE NULL DEFAULT NULL,
  `valor_net` DECIMAL(10,2) NULL DEFAULT NULL,
  `valor_tributo` DECIMAL(10,2) NULL DEFAULT NULL,
  `valor_total` DECIMAL(10,2) NULL DEFAULT NULL,
  `nome_item` VARCHAR(45) NULL DEFAULT NULL,
  `qtd_item` INT NULL DEFAULT NULL,
  `condicao_pagamento` VARCHAR(45) NULL DEFAULT NULL,
  `cep` VARCHAR(45) NULL DEFAULT NULL,
  `num_endereco` VARCHAR(45) NULL DEFAULT NULL,
  `complemento` VARCHAR(45) NULL DEFAULT NULL,
  `tipo_endereco` VARCHAR(45) NULL DEFAULT NULL,
  `data_processamento` DATE NULL DEFAULT NULL,
  `motivo` TEXT NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `stage` ;

-- -----------------------------------------------------
-- procedure SD_INSERIR_NF_SAIDA
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SD_INSERIR_NF_SAIDA`()
BEGIN
DECLARE done int default false;
DECLARE v_ID_CLIENTE INT;
DECLARE v_ID_CONDICAO INT;
DECLARE v_data_emissao DATE;
DECLARE v_nome_item VARCHAR(255);
DECLARE v_num_nf INT;
DECLARE v_quantidade_item INT;
DECLARE v_valor_tributo DECIMAL(10,2);
DECLARE v_valor_total DECIMAL(10,2);
DECLARE v_valor_net DECIMAL(10,2); 

DECLARE cursor_inserir_nf_saida CURSOR FOR
	SELECT
	v9.ID_CLIENTE,
	v9.ID_CONDICAO,
    v9.data_emissao,
    v9.nome_item,
    v9.numero_nf,
    v9.qtd_item,
    v9.valor_tributo,
    v9.valor_total,
    v9.valor_net
FROM stage.vendas9 v9;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cursor_inserir_nf_saida;
	read_loop: LOOP
    FETCH cursor_inserir_nf_saida INTO
        v_ID_CLIENTE,
		v_ID_CONDICAO,
		v_data_emissao,
		v_nome_item,
		v_num_nf,
		v_quantidade_item,
		v_valor_tributo,
		v_valor_total,
		v_valor_net;
	IF done THEN
	LEAVE read_loop;
	END IF;
 INSERT INTO projeto_financeiro.notas_fiscais_saida
		(
		 ID_CLIENTE,
		 ID_CONDICAO,
		 DATA_EMISSAO_NF_SAIDA,
		 NOME_ITEM_NF_SAIDA,
		 NUMERO_NF_SAIDA,
		 QTD_ITEM_NF_SAIDA,
		 VALOR_TRIBUTO_NF_SAIDA,
		 VALOR_TOTAL_NF_SAIDA,
		 VALOR_NET_NF_SAIDA
         )
 VALUES(
		v_ID_CLIENTE,
		v_ID_CONDICAO,
		v_data_emissao,
		v_nome_item,
		v_num_nf,
		v_quantidade_item,
		v_valor_tributo,
		v_valor_total,
		v_valor_net
        ); 
	
END LOOP;
CLOSE cursor_inserir_nf_saida;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_INSERIR_CLIENTES
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERIR_CLIENTES`()
BEGIN
-- inserindo os clientes/atualizando dados se forem alterados  
INSERT INTO projeto_financeiro.clientes (CNPJ_CLIENTE, EMAIL_CLIENTE, NOME_CLIENTE, TELEFONE_CLIENTE)
SELECT
    v8.cnpj_cliente,
    v8.email_cliente,
    v8.nome_cliente,
    v8.telefone_cliente
FROM stage.vendas8 v8
ON DUPLICATE KEY UPDATE
    EMAIL_CLIENTE = IF(v8.email_cliente != projeto_financeiro.clientes.EMAIL_CLIENTE, v8.email_cliente, projeto_financeiro.clientes.EMAIL_CLIENTE),
    NOME_CLIENTE = IF(v8.nome_cliente != projeto_financeiro.clientes.NOME_CLIENTE, v8.nome_cliente, projeto_financeiro.clientes.NOME_CLIENTE),
    TELEFONE_CLIENTE = IF(v8.telefone_cliente != projeto_financeiro.clientes.TELEFONE_CLIENTE, v8.telefone_cliente, projeto_financeiro.clientes.TELEFONE_CLIENTE);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_INSERIR_COMPRAS_PROCESSADAS
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERIR_COMPRAS_PROCESSADAS`()
BEGIN
   INSERT INTO stage.validacao_compras (
    data_processamento,
    data_emissao,
    num_nf,
    cnpj_fornecedor)
SELECT 
	data_processamento,
    data_emissao,
    numero_nf,
    cnpj_fornecedor
FROM stage.compras9;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_INSERIR_ENDERECOS_CLIENTES
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERIR_ENDERECOS_CLIENTES`()
BEGIN
 -- INSERIR O ENDERECO DOS CLIENTES
INSERT INTO projeto_financeiro.enderecos_clientes (ID_CLIENTE, ID_TIPO_ENDERECO, CEP, COMPLEMENTO_CLIENTE, NUMERO_CLIENTE)
SELECT
    v9.ID_CLIENTE,
    v9.ID_TIPO_ENDERECO,
    v9.CEP,
    v9.complemento,
    v9.num_endereco
FROM stage.vendas9 v9
WHERE NOT EXISTS (
    SELECT 1
    FROM projeto_financeiro.enderecos_clientes ec
    WHERE ec.ID_CLIENTE = v9.ID_CLIENTE
        AND ec.ID_TIPO_ENDERECO = v9.ID_TIPO_ENDERECO
)
ON DUPLICATE KEY UPDATE
    CEP = IF(v9.CEP != projeto_financeiro.enderecos_clientes.CEP, v9.CEP, projeto_financeiro.enderecos_clientes.CEP),
    COMPLEMENTO_CLIENTE = IF(v9.complemento != projeto_financeiro.enderecos_clientes.COMPLEMENTO_CLIENTE, v9.complemento, projeto_financeiro.enderecos_clientes.COMPLEMENTO_CLIENTE),
    NUMERO_CLIENTE = IF(v9.num_endereco != projeto_financeiro.enderecos_clientes.NUMERO_CLIENTE, v9.num_endereco, projeto_financeiro.enderecos_clientes.NUMERO_CLIENTE);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_INSERIR_ENDERECOS_FORNECEDORES
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERIR_ENDERECOS_FORNECEDORES`()
BEGIN
   INSERT INTO projeto_financeiro.enderecos_fornecedores (ID_FORNECEDOR, ID_TIPO_ENDERECO, CEP, COMPLEMENTO_FORNECEDOR, NUMERO_FORNECEDOR)
SELECT
    c9.ID_FORNECEDOR,
    c9.ID_TIPO_ENDERECO,
    c9.CEP,
    c9.complemento,
    c9.num_endereco
FROM stage.compras9 c9
WHERE NOT EXISTS (
    SELECT 1
    FROM projeto_financeiro.enderecos_fornecedores ef
    WHERE ef.ID_FORNECEDOR = c9.ID_FORNECEDOR
        AND ef.ID_TIPO_ENDERECO = c9.ID_TIPO_ENDERECO
)
ON DUPLICATE KEY UPDATE
    CEP = IF(c9.CEP != projeto_financeiro.enderecos_fornecedores.CEP, c9.CEP, projeto_financeiro.enderecos_fornecedores.CEP),
    COMPLEMENTO_FORNECEDOR = IF(c9.complemento != projeto_financeiro.enderecos_fornecedores.COMPLEMENTO_FORNECEDOR, c9.complemento, projeto_financeiro.enderecos_fornecedores.COMPLEMENTO_FORNECEDOR),
    NUMERO_FORNECEDOR = IF(c9.num_endereco != projeto_financeiro.enderecos_fornecedores.NUMERO_FORNECEDOR, c9.num_endereco, projeto_financeiro.enderecos_fornecedores.NUMERO_FORNECEDOR);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_INSERIR_FORNECEDORES
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERIR_FORNECEDORES`()
BEGIN
    INSERT INTO projeto_financeiro.fornecedores (CNPJ_FORNECEDOR, EMAIL_FORNECEDOR, NOME_FORNECEDOR, TELEFONE_FORNECEDOR)
    SELECT
        c8.cnpj_fornecedor,
        c8.email_fornecedor,
        c8.nome_fornecedor,
        c8.telefone_fornecedor
    FROM stage.compras8 c8
    ON DUPLICATE KEY UPDATE
        EMAIL_FORNECEDOR = IF(c8.email_fornecedor != projeto_financeiro.fornecedores.EMAIL_FORNECEDOR, c8.email_fornecedor, projeto_financeiro.fornecedores.EMAIL_FORNECEDOR),
        NOME_FORNECEDOR = IF(c8.nome_fornecedor != projeto_financeiro.fornecedores.NOME_FORNECEDOR, c8.nome_fornecedor, projeto_financeiro.fornecedores.NOME_FORNECEDOR),
        TELEFONE_FORNECEDOR = IF(c8.telefone_fornecedor != projeto_financeiro.fornecedores.TELEFONE_FORNECEDOR, c8.telefone_fornecedor, projeto_financeiro.fornecedores.TELEFONE_FORNECEDOR);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_INSERIR_HISTORICO_PAGAMENTO
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERIR_HISTORICO_PAGAMENTO`()
BEGIN

	 INSERT INTO projeto_financeiro.historico_pagamento (
        ID_PROGRAMACAO_PAGAMENTO,
        DATA_PAGAMENTO,
        VALOR_PAGO,
        VALOR_PAGAR)
        SELECT 
        ID_PROGRAMACAO_PAGAMENTO,
        data_pgt_efetuado,
        valor_parcela_pago,
		VALOR_PARCELA_PROG_PAGAMENTO
        FROM stage.pagamentos5 p5
        WHERE NOT EXISTS ( 
        SELECT 1
        FROM projeto_financeiro.historico_pagamento hp
        WHERE hp.ID_PROGRAMACAO_PAGAMENTO = p5.ID_PROGRAMACAO_PAGAMENTO
        );
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_INSERIR_HIST_RECEBIMENTO
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERIR_HIST_RECEBIMENTO`()
BEGIN
	INSERT INTO projeto_financeiro.historico_recebimento (
		ID_PROGRAMACAO_RECEBIMENTO,
		ID_DESCONTO,
		DATA_RECEBIMENTO,
		VALOR_RECEBER,
		VALOR_RECEBIDO)	
	SELECT 
		r10.ID_PROGRAMACAO_RECEBIMENTO,
		r10.ID_DESCONTO,
		r10.data_recebimento,
		r10.VALOR_PARCELA_PROG_RECEBIMENTO,
		r10.valor_recebido
	FROM stage.recebimentos10 r10
        WHERE NOT EXISTS ( 
        SELECT 1
        FROM projeto_financeiro.historico_recebimento hr
        WHERE hr.ID_PROGRAMACAO_RECEBIMENTO = r10.ID_PROGRAMACAO_RECEBIMENTO
        );
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_INSERIR_HIST_RECEBIMENTO_DIVERGENTE
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERIR_HIST_RECEBIMENTO_DIVERGENTE`()
BEGIN
	INSERT INTO projeto_financeiro.historico_recebimento_divergente (
		ID_PROGRAMACAO_RECEBIMENTO,
		ID_DESCONTO,
		DATA_RECEBIMENTO_HIST_DIVERGENTE,
		MOTIVO_DIVERGENCIA,
		VALOR_RECEBIDO_HIST_DIVERGENTE)	
	SELECT 
		r10.ID_PROGRAMACAO_RECEBIMENTO,
		r10.ID_DESCONTO,
		r10.data_recebimento,
		"Tipo de desconto inválido" AS MOTIVO_DIVERGENCIA,
		r10.valor_recebido
	FROM stage.recebimentos10 r10
    WHERE r10.diferenca_dias = -1 AND r10.porcentagem = -1;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_INSERIR_NF_ENTRADA
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERIR_NF_ENTRADA`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_ID_CONDICAO INT;
    DECLARE v_ID_FORNECEDOR INT;
    DECLARE v_data_emissao DATE;
    DECLARE v_nome_item VARCHAR(255);
    DECLARE v_numero_nf VARCHAR(50);
    DECLARE v_qtd_item INT;
    DECLARE v_valor_tributo DECIMAL(10, 2);
    DECLARE v_valor_total DECIMAL(10, 2);
    DECLARE v_valor_net DECIMAL(10, 2);

    DECLARE cursor_compras CURSOR FOR
        SELECT
            c9.ID_CONDICAO,
            c9.ID_FORNECEDOR,
            c9.data_emissao,
            c9.nome_item,
            c9.numero_nf,
            c9.qtd_item,
            c9.valor_tributo,
            c9.valor_total,
            c9.valor_net
        FROM stage.compras9 c9;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cursor_compras;

    read_loop: LOOP
        FETCH cursor_compras INTO
            v_ID_CONDICAO,
            v_ID_FORNECEDOR,
            v_data_emissao,
            v_nome_item,
            v_numero_nf,
            v_qtd_item,
            v_valor_tributo,
            v_valor_total,
            v_valor_net;

        IF done THEN
            LEAVE read_loop;
        END IF;

        INSERT INTO projeto_financeiro.notas_fiscais_entrada_ (
            ID_CONDICAO,
            ID_FORNECEDOR,
            DATA_EMISSAO_NF_ENTRADA,
            NOME_ITEM_NF_ENTRADA,
            NUMERO_NF_ENTRADA,
            QTD_ITEM_NF_ENTRADA,
            VALOR_TRIBUTO_NF_ENTRADA,
            VALOR_TOTAL_NF_ENTRADA,
            VALOR_NET_NF_ENTRADA
        ) VALUES (
            v_ID_CONDICAO,
            v_ID_FORNECEDOR,
            v_data_emissao,
            v_nome_item,
            v_numero_nf,
            v_qtd_item,
            v_valor_tributo,
            v_valor_total,
            v_valor_net
        );

    END LOOP;

    CLOSE cursor_compras;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_INSERIR_NF_SAIDA
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERIR_NF_SAIDA`()
BEGIN
DECLARE done int default false;
DECLARE v_ID_CLIENTE INT;
DECLARE v_ID_CONDICAO INT;
DECLARE v_data_emissao DATE;
DECLARE v_nome_item VARCHAR(255);
DECLARE v_num_nf VARCHAR(50);
DECLARE v_quantidade_item INT;
DECLARE v_valor_tributo DECIMAL(10,2);
DECLARE v_valor_total DECIMAL(10,2);
DECLARE v_valor_net DECIMAL(10,2); 

DECLARE cursor_inserir_nf_saida CURSOR FOR
	SELECT
	v9.ID_CLIENTE,
	v9.ID_CONDICAO,
    v9.data_emissao,
    v9.nome_item,
    v9.numero_nf,
    v9.qtd_item,
    v9.valor_tributo,
    v9.valor_total,
    v9.valor_net
FROM vendas9 v9;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cursor_inserir_nf_saida;
	read_loop: LOOP
    FETCH cursor_inserir_nf_saida INTO
        v_ID_CLIENTE,
		v_ID_CONDICAO,
		v_data_emissao,
		v_nome_item,
		v_num_nf,
		v_quantidade_item,
		v_valor_tributo,
		v_valor_total,
		v_valor_net;
	IF done THEN
	LEAVE read_loop;
	END IF;
 INSERT INTO projeto_financeiro.notas_fiscais_saida
		(
		 ID_CLIENTE,
		 ID_CONDICAO,
		 DATA_EMISSAO_NF_SAIDA,
		 NOME_ITEM_NF_SAIDA,
		 NUMERO_NF_SAIDA,
		 QTD_ITEM_NF_SAIDA,
		 VALOR_TRIBUTO_NF_SAIDA,
		 VALOR_TOTAL_NF_SAIDA,
		 VALOR_NET_NF_SAIDA
         )
 VALUES(
		v_ID_CLIENTE,
		v_ID_CONDICAO,
		v_data_emissao,
		v_nome_item,
		v_num_nf,
		v_quantidade_item,
		v_valor_tributo,
		v_valor_total,
		v_valor_net
        ); 
	
END LOOP;
CLOSE cursor_inserir_nf_saida;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_INSERIR_VENDAS_PROCESSADAS
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERIR_VENDAS_PROCESSADAS`()
BEGIN

INSERT INTO stage.validacao_vendas (
    data_processamento,
    data_emissao,
    numero_nf,
    cnpj_cliente)
SELECT 
	data_processamento,
    data_emissao,
    numero_nf,
    cnpj_cliente
FROM stage.vendas9;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_LIMPAR_TABELAS_STAGE
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LIMPAR_TABELAS_STAGE`()
BEGIN 
    TRUNCATE TABLE stage.compras;
    TRUNCATE TABLE stage.vendas;
    TRUNCATE TABLE stage.pagamentos;
    TRUNCATE TABLE stage.recebimentos;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_LIMPAR_TBS_TEMP_STAGE
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LIMPAR_TBS_TEMP_STAGE`()
BEGIN
-- Tabelas temporarias do tratamento de compras 
DROP TABLE stage.compras1;
DROP TABLE stage.compras2;
DROP TABLE stage.compras3;
DROP TABLE stage.compras4;
DROP TABLE stage.compras5;
DROP TABLE stage.compras6;
DROP TABLE stage.compras7;
DROP TABLE stage.compras8;
DROP TABLE stage.compras9;

-- Tabelas temporarias do tratamento pagamentos

DROP TABLE stage.pagamentos1;
DROP TABLE stage.pagamentos2;
DROP TABLE stage.pagamentos3;
DROP TABLE stage.pagamentos4;
DROP TABLE stage.pagamentos5;

-- Tabelas temporarias do tratamento VENDAS 
DROP TABLE stage.vendas1;
DROP TABLE stage.vendas2;
DROP TABLE stage.vendas3;
DROP TABLE stage.vendas4;
DROP TABLE stage.vendas5;
DROP TABLE stage.vendas6;
DROP TABLE stage.vendas7;
DROP TABLE stage.vendas8;
DROP TABLE stage.vendas9;

-- Tabelas temporarias do tratamento RECEBIMENTOS
DROP TABLE stage.recebimentos1;
DROP TABLE stage.recebimentos2;
DROP TABLE stage.recebimentos3;
DROP TABLE stage.recebimentos4;
DROP TABLE stage.recebimentos5;
DROP TABLE stage.recebimentos6;
DROP TABLE stage.recebimentos7;
DROP TABLE stage.recebimentos8;
DROP TABLE stage.recebimentos9;
DROP TABLE stage.recebimentos10;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TRATAMENTO_CEP
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRATAMENTO_CEP`()
BEGIN
-- Criar a tabela temporaria cep1 fazendo tratando cep, bairro, cidade, logradouro
CREATE TEMPORARY TABLE  if not exists stage.cep1 AS
SELECT
    cep,
    CASE WHEN LENGTH(uf) >= 2 THEN SUBSTRING(uf, 1, 2) ELSE uf END AS uf,
    COALESCE(NULLIF(cidade, ''), 'N/D') AS cidade,
    COALESCE(NULLIF(bairro, ''), 'N/D') AS bairro,
    COALESCE(NULLIF(REPLACE(logradouro, ',', ''), ''), 'N/D') AS logradouro
FROM stage.cep;

insert into projeto_financeiro.cep (
cep, 
uf, 
cidade, 
bairro, 
logradouro) 
select * from stage.cep1 WHERE cep NOT IN (SELECT cep FROM projeto_financeiro.cep);
drop table stage.cep1;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TRATAMENTO_COMPRAS
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRATAMENTO_COMPRAS`()
BEGIN

-- inserindo em compras_rejeitas as compras já processadas usando a tb validacao_compras

INSERT INTO compras_rejeitadas (
    nome_fornecedor,
    cnpj_fornecedor,
    email_fornecedor,
    telefone_fornecedor,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    tipo_endereco,
    data_processamento,
    motivo
)
SELECT
    nome_fornecedor,
    cnpj_fornecedor,
    email_fornecedor,
    telefone_fornecedor,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    tipo_endereco,
    CURDATE() AS data_processamento,
    'NF já processada' AS motivo
FROM stage.compras
WHERE EXISTS (
    SELECT 1
    FROM validacao_compras vc
    WHERE vc.num_nf = compras.numero_nf
        AND vc.cnpj_fornecedor = compras.cnpj_fornecedor
);

-- Criação da Tabela Temporária compras1 com validaçao de duplicidade já processadas(estão sendo inseridas em compras rejeitadas)

CREATE TEMPORARY TABLE compras1 AS
SELECT
    nome_fornecedor,
    cnpj_fornecedor,
    email_fornecedor,
    telefone_fornecedor,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    tipo_endereco,
    CURDATE() AS data_processamento
FROM (
    SELECT
        nome_fornecedor,
        cnpj_fornecedor,
        email_fornecedor,
        telefone_fornecedor,
        numero_nf,
        data_emissao,
        valor_net,
        valor_tributo,
        valor_total,
        nome_item,
        qtd_item,
        condicao_pagamento,
        cep,
        num_endereco,
        complemento,
        tipo_endereco,
        data_processamento,
        ROW_NUMBER() OVER (PARTITION BY numero_nf, cnpj_fornecedor ORDER BY data_processamento DESC) as row_num
    FROM stage.compras c
    WHERE NOT EXISTS (
        SELECT 1
        FROM validacao_compras vc
        WHERE vc.num_nf = c.numero_nf
            AND vc.cnpj_fornecedor = c.cnpj_fornecedor
    )
) AS c1
WHERE c1.row_num = 1;


-- Criação da Tabela Temporária compras2 com validaçao de duplicidade e valores nulos

CREATE TEMPORARY TABLE compras2 AS
SELECT
    COALESCE(NULLIF(nome_fornecedor, ''), 'N/D') AS nome_fornecedor,
   CASE 
        WHEN LENGTH(NULLIF(cnpj_fornecedor, '')) >= 14 THEN NULLIF(cnpj_fornecedor, '')
        ELSE 'N/D'
    END AS cnpj_fornecedor,
    COALESCE(NULLIF(email_fornecedor, ''), 'N/D') AS email_fornecedor,
    COALESCE(NULLIF(telefone_fornecedor, ''), 'N/D') AS telefone_fornecedor,
    COALESCE(NULLIF(numero_nf, ''), 'N/D') AS numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    COALESCE(NULLIF(nome_item, ''), 'N/D') AS nome_item,
    qtd_item,
    COALESCE(NULLIF(condicao_pagamento, ''), 'N/D') AS condicao_pagamento,
    COALESCE(NULLIF(cep, ''), 'N/D') AS cep,
    COALESCE(NULLIF(num_endereco, ''), 'N/D') AS num_endereco,
	COALESCE(NULLIF(complemento, ''), 'N/D') AS complemento,
    COALESCE(NULLIF(tipo_endereco, ''), 'N/D') AS tipo_endereco,
    data_processamento
FROM stage.compras1 c; 


-- Inserindo as compras que tem o campo 'N/D'


INSERT INTO compras_rejeitadas (nome_fornecedor, cnpj_fornecedor, email_fornecedor, telefone_fornecedor, numero_nf, data_emissao, valor_net, valor_tributo, valor_total, nome_item, qtd_item, condicao_pagamento, cep, num_endereco, complemento, tipo_endereco, data_processamento, motivo)
SELECT
    nome_fornecedor,
    cnpj_fornecedor,
    email_fornecedor,
    telefone_fornecedor,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    tipo_endereco,
    data_processamento,
    IF(cnpj_fornecedor = 'N/D', 'CNPJ inválido', 
        IF(cep = 'N/D', 'CEP inválido', 
            IF(numero_nf = 'N/D', 'Número de nota fiscal inválido', NULL)
        )
    ) AS motivo
FROM stage.compras2
WHERE cnpj_fornecedor = 'N/D' OR cep = 'N/D' OR numero_nf = 'N/D';


-- criando a tabela temporaria sem os cnpj, cep, nf com 'N/D'


CREATE TEMPORARY TABLE compras3 AS 
SELECT
    nome_fornecedor,
    cnpj_fornecedor,
    email_fornecedor,
    telefone_fornecedor,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    tipo_endereco,
    data_processamento
FROM (
    SELECT
        nome_fornecedor,
        cnpj_fornecedor,
        email_fornecedor,
        telefone_fornecedor,
        numero_nf,
        data_emissao,
        valor_net,
        valor_tributo,
        valor_total,
        nome_item,
        qtd_item,
        condicao_pagamento,
        cep,
        num_endereco,
        complemento,
        tipo_endereco,
        data_processamento
    FROM stage.compras2 c
    WHERE numero_nf != 'N/D' AND cnpj_fornecedor != 'N/D' AND cep != 'N/D'
    ) AS c3;
    

-- tratar o tipo de endereço 

CREATE TEMPORARY TABLE compras4 AS
SELECT
    nome_fornecedor,
    cnpj_fornecedor,
    email_fornecedor,
    telefone_fornecedor,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
	qtd_item,
	condicao_pagamento,
	cep,
	num_endereco,
    complemento,
     CASE 
        WHEN LOWER(tipo_endereco) LIKE '%cobranca%' AND LOWER(tipo_endereco) LIKE '%entrega%' AND LOWER(tipo_endereco)  NOT LIKE '%faturamento%'  THEN 'cobranca/entrega'
        WHEN LOWER(tipo_endereco) LIKE '%cobranca%' AND LOWER(tipo_endereco) LIKE '%faturamento%' AND LOWER(tipo_endereco) NOT LIKE '%entrega%' THEN 'cobranca/faturamento'
        WHEN LOWER(tipo_endereco) LIKE '%entrega%' AND LOWER(tipo_endereco) LIKE '%faturamento%' AND LOWER(tipo_endereco) NOT LIKE '%cobranca%' THEN 'entrega/faturamento'
        WHEN LOWER(tipo_endereco) LIKE '%cobranca%' AND LOWER(tipo_endereco) LIKE '%entrega%' AND LOWER(tipo_endereco) LIKE '%faturamento%' THEN 'cobranca/entrega/faturamento'
        ELSE LOWER(tipo_endereco)
    END AS tipo_endereco,
    data_processamento
FROM stage.compras3 AS c4;


-- inserir nas compras rejeitadas as compras que possuem tipo de enderenco inexistente 

INSERT INTO compras_rejeitadas (
    nome_fornecedor,
    cnpj_fornecedor,
    email_fornecedor,
    telefone_fornecedor,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    tipo_endereco,
    data_processamento,
    motivo
)
SELECT
    c4.nome_fornecedor,
    c4.cnpj_fornecedor,
    c4.email_fornecedor,
    c4.telefone_fornecedor,
    c4.numero_nf,
    c4.data_emissao,
    c4.valor_net,
    c4.valor_tributo,
    c4.valor_total,
    c4.nome_item,
    c4.qtd_item,
    c4.condicao_pagamento,
    c4.cep,
    c4.num_endereco,
    c4.complemento,
    c4.tipo_endereco,
    c4.data_processamento,
    'Tipo de endereço inválido' AS motivo
FROM stage.compras4 c4
LEFT JOIN projeto_financeiro.tipo_endereco te ON c4.tipo_endereco = te.DESCRICAO
WHERE te.DESCRICAO IS NULL;


-- pegar o ID_TIPO_ENDERECO na tabela projeto_financeiro.tipo_endereco


CREATE TEMPORARY TABLE compras5 AS
SELECT
    nome_fornecedor,
    cnpj_fornecedor,
    email_fornecedor,
    telefone_fornecedor,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    te.ID_TIPO_ENDERECO,
    tipo_endereco,
    data_processamento
FROM stage.compras4 c4
JOIN projeto_financeiro.tipo_endereco te ON c4.tipo_endereco = te.DESCRICAO;


-- Criação da Tabela Temporária compras6 com condição pagamento corrigido erros de digitação corrigidos


CREATE TEMPORARY TABLE compras6 AS
SELECT
    nome_fornecedor,
    cnpj_fornecedor,
    email_fornecedor,
    telefone_fornecedor,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
     qtd_item,
        CASE 
			WHEN condicao_pagamento LIKE '%a vista%' THEN 'A vista'
            WHEN condicao_pagamento LIKE '%trinta dias%' AND condicao_pagamento NOT LIKE '%entrada%' THEN '30 dias'
            WHEN condicao_pagamento = '60 dias' THEN '30/60 dias'
            WHEN condicao_pagamento = '90 dias' THEN '30/60/90 dias'
            WHEN condicao_pagamento LIKE '%entrada%'AND condicao_pagamento LIKE '%30%' AND condicao_pagamento LIKE '%dias%' AND condicao_pagamento NOT LIKE '%60%' AND condicao_pagamento NOT LIKE '%90%' THEN 'Entrada/30 dias'
            WHEN condicao_pagamento LIKE '%30%' AND condicao_pagamento LIKE '%dias%' AND condicao_pagamento NOT LIKE '%60%' AND condicao_pagamento NOT LIKE '%90%' AND condicao_pagamento NOT LIKE '%entrada%' THEN '30 dias'
            WHEN condicao_pagamento LIKE '%30%' AND condicao_pagamento LIKE '%dias%' AND condicao_pagamento NOT LIKE '%60%' AND condicao_pagamento NOT LIKE '%90%' AND condicao_pagamento LIKE '%entrada%' THEN 'Entrada/30 dias'
            WHEN condicao_pagamento LIKE '%30%' AND condicao_pagamento LIKE '%60%' AND condicao_pagamento LIKE '%dias%' AND condicao_pagamento NOT LIKE '%90%'AND condicao_pagamento NOT LIKE '%entrada%' THEN '30/60 dias'
            WHEN condicao_pagamento LIKE '%30%' AND condicao_pagamento LIKE '%60%' AND condicao_pagamento LIKE '%dias%' AND condicao_pagamento NOT LIKE '%90%' AND condicao_pagamento LIKE '%entrada%' THEN 'Entrada/30/60 dias'
            WHEN condicao_pagamento LIKE '%30%' AND condicao_pagamento LIKE '%60%' AND condicao_pagamento LIKE '%dias%' AND condicao_pagamento LIKE '%90%' AND condicao_pagamento NOT LIKE '%entrada%' THEN '30/60/90 dias'
            WHEN condicao_pagamento LIKE '%30%' AND condicao_pagamento LIKE '%60%' AND condicao_pagamento LIKE '%dias%' AND condicao_pagamento LIKE '%90%' AND condicao_pagamento LIKE '%entrada%' THEN 'Entrada/30/60/90 dias'
            WHEN condicao_pagamento = 'Entrada/trinta dias' THEN 'Entrada/30 dias'
            
            ELSE condicao_pagamento
        END AS condicao_pagamento,
        cep,
        num_endereco,
    complemento,
    ID_TIPO_ENDERECO,
    tipo_endereco,
    data_processamento
FROM stage.compras5;

-- inserir nas compras rejeitadas as compras que possuem condicao de pagamento inexistente

INSERT INTO compras_rejeitadas (
    nome_fornecedor,
    cnpj_fornecedor,
    email_fornecedor,
    telefone_fornecedor,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    tipo_endereco,
    data_processamento,
    motivo
)
SELECT
    c6.nome_fornecedor,
    c6.cnpj_fornecedor,
    c6.email_fornecedor,
    c6.telefone_fornecedor,
    c6.numero_nf,
    c6.data_emissao,
    c6.valor_net,
    c6.valor_tributo,
    c6.valor_total,
    c6.nome_item,
    c6.qtd_item,
    c6.condicao_pagamento,
    c6.cep,
    c6.num_endereco,
    c6.complemento,
    c6.tipo_endereco,
    c6.data_processamento,
    'Condicao de pagamento inexistente' AS motivo
FROM stage.compras6 c6
LEFT JOIN projeto_financeiro.condicao_pagamento cp ON c6.condicao_pagamento = cp.DESCRICAO
WHERE cp.DESCRICAO IS NULL;


-- Criação da Tabela Temporária compras7 para obter o ID_CONDICAO da condicao_pagamento


CREATE TEMPORARY TABLE compras7 AS
SELECT
    nome_fornecedor,
    cnpj_fornecedor,
    email_fornecedor,
    telefone_fornecedor,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    cp.ID_CONDICAO,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    ID_TIPO_ENDERECO,
    tipo_endereco,
    data_processamento
FROM stage.compras6 c6
JOIN projeto_financeiro.condicao_pagamento cp ON c6.condicao_pagamento = cp.DESCRICAO;


-- inserir nas compras rejeitadas as compras que o cep não é encontrado na tabela projeto_financeiro.cep

INSERT INTO compras_rejeitadas (
    nome_fornecedor,
    cnpj_fornecedor,
    email_fornecedor,
    telefone_fornecedor,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    tipo_endereco,
    data_processamento,
    motivo
)
SELECT
    c7.nome_fornecedor,
    c7.cnpj_fornecedor,
    c7.email_fornecedor,
    c7.telefone_fornecedor,
    c7.numero_nf,
    c7.data_emissao,
    c7.valor_net,
    c7.valor_tributo,
    c7.valor_total,
    c7.nome_item,
    c7.qtd_item,
    c7.condicao_pagamento,
    c7.cep,
    c7.num_endereco,
    c7.complemento,
    c7.tipo_endereco,
    c7.data_processamento,
    'CEP inexistente' AS motivo
FROM stage.compras7 c7
LEFT JOIN projeto_financeiro.cep tbl_cep ON c7.cep = tbl_cep.CEP
WHERE tbl_cep.CEP IS NULL;  



-- VERIFICANDO A CORRESPONDENCIA DO CEP  

CREATE TEMPORARY TABLE compras8 AS
SELECT
    nome_fornecedor,
    cnpj_fornecedor,
    email_fornecedor,
    telefone_fornecedor,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    ID_CONDICAO,
    condicao_pagamento,
    tb_cep.CEP,
    c7.cep as cep_compra,
    num_endereco,
    complemento,
    ID_TIPO_ENDERECO,
    tipo_endereco,
    data_processamento
FROM stage.compras7 c7
JOIN projeto_financeiro.cep tb_cep ON c7.cep = tb_cep.CEP;

-- inserindo os fornecedores/atualizando dados se forem alterados  
CALL stage.SP_INSERIR_FORNECEDORES();

-- OBTEM O ID_FORNECEDOR PARA INSERIR NA TB enderecos_fornecedores
CREATE TEMPORARY TABLE compras9 AS
SELECT
    f.ID_FORNECEDOR,
    f.nome_fornecedor,
    f.cnpj_fornecedor,
    f.email_fornecedor,
    f.telefone_fornecedor,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    ID_CONDICAO,
    CEP,
    num_endereco,
    complemento,
    ID_TIPO_ENDERECO,
    data_processamento
FROM stage.compras8 c8
JOIN projeto_financeiro.fornecedores f ON c8.cnpj_fornecedor = f.CNPJ_FORNECEDOR;


-- INSERIR na tb validacao_compras, as compras já processadas.
CALL stage.SP_INSERIR_COMPRAS_PROCESSADAS();

 -- INSERIR O ENDERECO DOS FORNECEDORES  NO BD projeto_financeiro
CALL stage.SP_INSERIR_ENDERECOS_FORNECEDORES();

-- INSERIR NOTAS FISCAIS DE ENTRADA NO BD projeto_financeiro
CALL stage.SP_INSERIR_NF_ENTRADA();

  END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TRATAMENTO_PAGAMENTOS
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRATAMENTO_PAGAMENTOS`()
BEGIN
-- TRATA VALORES NULLS E EM BRANCO e DUPLICADOS QUE PODE SER CARREGADOS DO CSV pagamentos
CREATE TEMPORARY TABLE pagamentos1 AS
    SELECT 
        COALESCE(NULLIF(id_nf_entrada, ''), 'N/D') id_nf_entrada,
        COALESCE(NULLIF(data_vencimento, ''), 'N/D') data_vencimento,
        COALESCE(NULLIF(data_pgt_efetuado, ''), 'N/D') data_pgt_efetuado,
        COALESCE(NULLIF(valor_parcela_pago, ''), 'N/D') valor_parcela_pago
    FROM (
        SELECT 
            id_nf_entrada,
            data_vencimento,
            data_pgt_efetuado,
            valor_parcela_pago,
            ROW_NUMBER() OVER (PARTITION BY id_nf_entrada ORDER BY data_vencimento) as row_num
        FROM stage.pagamentos
    ) AS numbered_rows
    WHERE row_num = 1;
    
-- INSERE EM PAGAMENTO REJEITADOS OS PAGAMENTOS QUE POSSUEM 'N/D' 

INSERT INTO stage.pagamentos_rejeitadas (
	    id_nf_entrada,
		data_vencimento, 
		data_pgt_efetuado, 
		valor_parcela_pago,
        motivo )
        SELECT 
        id_nf_entrada,
		data_vencimento,
		data_pgt_efetuado, 
		valor_parcela_pago,
        IF(id_nf_entrada = 'N/D', 'ID da nota fiscal inexistente',
			IF(data_vencimento = 'N/D', 'Data de vencimento da nota fiscal inexistente',
				IF(data_pgt_efetuado = 'N/D', 'Data de pagamento da nota fiscal inexistente',
					IF(valor_parcela_pago= 'N/D', 'Valor pago da nota fiscal inexistente', 'Motivo não encontrado'))))
                    AS motivo
			FROM stage.pagamentos1 
                    WHERE id_nf_entrada = 'N/D'
					   OR data_vencimento = 'N/D' 
                       OR data_pgt_efetuado = 'N/D' 
                       OR valor_parcela_pago = 'N/D';
	
-- REMOVE OS PAGAMENTOS QUE CONTEM VALORES N/D

CREATE TEMPORARY TABLE pagamentos2 AS 
	SELECT
		id_nf_entrada,
		data_vencimento,
		data_pgt_efetuado, 
		valor_parcela_pago
	FROM (
		SELECT 
        id_nf_entrada,
		data_vencimento,
		data_pgt_efetuado, 
		valor_parcela_pago
        FROM stage.pagamentos1 WHERE 
        id_nf_entrada != 'N/D' AND data_vencimento != 'N/D' AND data_pgt_efetuado != 'N/D' AND valor_parcela_pago != 'N/D') AS p2;


-- VERIFICA SE O ID da NF de entrada do csv pagamento existe na tb programacao_pagamento

CREATE TEMPORARY TABLE pagamentos3 AS 
	SELECT
		id_nf_entrada,
		data_vencimento,
		data_pgt_efetuado, 
		valor_parcela_pago
	FROM stage.pagamentos2 p2
    WHERE EXISTS (
    SELECT 1
    FROM projeto_financeiro.programacao_pagamento pp 
		WHERE pp.ID_NF_ENTRADA = p2.id_nf_entrada);
        

-- INSERE EM PAGAMENTO REJEITADOS OS PAGAMENTOS QUE id_nf_entrada NAO FOI ENCONTRADO NA TB programacao_pagamento

INSERT INTO stage.pagamentos_rejeitadas (
	    id_nf_entrada,
		data_vencimento,
		data_pgt_efetuado, 
		valor_parcela_pago,
        motivo )
        SELECT 
        id_nf_entrada,
		data_vencimento,
		data_pgt_efetuado, 
		valor_parcela_pago,
        'ID de nota fiscal invalido, não foi encontrado programação de pagamento para esta nota fiscal' AS motivo
        FROM stage.pagamentos2 p2
		 WHERE NOT EXISTS (
			SELECT 1
			FROM projeto_financeiro.programacao_pagamento pp 
		    WHERE pp.ID_NF_ENTRADA = p2.id_nf_entrada);


-- Verifica se a data de vencimento da tb pagamentos é igual a data de vencimento que esta na programacao de pagamento
CREATE TEMPORARY TABLE pagamentos4 AS 
	SELECT
        p3.id_nf_entrada,
		data_vencimento,
		data_pgt_efetuado, 
        pp.ID_PROGRAMACAO_PAGAMENTO,
        valor_parcela_pago
	FROM stage.pagamentos3 p3
	JOIN projeto_financeiro.programacao_pagamento pp ON pp.ID_NF_ENTRADA =p3.id_nf_entrada
    WHERE p3.data_vencimento = pp.DATA_VENCIMENTO_PROG_PAGAMENTO;

-- INSERE EM PAGAMENTO REJEITADOS OS PAGAMENTOS QUE A DATA DE VENCIMENTO ESTA DIFERENTE DA PROGRAMACAO DE PAGAMENTO

INSERT INTO stage.pagamentos_rejeitadas (
	    id_nf_entrada,
		data_vencimento,
		data_pgt_efetuado, 
		valor_parcela_pago,
        motivo )
        SELECT 
        p3.id_nf_entrada,
		data_vencimento,
		data_pgt_efetuado, 
		valor_parcela_pago,
        'Data de vencimento divergente da programação de pagamento' AS motivo
        FROM stage.pagamentos3 p3
		LEFT JOIN projeto_financeiro.programacao_pagamento pp ON pp.ID_NF_ENTRADA = p3.id_nf_entrada
		AND pp.DATA_VENCIMENTO_PROG_PAGAMENTO = p3.data_vencimento
		WHERE pp.ID_PROGRAMACAO_PAGAMENTO IS NULL;

-- OBTEM DADOS VALOR_PARCELA_PROG_PAGAMENTO

CREATE TEMPORARY TABLE pagamentos5 AS
	SELECT 
		p4.id_nf_entrada,
        p4.ID_PROGRAMACAO_PAGAMENTO,
		data_vencimento AS DATA_VENCIMENTO_PROG_PAGAMENTO,
		data_pgt_efetuado, 
		valor_parcela_pago,
        pp.VALOR_PARCELA_PROG_PAGAMENTO
    FROM stage.pagamentos4 p4
    JOIN projeto_financeiro.programacao_pagamento pp ON p4.ID_PROGRAMACAO_PAGAMENTO = pp.ID_PROGRAMACAO_PAGAMENTO;


-- INSERE OS DADOS TRATADOS NA tb historico_pagamento 
CALL stage.SP_INSERIR_HISTORICO_PAGAMENTO();
-- Atualiza os status da prog de pagamento
CALL projeto_financeiro.SP_ATUALIZAR_STATUS_PROG_PAGAMENTO();
   
   END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TRATAMENTO_RECEBIMENTOS
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRATAMENTO_RECEBIMENTOS`()
BEGIN

-- TRATA VALORES NULLS E EM BRANCO e DUPLICADOS QUE PODE SER CARREGADOS DO CSV recebimentos
CREATE TEMPORARY TABLE recebimentos1 AS
    SELECT 
        COALESCE(NULLIF(numero_nf, ''), 'N/D') numero_nf,
        COALESCE(NULLIF(valor_recebido, ''), 'N/D') valor_recebido,
        COALESCE(NULLIF(data_vencimento, ''), 'N/D') data_vencimento,
        COALESCE(NULLIF(data_recebimento, ''), 'N/D') data_recebimento,
        COALESCE(NULLIF(data_processamento, ''), 'N/D') data_processamento
    FROM (
        SELECT
			numero_nf,
            valor_recebido,
            data_vencimento,
            data_recebimento,
		    data_processamento,
            ROW_NUMBER() OVER (PARTITION BY numero_nf ORDER BY data_vencimento) as row_num
        FROM stage.recebimentos
    ) AS numbered_rows
    WHERE row_num = 1;


-- INSERE EM RECEBIMENTO REJEITADOS OS RECEBIMENTOS QUE POSSUEM 'N/D' 

INSERT INTO stage.recebimento_rejeitados (
	    numero_nf,
		valor_recebido,
		data_vencimento,
		data_recebimento,
		data_processamento,
        motivo )
        SELECT 
        numero_nf,
		valor_recebido,
        data_vencimento,
		data_recebimento,
		data_processamento,
        IF(numero_nf = 'N/D', 'Numero da nota fiscal inexistente',
			IF(valor_recebido = 'N/D', 'Valor recebido inexistente',
				IF(data_vencimento = 'N/D', 'Data de vencimento da programacao de recebimento inexistente',
					IF(data_recebimento = 'N/D', 'Data de recebimento inexistente',
						IF(data_processamento = 'N/D', 'Data de processamento inexistente',
                    'Motivo não encontrado')))))
                    AS motivo
			FROM stage.recebimentos1
                    WHERE numero_nf = 'N/D'
                       OR valor_recebido = 'N/D' 
					   OR data_vencimento = 'N/D' 
                       OR data_recebimento = 'N/D' 
                       OR data_processamento = 'N/D';
	
-- REMOVE OS RECEBIMENTOS QUE CONTEM VALORES N/D

CREATE TEMPORARY TABLE recebimentos2 AS 
	SELECT
		numero_nf,
		valor_recebido,
		data_vencimento,
		data_recebimento,
		data_processamento
	FROM (
		SELECT 
        numero_nf,
		valor_recebido,
		data_vencimento,
		data_recebimento,
		data_processamento
        FROM stage.recebimentos1 WHERE 
        numero_nf != 'N/D' AND valor_recebido != 'N/D' AND data_vencimento != 'N/D' AND data_recebimento != 'N/D' AND data_processamento != 'N/D') AS r2;


-- VERIFICA SE O numero_nf da nf de saida do csv recebimento existe na tb notas_fiscais_saida

CREATE TEMPORARY TABLE recebimentos3 AS 
	SELECT
        nfs.ID_NF_SAIDA,
		numero_nf,
		valor_recebido,
		data_vencimento,
		data_recebimento,
		data_processamento
	FROM stage.recebimentos2 r2
    JOIN projeto_financeiro.notas_fiscais_saida nfs ON nfs.NUMERO_NF_SAIDA = r2.numero_nf
    WHERE EXISTS (
    SELECT 1
    FROM projeto_financeiro.notas_fiscais_saida nfs
		WHERE nfs.NUMERO_NF_SAIDA = r2.numero_nf);
        
        
-- INSERE EM RECEBIMENTOS REJEITADOS OS RECEBIMENTOS QUE O NUMERO DA NF NAO FOI ENCONTRADO

INSERT INTO stage.recebimento_rejeitados (
		numero_nf,
		valor_recebido,
		data_vencimento,
		data_recebimento,
		data_processamento,
        motivo )
        SELECT
        numero_nf,
		valor_recebido,
		data_vencimento,
		data_recebimento,
		data_processamento,
        'Numero de nota fiscal invalido, não foi encontrado nota fiscal de saida' AS motivo
		FROM stage.recebimentos2 r2
		WHERE NOT EXISTS (
		SELECT 1
		FROM projeto_financeiro.notas_fiscais_saida nfs
			WHERE nfs.NUMERO_NF_SAIDA = r2.numero_nf);

        
-- VERIFICA SE O id_nf_saida existe na tb programacao_recebimento
 CREATE TEMPORARY TABLE recebimentos4 AS 
	SELECT
		r3.ID_NF_SAIDA,
		numero_nf,
		valor_recebido,
		data_vencimento,
		data_recebimento,
		data_processamento
	FROM stage.recebimentos3 r3
    WHERE EXISTS (
    SELECT 1
    FROM projeto_financeiro.programacao_recebimento pr
		WHERE pr.ID_NF_SAIDA = r3.ID_NF_SAIDA);


-- INSERE EM RECEBIMENTOS REJEITADOS OS RECEBIMENTOS QUE id_nf_SAIDA NAO FOI ENCONTRADO NA TB programacao_recebimento

INSERT INTO stage.recebimento_rejeitados (
		numero_nf,
		valor_recebido,
		data_vencimento,
		data_recebimento,
		data_processamento,
        motivo )
        SELECT
        numero_nf,
		valor_recebido,
		data_vencimento,
		data_recebimento,
		data_processamento,
        'ID de nota fiscal invalido, não foi encontrado programação de recebimento para esta nota fiscal' AS motivo
        FROM stage.recebimentos4 r4
		 WHERE NOT EXISTS (
			SELECT 1
			FROM projeto_financeiro.programacao_recebimento pr 
		    WHERE pr.ID_NF_SAIDA = r4.ID_NF_SAIDA);


-- Verifica se a data de vencimento da tb recebimentos é igual a data de vencimento que esta na programacao de recebimento

CREATE TEMPORARY TABLE recebimentos5 AS 
	SELECT
		r4.ID_NF_SAIDA,
        pr.ID_PROGRAMACAO_RECEBIMENTO,
		numero_nf,
		valor_recebido,
		data_vencimento,
		data_recebimento,
		data_processamento
	FROM stage.recebimentos4 r4
	JOIN projeto_financeiro.programacao_recebimento pr ON pr.ID_NF_SAIDA =r4.ID_NF_SAIDA 
    AND r4.data_vencimento = pr.DATA_VENCIMENTO_PROG_RECEBIMENTO;


-- INSERE EM RECEBIMENTOS REJEITADOS OS RECEBIMENTOS QUE A DATA DE VENCIMENTO ESTÁ DIFERENTE DA PROGRAMAÇÃO DE RECEBIMENTOS

INSERT INTO stage.recebimento_rejeitados (
    numero_nf,
    valor_recebido,
    data_vencimento,
    data_recebimento,
    data_processamento,
    motivo
)
SELECT 
    r4.numero_nf,
    r4.valor_recebido,
    r4.data_vencimento,
    r4.data_recebimento,
    r4.data_processamento,
    'Data de vencimento divergente da programação de recebimento' AS motivo
FROM stage.recebimentos4 r4
LEFT JOIN projeto_financeiro.programacao_recebimento pr ON pr.ID_NF_SAIDA = r4.ID_NF_SAIDA
AND pr.DATA_VENCIMENTO_PROG_RECEBIMENTO = r4.data_vencimento
WHERE pr.ID_PROGRAMACAO_RECEBIMENTO IS NULL;


-- PEGA O VALOR DA PARCELA NA PROGRAMACAO DE RECEBIMENTO
CREATE TEMPORARY TABLE recebimentos6 AS
	SELECT
	    r5.ID_NF_SAIDA,
        r5.ID_PROGRAMACAO_RECEBIMENTO,
		numero_nf,
		valor_recebido,
        pr.VALOR_PARCELA_PROG_RECEBIMENTO,
		data_vencimento,
		data_recebimento,
		data_processamento
 	FROM stage.recebimentos5 r5
	JOIN projeto_financeiro.programacao_recebimento pr ON pr.ID_PROGRAMACAO_RECEBIMENTO = r5.ID_PROGRAMACAO_RECEBIMENTO;


-- CALCULANDO A DIFERENÇA DE VALOR, DE DATA E IDENTIFICANDO SE HÁ DESCONTO OU NÃO
CREATE TEMPORARY TABLE recebimentos7 AS
	SELECT
        ID_PROGRAMACAO_RECEBIMENTO,
        data_recebimento,
        valor_recebido,
        VALOR_PARCELA_PROG_RECEBIMENTO,
		TRUNCATE(ABS((r6.valor_recebido - r6.VALOR_PARCELA_PROG_RECEBIMENTO)),2) AS diferenca_valor,
        CASE 
			WHEN (DATEDIFF(r6.data_recebimento,r6.data_vencimento)) < 0 THEN 1
            ELSE 0
		END AS tipo,
        ABS(DATEDIFF(r6.data_vencimento,r6.data_recebimento)) AS diferenca_dias,
        TRUNCATE(ABS(((r6.valor_recebido - r6.VALOR_PARCELA_PROG_RECEBIMENTO) * 100) / r6.VALOR_PARCELA_PROG_RECEBIMENTO),2) as porcentagem
FROM stage.recebimentos6 r6;


-- CORRIGE A DIFERENÇA DE DIAS MAIOR QUE 11 PARA SE ENQUADRAR NO RANGE
CREATE TEMPORARY TABLE recebimentos8 AS
SELECT
	r7.ID_PROGRAMACAO_RECEBIMENTO,
    r7.data_recebimento,
	r7.valor_recebido,
	r7.VALOR_PARCELA_PROG_RECEBIMENTO,
	r7.diferenca_valor,
    r7.tipo,
    CASE 
        WHEN r7.diferenca_dias > 11 THEN 11
        ELSE r7.diferenca_dias
    END as diferenca_dias,
    r7.porcentagem
FROM stage.recebimentos7 r7;

-- COLOCAR OS VALORES DE diferenca_dias,porcentagem como -1 para entrar no range do desconto invalido
CREATE TEMPORARY TABLE recebimentos9 AS
SELECT
    r8.ID_PROGRAMACAO_RECEBIMENTO,
    r8.data_recebimento,
    r8.valor_recebido,
    r8.VALOR_PARCELA_PROG_RECEBIMENTO,
    CASE WHEN tp.ID_DESCONTO IS NULL THEN -1 ELSE r8.diferenca_dias END AS diferenca_dias,
    CASE WHEN tp.ID_DESCONTO IS NULL THEN -1 ELSE r8.porcentagem END AS porcentagem,
    r8.tipo
FROM stage.recebimentos8 r8
LEFT JOIN projeto_financeiro.tipo_desconto tp ON r8.diferenca_dias BETWEEN tp.MINIMO_DIAS AND tp.MAXIMO_DIAS
                                              AND r8.porcentagem BETWEEN tp.MINIMO_PORCENTO AND tp.MAXIMO_PORCENTO
                                              AND tp.TIPO_DESCONTO = r8.tipo;

-- OBTER O ID_DESCONTO dos recebimentos 
CREATE TEMPORARY TABLE recebimentos10 AS
SELECT
    r9.ID_PROGRAMACAO_RECEBIMENTO,
    tp.ID_DESCONTO,
    r9.data_recebimento,
    r9.valor_recebido,
    r9.VALOR_PARCELA_PROG_RECEBIMENTO,
    r9.diferenca_dias,
    r9.porcentagem
FROM stage.recebimentos9 r9
JOIN projeto_financeiro.tipo_desconto tp ON r9.diferenca_dias BETWEEN tp.MINIMO_DIAS AND tp.MAXIMO_DIAS
                                              AND r9.porcentagem BETWEEN tp.MINIMO_PORCENTO AND tp.MAXIMO_PORCENTO
                                              AND tp.TIPO_DESCONTO = r9.tipo;

 -- INSERE OS RECEBIMENTOS CORRETOS na tb historico_recebimento
CALL stage.SP_INSERIR_HIST_RECEBIMENTO();
 -- INSERE OS RECEBIMENTOS com tipo de desconto invalido na tb historico_recebimento_divergente
CALL stage.SP_INSERIR_HIST_RECEBIMENTO_DIVERGENTE();
-- Atuliza o status da prog de recebimento de acordo com o hist de recebimento
CALL projeto_financeiro.SP_ATUALIZAR_STATUS_PROG_RECEBIMENTO();


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TRATAMENTO_VENDAS
-- -----------------------------------------------------

DELIMITER $$
USE `stage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRATAMENTO_VENDAS`()
BEGIN 

INSERT INTO stage.vendas_rejeitadas (
    nome_cliente,
    cnpj_cliente,
    email_cliente,
    telefone_cliente,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    tipo_endereco,
    data_processamento,
    motivo
)
SELECT
    nome_cliente,
    cnpj_cliente,
    email_cliente,
    telefone_cliente,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    tipo_endereco,
    CURDATE() AS data_processamento,
    'NF já processada' AS motivo
FROM stage.vendas
WHERE EXISTS (
    SELECT 1
    FROM validacao_vendas vv
    WHERE vv.numero_nf = vendas.numero_nf
);


-- Criação da Tabela Temporária vendas1 com validaçao de duplicidade já processadas(estão sendo inseridas em vendas rejeitadas)
-- aqui do jeito que esta ele esta validando somente pela numero_nf diferente de compras que valida pelo cnpj tambem
CREATE TEMPORARY TABLE vendas1 AS
SELECT
    nome_cliente,
    cnpj_cliente,
    email_cliente,
    telefone_cliente,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    tipo_endereco,
    CURDATE() AS data_processamento
FROM (
    SELECT
        nome_cliente,
        cnpj_cliente,
        email_cliente,
        telefone_cliente,
        numero_nf,
        data_emissao,
        valor_net,
        valor_tributo,
        valor_total,
        nome_item,
        qtd_item,
        condicao_pagamento,
        cep,
        num_endereco,
        complemento,
        tipo_endereco,
        data_processamento,
        ROW_NUMBER() OVER (PARTITION BY numero_nf ORDER BY data_processamento DESC) as row_num
    FROM vendas v
    WHERE NOT EXISTS (
        SELECT 1
        FROM validacao_vendas vv
        WHERE vv.numero_nf = v.numero_nf
    )
) AS v1
WHERE v1.row_num = 1;


-- Criação da Tabela Temporária vendas2 com validaçao de duplicidade e valores nulos

CREATE TEMPORARY TABLE vendas2 AS
SELECT
    COALESCE(NULLIF(nome_cliente, ''), 'N/D') AS nome_cliente,
   CASE 
        WHEN LENGTH(NULLIF(cnpj_cliente, '')) >= 14 THEN NULLIF(cnpj_cliente, '')
        ELSE 'N/D'
    END AS cnpj_cliente,
    COALESCE(NULLIF(email_cliente, ''), 'N/D') AS email_cliente,
    COALESCE(NULLIF(telefone_cliente, ''), 'N/D') AS telefone_cliente,
    COALESCE(NULLIF(numero_nf, ''), 'N/D') AS numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    COALESCE(NULLIF(nome_item, ''), 'N/D') AS nome_item,
    qtd_item,
    COALESCE(NULLIF(condicao_pagamento, ''), 'N/D') AS condicao_pagamento,
    COALESCE(NULLIF(cep, ''), 'N/D') AS cep,
    COALESCE(NULLIF(num_endereco, ''), 'N/D') AS num_endereco,
    COALESCE(NULLIF(complemento, ''), 'N/D') AS complemento,
    COALESCE(NULLIF(tipo_endereco, ''), 'N/D') AS tipo_endereco,
    data_processamento
FROM vendas1 v;


-- Inserindo as vendas que tem o campo 'N/D'

INSERT INTO vendas_rejeitadas (nome_cliente, cnpj_cliente, email_cliente, telefone_cliente, numero_nf, data_emissao, valor_net, valor_tributo, valor_total, nome_item, qtd_item, condicao_pagamento, cep, num_endereco, complemento, tipo_endereco, data_processamento, motivo)
SELECT
    nome_cliente,
    cnpj_cliente,
    email_cliente,
    telefone_cliente,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    tipo_endereco,
    data_processamento,
    IF(cnpj_cliente = 'N/D', 'CNPJ inválido', 
        IF(cep = 'N/D', 'CEP inválido', 
            IF(numero_nf = 'N/D', 'Número de nota fiscal inválido', NULL)
        )
    ) AS motivo
FROM vendas2
WHERE cnpj_cliente = 'N/D' OR cep = 'N/D' OR numero_nf = 'N/D';


-- criando a tabela temporaria de vendas sem os cnpj, cep, nf com 'N/D'


CREATE TEMPORARY TABLE vendas3 AS 
SELECT
    nome_cliente,
    cnpj_cliente,
    email_cliente,
    telefone_cliente,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    tipo_endereco,
    data_processamento
FROM (
    SELECT
        nome_cliente,
        cnpj_cliente,
        email_cliente,
        telefone_cliente,
        numero_nf,
        data_emissao,
        valor_net,
        valor_tributo,
        valor_total,
        nome_item,
        qtd_item,
        condicao_pagamento,
        cep,
        num_endereco,
        complemento,
        tipo_endereco,
        data_processamento
    FROM vendas2 v
    WHERE numero_nf != 'N/D' AND cnpj_cliente != 'N/D' AND cep != 'N/D'
) AS v3;


-- tratar o tipo de endereço das vendas

CREATE TEMPORARY TABLE vendas4 AS
SELECT
    nome_cliente,
    cnpj_cliente,
    email_cliente,
    telefone_cliente,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
	qtd_item,
	condicao_pagamento,
	cep,
	num_endereco,
    complemento,
     CASE 
        WHEN LOWER(tipo_endereco) LIKE '%cobranca%' AND LOWER(tipo_endereco) LIKE '%entrega%' AND LOWER(tipo_endereco)  NOT LIKE '%faturamento%'  THEN 'cobranca/entrega'
        WHEN LOWER(tipo_endereco) LIKE '%cobranca%' AND LOWER(tipo_endereco) LIKE '%faturamento%' AND LOWER(tipo_endereco) NOT LIKE '%entrega%' THEN 'cobranca/faturamento'
        WHEN LOWER(tipo_endereco) LIKE '%entrega%' AND LOWER(tipo_endereco) LIKE '%faturamento%' AND LOWER(tipo_endereco) NOT LIKE '%cobranca%' THEN 'entrega/faturamento'
        WHEN LOWER(tipo_endereco) LIKE '%cobranca%' AND LOWER(tipo_endereco) LIKE '%entrega%' AND LOWER(tipo_endereco) LIKE '%faturamento%' THEN 'cobranca/entrega/faturamento'
        ELSE LOWER(tipo_endereco)
    END AS tipo_endereco,
    data_processamento
FROM vendas3 AS v4;


-- inserir nas vendas rejeitadas as compras que possuem tipo de enderenco inexistente 

INSERT INTO vendas_rejeitadas (
    nome_cliente,
    cnpj_cliente,
    email_cliente,
    telefone_cliente,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    tipo_endereco,
    data_processamento,
    motivo
)
SELECT
    v4.nome_cliente,
    v4.cnpj_cliente,
    v4.email_cliente,
    v4.telefone_cliente,
    v4.numero_nf,
    v4.data_emissao,
    v4.valor_net,
    v4.valor_tributo,
    v4.valor_total,
    v4.nome_item,
    v4.qtd_item,
    v4.condicao_pagamento,
    v4.cep,
    v4.num_endereco,
    v4.complemento,
    v4.tipo_endereco,
    v4.data_processamento,
    'Tipo de endereço inválido' AS motivo
FROM vendas4 v4
LEFT JOIN projeto_financeiro.tipo_endereco te ON v4.tipo_endereco = te.DESCRICAO
WHERE te.DESCRICAO IS NULL;



-- pegar o ID_TIPO_ENDERECO na tabela projeto_financeiro.tipo_endereco

CREATE TEMPORARY TABLE vendas5 AS
SELECT
    nome_cliente,
    cnpj_cliente,
    email_cliente,
    telefone_cliente,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    te.ID_TIPO_ENDERECO,
    tipo_endereco,
    data_processamento
FROM vendas4 v4
JOIN projeto_financeiro.tipo_endereco te ON v4.tipo_endereco = te.DESCRICAO;


-- Criação da Tabela Temporária vendas6 com condição pagamento corrigido erros de digitação corrigidos

CREATE TEMPORARY TABLE vendas6 AS
SELECT
    nome_cliente,
    cnpj_cliente,
    email_cliente,
    telefone_cliente,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    CASE 
        WHEN condicao_pagamento LIKE '%a vista%' THEN 'A vista'
        WHEN condicao_pagamento LIKE '%trinta dias%' AND condicao_pagamento NOT LIKE '%entrada%' THEN '30 dias'
        WHEN condicao_pagamento = '60 dias' THEN '30/60 dias'
        WHEN condicao_pagamento = '90 dias' THEN '30/60/90 dias'
        WHEN condicao_pagamento LIKE '%entrada%' AND condicao_pagamento LIKE '%30%' AND condicao_pagamento LIKE '%dias%' AND condicao_pagamento NOT LIKE '%60%' AND condicao_pagamento NOT LIKE '%90%' THEN 'Entrada/30 dias'
        WHEN condicao_pagamento LIKE '%30%' AND condicao_pagamento LIKE '%dias%' AND condicao_pagamento NOT LIKE '%60%' AND condicao_pagamento NOT LIKE '%90%' AND condicao_pagamento NOT LIKE '%entrada%' THEN '30 dias'
        WHEN condicao_pagamento LIKE '%30%' AND condicao_pagamento LIKE '%dias%' AND condicao_pagamento NOT LIKE '%60%' AND condicao_pagamento NOT LIKE '%90%' AND condicao_pagamento LIKE '%entrada%' THEN 'Entrada/30 dias'
        WHEN condicao_pagamento LIKE '%30%' AND condicao_pagamento LIKE '%60%' AND condicao_pagamento LIKE '%dias%' AND condicao_pagamento NOT LIKE '%90%' AND condicao_pagamento NOT LIKE '%entrada%' THEN '30/60 dias'
        WHEN condicao_pagamento LIKE '%30%' AND condicao_pagamento LIKE '%60%' AND condicao_pagamento LIKE '%dias%' AND condicao_pagamento NOT LIKE '%90%' AND condicao_pagamento LIKE '%entrada%' THEN 'Entrada/30/60 dias'
        WHEN condicao_pagamento LIKE '%30%' AND condicao_pagamento LIKE '%60%' AND condicao_pagamento LIKE '%dias%' AND condicao_pagamento LIKE '%90%' AND condicao_pagamento NOT LIKE '%entrada%' THEN '30/60/90 dias'
        WHEN condicao_pagamento LIKE '%30%' AND condicao_pagamento LIKE '%60%' AND condicao_pagamento LIKE '%dias%' AND condicao_pagamento LIKE '%90%' AND condicao_pagamento LIKE '%entrada%' THEN 'Entrada/30/60/90 dias'
        WHEN condicao_pagamento = 'Entrada/trinta dias' THEN 'Entrada/30 dias'
        ELSE condicao_pagamento
    END AS condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    ID_TIPO_ENDERECO,
    tipo_endereco,
    data_processamento
FROM vendas5;



-- inserir nas vendas_rejeitadas as vendas que possuem condicao de pagamento inexistente

INSERT INTO vendas_rejeitadas (
    nome_cliente,
    cnpj_cliente,
    email_cliente,
    telefone_cliente,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    tipo_endereco,
    data_processamento,
    motivo
)
SELECT
    v6.nome_cliente,
    v6.cnpj_cliente,
    v6.email_cliente,
    v6.telefone_cliente,
    v6.numero_nf,
    v6.data_emissao,
    v6.valor_net,
    v6.valor_tributo,
    v6.valor_total,
    v6.nome_item,
    v6.qtd_item,
    v6.condicao_pagamento,
    v6.cep,
    v6.num_endereco,
    v6.complemento,
    v6.tipo_endereco,
    v6.data_processamento,
    'Condicao de pagamento inexistente' AS motivo
FROM vendas6 v6
LEFT JOIN projeto_financeiro.condicao_pagamento cp ON v6.condicao_pagamento = cp.DESCRICAO
WHERE cp.DESCRICAO IS NULL;



-- Criação da Tabela Temporária vendas7 para obter o ID_CONDICAO da condicao_pagamento


CREATE TEMPORARY TABLE vendas7 AS
SELECT
    nome_cliente,
    cnpj_cliente,
    email_cliente,
    telefone_cliente,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    cp.ID_CONDICAO,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    ID_TIPO_ENDERECO,
    tipo_endereco,
    data_processamento
FROM vendas6 v6
JOIN projeto_financeiro.condicao_pagamento cp ON v6.condicao_pagamento = cp.DESCRICAO;


-- inserir nas vendas_rejeitadas as vendas que o cep não é encontrado na tabela projeto_financeiro.cep

INSERT INTO stage.vendas_rejeitadas (
    nome_cliente,
    cnpj_cliente,
    email_cliente,
    telefone_cliente,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    condicao_pagamento,
    cep,
    num_endereco,
    complemento,
    tipo_endereco,
    data_processamento,
    motivo
)
SELECT
    v7.nome_cliente,
    v7.cnpj_cliente,
    v7.email_cliente,
    v7.telefone_cliente,
    v7.numero_nf,
    v7.data_emissao,
    v7.valor_net,
    v7.valor_tributo,
    v7.valor_total,
    v7.nome_item,
    v7.qtd_item,
    v7.condicao_pagamento,
    v7.cep,
    v7.num_endereco,
    v7.complemento,
    v7.tipo_endereco,
    v7.data_processamento,
    'CEP inexistente' AS motivo
FROM vendas7 v7
LEFT JOIN projeto_financeiro.cep tbl_cep ON v7.cep = tbl_cep.CEP
WHERE tbl_cep.CEP IS NULL;
 

--  inserir na vendas7 somente as vendas que o cep existe na tabela projeto_financeiro.cep 

CREATE TEMPORARY TABLE vendas8 AS
SELECT
    nome_cliente,
    cnpj_cliente,
    email_cliente,
    telefone_cliente,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    ID_CONDICAO,
    condicao_pagamento,
    tb_cep.CEP,
    v7.cep as cep_venda,
    num_endereco,
    complemento,
    ID_TIPO_ENDERECO,
    tipo_endereco,
    data_processamento
FROM vendas7 v7
JOIN projeto_financeiro.cep tb_cep ON v7.cep = tb_cep.CEP;


-- INSERIR OS CLIENTES NO db projeto_financeiro
CALL stage.SP_INSERIR_CLIENTES();

-- PEGAR ID DO CLIENTE
CREATE TEMPORARY TABLE vendas9 AS
SELECT
    c.ID_CLIENTE,
    c.nome_cliente,
    c.cnpj_cliente,
    c.email_cliente,
    c.telefone_cliente,
    numero_nf,
    data_emissao,
    valor_net,
    valor_tributo,
    valor_total,
    nome_item,
    qtd_item,
    ID_CONDICAO,
    CEP,
    num_endereco,
    complemento,
    ID_TIPO_ENDERECO,
    data_processamento
FROM vendas8 c8
JOIN projeto_financeiro.clientes c ON c8.cnpj_cliente = c.CNPJ_CLIENTE;


-- INSERIR O ENDERECO DOS CLIENTES no db projeto_financeiro
CALL stage.SP_INSERIR_ENDERECOS_CLIENTES();
-- INSERIR NOTAS FISCAIS DE SAIDA no db projeto_financeiro
CALL stage.SP_INSERIR_NF_SAIDA();
-- inserir as vendas processadas no db
CALL stage.SP_INSERIR_VENDAS_PROCESSADAS();

END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;