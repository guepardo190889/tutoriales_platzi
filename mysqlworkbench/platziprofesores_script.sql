-- MySQL Script generated by MySQL Workbench
-- Sun Jun  3 08:10:21 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema platziprofesores
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema platziprofesores
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `platziprofesores` DEFAULT CHARACTER SET utf8 ;
USE `platziprofesores` ;

-- -----------------------------------------------------
-- Table `platziprofesores`.`teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `platziprofesores`.`teacher` (
  `id_teacher` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(250) NOT NULL,
  `avatar` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id_teacher`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `platziprofesores`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `platziprofesores`.`course` (
  `id_course` INT NOT NULL AUTO_INCREMENT,
  `id_teacher` INT NULL,
  `name` VARCHAR(250) NOT NULL,
  `themes` TEXT NULL,
  `project` VARCHAR(250) NULL,
  PRIMARY KEY (`id_course`),
  INDEX `fk_course_teacher1_idx` (`id_teacher` ASC),
  CONSTRAINT `fk_course_teacher1`
    FOREIGN KEY (`id_teacher`)
    REFERENCES `platziprofesores`.`teacher` (`id_teacher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `platziprofesores`.`social_media`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `platziprofesores`.`social_media` (
  `id_social_media` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(250) NOT NULL,
  `icon` VARCHAR(250) NULL,
  PRIMARY KEY (`id_social_media`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `platziprofesores`.`teacher_social_media`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `platziprofesores`.`teacher_social_media` (
  `id_teacher_social_media` INT NOT NULL AUTO_INCREMENT,
  `id_social_media` INT NOT NULL,
  `id_teacher` INT NOT NULL,
  `nickname` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id_teacher_social_media`),
  INDEX `fk_teacher_social_media_social_media1_idx` (`id_social_media` ASC),
  INDEX `fk_teacher_social_media_teache1_idx` (`id_teacher` ASC),
  CONSTRAINT `fk_teacher_social_media_social_media1`
    FOREIGN KEY (`id_social_media`)
    REFERENCES `platziprofesores`.`social_media` (`id_social_media`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_social_media_teache1`
    FOREIGN KEY (`id_teacher`)
    REFERENCES `platziprofesores`.`teacher` (`id_teacher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
