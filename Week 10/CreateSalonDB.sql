-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Salon
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Salon` ;

-- -----------------------------------------------------
-- Schema Salon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Salon` DEFAULT CHARACTER SET utf8 ;
USE `Salon` ;

-- -----------------------------------------------------
-- Table `Salon`.`Location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Salon`.`Location` ;

CREATE TABLE IF NOT EXISTS `Salon`.`Location` (
  `LocationID` INT NOT NULL AUTO_INCREMENT,
  `Address1` VARCHAR(45) NOT NULL,
  `Address2` VARCHAR(45) NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(2) NOT NULL,
  `Zip` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`LocationID`),
  UNIQUE INDEX `LocationID_UNIQUE` (`LocationID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Salon`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Salon`.`Customer` ;

CREATE TABLE IF NOT EXISTS `Salon`.`Customer` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Salon`.`Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Salon`.`Employee` ;

CREATE TABLE IF NOT EXISTS `Salon`.`Employee` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `EmpFirstName` VARCHAR(45) NOT NULL,
  `EmpLastName` VARCHAR(45) NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `HireDate` DATE NOT NULL,
  `TerminationDate` DATE NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(10) NOT NULL,
  `LocationID` INT NOT NULL,
  `ManagerID` VARCHAR(1) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`EmployeeID`),
  INDEX `fk_Employee_Location_idx` (`LocationID` ASC) ,
  UNIQUE INDEX `EmployeeID_UNIQUE` (`EmployeeID` ASC) ,
  CONSTRAINT `fk_Employee_Location`
    FOREIGN KEY (`LocationID`)
    REFERENCES `Salon`.`Location` (`LocationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Salon`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Salon`.`Product` ;

CREATE TABLE IF NOT EXISTS `Salon`.`Product` (
  `ProductID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  `UnitSize` VARCHAR(10) NULL,
  `Price` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE INDEX `ProductID_UNIQUE` (`ProductID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Salon`.`Transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Salon`.`Transaction` ;

CREATE TABLE IF NOT EXISTS `Salon`.`Transaction` (
  `TranID` INT NOT NULL AUTO_INCREMENT,
  `EmployeeID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `TranDate` DATE NOT NULL,
  PRIMARY KEY (`TranID`),
  INDEX `fk_Transaction_Employee1_idx` (`EmployeeID` ASC) ,
  INDEX `fk_Transaction_Customer1_idx` (`CustomerID` ASC) ,
  UNIQUE INDEX `TranID_UNIQUE` (`TranID` ASC) ,
  CONSTRAINT `fk_Transaction_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Salon`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaction_Customer1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Salon`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Salon`.`TransactionDetail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Salon`.`TransactionDetail` ;

CREATE TABLE IF NOT EXISTS `Salon`.`TransactionDetail` (
  `TranDetailID` INT NOT NULL AUTO_INCREMENT,
  `TranID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`TranDetailID`),
  INDEX `fk_TransactionDetail_Product1_idx` (`ProductID` ASC) ,
  INDEX `fk_TransactionDetail_Transaction1_idx` (`TranID` ASC) ,
  UNIQUE INDEX `TranDetailID_UNIQUE` (`TranDetailID` ASC) ,
  CONSTRAINT `fk_TransactionDetail_Product1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `Salon`.`Product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TransactionDetail_Transaction1`
    FOREIGN KEY (`TranID`)
    REFERENCES `Salon`.`Transaction` (`TranID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
