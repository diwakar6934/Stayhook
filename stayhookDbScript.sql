-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema stayhookdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema stayhookdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `stayhookdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `stayhookdb` ;

-- -----------------------------------------------------
-- Table `stayhookdb`.`__efmigrationshistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stayhookdb`.`__efmigrationshistory` (
  `MigrationId` VARCHAR(95) NOT NULL,
  `ProductVersion` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`MigrationId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stayhookdb`.`amenities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stayhookdb`.`amenities` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `DorLivingRoom` TINYINT(1) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stayhookdb`.`aspnetroles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stayhookdb`.`aspnetroles` (
  `Id` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `Name` VARCHAR(256) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `NormalizedName` VARCHAR(256) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `ConcurrencyStamp` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `RoleNameIndex` (`NormalizedName` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stayhookdb`.`aspnetroleclaims`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stayhookdb`.`aspnetroleclaims` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `RoleId` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `ClaimType` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `ClaimValue` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_AspNetRoleClaims_RoleId` (`RoleId` ASC) VISIBLE,
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId`
    FOREIGN KEY (`RoleId`)
    REFERENCES `stayhookdb`.`aspnetroles` (`Id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stayhookdb`.`aspnetusers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stayhookdb`.`aspnetusers` (
  `Id` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `FirstName` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `LastName` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `PhoneNo` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `UserName` VARCHAR(256) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `NormalizedUserName` VARCHAR(256) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `Email` VARCHAR(256) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `NormalizedEmail` VARCHAR(256) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `EmailConfirmed` TINYINT(1) NOT NULL,
  `PasswordHash` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `SecurityStamp` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `ConcurrencyStamp` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `PhoneNumber` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `PhoneNumberConfirmed` TINYINT(1) NOT NULL,
  `TwoFactorEnabled` TINYINT(1) NOT NULL,
  `LockoutEnd` DATETIME(6) NULL DEFAULT NULL,
  `LockoutEnabled` TINYINT(1) NOT NULL,
  `AccessFailedCount` INT NOT NULL,
  `IsVerrified` TINYINT(1) NOT NULL DEFAULT '0',
  `ResetToken` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `ResetTokenExpires` DATETIME(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `UserNameIndex` (`NormalizedUserName` ASC) VISIBLE,
  INDEX `EmailIndex` (`NormalizedEmail` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stayhookdb`.`aspnetuserclaims`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stayhookdb`.`aspnetuserclaims` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `UserId` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `ClaimType` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `ClaimValue` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_AspNetUserClaims_UserId` (`UserId` ASC) VISIBLE,
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId`
    FOREIGN KEY (`UserId`)
    REFERENCES `stayhookdb`.`aspnetusers` (`Id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stayhookdb`.`aspnetuserlogins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stayhookdb`.`aspnetuserlogins` (
  `LoginProvider` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `ProviderKey` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `ProviderDisplayName` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `UserId` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  PRIMARY KEY (`LoginProvider`, `ProviderKey`),
  INDEX `IX_AspNetUserLogins_UserId` (`UserId` ASC) VISIBLE,
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId`
    FOREIGN KEY (`UserId`)
    REFERENCES `stayhookdb`.`aspnetusers` (`Id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stayhookdb`.`aspnetuserroles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stayhookdb`.`aspnetuserroles` (
  `UserId` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `RoleId` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  PRIMARY KEY (`UserId`, `RoleId`),
  INDEX `IX_AspNetUserRoles_RoleId` (`RoleId` ASC) VISIBLE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId`
    FOREIGN KEY (`RoleId`)
    REFERENCES `stayhookdb`.`aspnetroles` (`Id`)
    ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId`
    FOREIGN KEY (`UserId`)
    REFERENCES `stayhookdb`.`aspnetusers` (`Id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stayhookdb`.`aspnetusertokens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stayhookdb`.`aspnetusertokens` (
  `UserId` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `LoginProvider` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `Name` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `Value` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`UserId`, `LoginProvider`, `Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId`
    FOREIGN KEY (`UserId`)
    REFERENCES `stayhookdb`.`aspnetusers` (`Id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stayhookdb`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stayhookdb`.`products` (
  `ProductId` INT NOT NULL AUTO_INCREMENT,
  `Name` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `Category` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `Color` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `UnitPrice` DECIMAL(65,30) NOT NULL,
  `AvailableQuantity` INT NOT NULL,
  PRIMARY KEY (`ProductId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stayhookdb`.`refreshtoken`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stayhookdb`.`refreshtoken` (
  `ApplicatioUserId` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Token` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `Expires` DATETIME(6) NOT NULL,
  `Created` DATETIME(6) NOT NULL,
  `Revoked` DATETIME(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`, `ApplicatioUserId`),
  INDEX `FK_RefreshToken_AspNetUsers_ApplicatioUserId` (`ApplicatioUserId` ASC) VISIBLE,
  CONSTRAINT `FK_RefreshToken_AspNetUsers_ApplicatioUserId`
    FOREIGN KEY (`ApplicatioUserId`)
    REFERENCES `stayhookdb`.`aspnetusers` (`Id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `stayhookdb`.`userinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stayhookdb`.`userinfo` (
  `UserId` INT NOT NULL AUTO_INCREMENT,
  `FirstName` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `LastName` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `UserName` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `Email` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `Password` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `PhoneNo` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `CreatedDate` DATETIME(6) NOT NULL,
  PRIMARY KEY (`UserId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
