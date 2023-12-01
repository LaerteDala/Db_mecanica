
CREATE SCHEMA IF NOT EXISTS `Sistema_oficina` DEFAULT CHARACTER SET utf8 ;
USE `Sistema_oficina` ;

-- -----------------------------------------------------
-- Table `Sistema_oficina`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_oficina`.`Cliente` (
  `idCliente` INT NOT NULL,
  `firma_cliente` VARCHAR(45) NULL,
  `nif_cliente` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_oficina`.`Equipa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_oficina`.`Equipa` (
  `idEquipa` INT NOT NULL,
  `descricao_equipa` VARCHAR(45) NULL,
  PRIMARY KEY (`idEquipa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_oficina`.`Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_oficina`.`Veiculo` (
  `idVeículos` INT NOT NULL,
  `matricula_veiculo` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Equipa_idEquipa` INT NOT NULL,
  PRIMARY KEY (`idVeículos`, `Cliente_idCliente`, `Equipa_idEquipa`),
  INDEX `fk_Veiculo_Cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Veiculo_Equipa1_idx` (`Equipa_idEquipa` ASC) VISIBLE,
  CONSTRAINT `fk_Veiculo_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `Sistema_oficina`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Veiculo_Equipa1`
    FOREIGN KEY (`Equipa_idEquipa`)
    REFERENCES `Sistema_oficina`.`Equipa` (`idEquipa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_oficina`.`Mecanico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_oficina`.`Mecanico` (
  `idMecanico` INT NOT NULL,
  `nome_mecanico` VARCHAR(45) NOT NULL,
  `endereco_mecanico` VARCHAR(45) NULL,
  `especialidade_mecanico` VARCHAR(45) NULL,
  `Equipa_idEquipa` INT NOT NULL,
  PRIMARY KEY (`idMecanico`, `Equipa_idEquipa`),
  INDEX `fk_Mecanico_Equipa1_idx` (`Equipa_idEquipa` ASC) VISIBLE,
  CONSTRAINT `fk_Mecanico_Equipa1`
    FOREIGN KEY (`Equipa_idEquipa`)
    REFERENCES `Sistema_oficina`.`Equipa` (`idEquipa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_oficina`.`Ordem de Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_oficina`.`Ordem de Servico` (
  `idOrdem de Servico` INT NOT NULL,
  `dataEmissao_os` DATE NULL,
  `dataFim_os` DATE NULL,
  `status_os` VARCHAR(45) NULL,
  `valor_os` DOUBLE NULL,
  PRIMARY KEY (`idOrdem de Servico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_oficina`.`Tbl_Mão de Obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_oficina`.`Tbl_Mão de Obra` (
  `idTbl_Mão de Obra` INT NOT NULL,
  `Descrição_serviço` VARCHAR(45) NULL,
  `Tipo_serviço` VARCHAR(45) NULL,
  `valot_serviço` INT NULL,
  PRIMARY KEY (`idTbl_Mão de Obra`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_oficina`.`Serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_oficina`.`Serviço` (
  `idServiço` INT NOT NULL,
  `descricao_servico` VARCHAR(45) NOT NULL,
  `valor_servico` VARCHAR(45) NULL,
  `Equipa_idEquipa` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Tbl_Mão de Obra_idTbl_Mão de Obra` INT NOT NULL,
  PRIMARY KEY (`idServiço`, `Equipa_idEquipa`, `Cliente_idCliente`, `Tbl_Mão de Obra_idTbl_Mão de Obra`),
  INDEX `fk_Serviço_Equipa1_idx` (`Equipa_idEquipa` ASC) VISIBLE,
  INDEX `fk_Serviço_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Serviço_Tbl_Mão de Obra1_idx` (`Tbl_Mão de Obra_idTbl_Mão de Obra` ASC) VISIBLE,
  CONSTRAINT `fk_Serviço_Equipa1`
    FOREIGN KEY (`Equipa_idEquipa`)
    REFERENCES `Sistema_oficina`.`Equipa` (`idEquipa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Serviço_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `Sistema_oficina`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Serviço_Tbl_Mão de Obra1`
    FOREIGN KEY (`Tbl_Mão de Obra_idTbl_Mão de Obra`)
    REFERENCES `Sistema_oficina`.`Tbl_Mão de Obra` (`idTbl_Mão de Obra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_oficina`.`Peças`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_oficina`.`Peças` (
  `idPeças` INT NOT NULL,
  `descrcao_pecas` VARCHAR(45) NULL,
  `valor_peca` VARCHAR(45) NULL,
  PRIMARY KEY (`idPeças`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_oficina`.`Preenche`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_oficina`.`Preenche` (
  `Ordem de Servico_idOrdem de Servico` INT NOT NULL,
  `Equipa_idEquipa` INT NOT NULL,
  PRIMARY KEY (`Ordem de Servico_idOrdem de Servico`, `Equipa_idEquipa`),
  INDEX `fk_Ordem de Servico_has_Equipa_Equipa1_idx` (`Equipa_idEquipa` ASC) VISIBLE,
  INDEX `fk_Ordem de Servico_has_Equipa_Ordem de Servico1_idx` (`Ordem de Servico_idOrdem de Servico` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem de Servico_has_Equipa_Ordem de Servico1`
    FOREIGN KEY (`Ordem de Servico_idOrdem de Servico`)
    REFERENCES `Sistema_oficina`.`Ordem de Servico` (`idOrdem de Servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem de Servico_has_Equipa_Equipa1`
    FOREIGN KEY (`Equipa_idEquipa`)
    REFERENCES `Sistema_oficina`.`Equipa` (`idEquipa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_oficina`.`Os_contem_peças`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_oficina`.`Os_contem_peças` (
  `Ordem de Servico_idOrdem de Servico` INT NOT NULL,
  `Peças_idPeças` INT NOT NULL,
  PRIMARY KEY (`Ordem de Servico_idOrdem de Servico`, `Peças_idPeças`),
  INDEX `fk_Ordem de Servico_has_Peças_Peças1_idx` (`Peças_idPeças` ASC) VISIBLE,
  INDEX `fk_Ordem de Servico_has_Peças_Ordem de Servico1_idx` (`Ordem de Servico_idOrdem de Servico` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem de Servico_has_Peças_Ordem de Servico1`
    FOREIGN KEY (`Ordem de Servico_idOrdem de Servico`)
    REFERENCES `Sistema_oficina`.`Ordem de Servico` (`idOrdem de Servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem de Servico_has_Peças_Peças1`
    FOREIGN KEY (`Peças_idPeças`)
    REFERENCES `Sistema_oficina`.`Peças` (`idPeças`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_oficina`.`Ordem de Servico_contem_Serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_oficina`.`Ordem de Servico_contem_Serviço` (
  `Ordem de Servico_idOrdem de Servico` INT NOT NULL,
  `Serviço_idServiço` INT NOT NULL,
  PRIMARY KEY (`Ordem de Servico_idOrdem de Servico`, `Serviço_idServiço`),
  INDEX `fk_Ordem de Servico_has_Serviço_Serviço1_idx` (`Serviço_idServiço` ASC) VISIBLE,
  INDEX `fk_Ordem de Servico_has_Serviço_Ordem de Servico1_idx` (`Ordem de Servico_idOrdem de Servico` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem de Servico_has_Serviço_Ordem de Servico1`
    FOREIGN KEY (`Ordem de Servico_idOrdem de Servico`)
    REFERENCES `Sistema_oficina`.`Ordem de Servico` (`idOrdem de Servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem de Servico_has_Serviço_Serviço1`
    FOREIGN KEY (`Serviço_idServiço`)
    REFERENCES `Sistema_oficina`.`Serviço` (`idServiço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

