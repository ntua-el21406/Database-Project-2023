-- MySQL Script generated by MySQL Workbench
-- Sat May  6 00:50:05 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Semester Project 2
-- -----------------------------------------------------
#DROP DATABASE `semester project 2`;
-- -----------------------------------------------------
-- Schema Semester Project 2
-- -----------------------------------------------------
#DROP DATABASE `semester project 2`;
CREATE SCHEMA IF NOT EXISTS `Semester Project 2` DEFAULT CHARACTER SET utf8 ;
USE `Semester Project 2` ;

-- -----------------------------------------------------
-- Table `Semester Project 2`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Semester Project 2`.`Address` (
  `Address_Id` INT NOT NULL,
  `Street` VARCHAR(45) NULL,
  `Number` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `Zip/Postal Code` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  PRIMARY KEY (`Address_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Semester Project 2`.`School Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Semester Project 2`.`School_Admin` (
  `School_Admin_Id` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`School_Admin_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Semester Project 2`.`School`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Semester Project 2`.`School` (
  `idSchool` INT NOT NULL,
  `School_Name` VARCHAR(45) NULL,
  `Phone` VARCHAR(50) NULL,
  `Email` VARCHAR(45) NULL,
  `Administrator_ID` VARCHAR(50) NULL,
  `Address_Id` INT NOT NULL,
  `School_Admin_Id` INT NOT NULL,
  PRIMARY KEY (`idSchool`),
  INDEX `fk_School_Address1_idx` (`Address_Id` ) ,
  INDEX `fk_School_School_Admin1_idx` (`School_Admin_Id` ) ,
  CONSTRAINT `fk_School_Address1`
    FOREIGN KEY (`Address_Id`)
    REFERENCES `Semester Project 2`.`Address` (`Address_Id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_School_Admin1`
    FOREIGN KEY (`School_Admin_Id`)
    REFERENCES `Semester Project 2`.`School_Admin` (`School_Admin_Id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Semester Project 2`.`Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Semester Project 2`.`Books` (
  `Book_Id` INT NOT NULL,
  `ISBN` VARCHAR(45) NULL,
  `Title` VARCHAR(450) NULL,
  `Publisher` VARCHAR(45) NULL,
  `Pages` INT NULL,
  `Available_Copies` INT NULL,
  `Image` VARCHAR(450) NULL,
  `Summary` VARCHAR(2500) NULL,
  `Language` VARCHAR(45) NULL,
  `KeyWords` VARCHAR(100) NULL,
  `School_idSchool` INT NOT NULL,
  PRIMARY KEY (`Book_Id`),
  INDEX `fk_Books_School1_idx` (`School_idSchool` ),
  CONSTRAINT `fk_Books_School1`
    FOREIGN KEY (`School_idSchool`)
    REFERENCES `Semester Project 2`.`School` (`idSchool`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Semester Project 2`.`Author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Semester Project 2`.`Author` (
  `Author_Id` INT NOT NULL,
  `First_Name` VARCHAR(45) NULL,
  `Last_Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Author_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Semester Project 2`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Semester Project 2`.`Categories` (
  `Category_Id` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Summary` VARCHAR(5000) NULL,
  PRIMARY KEY (`Category_Id`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Semester Project 2`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Semester Project 2`.`Users` (
  `User_ID` INT NOT NULL AUTO_INCREMENT,
  `Username` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  `First_Name` VARCHAR(45) NULL,
  `Last_Name` VARCHAR(45) NULL,
  `Age` INT NULL,
  `email` VARCHAR(45) NULL,
  `Registration_Status` INT NULL,
  `Borrowred_Card_Number` VARCHAR(45) NULL,
  `Number_Of_Loaned_Books` INT NULL,
  `Type` INT NULL,
  `School_Id` INT NOT NULL,
  PRIMARY KEY (`User_ID`),
  INDEX `NAME` (`First_Name` , `Last_Name` ) ,
  INDEX `fk_Users_School1_idx` (`School_Id` ) ,
  CONSTRAINT `fk_Users_School1`
    FOREIGN KEY (`School_Id`)
    REFERENCES `Semester Project 2`.`School` (`idSchool`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Semester Project 2`.`Borrow`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Semester Project 2`.`Borrow` (
  `Borrow_ID` INT NOT NULL AUTO_INCREMENT,
  `Status` INT NULL COMMENT 'its going to be 0,1 or 2',
  `Day_of_Return` DATE NULL,
  `Date_of_Borrow` DATE NULL,
  `School_Admin_Id` VARCHAR(45) NOT NULL,
  `Books_Book_Id` INT NOT NULL,
  `User_ID` INT NOT NULL,
 
  PRIMARY KEY (`Borrow_ID`),
  INDEX `fk_Borrow_Books1_idx` (`Books_Book_Id` ),
  CONSTRAINT `fk_Borrow_Books1`
    FOREIGN KEY (`Books_Book_Id`)
    REFERENCES `Semester Project 2`.`Books` (`Book_Id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  INDEX `fk_User_idx` (`User_ID` ),
  CONSTRAINT `fk_Borrow_User1`
    FOREIGN KEY (`User_ID`)
    REFERENCES `Semester Project 2`.`Users` (`User_Id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Semester Project 2`.`Review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Semester Project 2`.`Review` (
  `Review_Id` INT NOT NULL auto_increment,
   `User_ID` INT NOT NULL,
  `Text` VARCHAR(45) NULL,
  `Linkert_Scale` VARCHAR(45) NULL,
  `Books_Book_Id` INT NOT NULL,
  PRIMARY KEY (`Review_Id`),
  INDEX `fk_Review_Books1_idx` (`Books_Book_Id` ) ,
  CONSTRAINT `fk_Review_Books1`
    FOREIGN KEY (`Books_Book_Id`)
    REFERENCES `Semester Project 2`.`Books` (`Book_Id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  INDEX `fk_Review_User_idx` (`User_ID` ),
  CONSTRAINT `fk_Review_User1`
    FOREIGN KEY (`User_ID`)
    REFERENCES `Semester Project 2`.`Users` (`User_Id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Semester Project 2`.`Reservations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Semester Project 2`.`Reservations` (
  `Reservations_Id` INT NOT NULL,
  `Reservation_Date` DATE NULL,
  `Expiration_of_Reservation` DATE NULL,
  `User_ID` INT NOT NULL,
  `Reservationscol` VARCHAR(45) NULL,
  `School_id` INT NOT NULL,
  `Book_Id` INT NOT NULL,
  PRIMARY KEY (`Reservations_Id`),
  INDEX `fk_Reservations_Users1_idx` (`User_ID` ) ,
  INDEX `fk_Reservations_Books1_idx` (`School_id` , `Book_Id` ) ,
  CONSTRAINT `fk_Reservations_Users1`
    FOREIGN KEY (`User_ID`)
    REFERENCES `Semester Project 2`.`Users` (`User_ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Reservations_Books1`
    FOREIGN KEY (`School_id` , `Book_Id`)
    REFERENCES `Semester Project 2`.`Books` (`School_idSchool` , `Book_Id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE author_book (
    id INT PRIMARY KEY,
    author_id INT,
    book_id INT,
    
    INDEX `fk_Book_Id_idx` (`book_id` ) ,
	INDEX `fk_Author_Id_idx` (`author_id` ), 
  
    CONSTRAINT fk_Book_Id
    FOREIGN KEY (book_id)
    REFERENCES `Semester Project 2`.`Books` (Book_Id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
    
    CONSTRAINT fk_Author_Id
    FOREIGN KEY (author_id)
    REFERENCES `Semester Project 2`.`Author` (Author_Id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE category_book (
    id INT PRIMARY KEY,
    category_id INT,
    book_id INT,
    
    INDEX `fk_Book_Id_idx` (`book_id` ) ,
	INDEX `fk_Category_Id_idx` (`category_id` ), 
  
    CONSTRAINT fk_Book_Cat_Id
    FOREIGN KEY (book_id)
    REFERENCES `Semester Project 2`.`Books` (Book_Id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
    
    CONSTRAINT fk_Category_Id
    FOREIGN KEY (category_id)
    REFERENCES `Semester Project 2`.`Categories` (Category_Id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
