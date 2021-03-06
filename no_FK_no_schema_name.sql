-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Table `DEPARTMENT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CO_DEPARTMENT` ;

CREATE TABLE IF NOT EXISTS `CO_DEPARTMENT` (
  `DName` VARCHAR(30) NOT NULL COMMENT '',
  `DNumber` INT NOT NULL COMMENT '',
  `MgrStartDate` DATE NULL COMMENT '',
  `MgrSSN` CHAR(11) NULL COMMENT '',
  PRIMARY KEY (`DNumber`)  COMMENT '')
  -- CONSTRAINT `fk_DEPARTMENT_EMPLOYEE1`
    -- FOREIGN KEY (`MgrSSN`)
    -- REFERENCES `EMPLOYEE` (`SSN`)
    -- ON DELETE NO ACTION
    -- ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `DName_UNIQUE` ON `CO_DEPARTMENT` (`DName` ASC)  COMMENT '';

CREATE INDEX `fk_DEPARTMENT_EMPLOYEE1_idx` ON `CO_DEPARTMENT` (`MgrSSN` ASC)  COMMENT '';


-- -----------------------------------------------------
-- Table `EMPLOYEE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CO_EMPLOYEE` ;

CREATE TABLE IF NOT EXISTS `CO_EMPLOYEE` (
  `FName` VARCHAR(30) NULL COMMENT '',
  `LName` VARCHAR(30) NULL COMMENT '',
  `SSN` CHAR(11) NOT NULL COMMENT '',
  `BDate` DATE NULL COMMENT '',
  `Address` VARCHAR(45) NULL COMMENT '',
  `Gender` CHAR(1) NULL COMMENT '',
  `Salary` INT NULL COMMENT '',
  `DNumber` INT NOT NULL COMMENT '',
  `SupervisorSSN` CHAR(11) NULL COMMENT '',
  PRIMARY KEY (`SSN`)  COMMENT '')
  -- CONSTRAINT `fk_EMPLOYEE_DEPARTMENT`
    -- FOREIGN KEY (`DNumber`)
    -- REFERENCES `DEPARTMENT` (`DNumber`)
    -- ON DELETE NO ACTION
    -- ON UPDATE NO ACTION,
  -- CONSTRAINT `fk_EMPLOYEE_EMPLOYEE1`
    -- FOREIGN KEY (`SupervisorSSN`)
    -- REFERENCES `EMPLOYEE` (`SSN`)
    -- ON DELETE NO ACTION
    -- ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_EMPLOYEE_DEPARTMENT_idx` ON `CO_EMPLOYEE` (`DNumber` ASC)  COMMENT '';

CREATE INDEX `fk_EMPLOYEE_EMPLOYEE1_idx` ON `CO_EMPLOYEE` (`SupervisorSSN` ASC)  COMMENT '';


-- -----------------------------------------------------
-- Table `DEPENDENT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CO_DEPENDENT` ;

CREATE TABLE IF NOT EXISTS `CO_DEPENDENT` (
  `Name` VARCHAR(30) NOT NULL COMMENT '',
  `Gender` CHAR(1) NULL COMMENT '',
  `BDate` DATE NULL COMMENT '',
  `Relationship` VARCHAR(30) NULL COMMENT '',
  `ESSN` CHAR(11) NOT NULL COMMENT '',
  PRIMARY KEY (`Name`, `ESSN`)  COMMENT '')
  -- CONSTRAINT `fk_DEPENDENT_EMPLOYEE1`
    -- FOREIGN KEY (`ESSN`)
    -- REFERENCES `EMPLOYEE` (`SSN`)
    -- ON DELETE NO ACTION
    -- ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_DEPENDENT_EMPLOYEE1_idx` ON `CO_DEPENDENT` (`ESSN` ASC)  COMMENT '';


-- -----------------------------------------------------
-- Table `PROJECT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CO_PROJECT` ;

CREATE TABLE IF NOT EXISTS `CO_PROJECT` (
  `PNumber` INT NOT NULL COMMENT '',
  `PName` VARCHAR(45) NULL COMMENT '',
  `PLocation` VARCHAR(45) NULL COMMENT '',
  `DNumber` INT NULL COMMENT '',
  PRIMARY KEY (`PNumber`)  COMMENT '')
  -- CONSTRAINT `fk_PROJECT_DEPARTMENT1`
    -- FOREIGN KEY (`DNumber`)
    -- REFERENCES `DEPARTMENT` (`DNumber`)
    -- ON DELETE NO ACTION
    -- ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_PROJECT_DEPARTMENT1_idx` ON `CO_PROJECT` (`DNumber` ASC)  COMMENT '';


-- -----------------------------------------------------
-- Table `WORKS_ON`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CO_WORKS_ON` ;

CREATE TABLE IF NOT EXISTS `CO_WORKS_ON` (
  `ESSN` CHAR(11) NOT NULL COMMENT '',
  `PNumber` INT NOT NULL COMMENT '',
  `Hours` INT NULL COMMENT '',
  PRIMARY KEY (`ESSN`, `PNumber`)  COMMENT '')
  -- CONSTRAINT `fk_EMPLOYEE_has_PROJECT_EMPLOYEE1`
    -- FOREIGN KEY (`ESSN`)
    -- REFERENCES `EMPLOYEE` (`SSN`)
    -- ON DELETE NO ACTION
    -- ON UPDATE NO ACTION,
  -- CONSTRAINT `fk_EMPLOYEE_has_PROJECT_PROJECT1`
    -- FOREIGN KEY (`PNumber`)
    -- REFERENCES `PROJECT` (`PNumber`)
    -- ON DELETE NO ACTION
    -- ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_EMPLOYEE_has_PROJECT_PROJECT1_idx` ON `CO_WORKS_ON` (`PNumber` ASC)  COMMENT '';

CREATE INDEX `fk_EMPLOYEE_has_PROJECT_EMPLOYEE1_idx` ON `CO_WORKS_ON` (`ESSN` ASC)  COMMENT '';


-- -----------------------------------------------------
-- Table `DEPT_LOCATION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CO_DEPT_LOCATION` ;

CREATE TABLE IF NOT EXISTS `CO_DEPT_LOCATION` (
  `Location` VARCHAR(30) NOT NULL COMMENT '',
  `DNumber` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Location`, `DNumber`)  COMMENT '')
  -- CONSTRAINT `fk_DEPT_LOCATION_DEPARTMENT1`
    -- FOREIGN KEY (`DNumber`)
    -- REFERENCES `DEPARTMENT` (`DNumber`)
    -- ON DELETE NO ACTION
    -- ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_DEPT_LOCATION_DEPARTMENT1_idx` ON `CO_DEPT_LOCATION` (`DNumber` ASC)  COMMENT '';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
