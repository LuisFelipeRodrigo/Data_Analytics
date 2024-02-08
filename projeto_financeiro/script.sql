CREATE SCHEMA IF NOT EXISTS `projeto_financeiro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `projeto_financeiro` ;

- Table `projeto_financeiro`.`cep`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_financeiro`.`cep` (
  `CEP` INT NOT NULL,
  `BAIRRO` VARCHAR(255) NOT NULL,
  `CIDADE` VARCHAR(255) NOT NULL,
  `LOGRADOURO` VARCHAR(255) NOT NULL,
  `UF` CHAR(2) NOT NULL,
  PRIMARY KEY (`CEP`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projeto_financeiro`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_financeiro`.`clientes` (
  `ID_CLIENTE` INT NOT NULL AUTO_INCREMENT,
  `CNPJ_CLIENTE` BIGINT NOT NULL,
  `EMAIL_CLIENTE` VARCHAR(100) NOT NULL,
  `NOME_CLIENTE` VARCHAR(100) NOT NULL,
  `TELEFONE_CLIENTE` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`ID_CLIENTE`),
  UNIQUE INDEX `CNPJ_CLIENTE_UNIQUE` (`CNPJ_CLIENTE` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projeto_financeiro`.`condicao_pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_financeiro`.`condicao_pagamento` (
  `ID_CONDICAO` INT NOT NULL,
  `DESCRICAO` TEXT NOT NULL,
  `QUANTIDADE_PARCELA` SMALLINT NOT NULL,
  `ENTRADA` TINYINT NOT NULL,
  PRIMARY KEY (`ID_CONDICAO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projeto_financeiro`.`tipo_endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_financeiro`.`tipo_endereco` (
  `ID_TIPO_ENDERECO` INT NOT NULL,
  `DESCRICAO` TEXT NOT NULL,
  `SIGLA` CHAR(15) NOT NULL,
  PRIMARY KEY (`ID_TIPO_ENDERECO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projeto_financeiro`.`enderecos_clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_financeiro`.`enderecos_clientes` (
  `ID_ENDERECO_CLIENTE` INT NOT NULL AUTO_INCREMENT,
  `ID_TIPO_ENDERECO` INT NOT NULL,
  `ID_CLIENTE` INT NOT NULL,
  `CEP` INT NOT NULL,
  `COMPLEMENTO_CLIENTE` VARCHAR(120) NULL DEFAULT NULL,
  `NUMERO_CLIENTE` CHAR(10) NOT NULL,
  PRIMARY KEY (`ID_ENDERECO_CLIENTE`),
  INDEX `FK_ENDERECO_CLIENTES__CLIENTES` (`ID_CLIENTE` ASC) VISIBLE,
  INDEX `FK_ENDERECO_ENDERECOS_CEP` (`CEP` ASC) VISIBLE,
  INDEX `FK_ENDERECO_TIPO_ENDE_TIPO_END` (`ID_TIPO_ENDERECO` ASC) VISIBLE,
  CONSTRAINT `FK_ENDERECO_CLIENTES__CLIENTES`
    FOREIGN KEY (`ID_CLIENTE`)
    REFERENCES `projeto_financeiro`.`clientes` (`ID_CLIENTE`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `FK_ENDERECO_ENDERECOS_CEP`
    FOREIGN KEY (`CEP`)
    REFERENCES `projeto_financeiro`.`cep` (`CEP`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `FK_ENDERECO_TIPO_ENDE_TIPO_END`
    FOREIGN KEY (`ID_TIPO_ENDERECO`)
    REFERENCES `projeto_financeiro`.`tipo_endereco` (`ID_TIPO_ENDERECO`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projeto_financeiro`.`fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_financeiro`.`fornecedores` (
  `ID_FORNECEDOR` INT NOT NULL AUTO_INCREMENT,
  `CNPJ_FORNECEDOR` BIGINT NOT NULL,
  `EMAIL_FORNECEDOR` VARCHAR(100) NOT NULL,
  `NOME_FORNECEDOR` VARCHAR(100) NOT NULL,
  `TELEFONE_FORNECEDOR` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`ID_FORNECEDOR`),
  UNIQUE INDEX `CNPJ_FORNECEDOR_UNIQUE` (`CNPJ_FORNECEDOR` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projeto_financeiro`.`enderecos_fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_financeiro`.`enderecos_fornecedores` (
  `ID_ENDERECO_FORNECEDOR` INT NOT NULL AUTO_INCREMENT,
  `ID_FORNECEDOR` INT NOT NULL,
  `ID_TIPO_ENDERECO` INT NOT NULL,
  `CEP` INT NOT NULL,
  `COMPLEMENTO_FORNECEDOR` VARCHAR(120) NULL DEFAULT NULL,
  `NUMERO_FORNECEDOR` CHAR(10) NOT NULL,
  PRIMARY KEY (`ID_ENDERECO_FORNECEDOR`),
  INDEX `FK_ENDERECO_ENDERECOS_CEP1` (`CEP` ASC) VISIBLE,
  INDEX `FK_ENDERECO_TIPO_ENDE_TIPO_END1` (`ID_TIPO_ENDERECO` ASC) VISIBLE,
  INDEX `FK_ENDERECO_FORNECEDO_FORNECED` (`ID_FORNECEDOR` ASC) VISIBLE,
  CONSTRAINT `FK_ENDERECO_ENDERECOS_CEP1`
    FOREIGN KEY (`CEP`)
    REFERENCES `projeto_financeiro`.`cep` (`CEP`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `FK_ENDERECO_FORNECEDO_FORNECED`
    FOREIGN KEY (`ID_FORNECEDOR`)
    REFERENCES `projeto_financeiro`.`fornecedores` (`ID_FORNECEDOR`),
  CONSTRAINT `FK_ENDERECO_TIPO_ENDE_TIPO_END1`
    FOREIGN KEY (`ID_TIPO_ENDERECO`)
    REFERENCES `projeto_financeiro`.`tipo_endereco` (`ID_TIPO_ENDERECO`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projeto_financeiro`.`notas_fiscais_entrada_`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_financeiro`.`notas_fiscais_entrada_` (
  `ID_NF_ENTRADA` INT NOT NULL AUTO_INCREMENT,
  `ID_CONDICAO` INT NOT NULL,
  `ID_FORNECEDOR` INT NOT NULL,
  `DATA_EMISSAO_NF_ENTRADA` DATE NOT NULL,
  `NOME_ITEM_NF_ENTRADA` VARCHAR(255) NOT NULL,
  `NUMERO_NF_ENTRADA` VARCHAR(44) NOT NULL,
  `QTD_ITEM_NF_ENTRADA` INT NOT NULL,
  `VALOR_TRIBUTO_NF_ENTRADA` DECIMAL(10,2) NOT NULL,
  `VALOR_TOTAL_NF_ENTRADA` DECIMAL(10,2) NOT NULL,
  `VALOR_NET_NF_ENTRADA` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`ID_NF_ENTRADA`),
  INDEX `FK_NOTAS_FI_CONDICAO__CONDICAO` (`ID_CONDICAO` ASC) VISIBLE,
  INDEX `FK_NOTAS_FI_FORNECEDO_FORNECED` (`ID_FORNECEDOR` ASC) VISIBLE,
  CONSTRAINT `FK_NOTAS_FI_CONDICAO__CONDICAO`
    FOREIGN KEY (`ID_CONDICAO`)
    REFERENCES `projeto_financeiro`.`condicao_pagamento` (`ID_CONDICAO`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `FK_NOTAS_FI_FORNECEDO_FORNECED`
    FOREIGN KEY (`ID_FORNECEDOR`)
    REFERENCES `projeto_financeiro`.`fornecedores` (`ID_FORNECEDOR`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projeto_financeiro`.`programacao_pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_financeiro`.`programacao_pagamento` (
  `ID_PROGRAMACAO_PAGAMENTO` INT NOT NULL AUTO_INCREMENT,
  `ID_NF_ENTRADA` INT NOT NULL,
  `DATA_VENCIMENTO_PROG_PAGAMENTO` DATE NOT NULL,
  `NUMERO_PARCELA_PROG_PAGAMENTO` SMALLINT NOT NULL,
  `STATUS_PAGAMENTO` TINYINT NOT NULL,
  `VALOR_PARCELA_PROG_PAGAMENTO` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`ID_PROGRAMACAO_PAGAMENTO`),
  INDEX `FK_PROGRAMA_PROGRAMAC_NOTAS_FI` (`ID_NF_ENTRADA` ASC) VISIBLE,
  CONSTRAINT `FK_PROGRAMA_PROGRAMAC_NOTAS_FI`
    FOREIGN KEY (`ID_NF_ENTRADA`)
    REFERENCES `projeto_financeiro`.`notas_fiscais_entrada_` (`ID_NF_ENTRADA`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 35
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projeto_financeiro`.`historico_pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_financeiro`.`historico_pagamento` (
  `ID_HIST_PAGAMENTO` INT NOT NULL AUTO_INCREMENT,
  `ID_PROGRAMACAO_PAGAMENTO` INT NOT NULL,
  `DATA_PAGAMENTO` DATE NOT NULL,
  `VALOR_PAGO` DECIMAL(10,2) NOT NULL,
  `VALOR_PAGAR` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`ID_HIST_PAGAMENTO`),
  INDEX `FK_HISTORIC_HISTORICO_PROGRAMA` (`ID_PROGRAMACAO_PAGAMENTO` ASC) VISIBLE,
  CONSTRAINT `FK_HISTORIC_HISTORICO_PROGRAMA`
    FOREIGN KEY (`ID_PROGRAMACAO_PAGAMENTO`)
    REFERENCES `projeto_financeiro`.`programacao_pagamento` (`ID_PROGRAMACAO_PAGAMENTO`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projeto_financeiro`.`notas_fiscais_saida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_financeiro`.`notas_fiscais_saida` (
  `ID_NF_SAIDA` INT NOT NULL AUTO_INCREMENT,
  `ID_CLIENTE` INT NOT NULL,
  `ID_CONDICAO` INT NOT NULL,
  `DATA_EMISSAO_NF_SAIDA` DATE NOT NULL,
  `NOME_ITEM_NF_SAIDA` VARCHAR(255) NOT NULL,
  `NUMERO_NF_SAIDA` VARCHAR(44) NOT NULL,
  `QTD_ITEM_NF_SAIDA` INT NOT NULL,
  `VALOR_TRIBUTO_NF_SAIDA` DECIMAL(10,2) NOT NULL,
  `VALOR_TOTAL_NF_SAIDA` DECIMAL(10,2) NOT NULL,
  `VALOR_NET_NF_SAIDA` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`ID_NF_SAIDA`),
  INDEX `FK_NOTAS_FI_CLIENTES__CLIENTES` (`ID_CLIENTE` ASC) VISIBLE,
  INDEX `FK_NOTAS_FI_NOTAS_FIS_CONDICAO` (`ID_CONDICAO` ASC) VISIBLE,
  CONSTRAINT `FK_NOTAS_FI_CLIENTES__CLIENTES`
    FOREIGN KEY (`ID_CLIENTE`)
    REFERENCES `projeto_financeiro`.`clientes` (`ID_CLIENTE`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `FK_NOTAS_FI_NOTAS_FIS_CONDICAO`
    FOREIGN KEY (`ID_CONDICAO`)
    REFERENCES `projeto_financeiro`.`condicao_pagamento` (`ID_CONDICAO`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projeto_financeiro`.`programacao_recebimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_financeiro`.`programacao_recebimento` (
  `ID_PROGRAMACAO_RECEBIMENTO` INT NOT NULL AUTO_INCREMENT,
  `ID_NF_SAIDA` INT NOT NULL,
  `DATA_VENCIMENTO_PROG_RECEBIMENTO` DATE NOT NULL,
  `NUMERO_PARCELA_PROG_RECEBIMENTO` SMALLINT NOT NULL,
  `STATUS_RECEBIMENTO` VARCHAR(50) NOT NULL,
  `VALOR_PARCELA_PROG_RECEBIMENTO` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`ID_PROGRAMACAO_RECEBIMENTO`),
  INDEX `FK_PROGRAMA_NOTAS_FIS_NOTAS_FI` (`ID_NF_SAIDA` ASC) VISIBLE,
  CONSTRAINT `FK_PROGRAMA_NOTAS_FIS_NOTAS_FI`
    FOREIGN KEY (`ID_NF_SAIDA`)
    REFERENCES `projeto_financeiro`.`notas_fiscais_saida` (`ID_NF_SAIDA`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projeto_financeiro`.`tipo_desconto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_financeiro`.`tipo_desconto` (
  `ID_DESCONTO` INT NOT NULL,
  `DESCRICAO` TEXT NOT NULL,
  `MINIMO_DIAS` SMALLINT NOT NULL,
  `MAXIMO_DIAS` SMALLINT NOT NULL,
  `MINIMO_PORCENTO` DECIMAL(10,2) NOT NULL,
  `MAXIMO_PORCENTO` DECIMAL(10,2) NOT NULL,
  `APROVADOR` VARCHAR(255) NOT NULL,
  `DATA_APROVACAO` DATE NOT NULL,
  `TIPO_DESCONTO` TINYINT(1) NOT NULL,
  `STATUS_APROVACAO` TINYINT(1) NOT NULL,
  PRIMARY KEY (`ID_DESCONTO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projeto_financeiro`.`historico_recebimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_financeiro`.`historico_recebimento` (
  `ID_HIST_RECEBIMENTO` INT NOT NULL AUTO_INCREMENT,
  `ID_PROGRAMACAO_RECEBIMENTO` INT NOT NULL,
  `ID_DESCONTO` INT NOT NULL,
  `DATA_RECEBIMENTO` DATE NOT NULL,
  `VALOR_RECEBER` DECIMAL(10,2) NOT NULL,
  `VALOR_RECEBIDO` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`ID_HIST_RECEBIMENTO`),
  INDEX `FK_HISTORIC_HISTORICO_PROGRAMA1` (`ID_PROGRAMACAO_RECEBIMENTO` ASC) VISIBLE,
  INDEX `FK_HISTORIC_TIPO_DESC_TIPO_DES` (`ID_DESCONTO` ASC) VISIBLE,
  CONSTRAINT `FK_HISTORIC_HISTORICO_PROGRAMA1`
    FOREIGN KEY (`ID_PROGRAMACAO_RECEBIMENTO`)
    REFERENCES `projeto_financeiro`.`programacao_recebimento` (`ID_PROGRAMACAO_RECEBIMENTO`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `FK_HISTORIC_TIPO_DESC_TIPO_DES`
    FOREIGN KEY (`ID_DESCONTO`)
    REFERENCES `projeto_financeiro`.`tipo_desconto` (`ID_DESCONTO`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projeto_financeiro`.`historico_recebimento_divergente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_financeiro`.`historico_recebimento_divergente` (
  `ID_HIS_RECEBIMENTO_DIVERGENTE` INT NOT NULL AUTO_INCREMENT,
  `ID_PROGRAMACAO_RECEBIMENTO` INT NOT NULL,
  `ID_DESCONTO` INT NOT NULL,
  `DATA_RECEBIMENTO_HIST_DIVERGENTE` DATE NOT NULL,
  `MOTIVO_DIVERGENCIA` TEXT NOT NULL,
  `VALOR_RECEBIDO_HIST_DIVERGENTE` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`ID_HIS_RECEBIMENTO_DIVERGENTE`),
  INDEX `FK_HISTORIC_HISTORICO_PROGRAMA2` (`ID_PROGRAMACAO_RECEBIMENTO` ASC) VISIBLE,
  INDEX `FK_HISTORIC_TIPO_DESC_TIPO_DES1` (`ID_DESCONTO` ASC) VISIBLE,
  CONSTRAINT `FK_HISTORIC_HISTORICO_PROGRAMA2`
    FOREIGN KEY (`ID_PROGRAMACAO_RECEBIMENTO`)
    REFERENCES `projeto_financeiro`.`programacao_recebimento` (`ID_PROGRAMACAO_RECEBIMENTO`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `FK_HISTORIC_TIPO_DESC_TIPO_DES1`
    FOREIGN KEY (`ID_DESCONTO`)
    REFERENCES `projeto_financeiro`.`tipo_desconto` (`ID_DESCONTO`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `projeto_financeiro` ;

-- -----------------------------------------------------
-- procedure SP_ATUALIZAR_STATUS_PROG_PAGAMENTO
-- -----------------------------------------------------

DELIMITER $$
USE `projeto_financeiro`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ATUALIZAR_STATUS_PROG_PAGAMENTO`()
BEGIN
  
  UPDATE projeto_financeiro.programacao_pagamento pp
  SET STATUS_PAGAMENTO = 1 
  WHERE EXISTS (
    SELECT 1
    FROM projeto_financeiro.historico_pagamento hp
    WHERE pp.ID_PROGRAMACAO_PAGAMENTO = hp.ID_PROGRAMACAO_PAGAMENTO
  );


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ATUALIZAR_STATUS_PROG_RECEBIMENTO
-- -----------------------------------------------------

DELIMITER $$
USE `projeto_financeiro`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ATUALIZAR_STATUS_PROG_RECEBIMENTO`()
BEGIN
  UPDATE projeto_financeiro.programacao_recebimento pr
  SET STATUS_RECEBIMENTO = 1 
  WHERE EXISTS (
    SELECT 1
    FROM projeto_financeiro.historico_recebimento hr
    WHERE pr.ID_PROGRAMACAO_RECEBIMENTO = hr.ID_PROGRAMACAO_RECEBIMENTO
  );


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PROG_PAGAMENTO
-- -----------------------------------------------------

DELIMITER $$
USE `projeto_financeiro`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PROG_PAGAMENTO`(
    IN p_ID_NF_ENTRADA INT,
    IN p_ID_CONDICAO INT,
    IN p_DATA_EMISSAO_NF_ENTRADA DATE,
    IN p_VALOR_TOTAL_NF_ENTRADA DECIMAL(10,2)
)
BEGIN
    DECLARE v_QUANTIDADE_PARCELA INT;
    DECLARE v_ENTRADA BOOLEAN;
    DECLARE v_VALOR_PARCELA DECIMAL(10,2);
    DECLARE v_DATA_VENCIMENTO DATE;
    DECLARE v_NUMERO_PARCELA INT DEFAULT 1;

    -- Obter informações da condição de pagamento
    SELECT QUANTIDADE_PARCELA, ENTRADA INTO v_QUANTIDADE_PARCELA, v_ENTRADA
    FROM projeto_financeiro.condicao_pagamento
    WHERE ID_CONDICAO = p_ID_CONDICAO;

    -- Calcular valor da parcela
    SET v_VALOR_PARCELA = p_VALOR_TOTAL_NF_ENTRADA / v_QUANTIDADE_PARCELA;

    -- Loop para gerar programações de pagamento
    WHILE v_NUMERO_PARCELA <= v_QUANTIDADE_PARCELA DO
        -- Calcular a data de vencimento usando DATE_ADD
        SET v_DATA_VENCIMENTO = DATE_ADD(
            IF(v_ENTRADA = 1, p_DATA_EMISSAO_NF_ENTRADA, DATE_ADD(p_DATA_EMISSAO_NF_ENTRADA, INTERVAL 1 MONTH)),
            INTERVAL (v_NUMERO_PARCELA - 1) MONTH
        );


        -- Inserir na tabela programacao_pagamento
        INSERT INTO projeto_financeiro.programacao_pagamento (ID_NF_ENTRADA, DATA_VENCIMENTO_PROG_PAGAMENTO, NUMERO_PARCELA_PROG_PAGAMENTO, STATUS_PAGAMENTO, VALOR_PARCELA_PROG_PAGAMENTO)
        VALUES (p_ID_NF_ENTRADA, v_DATA_VENCIMENTO, v_NUMERO_PARCELA, 0, v_VALOR_PARCELA);

        SET v_NUMERO_PARCELA = v_NUMERO_PARCELA + 1;
    END WHILE;
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PROG_RECEBIMENTO
-- -----------------------------------------------------

DELIMITER $$
USE `projeto_financeiro`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PROG_RECEBIMENTO`(
IN p_ID_NF_SAIDA INT,
IN p_ID_CONDICAO INT,
IN p_DATA_EMISSAO_NF_SAIDA date,
IN p_VALOR_TOTAL_NF_SAIDA DECIMAL(10,2)
)
BEGIN
    DECLARE v_QUANTIDADE_PARCELA INT;
    DECLARE v_ENTRADA BOOLEAN;
    DECLARE v_VALOR_PARCELA DECIMAL(10,2);
    DECLARE v_DATA_VENCIMENTO DATE;
    DECLARE v_NUMERO_PARCELA INT DEFAULT 1;


    SELECT QUANTIDADE_PARCELA, ENTRADA INTO v_QUANTIDADE_PARCELA, v_ENTRADA
    FROM projeto_financeiro.condicao_pagamento
    WHERE ID_CONDICAO = p_ID_CONDICAO;

    SET v_VALOR_PARCELA = p_VALOR_TOTAL_NF_SAIDA / v_QUANTIDADE_PARCELA;

    WHILE v_NUMERO_PARCELA <= v_QUANTIDADE_PARCELA DO

        SET v_DATA_VENCIMENTO = DATE_ADD(
            IF(v_ENTRADA = 1, p_DATA_EMISSAO_NF_SAIDA, DATE_ADD(p_DATA_EMISSAO_NF_SAIDA, INTERVAL 1 MONTH)),
            INTERVAL (v_NUMERO_PARCELA - 1) MONTH
        );
        INSERT INTO projeto_financeiro.programacao_recebimento (ID_NF_SAIDA, DATA_VENCIMENTO_PROG_RECEBIMENTO, NUMERO_PARCELA_PROG_RECEBIMENTO, STATUS_RECEBIMENTO, VALOR_PARCELA_PROG_RECEBIMENTO)
        VALUES (p_ID_NF_SAIDA, v_DATA_VENCIMENTO, v_NUMERO_PARCELA, 0, v_VALOR_PARCELA);

        SET v_NUMERO_PARCELA = v_NUMERO_PARCELA + 1;
    END WHILE;
END$$

DELIMITER ;
USE `projeto_financeiro`;

DELIMITER $$
USE `projeto_financeiro`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `projeto_financeiro`.`trigger_nova_nf_entrada`
AFTER INSERT ON `projeto_financeiro`.`notas_fiscais_entrada_`
FOR EACH ROW
BEGIN
  -- Chamar a stored procedure SP_PROG_PAGAMENTO
  CALL projeto_financeiro.SP_PROG_PAGAMENTO(
    NEW.ID_NF_ENTRADA,
    NEW.ID_CONDICAO,
    NEW.DATA_EMISSAO_NF_ENTRADA,
    NEW.VALOR_TOTAL_NF_ENTRADA
  );
END$$

USE `projeto_financeiro`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `projeto_financeiro`.`TRIGGER_NOVA_NF_SAIDA`
AFTER INSERT ON `projeto_financeiro`.`notas_fiscais_saida`
FOR EACH ROW
BEGIN
CALL projeto_financeiro.SP_PROG_RECEBIMENTO(
	NEW.ID_NF_SAIDA,
    NEW.ID_CONDICAO,
    NEW.DATA_EMISSAO_NF_SAIDA,
    NEW.VALOR_TOTAL_NF_SAIDA
    );
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;