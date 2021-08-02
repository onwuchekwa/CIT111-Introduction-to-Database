-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `university` ;

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8 ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`college`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`college` ;

CREATE TABLE IF NOT EXISTS `university`.`college` (
  `collegeId` INT NOT NULL AUTO_INCREMENT,
  `collegeName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`collegeId`),
  UNIQUE INDEX `collegeId_UNIQUE` (`collegeId` ASC) ,
  UNIQUE INDEX `collegeName_UNIQUE` (`collegeName` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`department` ;

CREATE TABLE IF NOT EXISTS `university`.`department` (
  `departmentId` INT NOT NULL AUTO_INCREMENT,
  `departmentCode` VARCHAR(4) NOT NULL,
  `departmentName` VARCHAR(45) NOT NULL,
  `collegeId` INT NOT NULL,
  PRIMARY KEY (`departmentId`),
  UNIQUE INDEX `departmentId_UNIQUE` (`departmentId` ASC) ,
  UNIQUE INDEX `departmentCode_UNIQUE` (`departmentCode` ASC) ,
  UNIQUE INDEX `departmentName_UNIQUE` (`departmentName` ASC) ,
  INDEX `fk_department_college_idx` (`collegeId` ASC) ,
  CONSTRAINT `fk_department_college`
    FOREIGN KEY (`collegeId`)
    REFERENCES `university`.`college` (`collegeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`course` ;

CREATE TABLE IF NOT EXISTS `university`.`course` (
  `courseId` INT NOT NULL AUTO_INCREMENT,
  `courseNumber` INT NOT NULL,
  `courseName` VARCHAR(45) NOT NULL,
  `creditHour` INT NOT NULL,
  `departmentId` INT NOT NULL,
  PRIMARY KEY (`courseId`),
  UNIQUE INDEX `courseId_UNIQUE` (`courseId` ASC) ,
  UNIQUE INDEX `courseNumber_UNIQUE` (`courseNumber` ASC) ,
  UNIQUE INDEX `courseName_UNIQUE` (`courseName` ASC) ,
  INDEX `fk_course_department1_idx` (`departmentId` ASC) ,
  CONSTRAINT `fk_course_department1`
    FOREIGN KEY (`departmentId`)
    REFERENCES `university`.`department` (`departmentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`professor` ;

CREATE TABLE IF NOT EXISTS `university`.`professor` (
  `professorId` INT NOT NULL AUTO_INCREMENT,
  `professorName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`professorId`),
  UNIQUE INDEX `professorId_UNIQUE` (`professorId` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`term`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`term` ;

CREATE TABLE IF NOT EXISTS `university`.`term` (
  `termId` INT NOT NULL AUTO_INCREMENT,
  `termSemester` VARCHAR(15) NOT NULL,
  `termYear` YEAR(4) NOT NULL,
  PRIMARY KEY (`termId`),
  UNIQUE INDEX `termId_UNIQUE` (`termId` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`section` ;

CREATE TABLE IF NOT EXISTS `university`.`section` (
  `sectionId` INT NOT NULL AUTO_INCREMENT,
  `sectionNumber` INT NOT NULL,
  `capacity` INT NOT NULL,
  `professorId` INT NOT NULL,
  `courseId` INT NOT NULL,
  `termId` INT NOT NULL,
  PRIMARY KEY (`sectionId`),
  UNIQUE INDEX `sectionId_UNIQUE` (`sectionId` ASC) ,
  INDEX `fk_section_professor1_idx` (`professorId` ASC) ,
  INDEX `fk_section_course1_idx` (`courseId` ASC) ,
  INDEX `fk_section_term1_idx` (`termId` ASC) ,
  CONSTRAINT `fk_section_professor1`
    FOREIGN KEY (`professorId`)
    REFERENCES `university`.`professor` (`professorId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_course1`
    FOREIGN KEY (`courseId`)
    REFERENCES `university`.`course` (`courseId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_term1`
    FOREIGN KEY (`termId`)
    REFERENCES `university`.`term` (`termId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`student` ;

CREATE TABLE IF NOT EXISTS `university`.`student` (
  `studentId` INT NOT NULL AUTO_INCREMENT,
  `studentName` VARCHAR(45) NOT NULL,
  `gender` ENUM('M', 'F') NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`studentId`),
  UNIQUE INDEX `studentId_UNIQUE` (`studentId` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`enrollment` ;

CREATE TABLE IF NOT EXISTS `university`.`enrollment` (
  `enrollmentId` INT NOT NULL AUTO_INCREMENT,
  `sectionId` INT NOT NULL,
  `studentId` INT NOT NULL,
  PRIMARY KEY (`enrollmentId`),
  UNIQUE INDEX `enrollmentId_UNIQUE` (`enrollmentId` ASC) ,
  INDEX `fk_enrollment_section1_idx` (`sectionId` ASC) ,
  INDEX `fk_enrollment_student1_idx` (`studentId` ASC) ,
  CONSTRAINT `fk_enrollment_section1`
    FOREIGN KEY (`sectionId`)
    REFERENCES `university`.`section` (`sectionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_student1`
    FOREIGN KEY (`studentId`)
    REFERENCES `university`.`student` (`studentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
