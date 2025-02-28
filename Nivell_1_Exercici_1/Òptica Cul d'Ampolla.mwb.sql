-- MySQL Script generated by MySQL Workbench
-- Wed Jan 15 13:51:17 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`suppliers` (
  `idtable1` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `fax` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtable1`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`bands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`bands` (
  `idbands` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `suppliers_idtable1` INT NOT NULL,
  PRIMARY KEY (`idbands`),
  INDEX `fk_bands_suppliers1_idx` (`suppliers_idtable1` ASC) VISIBLE,
  CONSTRAINT `fk_bands_suppliers1`
    FOREIGN KEY (`suppliers_idtable1`)
    REFERENCES `mydb`.`suppliers` (`idtable1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`glasses` (
  `idglasses` INT NOT NULL AUTO_INCREMENT,
  `left_graduation` VARCHAR(45) NOT NULL,
  `right_graduation` VARCHAR(45) NOT NULL,
  `mount` ENUM('floating', 'paste', 'metallic') NOT NULL,
  `color_mount` VARCHAR(45) NOT NULL,
  `price` VARCHAR(45) NOT NULL,
  `bands_idbands` INT NOT NULL,
  PRIMARY KEY (`idglasses`),
  INDEX `fk_glasses_bands1_idx` (`bands_idbands` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_bands1`
    FOREIGN KEY (`bands_idbands`)
    REFERENCES `mydb`.`bands` (`idbands`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clients` (
  `idclients` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `postal_address` INT NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `registration_date` DATETIME NOT NULL,
  PRIMARY KEY (`idclients`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employees` (
  `idemployee` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idemployee`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sales` (
  `idsales` INT NOT NULL AUTO_INCREMENT,
  `employee_idemployee` INT NOT NULL,
  `clients_idclients` INT NOT NULL,
  PRIMARY KEY (`idsales`),
  INDEX `fk_sales_employee1_idx` (`employee_idemployee` ASC) VISIBLE,
  INDEX `fk_sales_clients1_idx` (`clients_idclients` ASC) VISIBLE,
  CONSTRAINT `fk_sales_employee1`
    FOREIGN KEY (`employee_idemployee`)
    REFERENCES `mydb`.`employees` (`idemployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_clients1`
    FOREIGN KEY (`clients_idclients`)
    REFERENCES `mydb`.`clients` (`idclients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sale_glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sale_glasses` (
  `idtable1` INT NOT NULL AUTO_INCREMENT,
  `glasses_idglasses` INT NOT NULL,
  `sales_idsales` INT NOT NULL,
  PRIMARY KEY (`idtable1`),
  INDEX `fk_sale_glasses_glasses1_idx` (`glasses_idglasses` ASC) VISIBLE,
  INDEX `fk_sale_glasses_sales1_idx` (`sales_idsales` ASC) VISIBLE,
  CONSTRAINT `fk_sale_glasses_glasses1`
    FOREIGN KEY (`glasses_idglasses`)
    REFERENCES `mydb`.`glasses` (`idglasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sale_glasses_sales1`
    FOREIGN KEY (`sales_idsales`)
    REFERENCES `mydb`.`sales` (`idsales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
