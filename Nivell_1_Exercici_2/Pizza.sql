-- MySQL Script generated by MySQL Workbench
-- Wed Dec 18 08:23:19 2024
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
-- Table `mydb`.`province`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`province` (
  `idprovince` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idprovince`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`locality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`locality` (
  `idlocality` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `province_idprovince` INT NOT NULL,
  PRIMARY KEY (`idlocality`),
  INDEX `fk_locality_province1_idx` (`province_idprovince` ASC) VISIBLE,
  CONSTRAINT `fk_locality_province1`
    FOREIGN KEY (`province_idprovince`)
    REFERENCES `mydb`.`province` (`idprovince`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer` (
  `idcustomer` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surnames` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `zip_code` INT NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `locality_idlocality` INT NOT NULL,
  PRIMARY KEY (`idcustomer`),
  INDEX `fk_customer_locality1_idx` (`locality_idlocality` ASC) VISIBLE,
  CONSTRAINT `fk_customer_locality1`
    FOREIGN KEY (`locality_idlocality`)
    REFERENCES `mydb`.`locality` (`idlocality`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`store` (
  `idstore` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  `locality_idlocality` INT NOT NULL,
  PRIMARY KEY (`idstore`),
  INDEX `fk_store_locality1_idx` (`locality_idlocality` ASC) VISIBLE,
  CONSTRAINT `fk_store_locality1`
    FOREIGN KEY (`locality_idlocality`)
    REFERENCES `mydb`.`locality` (`idlocality`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employees` (
  `idemployees` INT NOT NULL AUTO_INCREMENT,
  `store_idstore` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `last_names` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `work` ENUM('cook', 'delivery_man') NOT NULL,
  PRIMARY KEY (`idemployees`),
  INDEX `fk_employees_store_idx` (`store_idstore` ASC) VISIBLE,
  CONSTRAINT `fk_employees_store`
    FOREIGN KEY (`store_idstore`)
    REFERENCES `mydb`.`store` (`idstore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`delivery` (
  `iddelivery` INT NOT NULL AUTO_INCREMENT,
  `employees_idemployees` INT NOT NULL,
  `date_time` DATETIME NOT NULL,
  PRIMARY KEY (`iddelivery`),
  INDEX `fk_delivery_employees1_idx` (`employees_idemployees` ASC) VISIBLE,
  CONSTRAINT `fk_delivery_employees1`
    FOREIGN KEY (`employees_idemployees`)
    REFERENCES `mydb`.`employees` (`idemployees`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `idorders` INT NOT NULL AUTO_INCREMENT,
  `date_time` DATETIME NOT NULL,
  `delivery` ENUM('home', 'store') NOT NULL,
  `quantity` VARCHAR(45) NOT NULL,
  `total_price` VARCHAR(45) NOT NULL,
  `customer_idcustomer` INT NOT NULL,
  `store_idstore` INT NOT NULL,
  `delivery_iddelivery` INT NULL,
  PRIMARY KEY (`idorders`),
  INDEX `fk_orders_customer1_idx` (`customer_idcustomer` ASC) VISIBLE,
  INDEX `fk_orders_store1_idx` (`store_idstore` ASC) VISIBLE,
  INDEX `fk_orders_delivery1_idx` (`delivery_iddelivery` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customer1`
    FOREIGN KEY (`customer_idcustomer`)
    REFERENCES `mydb`.`customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_store1`
    FOREIGN KEY (`store_idstore`)
    REFERENCES `mydb`.`store` (`idstore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_delivery1`
    FOREIGN KEY (`delivery_iddelivery`)
    REFERENCES `mydb`.`delivery` (`iddelivery`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pizza_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pizza_categories` (
  `idpizza_categories` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpizza_categories`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`products` (
  `idproducts` INT NOT NULL AUTO_INCREMENT,
  `tipe` ENUM('pizza', 'burger', 'drink') NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `price` VARCHAR(45) NOT NULL,
  `orders_idorders` INT NOT NULL,
  `pizza_categories_idpizza_categories` INT NULL,
  PRIMARY KEY (`idproducts`),
  INDEX `fk_products_orders1_idx` (`orders_idorders` ASC) VISIBLE,
  INDEX `fk_products_pizza_categories1_idx` (`pizza_categories_idpizza_categories` ASC) VISIBLE,
  CONSTRAINT `fk_products_orders1`
    FOREIGN KEY (`orders_idorders`)
    REFERENCES `mydb`.`orders` (`idorders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_pizza_categories1`
    FOREIGN KEY (`pizza_categories_idpizza_categories`)
    REFERENCES `mydb`.`pizza_categories` (`idpizza_categories`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
