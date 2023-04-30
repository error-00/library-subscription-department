-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ihnatieva
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ihnatieva
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ihnatieva` DEFAULT CHARACTER SET utf8 ;
USE `Ihnatieva` ;

-- -----------------------------------------------------
-- Table `Ihnatieva`.`publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ihnatieva`.`publisher` (
  `ID_publisher` INT NOT NULL,
  `name_publisher` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_publisher`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ihnatieva`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ihnatieva`.`book` (
  `ISBN` VARCHAR(20) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `public_city` VARCHAR(45) NOT NULL,
  `year` INT NOT NULL,
  `page_num` INT NOT NULL,
  `copies_num` INT NOT NULL,
  `publisher_ID_publisher` INT NOT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `fk_book_publisher1_idx` (`publisher_ID_publisher` ASC) VISIBLE,
  CONSTRAINT `fk_book_publisher1`
    FOREIGN KEY (`publisher_ID_publisher`)
    REFERENCES `Ihnatieva`.`publisher` (`ID_publisher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ihnatieva`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ihnatieva`.`author` (
  `ID_author` INT NOT NULL,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`ID_author`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ihnatieva`.`book_has_author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ihnatieva`.`book_has_author` (
  `book_ISBN` VARCHAR(20) NOT NULL,
  `author_ID_author` INT NOT NULL,
  PRIMARY KEY (`book_ISBN`, `author_ID_author`),
  INDEX `fk_book_has_author_author1_idx` (`author_ID_author` ASC) VISIBLE,
  INDEX `fk_book_has_author_book_idx` (`book_ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_book_has_author_book`
    FOREIGN KEY (`book_ISBN`)
    REFERENCES `Ihnatieva`.`book` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_has_author_author1`
    FOREIGN KEY (`author_ID_author`)
    REFERENCES `Ihnatieva`.`author` (`ID_author`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ihnatieva`.`copies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ihnatieva`.`copies` (
  `inventory_num` INT NOT NULL,
  `cost` DECIMAL(7,2) NOT NULL,
  `place` INT NOT NULL,
  `shelf` INT NOT NULL,
  `book_ISBN` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`inventory_num`),
  INDEX `fk_copies_book1_idx` (`book_ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_copies_book1`
    FOREIGN KEY (`book_ISBN`)
    REFERENCES `Ihnatieva`.`book` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ihnatieva`.`readers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ihnatieva`.`readers` (
  `read_ticket_num` INT NOT NULL,
  `PIB` VARCHAR(100) NOT NULL,
  `home_adress` VARCHAR(45) NOT NULL,
  `tel_work` VARCHAR(10) NOT NULL,
  `tel_home` VARCHAR(10) NULL,
  `birth_date` DATE NOT NULL,
  PRIMARY KEY (`read_ticket_num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ihnatieva`.`books_delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ihnatieva`.`books_delivery` (
  `readers_read_ticket_num` INT NOT NULL,
  `copies_inventory_num` INT NOT NULL,
  `data_issue` DATE NOT NULL,
  `date_return` DATE NOT NULL,
  PRIMARY KEY (`readers_read_ticket_num`, `copies_inventory_num`, `data_issue`),
  INDEX `fk_readers_has_copies_copies1_idx` (`copies_inventory_num` ASC) VISIBLE,
  INDEX `fk_readers_has_copies_readers1_idx` (`readers_read_ticket_num` ASC) VISIBLE,
  CONSTRAINT `fk_readers_has_copies_readers1`
    FOREIGN KEY (`readers_read_ticket_num`)
    REFERENCES `Ihnatieva`.`readers` (`read_ticket_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_readers_has_copies_copies1`
    FOREIGN KEY (`copies_inventory_num`)
    REFERENCES `Ihnatieva`.`copies` (`inventory_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ihnatieva`.`knowledge_field`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ihnatieva`.`knowledge_field` (
  `unique_num` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `knowledge_field_unique_num` INT NOT NULL,
  PRIMARY KEY (`unique_num`),
  INDEX `fk_knowledge_field_knowledge_field1_idx` (`knowledge_field_unique_num` ASC) VISIBLE,
  CONSTRAINT `fk_knowledge_field_knowledge_field1`
    FOREIGN KEY (`knowledge_field_unique_num`)
    REFERENCES `Ihnatieva`.`knowledge_field` (`unique_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ihnatieva`.`knowledge_field_has_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ihnatieva`.`knowledge_field_has_book` (
  `knowledge_field_unique_num` INT NOT NULL,
  `book_ISBN` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`knowledge_field_unique_num`, `book_ISBN`),
  INDEX `fk_knowledge_field_has_book_book1_idx` (`book_ISBN` ASC) VISIBLE,
  INDEX `fk_knowledge_field_has_book_knowledge_field1_idx` (`knowledge_field_unique_num` ASC) VISIBLE,
  CONSTRAINT `fk_knowledge_field_has_book_knowledge_field1`
    FOREIGN KEY (`knowledge_field_unique_num`)
    REFERENCES `Ihnatieva`.`knowledge_field` (`unique_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_knowledge_field_has_book_book1`
    FOREIGN KEY (`book_ISBN`)
    REFERENCES `Ihnatieva`.`book` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
