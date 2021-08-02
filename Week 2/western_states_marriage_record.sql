-- MySQL Script generated by MySQL Workbench
-- Wed Jan 15 23:01:08 2020
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
-- Table `mydb`.`grooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`grooms` (
  `groom_id` INT NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(30) NOT NULL,
  `first_name` VARCHAR(30) NOT NULL,
  `residency` VARCHAR(45) NULL,
  PRIMARY KEY (`groom_id`),
  UNIQUE INDEX `groom_id_UNIQUE` (`groom_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`brides`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`brides` (
  `bride_id` INT NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(30) NOT NULL,
  `first_name` VARCHAR(30) NOT NULL,
  `residency` VARCHAR(45) NULL,
  PRIMARY KEY (`bride_id`),
  UNIQUE INDEX `bride_id_UNIQUE` (`bride_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`locations` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `place` VARCHAR(45) NOT NULL,
  `county` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE INDEX `location_id_UNIQUE` (`location_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`marriages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`marriages` (
  `marriage_id` INT NOT NULL AUTO_INCREMENT,
  `marriage_date` DATE NOT NULL,
  `` VARCHAR(45) NULL,
  `locations_location_id` INT NOT NULL,
  `grooms_groom_id` INT NOT NULL,
  `brides_bride_id` INT NOT NULL,
  PRIMARY KEY (`marriage_id`),
  UNIQUE INDEX `marriage_id_UNIQUE` (`marriage_id` ASC) VISIBLE,
  INDEX `fk_marriages_locations1_idx` (`locations_location_id` ASC) VISIBLE,
  INDEX `fk_marriages_grooms1_idx` (`grooms_groom_id` ASC) VISIBLE,
  INDEX `fk_marriages_brides1_idx` (`brides_bride_id` ASC) VISIBLE,
  CONSTRAINT `fk_marriages_locations1`
    FOREIGN KEY (`locations_location_id`)
    REFERENCES `mydb`.`locations` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_marriages_grooms1`
    FOREIGN KEY (`grooms_groom_id`)
    REFERENCES `mydb`.`grooms` (`groom_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_marriages_brides1`
    FOREIGN KEY (`brides_bride_id`)
    REFERENCES `mydb`.`brides` (`bride_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`grooms_has_brides`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`grooms_has_brides` (
  `grooms_groom_id` INT NOT NULL,
  `brides_bride_id` INT NOT NULL,
  PRIMARY KEY (`grooms_groom_id`, `brides_bride_id`),
  INDEX `fk_grooms_has_brides_brides1_idx` (`brides_bride_id` ASC) VISIBLE,
  INDEX `fk_grooms_has_brides_grooms1_idx` (`grooms_groom_id` ASC) VISIBLE,
  CONSTRAINT `fk_grooms_has_brides_grooms1`
    FOREIGN KEY (`grooms_groom_id`)
    REFERENCES `mydb`.`grooms` (`groom_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grooms_has_brides_brides1`
    FOREIGN KEY (`brides_bride_id`)
    REFERENCES `mydb`.`brides` (`bride_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;