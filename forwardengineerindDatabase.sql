-- MySQL Script generated by MySQL Workbench
-- Fri Nov 12 11:37:54 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema RentIt
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema RentIt
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `RentIt` DEFAULT CHARACTER SET utf8 ;
USE `RentIt` ;

-- -----------------------------------------------------
-- Table `RentIt`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RentIt`.`User` (
  `UserID` INT NOT NULL,
  `UserName` VARCHAR(45) NOT NULL,
  `Email Id` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Mobile number` INT NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE INDEX `UserName_UNIQUE1` (`UserID` ASC) VISIBLE,
  UNIQUE INDEX `Email Id_UNIQUE` (`Email Id` ASC) VISIBLE,
  UNIQUE INDEX `UserName_UNIQUE2` (`UserName` ASC) VISIBLE,
  UNIQUE INDEX `Contact number_UNIQUE` (`Mobile number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RentIt`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RentIt`.`Product` (
  `Product Id` INT NOT NULL,
  `ProductName` VARCHAR(45) NOT NULL,
  `Rentor` VARCHAR(45) NOT NULL,
  `Rent Amount` INT NULL,
  PRIMARY KEY (`Product Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RentIt`.`Faults`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RentIt`.`Faults` (
  `Order Id` INT NOT NULL,
  `Fault` VARCHAR(45) NULL,
  `Recovery` VARCHAR(45) NULL,
  PRIMARY KEY (`Order Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RentIt`.`Completely Successful`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RentIt`.`Completely Successful` (
  `Order Id` INT NOT NULL,
  `Date of Reservation` DATETIME NULL,
  `Rent Duration days` INT NULL,
  `Rent Commencement` DATETIME NOT NULL,
  `Transaction termination` DATETIME NULL,
  `Fault Status` INT NULL,
  `Faults_Order Id` INT NOT NULL,
  `Product Id` INT NOT NULL,
  `Rentor ID` INT NOT NULL,
  `Rentee ID` INT NOT NULL,
  UNIQUE INDEX `Order Id_UNIQUE` (`Order Id` ASC) VISIBLE,
  PRIMARY KEY (`Faults_Order Id`, `Order Id`),
  INDEX `fk_Completely Successful_Product1_idx` (`Product Id` ASC) VISIBLE,
  INDEX `fk_Completely Successful_User1_idx` (`Rentor ID` ASC) VISIBLE,
  INDEX `fk_Completely Successful_User2_idx` (`Rentee ID` ASC) VISIBLE,
  CONSTRAINT `fk_Completely Successful_Faults`
    FOREIGN KEY (`Faults_Order Id`)
    REFERENCES `RentIt`.`Faults` (`Order Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Completely Successful_Product1`
    FOREIGN KEY (`Product Id`)
    REFERENCES `RentIt`.`Product` (`Product Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Completely Successful_User1`
    FOREIGN KEY (`Rentor ID`)
    REFERENCES `RentIt`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Completely Successful_User2`
    FOREIGN KEY (`Rentee ID`)
    REFERENCES `RentIt`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RentIt`.`Transaction in progress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RentIt`.`Transaction in progress` (
  `Order Id` INT NOT NULL,
  `Date of Reservation` DATE NULL,
  `Rent Commencement` DATETIME NULL,
  `RentTermination` DATETIME NULL,
  `Rent Duration` INT NULL,
  `Product_Product Id` INT NOT NULL,
  `Rentor ID` INT NOT NULL,
  `Rentee ID` INT NOT NULL,
  PRIMARY KEY (`Order Id`),
  INDEX `fk_Transaction in progress_Product1_idx` (`Product_Product Id` ASC) VISIBLE,
  INDEX `fk_Transaction in progress_User1_idx` (`Rentor ID` ASC) VISIBLE,
  INDEX `fk_Transaction in progress_User2_idx` (`Rentee ID` ASC) VISIBLE,
  CONSTRAINT `fk_Transaction in progress_Product1`
    FOREIGN KEY (`Product_Product Id`)
    REFERENCES `RentIt`.`Product` (`Product Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaction in progress_User1`
    FOREIGN KEY (`Rentor ID`)
    REFERENCES `RentIt`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaction in progress_User2`
    FOREIGN KEY (`Rentee ID`)
    REFERENCES `RentIt`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;