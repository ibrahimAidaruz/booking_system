-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema little_lemon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little_lemon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon` DEFAULT CHARACTER SET utf8mb3 ;
USE `little_lemon` ;

-- -----------------------------------------------------
-- Table `little_lemon`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `CustomerName` VARCHAR(45) NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`items` (
  `MenuItemID` INT NOT NULL AUTO_INCREMENT,
  `CourseName` VARCHAR(45) NOT NULL,
  `StarterName` VARCHAR(45) NOT NULL,
  `DesertName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`menus` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `MenuName` VARCHAR(45) NOT NULL,
  `Cuisine` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`menuitems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`menuitems` (
  `MenuItemID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  PRIMARY KEY (`MenuItemID`, `MenuID`),
  INDEX `fk_MenuItems_has_menus_menus1_idx` (`MenuID` ASC) VISIBLE,
  INDEX `fk_MenuItems_has_menus_MenuItems1_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `fk_MenuItems_has_menus_MenuItems1`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `little_lemon`.`items` (`MenuItemID`),
  CONSTRAINT `fk_MenuItems_has_menus_menus1`
    FOREIGN KEY (`MenuID`)
    REFERENCES `little_lemon`.`menus` (`MenuID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `TotalCost` FLOAT NOT NULL,
  `CustomerID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_orders_customers1_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_orders_menus1_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customers1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `little_lemon`.`customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_menus1`
    FOREIGN KEY (`MenuID`)
    REFERENCES `little_lemon`.`menus` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`orderdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`orderdetails` (
  `OrderDetailID` INT NOT NULL AUTO_INCREMENT,
  `DeliveredDate` DATETIME NOT NULL,
  `Statud` VARCHAR(45) NOT NULL,
  `OrderId` INT NOT NULL,
  PRIMARY KEY (`OrderDetailID`, `OrderId`),
  INDEX `fk_OrderDetails_Orders1_idx` (`OrderId` ASC) VISIBLE,
  CONSTRAINT `fk_OrderDetails_Orders1`
    FOREIGN KEY (`OrderId`)
    REFERENCES `little_lemon`.`orders` (`OrderID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`staff` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `StaffName` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Sallary` INT NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
