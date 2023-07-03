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
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`menus` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `Starters` VARCHAR(45) NOT NULL,
  `Cuisines` VARCHAR(45) NOT NULL,
  `Courses` VARCHAR(45) NOT NULL,
  `Drinks` VARCHAR(45) NOT NULL,
  `Desserts` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATETIME NOT NULL,
  `Quantity` INT NOT NULL,
  `Price` FLOAT NOT NULL,
  PRIMARY KEY (`OrderID`))
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


-- -----------------------------------------------------
-- Table `little_lemon`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATETIME NOT NULL,
  `TableNumber` INT(10) UNSIGNED ZEROFILL NOT NULL,
  `CustomerID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  `OrderId` INT NOT NULL,
  PRIMARY KEY (`BookingID`, `CustomerID`, `MenuID`),
  INDEX `fk_Bookings_Customers_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Bookings_Menus1_idx` (`MenuID` ASC) VISIBLE,
  INDEX `fk_Bookings_Staff1_idx` (`StaffID` ASC) VISIBLE,
  INDEX `fk_Bookings_Orders1_idx` (`OrderId` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_Customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `little_lemon`.`customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Bookings_Menus1`
    FOREIGN KEY (`MenuID`)
    REFERENCES `little_lemon`.`menus` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Bookings_Orders1`
    FOREIGN KEY (`OrderId`)
    REFERENCES `little_lemon`.`orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Bookings_Staff1`
    FOREIGN KEY (`StaffID`)
    REFERENCES `little_lemon`.`staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
