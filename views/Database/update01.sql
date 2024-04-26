DROP DATABASE fitness_for_everyone;


-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Fitness_For_Everyone
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Fitness_For_Everyone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Fitness_For_Everyone` DEFAULT CHARACTER SET utf8 ;
USE `Fitness_For_Everyone` ;

-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`role` (
  `id` VARCHAR(8) NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = INNODB;




CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`role1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER role_insert
BEFORE INSERT ON role
FOR EACH ROW
BEGIN
  INSERT INTO role1 VALUES (NULL);
  SET NEW.id = CONCAT('R-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;






-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`useraccount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`useraccount` (
  `id` VARCHAR(8) NOT NULL,
  `user_name` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `role_id` VARCHAR(8) NOT NULL,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `role_id`),
  CONSTRAINT `fk_useraccount_Role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `Fitness_For_Everyone`.`role` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_useraccount_Role1_idx` ON `Fitness_For_Everyone`.`useraccount` (`role_id` ASC) VISIBLE;



CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`useraccount1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER useraccount_insert
BEFORE INSERT ON useraccount
FOR EACH ROW
BEGIN
  INSERT INTO useraccount1 VALUES (NULL);
  SET NEW.id = CONCAT('UA-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;











-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`customer_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`customer_details` (
  `id` VARCHAR(8) NOT NULL,
  `age` INT(2) NULL,
  `height` DECIMAL(7,2) NULL,
  `chest` DECIMAL(7,2) NULL,
  `weight` DECIMAL(7,2) NULL,
  `issues` VARCHAR(1000) NULL,
  `name` VARCHAR(45) NULL,
  `arm_sizes` DECIMAL(7,2) NULL,
  `staff_id` VARCHAR(8) NOT NULL,
  `customer_id` VARCHAR(8) NOT NULL,
  `exercises` VARCHAR(20000) NULL,
  PRIMARY KEY (`id`, `staff_id`, `customer_id`),
  CONSTRAINT `fk_customer_details_staff1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `Fitness_For_Everyone`.`staff` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_details_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Fitness_For_Everyone`.`customer` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_customer_details_staff1_idx` ON `Fitness_For_Everyone`.`customer_details` (`staff_id` ASC) VISIBLE;

CREATE INDEX `fk_customer_details_customer1_idx` ON `Fitness_For_Everyone`.`customer_details` (`customer_id` ASC) VISIBLE;




CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`customer_details1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER customer_details_insert
BEFORE INSERT ON customer_details
FOR EACH ROW
BEGIN
  INSERT INTO customer_details1 VALUES (NULL);
  SET NEW.id = CONCAT('CD-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;
















-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`schedule_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`schedule_details` (
  `id` VARCHAR(8) NOT NULL,
  `given_date` DATE NULL,
  `renew_date` DATE DEFAULT '2022-06-06',
  `exercises` VARCHAR(1000) NULL,
  `remarks` VARCHAR(2000) NULL,
  `customer_details_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`, `customer_details_id`),
  CONSTRAINT `fk_schedule_details_customer_details1`
    FOREIGN KEY (`customer_details_id`)
    REFERENCES `Fitness_For_Everyone`.`customer_details` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_schedule_details_customer_details1_idx` ON `Fitness_For_Everyone`.`schedule_details` (`customer_details_id` ASC) VISIBLE;



CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`schedule_details1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);


DELIMITER $$
CREATE TRIGGER schedule_details_insert
BEFORE INSERT ON schedule_details
FOR EACH ROW
BEGIN
  INSERT INTO schedule_details1 VALUES (NULL);
  SET NEW.id = CONCAT('SD-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;



















DELIMITER $$
create trigger schedule_insert_trigger after INSERT  on customer_details
  for each row
   begin
 IF (130<=NEW.height AND  NEW.height<160)   then 
 			IF (30<=NEW.weight AND NEW.weight<50)   then 
 			insert into schedule_details(customer_details_id,given_date,exercises) values (NEW.id,CURDATE(),'Day 01 --> Bench Press 5*3, Flys Machine 5*3,Pull Over 5*3, Lat Pull Down 5*3, Shoulder Press 5*3, D/B Curl 5*3  Day 02-->  D/B Extension 5*3, Press Down 5*3, Squats 5*3, Leg Curl 5*3, Leg Extension 5*3, Calf 5*3 ');
  			END if; 
  			
  			IF (50<=NEW.weight)   then 
  			insert into schedule_details(customer_details_id,given_date,exercises) values (NEW.id,CURDATE(),'Day 01 --> Bench Press 8*3, Flys Machine 8*3,Pull Over 8*3, Lat Pull Down 8*3, Shoulder Press 8*3, D/B Curl 8*3  Day 02-->  D/B Extension 8*3, Press Down 8*3, Squats 8*3, Leg Curl 8*3, Leg Extension 8*3, Calf 8*3 ');
  			END if; 
 END if;
   
   
 IF (160<=NEW.height AND NEW.height<170) then 
 			IF (40<=NEW.weight AND NEW.weight<60)   then 
			insert into schedule_details(customer_details_id,given_date,exercises) values (NEW.id,CURDATE(),'Day 01 --> Bench Press 10*3, Flys Machine 10*3,Pull Over 10*3, Lat Pull Down 10*3, Shoulder Press 10*3, D/B Curl 10*3  Day 02-->  D/B Extension 10*3, Press Down 10*3, Squats 10*3, Leg Curl 10*3, Leg Extension 10*3, Calf 10*3 ');
 			END if; 
 
 			IF (60<=NEW.weight)   then 
			insert into schedule_details(customer_details_id,given_date,exercises) values (NEW.id,CURDATE(),'Day 01 --> Bench Press 12*3, Flys Machine 12*3,Pull Over 12*3, Lat Pull Down 12*3, Shoulder Press 12*3, D/B Curl 12*3  Day 02-->  D/B Extension 12*3, Press Down 12*3, Squats 12*3, Leg Curl 12*3, Leg Extension 12*3, Calf 12*3 ');
 			END if; 
 END if; 
    
  
 IF  (170<=NEW.height AND NEW.height<180)  then   
   	insert into schedule_details(customer_details_id,given_date,exercises) values (NEW.id,CURDATE(),'Day 01 --> Bench Press 12*3, Flys Machine 12*3,Pull Over 12*3, Lat Pull Down 12*3, Shoulder Press 12*3, D/B Curl 12*3  Day 02-->  D/B Extension 12*3, Press Down 12*3, Squats 12*3, Leg Curl 12*3, Leg Extension 12*3, 	Calf 12*3 Day 03 --> Bench Press 12*3, Flys Machine 12*3,Pull Over 12*3, Lat Pull Down 12*3, Shoulder Press 12*3, D/B Curl 12*3');
 END if; 
   
   
 IF  (180<=NEW.height)  then  
   	insert into schedule_details(customer_details_id,given_date,exercises) values (NEW.id,CURDATE(),'Day 01 --> Bench Press 15*3, Flys Machine 15*3,Pull Over 15*3, Lat Pull Down 15*3, Shoulder Press 15*3, D/B Curl 15*3  Day 02-->  D/B Extension 15*3, Press Down 15*3, Squats 15*3, Leg Curl 15*3, Leg Extension 15*3, 	Calf 15*3 Day 03 --> Bench Press 15*3, Flys Machine 15*3,Pull Over 15*3, Lat Pull Down 15*3, Shoulder Press 15*3, D/B Curl 15*3');
 END if; 

  

END$$
DELIMITER ;




DELIMITER $$
create trigger schedule_update_trigger after update  on customer_details
  for each row
   begin
   
 IF (130<=NEW.height AND  NEW.height<160 )   then 
 			IF (30<=NEW.weight AND NEW.weight<50)   then 
   					update schedule_details SET 
   					given_date = CURDATE(),
						exercises = ' Day 01 --> Bench Press 5*3, Flys Machine 5*3,Pull Over 5*3, Lat Pull Down 5*3, Shoulder Press 5*3, D/B Curl 5*3  Day 02-->  D/B Extension 5*3, Press Down 5*3, Squats 5*3, Leg Curl 5*3, Leg Extension 5*3, Calf 5*3 '
						WHERE customer_details_id=new.id ;
  			END if;
  			IF ( 50<=NEW.weight)   then  
   					update schedule_details SET 
   					given_date = CURDATE(),
						exercises = 'Day 01 --> Bench Press 8*3, Flys Machine 8*3,Pull Over 8*3, Lat Pull Down 8*3, Shoulder Press 8*3, D/B Curl 8*3  Day 02-->  D/B Extension 8*3, Press Down 8*3, Squats 8*3, Leg Curl 8*3, Leg Extension 8*3, Calf 8*3 '
						WHERE customer_details_id=new.id ;
  			END if;
  END if;
  
  
 IF (160<=NEW.height AND NEW.height<170) then 
 			IF (40<=NEW.weight AND NEW.weight<60)   then 
   					update schedule_details SET 
   					given_date = CURDATE(),
						exercises = 'Day 01 --> Bench Press 10*3, Flys Machine 10*3,Pull Over 10*3, Lat Pull Down 10*3, Shoulder Press 10*3, D/B Curl 10*3  Day 02-->  D/B Extension 10*3, Press Down 10*3, Squats 10*3, Leg Curl 10*3, Leg Extension 10*3, Calf 10*3 '
						WHERE customer_details_id=new.id ;
  			END if;
  			IF (60<=NEW.weight)   then 
   					update schedule_details SET 
   					given_date = CURDATE(),
						exercises = 'Day 01 --> Bench Press 12*3, Flys Machine 12*3,Pull Over 12*3, Lat Pull Down 12*3, Shoulder Press 12*3, D/B Curl 12*3  Day 02-->  D/B Extension 12*3, Press Down 12*3, Squats 12*3, Leg Curl 12*3, Leg Extension 12*3, Calf 12*3 '
						WHERE customer_details_id=new.id ;
  			END if;
  END if;
  
 IF  (170<=NEW.height AND NEW.height<180)  then  
   		update schedule_details SET 
   		given_date = CURDATE(),
			exercises = 'Day 01 --> Bench Press 12*3, Flys Machine 12*3,Pull Over 12*3, Lat Pull Down 12*3, Shoulder Press 12*3, D/B Curl 12*3  Day 02-->  D/B Extension 12*3, Press Down 12*3, Squats 12*3, Leg Curl 12*3, Leg Extension 12*3, 	Calf 12*3 Day 03 --> Bench Press 12*3, Flys Machine 12*3,Pull Over 12*3, Lat Pull Down 12*3, Shoulder Press 12*3, D/B Curl 12*3'
			WHERE customer_details_id=new.id ;
  END if;
  
 IF  (180<=NEW.height)  then   
   		update schedule_details SET 
   		given_date = CURDATE(),
			exercises = 'Day 01 --> Bench Press 15*3, Flys Machine 15*3,Pull Over 15*3, Lat Pull Down 15*3, Shoulder Press 15*3, D/B Curl 15*3  Day 02-->  D/B Extension 15*3, Press Down 15*3, Squats 15*3, Leg Curl 15*3, Leg Extension 15*3, 	Calf 15*3 Day 03 --> Bench Press 15*3, Flys Machine 15*3,Pull Over 15*3, Lat Pull Down 15*3, Shoulder Press 15*3, D/B Curl 15*3'
			WHERE customer_details_id=new.id ;
  END if;
  
  
END$$
DELIMITER ;





DELIMITER $$
create trigger customer_details after DELETE  on schedule_details
  for each row
   begin
  
     delete from schedule_details where id=OLD.id ;


END$$
DELIMITER ;











-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`customer_progress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`customer_progress` (
  `id` VARCHAR(8) NOT NULL,
  `progress_details` VARCHAR(2000) NULL,
  `schedule_details_id` VARCHAR(8) NOT NULL,
  `customer_details_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`, `schedule_details_id`, `customer_details_id`),
  CONSTRAINT `fk_customer_progress_schedule_Details1`
    FOREIGN KEY (`schedule_details_id`)
    REFERENCES `Fitness_For_Everyone`.`schedule_details` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_progress_customer_details1`
    FOREIGN KEY (`customer_details_id`)
    REFERENCES `Fitness_For_Everyone`.`customer_details` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_customer_progress_schedule_Details1_idx` ON `Fitness_For_Everyone`.`customer_progress` (`schedule_details_id` ASC) VISIBLE;

CREATE INDEX `fk_customer_progress_customer_details1_idx` ON `Fitness_For_Everyone`.`customer_progress` (`customer_details_id` ASC) VISIBLE;




CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`customer_progress1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER customer_progress_insert
BEFORE INSERT ON customer_progress
FOR EACH ROW
BEGIN
  INSERT INTO customer_progress1 VALUES (NULL);
  SET NEW.id = CONCAT('CP-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;










DELIMITER $$
CREATE TRIGGER customer_progress_insert_trigger 
AFTER INSERT ON schedule_details
FOR EACH ROW
BEGIN
insert into customer_progress(schedule_details_id, customer_details_id, progress_details) values (new.id, new.customer_details_id, 'Test');

END$$
DELIMITER ;



DELIMITER $$
create trigger customer_progress_delete_trigger after DELETE  on schedule_details
  for each row
   begin
  
     delete from customer_progress where id=OLD.id ;


END$$
DELIMITER ;









-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`designation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`designation` (
  `id` VARCHAR(8) NOT NULL DEFAULT '01',
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`designation1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER designation_insert
BEFORE INSERT ON designation
FOR EACH ROW
BEGIN
  INSERT INTO designation1 VALUES (NULL);
  SET NEW.id = CONCAT('D-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;





-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`gender`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`gender` (
  `id` VARCHAR(8) NOT NULL,
  `gender` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`gender1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER gender_insert
BEFORE INSERT ON gender
FOR EACH ROW
BEGIN
  INSERT INTO gender1 VALUES (NULL);
  SET NEW.id = CONCAT('G-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;



-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`staff` (
  `id` VARCHAR(8) NOT NULL,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `designation_id` VARCHAR(8) NOT NULL,
  `gender_id` VARCHAR(8) NOT NULL,
  `telephone` INT NULL,
  `address` VARCHAR(200) NULL,
  `email` VARCHAR(45) NULL,
  `dob` DATE NOT NULL DEFAULT '1990-01-01',
  `doj` DATE NOT NULL DEFAULT '2022-01-01',
  `description` VARCHAR(2000) NULL,
  `useraccount_id` VARCHAR(8) NOT NULL,
  `useraccount_role_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`, `designation_id`, `gender_id`, `useraccount_id`),
  CONSTRAINT `fk_Staff_Designation1`
    FOREIGN KEY (`designation_id`)
    REFERENCES `Fitness_For_Everyone`.`designation` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Staff_gender1`
    FOREIGN KEY (`gender_id`)
    REFERENCES `Fitness_For_Everyone`.`gender` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Staff_useraccount1`
    FOREIGN KEY (`useraccount_id` , `useraccount_role_id`)
    REFERENCES `Fitness_For_Everyone`.`useraccount` (`id` , `role_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Staff_Designation1_idx` ON `Fitness_For_Everyone`.`staff` (`designation_id` ASC) VISIBLE;

CREATE INDEX `fk_Staff_gender1_idx` ON `Fitness_For_Everyone`.`staff` (`gender_id` ASC) VISIBLE;

CREATE INDEX `fk_Staff_useraccount1_idx` ON `Fitness_For_Everyone`.`staff` (`useraccount_id` ASC, `useraccount_role_id` ASC) VISIBLE;






CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`staff1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER staff_insert
BEFORE INSERT ON staff
FOR EACH ROW
BEGIN
  INSERT INTO staff1 VALUES (NULL);
  SET NEW.id = CONCAT('S-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;














-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`membership` (
  `id` VARCHAR(8) NOT NULL,
  `name` VARCHAR(200) NULL,
  `description` VARCHAR(2000) NULL,
  `fee` DECIMAL NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`membership1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER membership_insert
BEFORE INSERT ON membership
FOR EACH ROW
BEGIN
  INSERT INTO membership1 VALUES (NULL);
  SET NEW.id = CONCAT('M-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;





-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`payment_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`payment_type` (
  `id` VARCHAR(8) NOT NULL,
  `payment_type_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`payment_type1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER payment_type_insert
BEFORE INSERT ON payment_type
FOR EACH ROW
BEGIN
  INSERT INTO payment_type1 VALUES (NULL);
  SET NEW.id = CONCAT('PT-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;





-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`payment` (
  `id` VARCHAR(8) NOT NULL,
  `amount` DECIMAL NULL,
  `date` DATE NOT NULL DEFAULT '2022-01-01',
  `payment_type_id` VARCHAR(8) NOT NULL,
  `status` VARCHAR(12) NULL,
  `remarks` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`, `payment_type_id`),
  CONSTRAINT `fk_payment_type1`
    FOREIGN KEY (`payment_type_id`)
    REFERENCES `Fitness_For_Everyone`.`payment_type` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_payment_payment_type1_idx` ON `Fitness_For_Everyone`.`payment` (`payment_type_id` ASC) VISIBLE;



CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`payment1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER payment_insert
BEFORE INSERT ON payment
FOR EACH ROW
BEGIN
  INSERT INTO payment1 VALUES (NULL);
  SET NEW.id = CONCAT('P-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;






















-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`membership_payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`membership_payment` (
  `id` VARCHAR(8) NOT NULL,
  `date` DATE NOT NULL DEFAULT '2022-01-01',
  `amount` DECIMAL NULL,
  `payment_payment_type_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`, `payment_payment_type_id`),
  CONSTRAINT `fk_membership_payment_payment1`
    FOREIGN KEY ( `payment_payment_type_id`)
    REFERENCES `Fitness_For_Everyone`.`payment_type` ( `id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_membership_payment_payment1_idx` ON `Fitness_For_Everyone`.`membership_payment` (`payment_payment_type_id` ASC) VISIBLE;



CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`membership_payment1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER membership_payment_insert
BEFORE INSERT ON membership_payment
FOR EACH ROW
BEGIN
  INSERT INTO membership_payment1 VALUES (NULL);
  SET NEW.id = CONCAT('MP-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;





















-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`register`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`register` (
  `id` VARCHAR(8) NOT NULL,
  `date` DATE NOT NULL DEFAULT '2022-01-01',
  `remark` VARCHAR(2000) NULL,
  `reg_fee` DECIMAL NULL,
  `membership_id` VARCHAR(8) NOT NULL,
  `membership_payment_id` VARCHAR(8) NOT NULL,
  `customer_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`, `membership_id`, `membership_payment_id`, `customer_id`),
  CONSTRAINT `fk_register_membership1`
    FOREIGN KEY (`membership_id`)
    REFERENCES `Fitness_For_Everyone`.`membership` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_register_membership_payment1`
    FOREIGN KEY (`membership_payment_id`)
    REFERENCES `Fitness_For_Everyone`.`membership_payment` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_register_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Fitness_For_Everyone`.`customer` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_register_membership1_idx` ON `Fitness_For_Everyone`.`register` (`membership_id` ASC) VISIBLE;

CREATE INDEX `fk_register_membership_payment1_idx` ON `Fitness_For_Everyone`.`register` (`membership_payment_id` ASC) VISIBLE;

CREATE INDEX `fk_register_customer1_idx` ON `Fitness_For_Everyone`.`register` (`customer_id` ASC) VISIBLE;




CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`register1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER register_insert
BEFORE INSERT ON register
FOR EACH ROW
BEGIN
  INSERT INTO register1 VALUES (NULL);
  SET NEW.id = CONCAT('RE-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;











-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`customer` (
  `id` VARCHAR(8) NOT NULL ,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `address` VARCHAR(200) NULL,
  `telephone` INT(10) NULL,
  `email` VARCHAR(45) NULL,
  `dob` DATE NOT NULL DEFAULT '1990-01-01',
  `doj` DATE NOT NULL DEFAULT '2022-01-01',
  `useraccount_id` VARCHAR(8) NOT NULL,
  `gender_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`, `useraccount_id`, `gender_id`),
  CONSTRAINT `fk_customer_useraccount1`
    FOREIGN KEY (`useraccount_id`)
    REFERENCES `Fitness_For_Everyone`.`useraccount` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_gender1`
    FOREIGN KEY (`gender_id`)
    REFERENCES `Fitness_For_Everyone`.`gender` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_customer_useraccount1_idx` ON `Fitness_For_Everyone`.`customer` (`useraccount_id` ASC) VISIBLE;

CREATE INDEX `fk_customer_gender1_idx` ON `Fitness_For_Everyone`.`customer` (`gender_id` ASC) VISIBLE;







CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`customer1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER customer_insert
BEFORE INSERT ON customer
FOR EACH ROW
BEGIN
  INSERT INTO customer1 VALUES (NULL);
  SET NEW.id = CONCAT('C-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;










-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`leave_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`leave_details` (
  `id` VARCHAR(8) NOT NULL ,
  `staff_id` VARCHAR(8) NULL,
  `date` DATE NOT NULL DEFAULT '2022-01-01',
  `staff_member_name` VARCHAR(50) NULL,
  PRIMARY KEY (`id`))
ENGINE = INNODB;



CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`leave_details1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER leave_details_insert
BEFORE INSERT ON leave_details
FOR EACH ROW
BEGIN
  INSERT INTO leave_details1 VALUES (NULL);
  SET NEW.id = CONCAT('LD-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;














-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`salary_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`salary_details` (
  `id` VARCHAR(9) NOT NULL,
  `payment` DECIMAL(11,2) NULL,
  `designation` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = INNODB;




CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`salary_details1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER salary_details_insert
BEFORE INSERT ON salary_details
FOR EACH ROW
BEGIN
  INSERT INTO salary_details1 VALUES (NULL);
  SET NEW.id = CONCAT('SAD-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;




-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`leave_process`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`leave_process` (
  `id` VARCHAR(8) NOT NULL,
  `staff_id` VARCHAR(8) NULL,
  `staff_member_name` VARCHAR(50) NULL,
  `date` DATE NULL,
  `remark` VARCHAR(2000)  NOT NULL DEFAULT 'Test',
  `status` VARCHAR(8)   NOT NULL DEFAULT 'Accepted',
  `leave_details_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`, `leave_details_id`),
  CONSTRAINT `fk_leave_process_leave_details1`
    FOREIGN KEY (`leave_details_id`)
    REFERENCES `Fitness_For_Everyone`.`leave_details` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_leave_process_leave_details1_idx` ON `Fitness_For_Everyone`.`leave_process` (`leave_details_id` ASC) VISIBLE;





CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`leave_process1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER leave_process_insert
BEFORE INSERT ON leave_process
FOR EACH ROW
BEGIN
  INSERT INTO leave_process1 VALUES (NULL);
  SET NEW.id = CONCAT('LP-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;



insert into leave_process(staff_id, staff_member_name, date, leave_details_id)
SELECT  staff_id, staff_member_name, date, id FROM leave_details;




DELIMITER $$
CREATE TRIGGER leave_insert
AFTER INSERT ON leave_details
FOR EACH ROW
BEGIN
insert into leave_process(staff_id, staff_member_name, date, leave_details_id, remark) values (new.staff_id, new.staff_member_name, new.date, new.id , 'Test');

END$$
DELIMITER ;






DELIMITER $$
CREATE TRIGGER leave_update
AFTER UPDATE ON leave_details
FOR EACH ROW
BEGIN

UPDATE leave_process,leave_details SET 
leave_process.staff_id = leave_details.staff_id,
leave_process.staff_member_name = leave_details.staff_member_name,
leave_process.date = leave_details.date
WHERE  leave_process.leave_details_id = leave_details.id;
END$$
DELIMITER ;








DELIMITER $$
create trigger leave_delete after DELETE  on leave_details
  for each row
   begin
  
     delete from leave_process where id=OLD.id ;


END$$
DELIMITER ;

















-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`vendor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`vendor` (
  `id` VARCHAR(8) NOT NULL,
  `name` VARCHAR(45) NULL,
  `equipments` VARCHAR(2000) NULL,
  `remarks` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = INNODB;




CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`vendor1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER vendor_insert
BEFORE INSERT ON vendor
FOR EACH ROW
BEGIN
  INSERT INTO vendor1 VALUES (NULL);
  SET NEW.id = CONCAT('V-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;









-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`equipment_purchases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`equipment_purchases` (
  `id` VARCHAR(8) NOT NULL,
  `name` VARCHAR(45)  NOT NULL DEFAULT 'Test',
  `status` VARCHAR(8) NOT NULL DEFAULT 'Active',
  `remark` VARCHAR(2000)  NOT NULL DEFAULT 'Test',
  `cost` DECIMAL NULL,
  `purchased_date` DATE NULL,
  `vendor_name` VARCHAR(45) NOT NULL DEFAULT 'Test',
  `quantity` INT  NOT NULL DEFAULT '5',
  `vendor_id` VARCHAR(8) NOT NULL DEFAULT 'V-00001',
  `payment_id` VARCHAR(8) NOT NULL,
  `payment_payment_type_id` VARCHAR(8) NOT NULL,
  `status1` VARCHAR(12) NULL,
  PRIMARY KEY (`id`, `vendor_id`, `payment_id`, `payment_payment_type_id`),
  CONSTRAINT `fk_equipment_purchases_vendor1`
    FOREIGN KEY (`vendor_id`)
    REFERENCES `Fitness_For_Everyone`.`vendor` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_equipment_purchases_payment1`
    FOREIGN KEY (`payment_id` , `payment_payment_type_id`)
    REFERENCES `Fitness_For_Everyone`.`payment` (`id` , `payment_type_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_equipment_purchases_vendor1_idx` ON `Fitness_For_Everyone`.`equipment_purchases` (`vendor_id` ASC) VISIBLE;

CREATE INDEX `fk_equipment_purchases_payment1_idx` ON `Fitness_For_Everyone`.`equipment_purchases` (`payment_id` ASC, `payment_payment_type_id` ASC) VISIBLE;





CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`equipment_purchases1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER equipment_purchases_insert
BEFORE INSERT ON equipment_purchases
FOR EACH ROW
BEGIN
  INSERT INTO equipment_purchases1 VALUES (NULL);
  SET NEW.id = CONCAT('EP-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;








-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`equipments_in_use`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`equipments_in_use` (
  `id` VARCHAR(9) NOT NULL,
  `name` VARCHAR(45) NULL,
  `vendor_name` VARCHAR(45) NULL,
  `quantity` INT NULL,
  `status` VARCHAR(2000) NULL,
  `equipment_purchases_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`, `equipment_purchases_id`),
  CONSTRAINT `fk_equipments_in_use_equipment_purchases1`
    FOREIGN KEY (`equipment_purchases_id`)
    REFERENCES `Fitness_For_Everyone`.`equipment_purchases` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_equipments_in_use_equipment_purchases1_idx` ON `Fitness_For_Everyone`.`equipments_in_use` (`equipment_purchases_id` ASC) VISIBLE;





CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`equipments_in_use1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);



DELIMITER $$
CREATE TRIGGER equipments_in_use_insert
BEFORE INSERT ON equipments_in_use
FOR EACH ROW
BEGIN
  INSERT INTO equipments_in_use1 VALUES (NULL);
  SET NEW.id = CONCAT('EIU-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;








-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`equipments_not_in_use`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`equipments_not_in_use` (
  `id` VARCHAR(9) NOT NULL,
  `name` VARCHAR(45) NULL,
  `status` VARCHAR(2000) NULL,
  `vendor_name` VARCHAR(45) NULL,
  `quantity` INT NULL,
  `equipment_purchases_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`, `equipment_purchases_id`),
  CONSTRAINT `fk_equipments_not_in_use_equipment_purchases1`
    FOREIGN KEY (`equipment_purchases_id`)
    REFERENCES `Fitness_For_Everyone`.`equipment_purchases` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_equipments_not_in_use_equipment_purchases1_idx` ON `Fitness_For_Everyone`.`equipments_not_in_use` (`equipment_purchases_id` ASC) VISIBLE;





CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`equipments_not_in_use1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER equipments_not_in_use_insert
BEFORE INSERT ON equipments_not_in_use
FOR EACH ROW
BEGIN
  INSERT INTO equipments_not_in_use1 VALUES (NULL);
  SET NEW.id = CONCAT('ENU-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;










-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`module`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`module` (
  `id` VARCHAR(8) NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;




CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`module1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER module_insert
BEFORE INSERT ON module
FOR EACH ROW
BEGIN
  INSERT INTO module1 VALUES (NULL);
  SET NEW.id = CONCAT('M-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;




-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`privilages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`privilages` (
  `id` VARCHAR(8) NOT NULL,
  `create` VARCHAR(45) NULL,
  `update` VARCHAR(45) NULL,
  `view` VARCHAR(45) NULL,
  `delete` VARCHAR(45) NULL,
  `module_id` VARCHAR(8) NOT NULL,
  `role_id` VARCHAR(8) NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `module_id`, `role_id`),
  CONSTRAINT `fk_Privilages_module1`
    FOREIGN KEY (`module_id`)
    REFERENCES `Fitness_For_Everyone`.`module` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Privilages_Role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `Fitness_For_Everyone`.`role` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Privilages_module1_idx` ON `Fitness_For_Everyone`.`privilages` (`module_id` ASC) VISIBLE;

CREATE INDEX `fk_Privilages_Role1_idx` ON `Fitness_For_Everyone`.`privilages` (`role_id` ASC) VISIBLE;



CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`privilages1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER privilages_insert
BEFORE INSERT ON privilages
FOR EACH ROW
BEGIN
  INSERT INTO privilages1 VALUES (NULL);
  SET NEW.id = CONCAT('P-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;



-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`attendance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`attendance` (
  `id` VARCHAR(13) NOT NULL ,
  `date` DATE NOT NULL DEFAULT '2022-01-01',
  `intime` TIME NOT NULL DEFAULT '08:00:00',
  `outtime` TIME NOT NULL DEFAULT '14:00:00',
  `total_hours` decimal DEFAULT '6',
  `staff_id` VARCHAR(8) NOT NULL,
  `staff_member_name` VARCHAR(30) NOT NULL,
  `staff_designation_id` VARCHAR(8) NOT NULL DEFAULT 'D-00003',
  PRIMARY KEY (`id`, `staff_id`, `staff_designation_id`),
  CONSTRAINT `fk_Attendance_Staff1`
    FOREIGN KEY (`staff_id` , `staff_designation_id`)
    REFERENCES `Fitness_For_Everyone`.`staff` (`id` , `designation_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Attendance_Staff1_idx` ON `Fitness_For_Everyone`.`attendance` (`staff_id` ASC, `staff_designation_id` ASC) VISIBLE;










CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`attendance1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER attendance_insert
BEFORE INSERT ON attendance
FOR EACH ROW
BEGIN
  INSERT INTO attendance1 VALUES (NULL);
  SET NEW.id = CONCAT('A-', LPAD(LAST_INSERT_ID(), 10, '0'));
END$$
DELIMITER ;














-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`salary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`salary` (
  `id` VARCHAR(8) NOT NULL,
  `staff_id` VARCHAR(8) NOT NULL,
  `staff_member_name` VARCHAR(30) NULL,
  `month` VARCHAR(30) NULL,
  `working_days` DECIMAL NULL,
  `total_working_hours` DECIMAL NULL,
  `salary_for_working` DECIMAL NULL,
  `extra` DECIMAL(11,2) NULL,
  `monthly_salary` DECIMAL NULL,
  PRIMARY KEY (`id`, `staff_id`),
  CONSTRAINT `fk_Salary_Staff1`
    FOREIGN KEY (`staff_id` )
    REFERENCES `Fitness_For_Everyone`.`staff` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Salary_Staff1_idx` ON `Fitness_For_Everyone`.`salary` (`staff_id` ASC) VISIBLE;





CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`salary1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER salary_insert
BEFORE INSERT ON salary
FOR EACH ROW
BEGIN
  INSERT INTO salary1 VALUES (NULL);
  SET NEW.id = CONCAT('SA-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;


						
















-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`outstanding`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`outstanding` (
  `id` VARCHAR(8) NOT NULL,
  `customer_id` VARCHAR(8) NULL,
  `customer_name` VARCHAR(45) NULL,
  `useraccount_id` VARCHAR(8) NULL,
  `register_id` VARCHAR(8) NULL,
  `membership_id` VARCHAR(8) NULL,
  `remark` VARCHAR(1000)  NOT NULL DEFAULT 'Test',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`outstanding1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER outstanding_insert
BEFORE INSERT ON outstanding
FOR EACH ROW
BEGIN
  INSERT INTO outstanding1 VALUES (NULL);
  SET NEW.id = CONCAT('O-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;










-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`income`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`income` (
  `id` VARCHAR(8) NOT NULL,
  `date` DATE NULL,
  `membership_payment` DECIMAL NULL,
  `salary_payment` DECIMAL NULL,
  `equipment_expenses` DECIMAL NULL,
  `other_expenses` DECIMAL NULL,
  `income` DECIMAL NULL,
  `remark` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;






CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`income1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER income_insert
BEFORE INSERT ON income
FOR EACH ROW
BEGIN
  INSERT INTO income1 VALUES (NULL);
  SET NEW.id = CONCAT('I-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;












-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`expenses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`expenses` (
  `id` VARCHAR(8) NOT NULL,
  `date` date NULL,
  `details` VARCHAR(45)  NOT NULL DEFAULT 'Test',
  `amount` DECIMAL NULL,
  `payment_id` VARCHAR(8) NOT NULL,
  `payment_payment_type_id` VARCHAR(8) NOT NULL,
  `status1` VARCHAR(12) NULL,
  PRIMARY KEY (`id`, `payment_id`, `payment_payment_type_id`),
  CONSTRAINT `fk_expenses_payment1`
    FOREIGN KEY (`payment_id` , `payment_payment_type_id`)
    REFERENCES `Fitness_For_Everyone`.`payment` (`id` , `payment_type_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_expenses_payment1_idx` ON `Fitness_For_Everyone`.`expenses` (`payment_id` ASC, `payment_payment_type_id` ASC) VISIBLE;






CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`expenses1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER expenses_insert
BEFORE INSERT ON expenses
FOR EACH ROW
BEGIN
  INSERT INTO expenses1 VALUES (NULL);
  SET NEW.id = CONCAT('E-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;




























-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`accepted_leaves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`accepted_leaves` (
  `id` VARCHAR(8) NOT NULL,
  `date` DATE NULL ,
  `leave_process_id` VARCHAR(8) NOT NULL ,
  `staff_id` VARCHAR(8) NULL,
  `staff_member_name` VARCHAR(45) NULL,
  `remark` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`, `leave_process_id`),
  CONSTRAINT `fk_Accepted_Leaves_leave_process1`
    FOREIGN KEY (`leave_process_id`)
    REFERENCES `Fitness_For_Everyone`.`leave_process` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Accepted_Leaves_leave_process1_idx` ON `Fitness_For_Everyone`.`accepted_leaves` (`leave_process_id` ASC) VISIBLE;





CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`accepted_leaves1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER accepted_leaves_insert
BEFORE INSERT ON accepted_leaves
FOR EACH ROW
BEGIN
  INSERT INTO accepted_leaves1 VALUES (NULL);
  SET NEW.id = CONCAT('AL-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;












-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`declined_leaves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`declined_leaves` (
  `id` VARCHAR(8) NOT NULL,
  `date` DATE NULL,
  `remark` VARCHAR(2000) NULL,
  `leave_process_id` VARCHAR(8) NOT NULL,
  `staff_id` VARCHAR(8) NULL,
  `staff_member_name` VARCHAR(10) NULL,
  PRIMARY KEY (`id`, `leave_process_id`),
  CONSTRAINT `fk_Declined_Leaves_leave_process1`
    FOREIGN KEY (`leave_process_id`)
    REFERENCES `Fitness_For_Everyone`.`leave_process` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Declined_Leaves_leave_process1_idx` ON `Fitness_For_Everyone`.`declined_leaves` (`leave_process_id` ASC) VISIBLE;





CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`declined_leaves1`
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER declined_leaves_insert
BEFORE INSERT ON declined_leaves
FOR EACH ROW
BEGIN
  INSERT INTO declined_leaves1 VALUES (NULL);
  SET NEW.id = CONCAT('DL-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;













INSERT INTO role (id,name)
VALUES('','Administrator'),('','Clerk'),('','Instructor'),('','Customer');


INSERT INTO designation (id,name)
VALUES('','Administrator/Owner'),('','Clerk'),('','Instructor');


INSERT INTO gender (id,gender)
VALUES('','Male'),('','Female');


INSERT INTO payment_type (id,payment_type_name)
VALUES('','Cash'),('','Card');



INSERT INTO salary_details (id,payment,designation)
VALUES('',45000,'Senior Accounts Clerk'),('',35000,'Junior Accounts Clerk'),('',2000,'Senior Instructor'),('',1500,'Junior Instructor');



INSERT INTO useraccount (id,user_name,PASSWORD,role_id,fname,lname)
VALUES
('','Dasun_Santha','@#Fitness1234','R-00001','Dasun','Santha'),

('','Ashan','@#Fitness1234','R-00002','Ashan','Himaru'),
('','Dasun','@#Fitness1234','R-00002','Dasun','Coorey'),

('','Tharindu','@#Fitness1234','R-00003','Tharindu','Madhawa'),
('','Janidu','@#Fitness1234','R-00003','Janidu','Jayasanka'),
('','Pasindu','@#Fitness1234','R-00003','Pasindu','deshan'),
('','Victor','@#Fitness1234','R-00003','Victor','Ivan'),
('','Jayod','@#Fitness1234','R-00003','Jayod','Jayasinghe'),
('','Tharumal','@#Fitness1234','R-00003','Tharumal','Wijesinghe'),
('','Rekha','@#Fitness1234','R-00003','Rekha','Perera'),
('','Ruvini','@#Fitness1234','R-00003','Ruvini','Ahangama'),
('','Tharupa','@#Fitness1234','R-00003','Tharupa','Amarasinghe'),
('','Thurunu','@#Fitness1234','R-00003','Thurunu','Jayasighe'),
('','Timal','@#Fitness1234','R-00003','Timal','Rukshan'),
('','Rukshan','@#Fitness1234','R-00003','Rukshan','Samarasinghe'),
('','Amarabandu','@#Fitness1234','R-00003','Amarabandu','Roopasinge'),
('','Roopa','@#Fitness1234','R-00003','Roopa','Randini'),
('','Chapa','@#Fitness1234','R-00003','Chapa','Satharasinghe'),



('','Uchitha','@#Fitness1234','R-00004','Uchitha','Kosgoda'),
('','Janith','@#Fitness1234','R-00004','Janith','Jayasinghe'),
('','Asitha','@#Fitness1234','R-00004','Asitha','Latheef'),
('','Dilan','@#Fitness1234','R-00004','Dilan','Sanka'),
('','Sanka','@#Fitness1234','R-00004','Sanka','Denuwan'),
('','Dulitha','@#Fitness1234','R-00004','Dulitha','Amarasinghe'),
('','Punidu','@#Fitness1234','R-00004','Punidu','Imesha'),
('','Imesha','@#Fitness1234','R-00004','Imesha','Fernando'),
('','Jayesh','@#Fitness1234','R-00004','Jayesh','Jayasanka'),
('','Ravibandu','@#Fitness1234','R-00004','Ravibandu','Roopasinghe'),
('','Ravindu','@#Fitness1234','R-00004','Ravindu','Pathirana'),
('','Jayanidu','@#Fitness1234','R-00004','Jayanidu','Jayasanka'),
('','Ravi','@#Fitness1234','R-00004','Ravi','Kumudesh'),
('','Kumudu','@#Fitness1234','R-00004','Kumudu','Pathirana'),
('','Pathirana','@#Fitness1234','R-00004','Pathirana','Kosgoda'),
('','Malith','@#Fitness1234','R-00004','Malith','Peiris'),
('','Ajith','@#Fitness1234','R-00004','Ajith','Niwad'),
('','Shihan','@#Fitness1234','R-00004','Shihan','Jayashantha'),
('','Dinesh','@#Fitness1234','R-00004','Dinesh','Kosgoda'),
('','Ranga','@#Fitness1234','R-00004','Ranga','Sameera'),
('','Shirantha','@#Fitness1234','R-00004','Shirantha','Wijesinghe'),
('','Ranil','@#Fitness1234','R-00004','Ranil','Nilukshan'),
('','Uditha','@#Fitness1234','R-00004','Uditha','Wijesekara'),
('','Nirosha','@#Fitness1234','R-00004','Nirosha','Perera'),
('','Suminda','@#Fitness1234','R-00004','Suminda','Fernando'),
('','Surindi','@#Fitness1234','R-00004','Surindi','Wijeweera'),
('','Diliki','@#Fitness1234','R-00004','Diliki','Alwis'),
('','Senuri','@#Fitness1234','R-00004','Senuri','Hapugoda'),
('','Gerad','@#Fitness1234','R-00004','Gerad','Fernando'),
('','Akila','@#Fitness1234','R-00004','Akila','Senevirathne'),
('','Athavuda','@#Fitness1234','R-00004','Athavuda','Senevirathne'),
('','Sachintha','@#Fitness1234','R-00004','Sachintha','Perera'),
('','Varuna','@#Fitness1234','R-00004','Varuna','Peiris'),
('','Sahan','@#Fitness1234','R-00004','Sahan','Jayasinghe'),
('','Nawod','@#Fitness1234','R-00004','Nawod','Wijesekara'),
('','Rasanjana','@#Fitness1234','R-00004','Rasanjana','Jayasinghe'),
('','Layodya','@#Fitness1234','R-00004','Layodya','Witharana'),
('','Kasthuri','@#Fitness1234','R-00004','Kasthuri','Perera'),
('','Hasith','@#Fitness1234','R-00004','Hasith','Bandara'),
('','Hasitha','@#Fitness1234','R-00004','Hasitha','Perera'),
('','Rasith','@#Fitness1234','R-00004','Rasith','Bandu'),
('','Rasintha','@#Fitness1234','R-00004','Rasintha','Weerasinghe'),
('','Suminda','@#Fitness1234','R-00004','Suminda','Wijebandu'),
('','Roopabandu','@#Fitness1234','R-00004','Roopabandu','Samarasinghe'),
('','Sajith','@#Fitness1234','R-00004','Sajith','Weerawansha'),
('','Rajitha','@#Fitness1234','R-00004','Rajitha','Priyanka'),
('','Samitha','@#Fitness1234','R-00004','Samitha','Bandara'),
('','Ravindara','@#Fitness1234','R-00004','Ravindara','Peiris'),
('','Samindu','@#Fitness1234','R-00004','Samindu','Samarasinghe'),
('','Dushmantha','@#Fitness1234','R-00004','Dushmantha','Samarasinghe'),



('','Tissa','@#Fitness1234','R-00003','Tissa','Madhawa'),
('','Kithsiri','@#Fitness1234','R-00003','Kithsiri','Jayasanka'),
('','Ranjith','@#Fitness1234','R-00003','Ranjith','deshan'),
('','Ruvindu','@#Fitness1234','R-00003','Ruvindu','Ivan'),
('','Ranimini','@#Fitness1234','R-00003','Ranimini','Jayasinghe'),
('','Ravini','@#Fitness1234','R-00003','Ravini','Wijesinghe'),
('','Minoli','@#Fitness1234','R-00003','Minoli','Perera'),
('','Vidumina','@#Fitness1234','R-00003','Vidumina','Ahangama'),
('','Chathuranga','@#Fitness1234','R-00003','Chathuranga','Amarasinghe'),
('','Deshan','@#Fitness1234','R-00003','Deshan','Jayasighe'),
('','Anjana','@#Fitness1234','R-00003','Anjana','Rukshan'),
('','Heshan','@#Fitness1234','R-00003','Heshan','Samarasinghe'),
('','Madhawa','@#Fitness1234','R-00003','Madhawa','Roopasinge'),
('','Madhawi','@#Fitness1234','R-00003','Madhawi','Randini'),
('','Sulochana','@#Fitness1234','R-00003','Sulochana','Satharasinghe'),
('','Irine','@#Fitness1234','R-00003','Irine','Fernando'),





('','Uchitha1','@#Fitness1234','R-00004','Uchitha','Kosgoda'),
('','Janith1','@#Fitness1234','R-00004','Janith','Jayasinghe'),
('','Asitha1','@#Fitness1234','R-00004','Asitha','Latheef'),
('','Dilan1','@#Fitness1234','R-00004','Dilan','Sanka'),
('','Sanka1','@#Fitness1234','R-00004','Sanka','Denuwan'),
('','Dulitha1','@#Fitness1234','R-00004','Dulitha','Amarasinghe'),
('','Punidu1','@#Fitness1234','R-00004','Punidu','Imesha'),
('','Imesha1','@#Fitness1234','R-00004','Imesha','Fernando'),
('','Jayesh1','@#Fitness1234','R-00004','Jayesh','Jayasanka'),
('','Ravibandu1','@#Fitness1234','R-00004','Ravibandu','Roopasinghe'),
('','Ravindu1','@#Fitness1234','R-00004','Ravindu','Pathirana'),
('','Jayanidu1','@#Fitness1234','R-00004','Jayanidu','Jayasanka'),
('','Ravi1','@#Fitness1234','R-00004','Ravi','Kumudesh'),
('','Kumudu1','@#Fitness1234','R-00004','Kumudu','Pathirana'),
('','Pathirana1','@#Fitness1234','R-00004','Pathirana','Kosgoda'),
('','Malith1','@#Fitness1234','R-00004','Malith','Peiris'),
('','Ajith1','@#Fitness1234','R-00004','Ajith','Niwad'),
('','Shihan1','@#Fitness1234','R-00004','Shihan','Jayashantha'),
('','Dinesh1','@#Fitness1234','R-00004','Dinesh','Kosgoda'),
('','Ranga1','@#Fitness1234','R-00004','Ranga','Sameera'),
('','Shirantha1','@#Fitness1234','R-00004','Shirantha','Wijesinghe'),
('','Ranil1','@#Fitness1234','R-00004','Ranil','Nilukshan'),
('','Uditha1','@#Fitness1234','R-00004','Uditha','Wijesekara'),
('','Nirosha1','@#Fitness1234','R-00004','Nirosha','Perera'),
('','Suminda1','@#Fitness1234','R-00004','Suminda','Fernando'),
('','Surindi1','@#Fitness1234','R-00004','Surindi','Wijeweera'),
('','Diliki1','@#Fitness1234','R-00004','Diliki','Alwis'),
('','Senuri1','@#Fitness1234','R-00004','Senuri','Hapugoda'),
('','Gerad1','@#Fitness1234','R-00004','Gerad','Fernando'),
('','Akila1','@#Fitness1234','R-00004','Akila','Senevirathne'),
('','Athavuda1','@#Fitness1234','R-00004','Athavuda','Senevirathne'),
('','Sachintha1','@#Fitness1234','R-00004','Sachintha','Perera'),
('','Varuna1','@#Fitness1234','R-00004','Varuna','Peiris'),
('','Sahan1','@#Fitness1234','R-00004','Sahan','Jayasinghe'),
('','Nawod1','@#Fitness1234','R-00004','Nawod','Wijesekara'),
('','Rasanjana1','@#Fitness1234','R-00004','Rasanjana','Jayasinghe'),
('','Layodya1','@#Fitness1234','R-00004','Layodya','Witharana'),
('','Kasthuri1','@#Fitness1234','R-00004','Kasthuri','Perera'),
('','Hasith1','@#Fitness1234','R-00004','Hasith','Bandara'),
('','Hasitha1','@#Fitness1234','R-00004','Hasitha','Perera'),
('','Rasith1','@#Fitness1234','R-00004','Rasith','Bandu'),
('','Rasintha1','@#Fitness1234','R-00004','Rasintha','Weerasinghe'),
('','Suminda1','@#Fitness1234','R-00004','Suminda','Wijebandu'),
('','Roopabandu1','@#Fitness1234','R-00004','Roopabandu','Samarasinghe'),
('','Sajith1','@#Fitness1234','R-00004','Sajith','Weerawansha'),
('','Rajitha1','@#Fitness1234','R-00004','Rajitha','Priyanka'),
('','Samitha1','@#Fitness1234','R-00004','Samitha','Bandara'),
('','Ravindara1','@#Fitness1234','R-00004','Ravindara','Peiris'),
('','Samindu1','@#Fitness1234','R-00004','Samindu','Samarasinghe'),
('','Dushmantha1','@#Fitness1234','R-00004','Dushmantha','Samarasinghe');




INSERT INTO staff (id,fname,lname,designation_id,gender_id,telephone,address,email,DESCRIPTION,useraccount_id,useraccount_role_id,doj)
VALUES
('','Dasun','Santha','D-00001','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00001','R-00001','2022-01-01'),

('','Ashan','Himaru','D-00002','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00002','R-00002','2022-01-01'),
('','Dasun','Coorey','D-00002','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00003','R-00002','2022-01-01'),

('','Tharindu','Madhawa','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00004','R-00003','2022-01-01'),
('','Janidu','Jayasanka','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00005','R-00003','2022-01-01'),
('','Pasindu','deshan','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00006','R-00003','2022-02-01'),
('','Victor','Ivan','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00007','R-00003','2022-01-01'),
('','Jayod','Jayasinghe','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00008','R-00003','2022-01-01'),
('','Tharumal','Wijesinghe','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00009','R-00003','2022-01-01'),
('','Rekha','Perera','D-00003','G-00002','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00010','R-00003','2022-01-01'),
('','Ruvini','Ahangama','D-00003','G-00002','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00011','R-00003','2022-02-01'),
('','Tharupa','Amarasinghe','D-00003','G-00002','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00012','R-00003','2022-02-01'),
('','Thurunu','Jayasighe','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00013','R-00003','2022-02-01'),
('','Timal','Rukshan','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00014','R-00003','2022-02-01'),
('','Rukshan','Samarasinghe','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00015','R-00003','2022-02-01'),
('','Amarabandu','Roopasinge','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00016','R-00003','2022-02-01'),
('','Roopa','Randini','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00017','R-00003','2022-03-01'),
('','Tissa','Madhawa','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00069','R-00003','2022-03-01'),
('','Kithsiri','Jayasanka','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00070','R-00003','2022-03-01'),
('','Ranjith','deshan','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00071','R-00003','2022-03-01'),
('','Ruvindu','Ivan','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00072','R-00003','2022-03-01'),
('','Ranimini','Jayasinghe','D-00003','G-00002','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00073','R-00003','2022-03-01'),
('','Ravini','Wijesinghe','D-00003','G-00002','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00074','R-00003','2022-04-01'),
('','Minoli','Perera','D-00003','G-00002','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00075','R-00003','2022-04-01'),
('','Vidumina','Ahangama','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00076','R-00003','2022-04-01'),
('','Chathuranga','Amarasinghe','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00077','R-00003','2022-04-01'),
('','Deshan','Jayasighe','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00078','R-00003','2022-04-01'),
('','Anjana','Rukshan','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00079','R-00003','2022-05-01'),
('','Heshan','Samarasinghe','D-00003','G-00001','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00080','R-00003','2022-05-01'),
('','Madhawa','Roopasinge','D-00003','G-00002','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00081','R-00003','2022-05-01'),
('','Madhawi','Randini','D-00003','G-00002','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00082','R-00003','2022-05-01'),
('','Sulochana','Satharasinghe','D-00003','G-00002','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00083','R-00003','2022-05-01'),
('','Irine','Fernando','D-00003','G-00002','0771231234','Thalawattugoda','abc@gmail.com','Test','UA-00084','R-00003','2022-05-01');


INSERT INTO membership (id,name,description,fee)
VALUES
('','Heavy User CARDIO-Any Time 03 Months Period','Any Time of Working Hours 5A.M to 10P.M  03 Months Period',20000),
('','Heavy User CARDIO-Any Time 06 Months Period','Any Time of Working Hours 5A.M to 10P.M  06 Months Period',30000),
('','Heavy User CARDIO-Any Time 01 Year Period','Any Time of Working Hours 5A.M to 10P.M  01 Year Period',50000),
('','Heavy User CARDIO-Any Time 02 Year Period','Any Time of Working Hours 5A.M to 10P.M  02 Year Period',80000),

('','PROFESSIONAL USER-Any Time 03 Months Period','Any Time of Working Hours 5A.M to 10P.M  03 Months Period',24000),
('','PROFESSIONAL USER-Any Time 06 Months Period','Any Time of Working Hours 5A.M to 10P.M  06 Months Period',35000),
('','PROFESSIONAL USER-Any Time 01 Year Period','Any Time of Working Hours 5A.M to 10P.M  01 Year Period',60000),
('','PROFESSIONAL USER-Any Time 02 Year Period','Any Time of Working Hours 5A.M to 10P.M  02 Year Period',90000),

('','FOR NORMAL USERS_MEN_LITE-Morning Hours 03 Months Period','Morning Hours 5A.M to 8A.M  03 Months Period',12000),
('','FOR NORMAL USERS_MEN_LITE-Morning Hours 06 Months Period','Morning Hours 5A.M to 8A.M  06 Months Period',17000),
('','FOR NORMAL USERS_MEN_LITE-Morning Hours 01 Year Period','Morning Hours 5A.M to 8A.M  01 Year Period',33000),
('','FOR NORMAL USERS_MEN_LITE-Morning Hours 02 Year Period','Morning Hours 5A.M to 8A.M  02 Year Period',60000),
('','FOR NORMAL USERS_MEN_BASIC-Afternoon Hours 03 Months Period','Afternoon Hours 3P.M to 10P.M  03 Months Period',15000),
('','FOR NORMAL USERS_MEN_BASIC-Afternoon Hours 06 Months Period','Afternoon Hours 3P.M to 10P.M  06 Months Period',20000),
('','FOR NORMAL USERS_MEN_BASIC-Afternoon Hours 01 Year Period','Afternoon Hours 3P.M to 10P.M  01 Year Period',35000),
('','FOR NORMAL USERS_MEN_BASIC-Afternoon Hours 02 Year Period','Afternoon Hours 3P.M to 10P.M  02 Year Period',50000),
('','FOR NORMAL USERS_MEN_PRO-Any Time 03 Months Period','Any Time of Working Hours 5A.M to 10P.M  03 Months Period',17000),
('','FOR NORMAL USERS_MEN_PRO-Any Time 06 Months Period','Any Time of Working Hours 5A.M to 10P.M  06 Months Period',28000),
('','FOR NORMAL USERS_MEN_PRO-Any Time 01 Year Period','Any Time of Working Hours 5A.M to 10P.M  01 Year Period',45000),
('','FOR NORMAL USERS_MEN_PRO-Any Time 02 Year Period','Any Time of Working Hours 5A.M to 10P.M  02 Year Period',65000),

('','FOR NORMAL USERS_WOMEN_LITE-Morning Hours 03 Months Period','Morning Hours 5A.M to 8A.M  03 Months Period',8000),
('','FOR NORMAL USERS_WOMEN_LITE-Morning Hours 06 Months Period','Morning Hours 5A.M to 8A.M  06 Months Period',14000),
('','FOR NORMAL USERS_WOMEN_LITE-Morning Hours 01 Year Period','Morning Hours 5A.M to 8A.M  01 Year Period',26000),
('','FOR NORMAL USERS_WOMEN_LITE-Morning Hours 02 Year Period','Morning Hours 5A.M to 8A.M  02 Year Period',45000),
('','FOR NORMAL USERS_WOMEN_BASIC-Afternoon Hours 03 Months Period','Afternoon Hours 3P.M to 10P.M  03 Months Period',9000),
('','FOR NORMAL USERS_WOMEN_BASIC-Afternoon Hours 06 Months Period','Afternoon Hours 3P.M to 10P.M  06 Months Period',16000),
('','FOR NORMAL USERS_WOMEN_BASIC-Afternoon Hours 01 Year Period','Afternoon Hours 3P.M to 10P.M  01 Year Period',30000),
('','FOR NORMAL USERS_WOMEN_BASIC-Afternoon Hours 02 Year Period','Afternoon Hours 3P.M to 10P.M  02 Year Period',55000),
('','FOR NORMAL USERS_WOMEN_PRO-Any Time 03 Months Period','Any Time of Working Hours 5A.M to 10P.M  03 Months Period',10000),
('','FOR NORMAL USERS_WOMEN_PRO-Any Time 06 Months Period','Any Time of Working Hours 5A.M to 10P.M  06 Months Period',18000),
('','FOR NORMAL USERS_WOMEN_PRO-Any Time 01 Year Period','Any Time of Working Hours 5A.M to 10P.M  01 Year Period',35000),
('','FOR NORMAL USERS_WOMEN_PRO-Any Time 02 Year Period','Any Time of Working Hours 5A.M to 10P.M  02 Year Period',60000),

('','FOR NORMAL USERS_TEENAGERS_LITE-Morning Hours 03 Months Period','Morning Hours 5A.M to 8A.M  03 Months Period',7000),
('','FOR NORMAL USERS_TEENAGERS_LITE-Morning Hours 06 Months Period','Morning Hours 5A.M to 8A.M  06 Months Period',12000),
('','FOR NORMAL USERS_TEENAGERS_LITE-Morning Hours 01 Year Period','Morning Hours 5A.M to 8A.M  01 Year Period',20000),
('','FOR NORMAL USERS_TEENAGERS_LITE-Morning Hours 02 Year Period','Morning Hours 5A.M to 8A.M  02 Year Period',36000),
('','FOR NORMAL USERS_TEENAGERS_BASIC-Afternoon Hours 03 Months Period','Afternoon Hours 3P.M to 10P.M  03 Months Period',8000),
('','FOR NORMAL USERS_TEENAGERS_BASIC-Afternoon Hours 06 Months Period','Afternoon Hours 3P.M to 10P.M  06 Months Period',14000),
('','FOR NORMAL USERS_TEENAGERS_BASIC-Afternoon Hours 01 Year Period','Afternoon Hours 3P.M to 10P.M  01 Year Period',26000),
('','FOR NORMAL USERS_TEENAGERS_BASIC-Afternoon Hours 02 Year Period','Afternoon Hours 3P.M to 10P.M  02 Year Period',48000),
('','FOR NORMAL USERS_TEENAGERS_PRO-Any Time 03 Months Period','Any Time of Working Hours 5A.M to 10P.M  03 Months Period',9000),
('','FOR NORMAL USERS_TEENAGERS_PRO-Any Time 06 Months Period','Any Time of Working Hours 5A.M to 10P.M  06 Months Period',16000),
('','FOR NORMAL USERS_TEENAGERS_PRO-Any Time 01 Year Period','Any Time of Working Hours 5A.M to 10P.M  01 Year Period',30000),
('','FOR NORMAL USERS_TEENAGERS_PRO-Any Time 02 Year Period','Any Time of Working Hours 5A.M to 10P.M  02 Year Period',55000);






INSERT INTO customer (id,doj,fname,lname,address,telephone,email,useraccount_id,gender_id)
VALUES


('','2022-01-01','Uchitha','Kosgoda','Thalawattugoda','0775556667','abc@gmail.com','UA-00019','G-00001'),
('','2022-01-01','Janith','Jayasinghe','Thalawattugoda','0775556667','abch@gmail.com','UA-00020','G-00001'),
('','2022-01-01','Asitha','Latheef','Thalawattugoda','0775556667','abc@gmail.com','UA-00021','G-00001'),
('','2022-01-01','Dilan','Sanka','Thalawattugoda','0775556667','abc@gmail.com','UA-00022','G-00001'),
('','2022-01-01','Sanka','Denuwan','Thalawattugoda','0775556667','abc@gmail.com','UA-00023','G-00001'),
('','2022-01-01','Dulitha','Amarasinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00024','G-00001'),
('','2022-01-01','Punidu','Imesha','Thalawattugoda','0775556667','abc@gmail.com','UA-00025','G-00001'),
('','2022-01-01','Imesha','Fernando','Thalawattugoda','0775556667','abc@gmail.com','UA-00026','G-00001'),
('','2022-01-01','Jayesh','Jayasanka','Thalawattugoda','0775556667','abc@gmail.com','UA-00027','G-00001'),
('','2022-01-01','Ravibandu','Roopasinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00028','G-00001'),
('','2022-01-01','Ravindu','Pathirana','Thalawattugoda','0775556667','abc@gmail.com','UA-00029','G-00001'),
('','2022-01-01','Jayanidu','Jayasanka','Thalawattugoda','0775556667','abc@gmail.com','UA-00030','G-00001'),
('','2022-01-01','Ravi','Kumudesh','Thalawattugoda','0775556667','abc@gmail.com','UA-00031','G-00001'),
('','2022-02-01','Kumudu','Pathirana','Thalawattugoda','0775556667','abc@gmail.com','UA-00032','G-00001'),
('','2022-02-01','Pathirana','Kosgoda','Thalawattugoda','0775556667','abc@gmail.com','UA-00033','G-00001'),
('','2022-02-01','Malith','Peiris','Thalawattugoda','0775556667','abc@gmail.com','UA-00034','G-00001'),
('','2022-02-01','Ajith','Niwad','Thalawattugoda','0775556667','abc@gmail.com','UA-00035','G-00001'),
('','2022-02-01','Shihan','Jayashantha','Thalawattugoda','0775556667','abc@gmail.com','UA-00036','G-00001'),
('','2022-02-01','Dinesh','Kosgoda','Thalawattugoda','0775556667','abc@gmail.com','UA-00037','G-00001'),
('','2022-02-01','Ranga','Sameera','Thalawattugoda','0775556667','abc@gmail.com','UA-00038','G-00001'),
('','2022-02-01','Shirantha','Wijesinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00039','G-00001'),
('','2022-02-01','Ranil','Nilukshan','Thalawattugoda','0775556667','abc@gmail.com','UA-00040','G-00001'),
('','2022-02-01','Uditha','Wijesekara','Thalawattugoda','0775556667','abc@gmail.com','UA-00041','G-00001'),
('','2022-02-01','Nirosha','Perera','Thalawattugoda','0775556667','abc@gmail.com','UA-00042','G-00001'),
('','2022-02-01','Suminda','Fernando','Thalawattugoda','0775556667','abc@gmail.com','UA-00043','G-00001'),
('','2022-02-01','Surindi','Wijeweera','Thalawattugoda','0775556667','abc@gmail.com','UA-00044','G-00001'),
('','2022-02-01','Diliki','Alwis','Thalawattugoda','0775556667','abc@gmail.com','UA-00045','G-00001'),
('','2022-02-01','Senuri','Hapugoda','Thalawattugoda','0775556667','abc@gmail.com','UA-00047','G-00001'),
('','2022-02-01','Gerad','Fernando','Thalawattugoda','0775556667','abc@gmail.com','UA-00048','G-00001'),
('','2022-02-01','Akila','Senevirathne','Thalawattugoda','0775556667','abc@gmail.com','UA-00049','G-00001'),
('','2022-02-01','Athavuda','Senevirathne','Thalawattugoda','0775556667','abc@gmail.com','UA-00050','G-00001'),
('','2022-02-01','Sachintha','Perera','Thalawattugoda','0775556667','abc@gmail.com','UA-00051','G-00001'),
('','2022-02-01','Varuna','Peiris','Thalawattugoda','0775556667','abc@gmail.com','UA-00052','G-00001'),
('','2022-02-01','Sahan','Jayasinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00053','G-00001'),
('','2022-02-01','Nawod','Wijesekara','Thalawattugoda','0775556667','abc@gmail.com','UA-00054','G-00001'),
('','2022-02-01','Rasanjana','Jayasinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00055','G-00001'),
('','2022-02-01','Layodya','Witharana','Thalawattugoda','0775556667','abc@gmail.com','UA-00056','G-00001'),
('','2022-02-01','Kasthuri','Perera','Thalawattugoda','0775556667','abc@gmail.com','UA-00057','G-00001'),
('','2022-02-01','Hasith','Bandara','Thalawattugoda','0775556667','abc@gmail.com','UA-00058','G-00001'),
('','2022-02-01','Hasitha','Perera','Thalawattugoda','0775556667','abc@gmail.com','UA-00059','G-00001'),
('','2022-02-01','Rasith','Bandu','Thalawattugoda','0775556667','abc@gmail.com','UA-00060','G-00001'),
('','2022-02-01','Rasintha','Weerasinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00061','G-00001'),
('','2022-02-01','Suminda','Wijebandu','Thalawattugoda','0775556667','abc@gmail.com','UA-00062','G-00001'),
('','2022-02-01','Roopabandu','Samarasinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00063','G-00001'),
('','2022-02-01','Sajith','Weerawansha','Thalawattugoda','0775556667','abc@gmail.com','UA-00064','G-00001'),
('','2022-02-01','Rajitha','Priyanka','Thalawattugoda','0775556667','abc@gmail.com','UA-00065','G-00001'),
('','2022-03-01','Samitha','Bandara','Thalawattugoda','0775556667','abc@gmail.com','UA-00066','G-00001'),
('','2022-03-01','Ravindara','Peiris','Thalawattugoda','0775556667','abc@gmail.com','UA-00067','G-00001'),
('','2022-03-01','Samindu','Samarasinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00068','G-00001'),
('','2022-03-01','Dushmantha','Samarasinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00068','G-00001'),
('','2022-03-01','Uchitha','Kosgoda','Thalawattugoda','0775556667','abc@gmail.com','UA-00085','G-00001'),
('','2022-03-01','Janith','Jayasinghe','Thalawattugoda','0775556667','abch@gmail.com','UA-00086','G-00001'),
('','2022-03-01','Asitha','Latheef','Thalawattugoda','0775556667','abc@gmail.com','UA-00087','G-00001'),
('','2022-03-01','Dilan','Sanka','Thalawattugoda','0775556667','abc@gmail.com','UA-00088','G-00001'),
('','2022-03-01','Sanka','Denuwan','Thalawattugoda','0775556667','abc@gmail.com','UA-00089','G-00001'),
('','2022-03-01','Dulitha','Amarasinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00090','G-00001'),
('','2022-03-01','Punidu','Imesha','Thalawattugoda','0775556667','abc@gmail.com','UA-00091','G-00001'),
('','2022-03-01','Imesha','Fernando','Thalawattugoda','0775556667','abc@gmail.com','UA-00092','G-00001'),
('','2022-03-01','Jayesh','Jayasanka','Thalawattugoda','0775556667','abc@gmail.com','UA-00093','G-00001'),
('','2022-03-01','Ravibandu','Roopasinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00094','G-00001'),
('','2022-03-01','Ravindu','Pathirana','Thalawattugoda','0775556667','abc@gmail.com','UA-00095','G-00001'),
('','2022-03-01','Jayanidu','Jayasanka','Thalawattugoda','0775556667','abc@gmail.com','UA-00096','G-00001'),
('','2022-03-01','Ravi','Kumudesh','Thalawattugoda','0775556667','abc@gmail.com','UA-00097','G-00001'),
('','2022-03-01','Kumudu','Pathirana','Thalawattugoda','0775556667','abc@gmail.com','UA-00098','G-00001'),
('','2022-03-01','Pathirana','Kosgoda','Thalawattugoda','0775556667','abc@gmail.com','UA-00099','G-00001'),
('','2022-03-01','Malith','Peiris','Thalawattugoda','0775556667','abc@gmail.com','UA-00100','G-00001'),
('','2022-03-01','Ajith','Niwad','Thalawattugoda','0775556667','abc@gmail.com','UA-00101','G-00001'),
('','2022-03-01','Shihan','Jayashantha','Thalawattugoda','0775556667','abc@gmail.com','UA-00102','G-00001'),
('','2022-03-01','Dinesh','Kosgoda','Thalawattugoda','0775556667','abc@gmail.com','UA-00103','G-00001'),
('','2022-04-01','Ranga','Sameera','Thalawattugoda','0775556667','abc@gmail.com','UA-00104','G-00001'),
('','2022-04-01','Shirantha','Wijesinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00105','G-00001'),
('','2022-04-01','Ranil','Nilukshan','Thalawattugoda','0775556667','abc@gmail.com','UA-00106','G-00001'),
('','2022-04-01','Uditha','Wijesekara','Thalawattugoda','0775556667','abc@gmail.com','UA-00107','G-00001'),
('','2022-04-01','Nirosha','Perera','Thalawattugoda','0775556667','abc@gmail.com','UA-00108','G-00001'),
('','2022-04-01','Suminda','Fernando','Thalawattugoda','0775556667','abc@gmail.com','UA-00109','G-00001'),
('','2022-04-01','Surindi','Wijeweera','Thalawattugoda','0775556667','abc@gmail.com','UA-00110','G-00001'),
('','2022-04-01','Diliki','Alwis','Thalawattugoda','0775556667','abc@gmail.com','UA-00045','G-00111'),
('','2022-04-01','Senuri','Hapugoda','Thalawattugoda','0775556667','abc@gmail.com','UA-00047','G-00112'),
('','2022-04-01','Gerad','Fernando','Thalawattugoda','0775556667','abc@gmail.com','UA-00048','G-00113'),
('','2022-04-01','Akila','Senevirathne','Thalawattugoda','0775556667','abc@gmail.com','UA-00114','G-00001'),
('','2022-04-01','Athavuda','Senevirathne','Thalawattugoda','0775556667','abc@gmail.com','UA-00115','G-00001'),
('','2022-04-01','Sachintha','Perera','Thalawattugoda','0775556667','abc@gmail.com','UA-00116','G-00001'),
('','2022-04-01','Varuna','Peiris','Thalawattugoda','0775556667','abc@gmail.com','UA-00117','G-00001'),
('','2022-04-01','Sahan','Jayasinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00118','G-00001'),
('','2022-04-01','Nawod','Wijesekara','Thalawattugoda','0775556667','abc@gmail.com','UA-00119','G-00001'),
('','2022-04-01','Rasanjana','Jayasinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00120','G-00001'),
('','2022-05-01','Layodya','Witharana','Thalawattugoda','0775556667','abc@gmail.com','UA-00121','G-00001'),
('','2022-05-01','Kasthuri','Perera','Thalawattugoda','0775556667','abc@gmail.com','UA-00122','G-00001'),
('','2022-05-01','Hasith','Bandara','Thalawattugoda','0775556667','abc@gmail.com','UA-00123','G-00001'),
('','2022-05-01','Hasitha','Perera','Thalawattugoda','0775556667','abc@gmail.com','UA-00124','G-00001'),
('','2022-05-01','Rasith','Bandu','Thalawattugoda','0775556667','abc@gmail.com','UA-00125','G-00001'),
('','2022-05-01','Rasintha','Weerasinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00126','G-00001'),
('','2022-05-01','Suminda','Wijebandu','Thalawattugoda','0775556667','abc@gmail.com','UA-00127','G-00001'),
('','2022-05-01','Roopabandu','Samarasinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00128','G-00001'),
('','2022-05-01','Sajith','Weerawansha','Thalawattugoda','0775556667','abc@gmail.com','UA-00129','G-00001'),
('','2022-05-01','Rajitha','Priyanka','Thalawattugoda','0775556667','abc@gmail.com','UA-00130','G-00001'),
('','2022-05-01','Samitha','Bandara','Thalawattugoda','0775556667','abc@gmail.com','UA-00131','G-00001'),
('','2022-05-01','Ravindara','Peiris','Thalawattugoda','0775556667','abc@gmail.com','UA-00132','G-00001'),
('','2022-05-01','Samindu','Samarasinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00133','G-00001'),
('','2022-05-01','Dushmantha','Samarasinghe','Thalawattugoda','0775556667','abc@gmail.com','UA-00134','G-00001');









INSERT INTO register (id,reg_fee,remark,membership_id,membership_payment_id,customer_id,date)
VALUES
('','90000','Test','M-00008','MP-00001','C-00001','2022-01-01'),
('','90000','Test','M-00008','MP-00002','C-00002','2022-01-01'),
('','90000','Test','M-00008','MP-00003','C-00003','2022-01-01'),
('','90000','Test','M-00008','MP-00004','C-00004','2022-01-01'),
('','90000','Test','M-00008','MP-00005','C-00005','2022-01-01'),
('','80000','Test','M-00004','MP-00006','C-00006','2022-01-01'),
('','80000','Test','M-00004','MP-00007','C-00007','2022-01-01'),
('','80000','Test','M-00004','MP-00008','C-00008','2022-01-01'),
('','80000','Test','M-00004','MP-00009','C-00009','2022-01-01'),
('','80000','Test','M-00004','MP-00010','C-00010','2022-01-01'),
('','80000','Test','M-00004','MP-00011','C-00011','2022-01-01'),
('','80000','Test','M-00004','MP-00012','C-00012','2022-01-01'),
('','80000','Test','M-00004','MP-00013','C-00013','2022-01-01'),
('','80000','Test','M-00004','MP-00014','C-00014','2022-02-01'),
('','80000','Test','M-00004','MP-00015','C-00015','2022-02-01'),
('','90000','Test','M-00008','MP-00016','C-00016','2022-02-01'),
('','90000','Test','M-00008','MP-00017','C-00017','2022-02-01'),
('','90000','Test','M-00008','MP-00018','C-00018','2022-02-01'),
('','90000','Test','M-00008','MP-00019','C-00019','2022-02-01'),
('','90000','Test','M-00008','MP-00020','C-00020','2022-02-01'),
('','90000','Test','M-00008','MP-00021','C-00021','2022-02-01'),
('','90000','Test','M-00008','MP-00022','C-00022','2022-02-01'),
('','90000','Test','M-00008','MP-00023','C-00023','2022-02-01'),
('','90000','Test','M-00008','MP-00024','C-00024','2022-02-01'),
('','90000','Test','M-00008','MP-00025','C-00025','2022-02-01'),
('','90000','Test','M-00008','MP-00026','C-00026','2022-02-01'),
('','90000','Test','M-00008','MP-00027','C-00027','2022-02-01'),
('','90000','Test','M-00008','MP-00028','C-00028','2022-02-01'),
('','90000','Test','M-00008','MP-00029','C-00029','2022-02-01'),
('','90000','Test','M-00008','MP-00030','C-00030','2022-02-01'),
('','65000','Test','M-00020','MP-00031','C-00031','2022-02-01'),
('','65000','Test','M-00020','MP-00032','C-00032','2022-02-01'),
('','65000','Test','M-00020','MP-00033','C-00033','2022-02-01'),
('','65000','Test','M-00020','MP-00034','C-00034','2022-02-01'),
('','65000','Test','M-00020','MP-00035','C-00035','2022-02-01'),
('','65000','Test','M-00020','MP-00036','C-00036','2022-02-01'),
('','65000','Test','M-00020','MP-00037','C-00037','2022-02-01'),
('','65000','Test','M-00020','MP-00038','C-00038','2022-02-01'),
('','65000','Test','M-00020','MP-00039','C-00039','2022-02-01'),
('','65000','Test','M-00020','MP-00040','C-00040','2022-02-01'),
('','65000','Test','M-00020','MP-00041','C-00041','2022-03-01'),
('','65000','Test','M-00020','MP-00042','C-00042','2022-03-01'),
('','65000','Test','M-00020','MP-00043','C-00043','2022-03-01'),
('','65000','Test','M-00020','MP-00044','C-00044','2022-03-01'),
('','65000','Test','M-00020','MP-00045','C-00045','2022-03-01'),
('','60000','Test','M-00007','MP-00046','C-00046','2022-03-01'),
('','60000','Test','M-00007','MP-00047','C-00047','2022-03-01'),
('','60000','Test','M-00007','MP-00048','C-00048','2022-03-01'),
('','60000','Test','M-00007','MP-00049','C-00049','2022-03-01'),
('','60000','Test','M-00007','MP-00050','C-00050','2022-03-01'),
('','60000','Test','M-00007','MP-00051','C-00051','2022-03-01'),
('','60000','Test','M-00007','MP-00052','C-00052','2022-03-01'),
('','60000','Test','M-00007','MP-00053','C-00053','2022-03-01'),
('','60000','Test','M-00007','MP-00054','C-00054','2022-03-01'),
('','60000','Test','M-00007','MP-00055','C-00055','2022-03-01'),
('','50000','Test','M-00016','MP-00056','C-00056','2022-03-01'),
('','50000','Test','M-00016','MP-00057','C-00057','2022-03-01'),
('','50000','Test','M-00016','MP-00058','C-00058','2022-03-01'),
('','50000','Test','M-00016','MP-00059','C-00059','2022-03-01'),
('','50000','Test','M-00016','MP-00060','C-00060','2022-03-01'),
('','50000','Test','M-00016','MP-00061','C-00061','2022-03-01'),
('','50000','Test','M-00016','MP-00062','C-00062','2022-03-01'),
('','50000','Test','M-00016','MP-00063','C-00063','2022-03-01'),
('','50000','Test','M-00016','MP-00064','C-00064','2022-04-01'),
('','50000','Test','M-00016','MP-00065','C-00065','2022-04-01'),
('','50000','Test','M-00016','MP-00066','C-00066','2022-04-01'),
('','50000','Test','M-00016','MP-00067','C-00067','2022-04-01'),
('','50000','Test','M-00016','MP-00068','C-00068','2022-04-01'),
('','50000','Test','M-00016','MP-00069','C-00069','2022-04-01'),
('','50000','Test','M-00016','MP-00070','C-00070','2022-04-01'),
('','45000','Test','M-00019','MP-00071','C-00071','2022-04-01'),
('','45000','Test','M-00019','MP-00072','C-00072','2022-04-01'),
('','45000','Test','M-00019','MP-00073','C-00073','2022-04-01'),
('','45000','Test','M-00019','MP-00074','C-00074','2022-04-01'),
('','45000','Test','M-00019','MP-00075','C-00075','2022-04-01'),
('','45000','Test','M-00019','MP-00076','C-00076','2022-04-01'),
('','45000','Test','M-00019','MP-00077','C-00077','2022-04-01'),
('','45000','Test','M-00019','MP-00078','C-00078','2022-04-01'),
('','45000','Test','M-00019','MP-00079','C-00079','2022-04-01'),
('','45000','Test','M-00019','MP-00080','C-00080','2022-04-01'),
('','45000','Test','M-00019','MP-00081','C-00081','2022-05-01'),
('','45000','Test','M-00019','MP-00082','C-00082','2022-05-01'),
('','45000','Test','M-00019','MP-00083','C-00083','2022-05-01'),
('','45000','Test','M-00019','MP-00084','C-00084','2022-05-01'),
('','60000','Test','M-00032','MP-00085','C-00085','2022-05-01'),
('','60000','Test','M-00032','MP-00086','C-00086','2022-05-01'),
('','60000','Test','M-00032','MP-00087','C-00087','2022-05-01'),
('','60000','Test','M-00032','MP-00088','C-00088','2022-05-01'),
('','60000','Test','M-00032','MP-00089','C-00089','2022-05-01'),
('','90000','Test','M-00008','MP-00090','C-00090','2022-05-01'),
('','90000','Test','M-00008','MP-00091','C-00091','2022-05-01'),
('','90000','Test','M-00008','MP-00092','C-00092','2022-05-01'),
('','90000','Test','M-00008','MP-00093','C-00093','2022-05-01'),
('','90000','Test','M-00008','MP-00094','C-00094','2022-05-01'),
('','90000','Test','M-00008','MP-00095','C-00095','2022-05-01'),
('','90000','Test','M-00008','MP-00096','C-00096','2022-05-01'),
('','90000','Test','M-00008','MP-00097','C-00097','2022-05-01'),
('','90000','Test','M-00008','MP-00098','C-00098','2022-05-01'),
('','90000','Test','M-00008','MP-00099','C-00099','2022-05-01'),
('','90000','Test','M-00008','MP-00100','C-00100','2022-05-01');









INSERT INTO customer_details (customer_id,name,age,height,weight,chest,arm_sizes,issues,staff_id)
VALUES
('C-00001','Uchitha Kosgoda',27,175,85,25,15,'None','S-00003'),
('C-00002','Janith Jayasinghe',27,180,70,25,15,'None','S-00031'),
('C-00003','Asitha Latheef',27,172,65,25,15,'None','S-00031'),
('C-00004','Dilan Sanka',27,178,65,25,15,'None','S-00033'),
('C-00005','Sanka Denuwan',27,167,55,25,15,'None','S-00033'),
('C-00006','Dulitha Amarasinghe',27,162,55,25,15,'None','S-00031'),
('C-00007','Punidu Imesha',27,161,55,25,15,'None','S-00033'),
('C-00008','Imesha Fernando',27,169,55,25,15,'None','S-00008'),
('C-00009','Jayesh Jayasanka',27,163,55,25,15,'None','S-00009'),
('C-00010','Ravibandu Roopasinghe',27,164,55,25,15,'None','S-00010'),
('C-00011','Ravindu Pathirana',27,175,65,25,15,'None','S-00003'),
('C-00012','Jayanidu Jayasanka',27,172,67,25,15,'None','S-00003'),
('C-00013','Ravi Kumudesh',27,190,85,25,15,'None','S-00003'),
('C-00014','Kumudu Pathirana',27,195,85,25,15,'None','S-00003'),
('C-00015','Pathirana Kosgoda',27,198,85,25,15,'None','S-00004'),
('C-00016','Malith Peiris',27,199,85,25,15,'None','S-00005'),
('C-00017','Ajith Niwad',27,194,85,25,15,'None','S-00005'),
('C-00018','Shihan Jayashantha',27,191,85,25,15,'None','S-00005'),
('C-00019','Dinesh Kosgoda',27,199,85,25,15,'None','S-00005'),
('C-00020','Ranga Sameera',27,197,85,25,15,'None','S-00005'),
('C-00021','Shirantha Wijesinghe',27,192,85,25,15,'None','S-00005'),
('C-00022','Ranil Nilukshan',27,181,65,25,15,'None','S-00004'),
('C-00023','Uditha Wijesekara',27,182,65,25,15,'None','S-00004'),
('C-00024','Nirosha Perera',27,183,65,25,15,'None','S-00006'),
('C-00025','Suminda Fernando',27,184,65,25,15,'None','S-00006'),
('C-00026','Surindi Wijeweera',27,185,65,25,15,'None','S-00006'),
('C-00027','Diliki Alwis',27,186,65,25,15,'None','S-00006'),
('C-00028','Senuri Hapugoda',27,187,65,25,15,'None','S-00007'),
('C-00028','Gerad Fernando',27,188,65,25,15,'None','S-00007'),
('C-00030','Akila Senevirathne',27,189,65,25,15,'None','S-00008'),
('C-00031','Athavuda Senevirathne',27,181,65,25,15,'None','S-00009'),
('C-00032','Sachintha Perera',27,161,65,25,15,'None','S-00009'),
('C-00033','Varuna Peiris',27,162,65,25,15,'None','S-00010'),
('C-00034','Sahan Jayasinghe',27,163,65,25,15,'None','S-00010'),
('C-00035','Nawod Wijesekara',27,164,65,25,15,'None','S-00011'),
('C-00036','Rasanjana Jayasinghe',27,165,65,25,15,'None','S-00012'),
('C-00037','Layodya Witharana',27,166,65,25,15,'None','S-00012'),
('C-00038','Kasthuri Perera',27,167,65,25,15,'None','S-00013'),
('C-00039','Hasith Bandara',27,168,65,25,15,'None','S-00013'),
('C-00040','Hasitha Perera',27,169,65,25,15,'None','S-00013'),
('C-00041','Rasith Bandu',27,169,65,25,15,'None','S-00014'),
('C-00042','Rasintha Weerasinghe',27,179,65,25,15,'None','S-00014'),
('C-00043','Suminda Wijebandu',27,189,65,25,15,'None','S-00015'),
('C-00044','Roopabandu Samarasinghe',27,175,65,25,15,'None','S-00016'),
('C-00045','Sajith Weerawansha',27,176,65,25,15,'None','S-00017'),
('C-00046','Rajitha Priyanka',27,177,65,25,15,'None','S-00018'),
('C-00047','Samitha Bandara',27,166,65,25,15,'None','S-00019'),
('C-00048','Ravindara Peiris',27,169,65,25,15,'None','S-00020'),
('C-00049','Samindu Samarasinghe',27,168,65,25,15,'None','S-00021'),
('C-00050','Dushmantha Samarasinghe',27,178,65,25,15,'None','S-00022'),
('C-00051','Uchitha Kosgoda',27,178,65,25,15,'None','S-00023'),
('C-00052','Janith Jayasinghe',27,171,65,25,15,'None','S-00024'),
('C-00053','Asitha Latheef',27,172,65,25,15,'None','S-00025'),
('C-00054','Dilan Sanka',27,173,65,25,15,'None','S-00026'),
('C-00055','Sanka Denuwan',27,175,65,25,15,'None','S-00026'),
('C-00056','Dulitha Amarasinghe',27,178,65,25,15,'None','S-00028'),
('C-00057','Punidu Imesha',27,175,65,25,15,'None','S-00030'),
('C-00058','Imesha Fernando',27,175,65,25,15,'None','S-00030'),
('C-00059','Jayesh Jayasanka',27,175,65,25,15,'None','S-00030'),
('C-00060','Ravibandu Roopasinghe',27,185,65,25,15,'None','S-00032'),
('C-00061','Ravindu Pathirana',27,185,65,25,15,'None','S-00032'),
('C-00062','Jayanidu Jayasanka',27,185,65,25,15,'None','S-00032'),
('C-00063','Ravi Kumudesh',27,185,65,25,15,'None','S-00032'),
('C-00064','Kumudu Pathirana',27,185,65,25,15,'None','S-00028'),
('C-00065','Pathirana Kosgoda',27,185,65,25,15,'None','S-00032'),
('C-00066','Malith Peiris',27,185,65,25,15,'None','S-00030'),
('C-00067','Ajith Niwad',27,185,65,25,15,'None','S-00026'),
('C-00068','Shihan Jayashantha',27,185,65,25,15,'None','S-00026'),
('C-00069','Dinesh Kosgoda',27,185,65,25,15,'None','S-00030'),
('C-00070','Ranga Sameera',27,185,65,25,15,'None','S-00030'),
('C-00071','Shirantha Wijesinghe',27,185,65,25,15,'None','S-00028'),
('C-00072','Ranil Nilukshan',27,185,65,25,15,'None','S-00028'),
('C-00073','Uditha Wijesekara',27,185,65,25,15,'None','S-00028'),
('C-00074','Nirosha Perera',27,185,65,25,15,'None','S-00025'),
('C-00075','Suminda Fernando',27,175,65,25,15,'None','S-00025'),
('C-00076','Surindi Wijeweera',27,175,65,25,15,'None','S-00025'),
('C-00077','Diliki Alwis',27,175,65,25,15,'None','S-00024'),
('C-00078','Senuri Hapugoda',27,175,65,25,15,'None','S-00029'),
('C-00079','Gerad Fernando',27,175,65,25,15,'None','S-00029'),
('C-00080','Akila Senevirathne',27,175,65,25,15,'None','S-00029'),
('C-00081','Athavuda Senevirathne',27,175,65,25,15,'None','S-00027'),
('C-00082','Sachintha Perera',27,175,65,25,15,'None','S-00027'),
('C-00083','Varuna Peiris',27,175,65,25,15,'None','S-00021'),
('C-00084','Sahan Jayasinghe',27,175,65,25,15,'None','S-00021'),
('C-00085','Nawod Wijesekara',27,185,65,25,15,'None','S-00021'),
('C-00086','Rasanjana Jayasinghe',27,181,65,25,15,'None','S-00021'),
('C-00087','Layodya Witharana',27,171,65,25,15,'None','S-00020'),
('C-00088','Kasthuri Perera',27,177,65,25,15,'None','S-00020'),
('C-00089','Hasith Bandara',27,185,65,25,15,'None','S-00020'),
('C-00090','Hasitha Perera',27,195,65,25,15,'None','S-00019'),
('C-00091','Rasith Bandu',27,165,65,25,15,'None','S-00019'),
('C-00092','Rasintha Weerasinghe',28,175,65,25,15,'None','S-00019'),
('C-00093','Suminda Wijebandu',27,185,65,25,15,'None','S-00019'),
('C-00094','Roopabandu Samarasinghe',27,178,65,25,15,'None','S-00018'),
('C-00095','Sajith Weerawansha',27,177,65,25,15,'None','S-00018'),
('C-00096','Rajitha Priyanka',27,175,65,25,15,'None','S-00018'),
('C-00097','Samitha Bandara',27,169,65,25,15,'None','S-00017'),
('C-00098','Ravindara Peiris',27,168,65,25,15,'None','S-00017'),
('C-00099','Samindu Samarasinghe',27,165,65,25,15,'None','S-00017'),
('C-00100','Dushmantha Samarasinghe',27,165,65,25,15,'None','S-00017');





INSERT INTO payment (id,amount,payment_type_id,status,remarks,date)
VALUES
('','15520','PT-00001','Equipment','Test','2022-01-01'),
('','7850','PT-00002','Equipment','Test','2022-01-01'),
('','2555','PT-00001','Expense','Test','2022-01-01'),
('','1500','PT-00001','Expense','Test','2022-01-01'),
('','20000','PT-00001','Equipment','Test','2022-01-01'),
('','12578','PT-00002','Equipment','Test','2022-01-01'),
('','3758','PT-00001','Expense','Test','2022-01-01'),
('','4890','PT-00002','Equipment','Test','2022-01-01'),
('','9250','PT-00002','Equipment','Test','2022-01-01'),
('','2450','PT-00002','Expense','Test','2022-01-01'),
('','3450','PT-00001','Equipment','Test','2022-01-01'),
('','25000','PT-00001','Equipment','Test','2022-02-01'),
('','4550','PT-00001','Equipment','Test','2022-02-01'),
('','1450','PT-00001','Expense','Test','2022-02-01'),
('','1785','PT-00001','Expense','Test','2022-02-01'),
('','9850','PT-00001','Equipment','Test','2022-02-01'),
('','5580','PT-00001','Equipment','Test','2022-02-01'),
('','1250','PT-00002','Expense','Test','2022-02-01'),
('','13550','PT-00002','Equipment','Test','2022-02-01'),
('','3650','PT-00002','Expense','Test','2022-02-01'),
('','7950','PT-00002','Equipment','Test','2022-02-01'),
('','2250','PT-00002','Expense','Test','2022-02-01'),
('','2360','PT-00002','Expense','Test','2022-02-01'),
('','6680','PT-00002','Equipment','Test','2022-02-01'),
('','6150','PT-00002','Equipment','Test','2022-02-01'),
('','4250','PT-00002','Equipment','Test','2022-02-01'),
('','3450','PT-00002','Expense','Test','2022-02-01'),
('','8750','PT-00002','Equipment','Test','2022-02-01'),
('','7560','PT-00002','Equipment','Test','2022-02-01'),
('','7560','PT-00002','Equipment','Test','2022-02-01'),
('','15520','PT-00001','Equipment','Test','2022-02-01'),
('','7850','PT-00002','Equipment','Test','2022-02-01'),
('','2555','PT-00001','Expense','Test','2022-02-01'),
('','1500','PT-00001','Expense','Test','2022-02-01'),
('','20000','PT-00001','Equipment','Test','2022-02-01'),
('','12578','PT-00002','Equipment','Test','2022-02-01'),
('','3758','PT-00001','Expense','Test','2022-02-01'),
('','4890','PT-00002','Equipment','Test','2022-02-01'),
('','9250','PT-00002','Equipment','Test','2022-03-01'),
('','2450','PT-00002','Expense','Test','2022-03-01'),
('','3450','PT-00001','Equipment','Test','2022-03-01'),
('','25000','PT-00001','Equipment','Test','2022-03-01'),
('','4550','PT-00001','Equipment','Test','2022-03-01'),
('','1450','PT-00001','Expense','Test','2022-03-01'),
('','1785','PT-00001','Expense','Test','2022-03-01'),
('','9850','PT-00001','Equipment','Test','2022-03-01'),
('','5580','PT-00001','Equipment','Test','2022-03-01'),
('','1250','PT-00002','Expense','Test','2022-03-01'),
('','13550','PT-00002','Equipment','Test','2022-03-01'),
('','3650','PT-00002','Expense','Test','2022-03-01'),
('','7950','PT-00002','Equipment','Test','2022-03-01'),
('','2250','PT-00002','Expense','Test','2022-03-01'),
('','2360','PT-00002','Expense','Test','2022-03-01'),
('','6680','PT-00002','Equipment','Test','2022-03-01'),
('','6150','PT-00002','Equipment','Test','2022-03-01'),
('','4250','PT-00002','Equipment','Test','2022-03-01'),
('','3450','PT-00002','Expense','Test','2022-03-01'),
('','8750','PT-00002','Equipment','Test','2022-03-01'),
('','7560','PT-00002','Equipment','Test','2022-03-01'),
('','7560','PT-00002','Equipment','Test','2022-03-01'),
('','15520','PT-00001','Equipment','Test','2022-04-01'),
('','7850','PT-00002','Equipment','Test','2022-04-01'),
('','2555','PT-00001','Expense','Test','2022-04-01'),
('','1500','PT-00001','Expense','Test','2022-04-01'),
('','20000','PT-00001','Equipment','Test','2022-04-01'),
('','12578','PT-00002','Equipment','Test','2022-04-01'),
('','3758','PT-00001','Expense','Test','2022-04-01'),
('','4890','PT-00002','Equipment','Test','2022-04-01'),
('','9250','PT-00002','Equipment','Test','2022-04-01'),
('','2450','PT-00002','Expense','Test','2022-04-01'),
('','3450','PT-00001','Equipment','Test','2022-04-01'),
('','25000','PT-00001','Equipment','Test','2022-04-01'),
('','4550','PT-00001','Equipment','Test','2022-04-01'),
('','1450','PT-00001','Expense','Test','2022-04-01'),
('','1785','PT-00001','Expense','Test','2022-04-01'),
('','9850','PT-00001','Equipment','Test','2022-04-01'),
('','5580','PT-00001','Equipment','Test','2022-04-01'),
('','1250','PT-00002','Expense','Test','2022-04-01'),
('','13550','PT-00002','Equipment','Test','2022-04-01'),
('','3650','PT-00002','Expense','Test','2022-04-01'),
('','7950','PT-00002','Equipment','Test','2022-04-01'),
('','2250','PT-00002','Expense','Test','2022-04-01'),
('','2360','PT-00002','Expense','Test','2022-04-01'),
('','6680','PT-00002','Equipment','Test','2022-04-01'),
('','6150','PT-00002','Equipment','Test','2022-04-01'),
('','4250','PT-00002','Equipment','Test','2022-04-01'),
('','3450','PT-00002','Expense','Test','2022-04-01'),
('','8750','PT-00002','Equipment','Test','2022-04-01'),
('','7560','PT-00002','Equipment','Test','2022-04-01'),
('','7560','PT-00002','Equipment','Test','2022-04-01'),
('','15520','PT-00001','Equipment','Test','2022-04-01'),
('','7850','PT-00002','Equipment','Test','2022-04-01'),
('','2555','PT-00001','Expense','Test','2022-05-01'),
('','1500','PT-00001','Expense','Test','2022-05-01'),
('','20000','PT-00001','Equipment','Test','2022-05-01'),
('','12578','PT-00002','Equipment','Test','2022-05-01'),
('','3758','PT-00001','Expense','Test','2022-05-01'),
('','4890','PT-00002','Equipment','Test','2022-05-01'),
('','9250','PT-00002','Equipment','Test','2022-05-01'),
('','2450','PT-00002','Expense','Test','2022-05-01'),
('','3450','PT-00001','Equipment','Test','2022-05-01'),
('','25000','PT-00001','Equipment','Test','2022-05-01'),
('','4550','PT-00001','Equipment','Test','2022-05-01'),
('','1450','PT-00001','Expense','Test','2022-05-01'),
('','1785','PT-00001','Expense','Test','2022-05-01'),
('','9850','PT-00001','Equipment','Test','2022-05-01'),
('','5580','PT-00001','Equipment','Test','2022-05-01'),
('','1250','PT-00002','Expense','Test','2022-05-01'),
('','13550','PT-00002','Equipment','Test','2022-05-01'),
('','3650','PT-00002','Expense','Test','2022-05-01'),
('','7950','PT-00002','Equipment','Test','2022-05-01'),
('','2250','PT-00002','Expense','Test','2022-05-01'),
('','2360','PT-00002','Expense','Test','2022-05-01'),
('','6680','PT-00002','Equipment','Test','2022-05-01'),
('','6150','PT-00002','Equipment','Test','2022-05-01'),
('','4250','PT-00002','Equipment','Test','2022-05-01'),
('','3450','PT-00002','Expense','Test','2022-05-01'),
('','8750','PT-00002','Equipment','Test','2022-05-01'),
('','7560','PT-00002','Equipment','Test','2022-05-01'),
('','7560','PT-00002','Equipment','Test','2022-05-01');



INSERT INTO membership_payment (id,amount,payment_payment_type_id,date)
VALUES
('','90000','PT-00001','2022-01-01'),
('','90000','PT-00002','2022-01-01'),
('','90000','PT-00001','2022-01-01'),
('','90000','PT-00001','2022-01-01'),
('','90000','PT-00002','2022-01-01'),
('','80000','PT-00002','2022-01-01'),
('','80000','PT-00002','2022-01-01'),
('','80000','PT-00002','2022-01-01'),
('','80000','PT-00002','2022-01-01'),
('','80000','PT-00001','2022-01-01'),
('','80000','PT-00001','2022-01-01'),
('','80000','PT-00001','2022-01-01'),
('','80000','PT-00001','2022-01-01'),
('','80000','PT-00001','2022-02-01'),
('','80000','PT-00001','2022-02-01'),
('','90000','PT-00001','2022-02-01'),
('','90000','PT-00001','2022-02-01'),
('','90000','PT-00002','2022-02-01'),
('','90000','PT-00002','2022-02-01'),
('','90000','PT-00002','2022-02-01'),
('','90000','PT-00002','2022-02-01'),
('','90000','PT-00002','2022-02-01'),
('','90000','PT-00002','2022-02-01'),
('','90000','PT-00001','2022-02-01'),
('','90000','PT-00001','2022-02-01'),
('','90000','PT-00001','2022-02-01'),
('','90000','PT-00002','2022-02-01'),
('','90000','PT-00001','2022-02-01'),
('','90000','PT-00001','2022-02-01'),
('','90000','PT-00002','2022-02-01'),
('','65000','PT-00002','2022-02-01'),
('','65000','PT-00002','2022-02-01'),
('','65000','PT-00002','2022-02-01'),
('','65000','PT-00002','2022-02-01'),
('','65000','PT-00001','2022-02-01'),
('','65000','PT-00001','2022-02-01'),
('','65000','PT-00001','2022-02-01'),
('','65000','PT-00001','2022-02-01'),
('','65000','PT-00001','2022-02-01'),
('','65000','PT-00001','2022-02-01'),
('','65000','PT-00001','2022-03-01'),
('','65000','PT-00001','2022-03-01'),
('','65000','PT-00002','2022-03-01'),
('','65000','PT-00002','2022-03-01'),
('','65000','PT-00002','2022-03-01'),
('','60000','PT-00002','2022-03-01'),
('','60000','PT-00002','2022-03-01'),
('','60000','PT-00002','2022-03-01'),
('','60000','PT-00001','2022-03-01'),
('','60000','PT-00001','2022-03-01'),
('','60000','PT-00001','2022-03-01'),
('','60000','PT-00002','2022-03-01'),
('','60000','PT-00001','2022-03-01'),
('','60000','PT-00001','2022-03-01'),
('','60000','PT-00002','2022-03-01'),
('','50000','PT-00002','2022-03-01'),
('','50000','PT-00002','2022-03-01'),
('','50000','PT-00002','2022-03-01'),
('','50000','PT-00002','2022-03-01'),
('','50000','PT-00001','2022-03-01'),
('','50000','PT-00001','2022-03-01'),
('','50000','PT-00001','2022-03-01'),
('','50000','PT-00001','2022-03-01'),
('','50000','PT-00001','2022-04-01'),
('','50000','PT-00001','2022-04-01'),
('','50000','PT-00001','2022-04-01'),
('','50000','PT-00001','2022-04-01'),
('','50000','PT-00002','2022-04-01'),
('','50000','PT-00002','2022-04-01'),
('','50000','PT-00002','2022-04-01'),
('','45000','PT-00002','2022-04-01'),
('','45000','PT-00002','2022-04-01'),
('','45000','PT-00002','2022-04-01'),
('','45000','PT-00001','2022-04-01'),
('','45000','PT-00001','2022-04-01'),
('','45000','PT-00001','2022-04-01'),
('','45000','PT-00002','2022-04-01'),
('','45000','PT-00001','2022-04-01'),
('','45000','PT-00001','2022-04-01'),
('','45000','PT-00002','2022-04-01'),
('','45000','PT-00002','2022-05-01'),
('','45000','PT-00002','2022-05-01'),
('','45000','PT-00002','2022-05-01'),
('','45000','PT-00002','2022-05-01'),
('','60000','PT-00001','2022-05-01'),
('','60000','PT-00001','2022-05-01'),
('','60000','PT-00001','2022-05-01'),
('','60000','PT-00001','2022-05-01'),
('','60000','PT-00001','2022-05-01'),
('','90000','PT-00001','2022-05-01'),
('','90000','PT-00001','2022-05-01'),
('','90000','PT-00001','2022-05-01'),
('','90000','PT-00002','2022-05-01'),
('','90000','PT-00002','2022-05-01'),
('','90000','PT-00002','2022-05-01'),
('','90000','PT-00002','2022-05-01'),
('','90000','PT-00002','2022-05-01'),
('','90000','PT-00002','2022-05-01'),
('','90000','PT-00001','2022-05-01'),
('','90000','PT-00001','2022-05-01');






INSERT INTO leave_details (id,staff_id,staff_member_name,date)
VALUES


('','S-00002','Ashan Himaru','2022-04-01'),
('','S-00002','Ashan Himaru','2022-04-02'),
('','S-00002','Ashan Himaru','2022-04-03'),
('','S-00002','Ashan Himaru','2022-04-04'),
('','S-00002','Ashan Himaru','2022-04-05'),
('','S-00002','Ashan Himaru','2022-05-01'),
('','S-00002','Ashan Himaru','2022-05-02'),
('','S-00002','Ashan Himaru','2022-05-03'),
('','S-00002','Ashan Himaru','2022-05-04'),
('','S-00002','Ashan Himaru','2022-05-31'),





('','S-00003','Dasun Coorey','2022-04-02'),
('','S-00003','Dasun Coorey','2022-04-03'),
('','S-00003','Dasun Coorey','2022-04-04'),
('','S-00003','Dasun Coorey','2022-04-05'),
('','S-00003','Dasun Coorey','2022-04-06'),
('','S-00003','Dasun Coorey','2022-05-02'),
('','S-00003','Dasun Coorey','2022-05-03'),
('','S-00003','Dasun Coorey','2022-05-04'),
('','S-00003','Dasun Coorey','2022-05-05'),
('','S-00003','Dasun Coorey','2022-05-30'),





('','S-00004','Tharindu Madhawa','2022-04-03'),
('','S-00004','Tharindu Madhawa','2022-04-04'),
('','S-00004','Tharindu Madhawa','2022-04-05'),
('','S-00004','Tharindu Madhawa','2022-04-06'),
('','S-00004','Tharindu Madhawa','2022-04-07'),
('','S-00004','Tharindu Madhawa','2022-05-08'),
('','S-00004','Tharindu Madhawa','2022-05-09'),
('','S-00004','Tharindu Madhawa','2022-05-10'),
('','S-00004','Tharindu Madhawa','2022-05-11'),
('','S-00004','Tharindu Madhawa','2022-05-31'),




('','S-00005','Janidu Jayasanka','2022-04-04'),
('','S-00005','Janidu Jayasanka','2022-04-05'),
('','S-00005','Janidu Jayasanka','2022-04-06'),
('','S-00005','Janidu Jayasanka','2022-04-07'),
('','S-00005','Janidu Jayasanka','2022-04-08'),
('','S-00005','Janidu Jayasanka','2022-05-09'),
('','S-00005','Janidu Jayasanka','2022-05-10'),
('','S-00005','Janidu Jayasanka','2022-05-11'),
('','S-00005','Janidu Jayasanka','2022-05-12'),
('','S-00005','Janidu Jayasanka','2022-05-13'),






('','S-00006','Pasindu Deshan','2022-04-05'),
('','S-00006','Pasindu Deshan','2022-04-06'),
('','S-00006','Pasindu Deshan','2022-04-07'),
('','S-00006','Pasindu Deshan','2022-04-08'),
('','S-00006','Pasindu Deshan','2022-04-09'),
('','S-00006','Pasindu Deshan','2022-05-10'),
('','S-00006','Pasindu Deshan','2022-05-11'),
('','S-00006','Pasindu Deshan','2022-05-12'),
('','S-00006','Pasindu Deshan','2022-05-13'),
('','S-00006','Pasindu Deshan','2022-05-14'),





('','S-00007','Victor Ivan','2022-04-15'),
('','S-00007','Victor Ivan','2022-04-16'),
('','S-00007','Victor Ivan','2022-04-17'),
('','S-00007','Victor Ivan','2022-04-18'),
('','S-00007','Victor Ivan','2022-04-19'),
('','S-00007','Victor Ivan','2022-05-20'),
('','S-00007','Victor Ivan','2022-05-21'),
('','S-00007','Victor Ivan','2022-05-22'),
('','S-00007','Victor Ivan','2022-05-23'),
('','S-00007','Victor Ivan','2022-05-24'),





('','S-00008','Jayod Jayasinghe','2022-04-16'),
('','S-00008','Jayod Jayasinghe','2022-04-17'),
('','S-00008','Jayod Jayasinghe','2022-04-18'),
('','S-00008','Jayod Jayasinghe','2022-04-19'),
('','S-00008','Jayod Jayasinghe','2022-04-20'),
('','S-00008','Jayod Jayasinghe','2022-05-21'),
('','S-00008','Jayod Jayasinghe','2022-05-22'),
('','S-00008','Jayod Jayasinghe','2022-05-23'),
('','S-00008','Jayod Jayasinghe','2022-05-24'),
('','S-00008','Jayod Jayasinghe','2022-05-31'),







('','S-00009','Tharumal Wijesinghe','2022-04-17'),
('','S-00009','Tharumal Wijesinghe','2022-04-18'),
('','S-00009','Tharumal Wijesinghe','2022-04-19'),
('','S-00009','Tharumal Wijesinghe','2022-04-20'),
('','S-00009','Tharumal Wijesinghe','2022-04-21'),
('','S-00009','Tharumal Wijesinghe','2022-05-22'),
('','S-00009','Tharumal Wijesinghe','2022-05-23'),
('','S-00009','Tharumal Wijesinghe','2022-05-24'),
('','S-00009','Tharumal Wijesinghe','2022-05-25'),
('','S-00009','Tharumal Wijesinghe','2022-05-26'),






('','S-00010','Rekha Perera','2022-04-18'),
('','S-00010','Rekha Perera','2022-04-19'),
('','S-00010','Rekha Perera','2022-04-20'),
('','S-00010','Rekha Perera','2022-04-21'),
('','S-00010','Rekha Perera','2022-04-22'),
('','S-00010','Rekha Perera','2022-05-23'),
('','S-00010','Rekha Perera','2022-05-24'),
('','S-00010','Rekha Perera','2022-05-25'),
('','S-00010','Rekha Perera','2022-05-26'),
('','S-00010','Rekha Perera','2022-05-27'),





('','S-00011','Ruvini Ahangama','2022-04-20'),
('','S-00011','Ruvini Ahangama','2022-04-21'),
('','S-00011','Ruvini Ahangama','2022-04-22'),
('','S-00011','Ruvini Ahangama','2022-04-23'),
('','S-00011','Ruvini Ahangama','2022-04-24'),
('','S-00011','Ruvini Ahangama','2022-05-25'),
('','S-00011','Ruvini Ahangama','2022-05-26'),
('','S-00011','Ruvini Ahangama','2022-05-27'),
('','S-00011','Ruvini Ahangama','2022-05-28'),
('','S-00011','Ruvini Ahangama','2022-05-29'),






('','S-00012','Tharupa Amarasinghe','2022-04-20'),
('','S-00012','Tharupa Amarasinghe','2022-04-21'),
('','S-00012','Tharupa Amarasinghe','2022-04-22'),
('','S-00012','Tharupa Amarasinghe','2022-04-23'),
('','S-00012','Tharupa Amarasinghe','2022-04-24'),
('','S-00012','Tharupa Amarasinghe','2022-05-25'),
('','S-00012','Tharupa Amarasinghe','2022-05-26'),
('','S-00012','Tharupa Amarasinghe','2022-05-27'),
('','S-00012','Tharupa Amarasinghe','2022-05-28'),
('','S-00012','Tharupa Amarasinghe','2022-05-29'),





('','S-00013','Thurunu Jayasighe','2022-04-21'),
('','S-00013','Thurunu Jayasighe','2022-04-22'),
('','S-00013','Thurunu Jayasighe','2022-04-23'),
('','S-00013','Thurunu Jayasighe','2022-04-24'),
('','S-00013','Thurunu Jayasighe','2022-04-25'),
('','S-00013','Thurunu Jayasighe','2022-05-21'),
('','S-00013','Thurunu Jayasighe','2022-05-26'),
('','S-00013','Thurunu Jayasighe','2022-05-27'),
('','S-00013','Thurunu Jayasighe','2022-05-28'),
('','S-00013','Thurunu Jayasighe','2022-05-31'),





('','S-00014','Timal Rukshan','2022-04-21'),
('','S-00014','Timal Rukshan','2022-04-22'),
('','S-00014','Timal Rukshan','2022-04-23'),
('','S-00014','Timal Rukshan','2022-04-24'),
('','S-00014','Timal Rukshan','2022-04-25'),
('','S-00014','Timal Rukshan','2022-05-26'),
('','S-00014','Timal Rukshan','2022-05-27'),
('','S-00014','Timal Rukshan','2022-05-28'),
('','S-00014','Timal Rukshan','2022-05-29'),
('','S-00014','Timal Rukshan','2022-05-31'),




('','S-00015','Rukshan Samarasinghe','2022-04-22'),
('','S-00015','Rukshan Samarasinghe','2022-04-23'),
('','S-00015','Rukshan Samarasinghe','2022-04-24'),
('','S-00015','Rukshan Samarasinghe','2022-04-25'),
('','S-00015','Rukshan Samarasinghe','2022-04-26'),
('','S-00015','Rukshan Samarasinghe','2022-05-27'),
('','S-00015','Rukshan Samarasinghe','2022-05-28'),
('','S-00015','Rukshan Samarasinghe','2022-05-29'),
('','S-00015','Rukshan Samarasinghe','2022-05-30'),
('','S-00015','Rukshan Samarasinghe','2022-05-31'),



('','S-00016','Amarabandu Roopasinge','2022-04-22'),
('','S-00016','Amarabandu Roopasinge','2022-04-23'),
('','S-00016','Amarabandu Roopasinge','2022-04-24'),
('','S-00016','Amarabandu Roopasinge','2022-04-25'),
('','S-00016','Amarabandu Roopasinge','2022-04-26'),
('','S-00016','Amarabandu Roopasinge','2022-05-27'),
('','S-00016','Amarabandu Roopasinge','2022-05-28'),
('','S-00016','Amarabandu Roopasinge','2022-05-29'),
('','S-00016','Amarabandu Roopasinge','2022-05-30'),
('','S-00016','Amarabandu Roopasinge','2022-05-31'),




('','S-00017','Roopa Randini','2022-04-22'),
('','S-00017','Roopa Randini','2022-04-23'),
('','S-00017','Roopa Randini','2022-04-07'),
('','S-00017','Roopa Randini','2022-04-08'),
('','S-00017','Roopa Randini','2022-04-09'),
('','S-00017','Roopa Randini','2022-05-10'),
('','S-00017','Roopa Randini','2022-05-12'),
('','S-00017','Roopa Randini','2022-05-13'),
('','S-00017','Roopa Randini','2022-05-14'),
('','S-00017','Roopa Randini','2022-05-31'),




('','S-00018','Tissa Madhawa','2022-04-11'),
('','S-00018','Tissa Madhawa','2022-04-12'),
('','S-00018','Tissa Madhawa','2022-04-13'),
('','S-00018','Tissa Madhawa','2022-04-14'),
('','S-00018','Tissa Madhawa','2022-04-15'),
('','S-00018','Tissa Madhawa','2022-05-11'),
('','S-00018','Tissa Madhawa','2022-05-12'),
('','S-00018','Tissa Madhawa','2022-05-13'),
('','S-00018','Tissa Madhawa','2022-05-14'),
('','S-00018','Tissa Madhawa','2022-05-31'),




('','S-00019','Kithsiri Jayasanka','2022-04-01'),
('','S-00019','Kithsiri Jayasanka','2022-04-02'),
('','S-00019','Kithsiri Jayasanka','2022-04-03'),
('','S-00019','Kithsiri Jayasanka','2022-04-04'),
('','S-00019','Kithsiri Jayasanka','2022-04-05'),
('','S-00019','Kithsiri Jayasanka','2022-05-01'),
('','S-00019','Kithsiri Jayasanka','2022-05-02'),
('','S-00019','Kithsiri Jayasanka','2022-05-03'),
('','S-00019','Kithsiri Jayasanka','2022-05-04'),
('','S-00019','Kithsiri Jayasanka','2022-05-15'),





('','S-00020','Ranjith Deshan','2022-04-01'),
('','S-00020','Ranjith Deshan','2022-04-02'),
('','S-00020','Ranjith Deshan','2022-04-03'),
('','S-00020','Ranjith Deshan','2022-04-04'),
('','S-00020','Ranjith Deshan','2022-04-05'),
('','S-00020','Ranjith Deshan','2022-05-01'),
('','S-00020','Ranjith Deshan','2022-05-02'),
('','S-00020','Ranjith Deshan','2022-05-03'),
('','S-00020','Ranjith Deshan','2022-05-04'),
('','S-00020','Ranjith Deshan','2022-05-15'),






('','S-00021','Ruvindu Ivan','2022-04-01'),
('','S-00021','Ruvindu Ivan','2022-04-02'),
('','S-00021','Ruvindu Ivan','2022-04-03'),
('','S-00021','Ruvindu Ivan','2022-04-04'),
('','S-00021','Ruvindu Ivan','2022-04-05'),
('','S-00021','Ruvindu Ivan','2022-05-01'),
('','S-00021','Ruvindu Ivan','2022-05-02'),
('','S-00021','Ruvindu Ivan','2022-05-03'),
('','S-00021','Ruvindu Ivan','2022-05-04'),
('','S-00021','Ruvindu Ivan','2022-05-14'),






('','S-00022','Ranimini Jayasinghe','2022-03-01'),
('','S-00022','Ranimini Jayasinghe','2022-03-02'),
('','S-00022','Ranimini Jayasinghe','2022-03-03'),
('','S-00022','Ranimini Jayasinghe','2022-03-04'),
('','S-00022','Ranimini Jayasinghe','2022-03-05'),
('','S-00022','Ranimini Jayasinghe','2022-02-01'),
('','S-00022','Ranimini Jayasinghe','2022-02-02'),
('','S-00022','Ranimini Jayasinghe','2022-02-03'),
('','S-00022','Ranimini Jayasinghe','2022-02-04'),
('','S-00022','Ranimini Jayasinghe','2022-02-05'),





('','S-00023','Ravini Wijesinghe','2022-03-01'),
('','S-00023','Ravini Wijesinghe','2022-03-02'),
('','S-00023','Ravini Wijesinghe','2022-03-03'),
('','S-00023','Ravini Wijesinghe','2022-03-04'),
('','S-00023','Ravini Wijesinghe','2022-03-05'),
('','S-00023','Ravini Wijesinghe','2022-02-01'),
('','S-00023','Ravini Wijesinghe','2022-02-02'),
('','S-00023','Ravini Wijesinghe','2022-02-03'),
('','S-00023','Ravini Wijesinghe','2022-02-04'),
('','S-00023','Ravini Wijesinghe','2022-02-28'),





('','S-00024','Minoli Perera','2022-03-06'),
('','S-00024','Minoli Perera','2022-03-07'),
('','S-00024','Minoli Perera','2022-03-08'),
('','S-00024','Minoli Perera','2022-03-09'),
('','S-00024','Minoli Perera','2022-03-10'),
('','S-00024','Minoli Perera','2022-02-08'),
('','S-00024','Minoli Perera','2022-02-09'),
('','S-00024','Minoli Perera','2022-02-10'),
('','S-00024','Minoli Perera','2022-02-11'),
('','S-00024','Minoli Perera','2022-02-12'),






('','S-00025','Vidumina Ahangama','2022-03-06'),
('','S-00025','Vidumina Ahangama','2022-03-07'),
('','S-00025','Vidumina Ahangama','2022-03-08'),
('','S-00025','Vidumina Ahangama','2022-03-09'),
('','S-00025','Vidumina Ahangama','2022-03-10'),
('','S-00025','Vidumina Ahangama','2022-02-06'),
('','S-00025','Vidumina Ahangama','2022-02-07'),
('','S-00025','Vidumina Ahangama','2022-02-08'),
('','S-00025','Vidumina Ahangama','2022-02-09'),
('','S-00025','Vidumina Ahangama','2022-02-10'),







('','S-00026','Chathuranga Amarasinghe','2022-03-06'),
('','S-00026','Chathuranga Amarasinghe','2022-03-07'),
('','S-00026','Chathuranga Amarasinghe','2022-03-08'),
('','S-00026','Chathuranga Amarasinghe','2022-03-09'),
('','S-00026','Chathuranga Amarasinghe','2022-03-10'),
('','S-00026','Chathuranga Amarasinghe','2022-02-07'),
('','S-00026','Chathuranga Amarasinghe','2022-02-08'),
('','S-00026','Chathuranga Amarasinghe','2022-02-09'),
('','S-00026','Chathuranga Amarasinghe','2022-02-10'),
('','S-00026','Chathuranga Amarasinghe','2022-02-11'),







('','S-00027','Deshan Jayasighe','2022-03-10'),
('','S-00027','Deshan Jayasighe','2022-03-12'),
('','S-00027','Deshan Jayasighe','2022-03-13'),
('','S-00027','Deshan Jayasighe','2022-03-14'),
('','S-00027','Deshan Jayasighe','2022-03-15'),
('','S-00027','Deshan Jayasighe','2022-02-11'),
('','S-00027','Deshan Jayasighe','2022-02-12'),
('','S-00027','Deshan Jayasighe','2022-02-13'),
('','S-00027','Deshan Jayasighe','2022-02-14'),
('','S-00027','Deshan Jayasighe','2022-02-21'),






('','S-00028','Anjana Rukshan','2022-03-11'),
('','S-00028','Anjana Rukshan','2022-03-12'),
('','S-00028','Anjana Rukshan','2022-03-13'),
('','S-00028','Anjana Rukshan','2022-03-14'),
('','S-00028','Anjana Rukshan','2022-03-15'),
('','S-00028','Anjana Rukshan','2022-02-11'),
('','S-00028','Anjana Rukshan','2022-02-12'),
('','S-00028','Anjana Rukshan','2022-02-13'),
('','S-00028','Anjana Rukshan','2022-02-14'),
('','S-00028','Anjana Rukshan','2022-02-22'),






('','S-00029','Heshan Samarasinghe','2022-03-21'),
('','S-00029','Heshan Samarasinghe','2022-02-22'),
('','S-00029','Heshan Samarasinghe','2022-02-23'),
('','S-00029','Heshan Samarasinghe','2022-02-24'),
('','S-00029','Heshan Samarasinghe','2022-02-25'),
('','S-00029','Heshan Samarasinghe','2022-03-21'),
('','S-00029','Heshan Samarasinghe','2022-03-22'),
('','S-00029','Heshan Samarasinghe','2022-03-23'),
('','S-00029','Heshan Samarasinghe','2022-03-24'),
('','S-00029','Heshan Samarasinghe','2022-03-25'),






('','S-00030','Madhawa Roopasinge','2022-02-21'),
('','S-00030','Madhawa Roopasinge','2022-02-22'),
('','S-00030','Madhawa Roopasinge','2022-02-23'),
('','S-00030','Madhawa Roopasinge','2022-02-24'),
('','S-00030','Madhawa Roopasinge','2022-02-25'),
('','S-00030','Madhawa Roopasinge','2022-03-21'),
('','S-00030','Madhawa Roopasinge','2022-03-22'),
('','S-00030','Madhawa Roopasinge','2022-03-23'),
('','S-00030','Madhawa Roopasinge','2022-03-24'),
('','S-00030','Madhawa Roopasinge','2022-03-25'),







('','S-00031','Madhawi Randini','2022-02-15'),
('','S-00031','Madhawi Randini','2022-02-16'),
('','S-00031','Madhawi Randini','2022-02-17'),
('','S-00031','Madhawi Randini','2022-02-18'),
('','S-00031','Madhawi Randini','2022-02-19'),
('','S-00031','Madhawi Randini','2022-03-15'),
('','S-00031','Madhawi Randini','2022-03-16'),
('','S-00031','Madhawi Randini','2022-03-17'),
('','S-00031','Madhawi Randini','2022-03-18'),
('','S-00031','Madhawi Randini','2022-03-19'),





('','S-00032','Sulochana Satharasinghe','2022-02-26'),
('','S-00032','Sulochana Satharasinghe','2022-02-27'),
('','S-00032','Sulochana Satharasinghe','2022-02-15'),
('','S-00032','Sulochana Satharasinghe','2022-02-16'),
('','S-00032','Sulochana Satharasinghe','2022-02-17'),
('','S-00032','Sulochana Satharasinghe','2022-03-24'),
('','S-00032','Sulochana Satharasinghe','2022-03-25'),
('','S-00032','Sulochana Satharasinghe','2022-03-26'),
('','S-00002','Sulochana Satharasinghe','2022-03-27'),
('','S-00032','Sulochana Satharasinghe','2022-03-31'),






('','S-00033','Irine Fernando','2022-02-26'),
('','S-00033','Irine Fernando','2022-02-27'),
('','S-00033','Irine Fernando','2022-02-28'),
('','S-00033','Irine Fernando','2022-02-15'),
('','S-00033','Irine Fernando','2022-02-16'),
('','S-00033','Irine Fernando','2022-02-19'),
('','S-00033','Irine Fernando','2022-03-27'),
('','S-00033','Irine Fernando','2022-03-28'),
('','S-00033','Irine Fernando','2022-03-30'),
('','S-00033','Irine Fernando','2022-03-31');




INSERT INTO vendor (id,name,equipments,remarks)
VALUES
('','P.K Holdings','Test','Test'),
('','Jayasighe & Sons','Test','Test'),
('','Weerarathne Suppliers','Test','Test'),
('','Amarasighe PLC','Test','Test'),
('','Roopasinghe Stores','Test','Test'),
('','Amarabandu Holdings','Test','Test'),
('','Weerasinghe PLC','Test','Test'),
('','P.K Holdings','Test','Test');





INSERT INTO attendance (id,staff_id,staff_member_name,date)
VALUES

('','S-00002','Ashan Himaru','2022-01-01'),
('','S-00002','Ashan Himaru','2022-01-02'),
('','S-00002','Ashan Himaru','2022-01-03'),
('','S-00002','Ashan Himaru','2022-01-04'),
('','S-00002','Ashan Himaru','2022-01-05'),
('','S-00002','Ashan Himaru','2022-01-06'),
('','S-00002','Ashan Himaru','2022-01-07'),
('','S-00002','Ashan Himaru','2022-01-08'),
('','S-00002','Ashan Himaru','2022-01-09'),
('','S-00002','Ashan Himaru','2022-01-10'),
('','S-00002','Ashan Himaru','2022-01-11'),
('','S-00002','Ashan Himaru','2022-01-12'),
('','S-00002','Ashan Himaru','2022-01-13'),
('','S-00002','Ashan Himaru','2022-01-14'),
('','S-00002','Ashan Himaru','2022-01-15'),
('','S-00002','Ashan Himaru','2022-01-16'),
('','S-00002','Ashan Himaru','2022-01-17'),
('','S-00002','Ashan Himaru','2022-01-18'),
('','S-00002','Ashan Himaru','2022-01-19'),
('','S-00002','Ashan Himaru','2022-01-20'),
('','S-00002','Ashan Himaru','2022-02-01'),
('','S-00002','Ashan Himaru','2022-02-02'),
('','S-00002','Ashan Himaru','2022-02-03'),
('','S-00002','Ashan Himaru','2022-02-04'),
('','S-00002','Ashan Himaru','2022-02-05'),
('','S-00002','Ashan Himaru','2022-02-06'),
('','S-00002','Ashan Himaru','2022-02-07'),
('','S-00002','Ashan Himaru','2022-02-08'),
('','S-00002','Ashan Himaru','2022-02-09'),
('','S-00002','Ashan Himaru','2022-02-10'),
('','S-00002','Ashan Himaru','2022-02-11'),
('','S-00002','Ashan Himaru','2022-02-12'),
('','S-00002','Ashan Himaru','2022-02-13'),
('','S-00002','Ashan Himaru','2022-02-14'),
('','S-00002','Ashan Himaru','2022-02-15'),
('','S-00002','Ashan Himaru','2022-02-16'),
('','S-00002','Ashan Himaru','2022-02-17'),
('','S-00002','Ashan Himaru','2022-02-18'),
('','S-00002','Ashan Himaru','2022-02-19'),
('','S-00002','Ashan Himaru','2022-02-20'),
('','S-00002','Ashan Himaru','2022-03-01'),
('','S-00002','Ashan Himaru','2022-03-02'),
('','S-00002','Ashan Himaru','2022-03-03'),
('','S-00002','Ashan Himaru','2022-03-04'),
('','S-00002','Ashan Himaru','2022-03-05'),
('','S-00002','Ashan Himaru','2022-03-06'),
('','S-00002','Ashan Himaru','2022-03-07'),
('','S-00002','Ashan Himaru','2022-03-08'),
('','S-00002','Ashan Himaru','2022-03-09'),
('','S-00002','Ashan Himaru','2022-03-10'),
('','S-00002','Ashan Himaru','2022-03-11'),
('','S-00002','Ashan Himaru','2022-03-12'),
('','S-00002','Ashan Himaru','2022-03-13'),
('','S-00002','Ashan Himaru','2022-03-14'),
('','S-00002','Ashan Himaru','2022-03-15'),
('','S-00002','Ashan Himaru','2022-03-16'),
('','S-00002','Ashan Himaru','2022-03-17'),
('','S-00002','Ashan Himaru','2022-03-18'),
('','S-00002','Ashan Himaru','2022-03-19'),
('','S-00002','Ashan Himaru','2022-03-20'),
('','S-00002','Ashan Himaru','2022-04-01'),
('','S-00002','Ashan Himaru','2022-04-02'),
('','S-00002','Ashan Himaru','2022-04-03'),
('','S-00002','Ashan Himaru','2022-04-04'),
('','S-00002','Ashan Himaru','2022-04-05'),
('','S-00002','Ashan Himaru','2022-04-06'),
('','S-00002','Ashan Himaru','2022-04-07'),
('','S-00002','Ashan Himaru','2022-04-08'),
('','S-00002','Ashan Himaru','2022-04-09'),
('','S-00002','Ashan Himaru','2022-04-10'),
('','S-00002','Ashan Himaru','2022-04-11'),
('','S-00002','Ashan Himaru','2022-04-12'),
('','S-00002','Ashan Himaru','2022-04-13'),
('','S-00002','Ashan Himaru','2022-04-14'),
('','S-00002','Ashan Himaru','2022-04-15'),
('','S-00002','Ashan Himaru','2022-04-16'),
('','S-00002','Ashan Himaru','2022-04-17'),
('','S-00002','Ashan Himaru','2022-04-18'),
('','S-00002','Ashan Himaru','2022-04-19'),
('','S-00002','Ashan Himaru','2022-04-20'),
('','S-00002','Ashan Himaru','2022-05-01'),
('','S-00002','Ashan Himaru','2022-05-02'),
('','S-00002','Ashan Himaru','2022-05-03'),
('','S-00002','Ashan Himaru','2022-05-04'),
('','S-00002','Ashan Himaru','2022-05-05'),
('','S-00002','Ashan Himaru','2022-05-06'),
('','S-00002','Ashan Himaru','2022-05-07'),
('','S-00002','Ashan Himaru','2022-05-08'),
('','S-00002','Ashan Himaru','2022-05-09'),
('','S-00002','Ashan Himaru','2022-05-10'),
('','S-00002','Ashan Himaru','2022-05-11'),
('','S-00002','Ashan Himaru','2022-05-12'),
('','S-00002','Ashan Himaru','2022-05-13'),
('','S-00002','Ashan Himaru','2022-05-14'),
('','S-00002','Ashan Himaru','2022-05-15'),
('','S-00002','Ashan Himaru','2022-05-16'),
('','S-00002','Ashan Himaru','2022-05-17'),
('','S-00002','Ashan Himaru','2022-05-18'),
('','S-00002','Ashan Himaru','2022-05-19'),
('','S-00002','Ashan Himaru','2022-05-20'),





('','S-00003','Dasun Coorey','2022-01-01'),
('','S-00003','Dasun Coorey','2022-01-02'),
('','S-00003','Dasun Coorey','2022-01-03'),
('','S-00003','Dasun Coorey','2022-01-04'),
('','S-00003','Dasun Coorey','2022-01-05'),
('','S-00003','Dasun Coorey','2022-01-06'),
('','S-00003','Dasun Coorey','2022-01-07'),
('','S-00003','Dasun Coorey','2022-01-08'),
('','S-00003','Dasun Coorey','2022-01-09'),
('','S-00003','Dasun Coorey','2022-01-10'),
('','S-00003','Dasun Coorey','2022-01-11'),
('','S-00003','Dasun Coorey','2022-01-12'),
('','S-00003','Dasun Coorey','2022-01-13'),
('','S-00003','Dasun Coorey','2022-01-14'),
('','S-00003','Dasun Coorey','2022-01-15'),
('','S-00003','Dasun Coorey','2022-01-16'),
('','S-00003','Dasun Coorey','2022-01-17'),
('','S-00003','Dasun Coorey','2022-01-18'),
('','S-00003','Dasun Coorey','2022-01-19'),
('','S-00003','Dasun Coorey','2022-01-20'),
('','S-00003','Dasun Coorey','2022-02-01'),
('','S-00003','Dasun Coorey','2022-02-02'),
('','S-00003','Dasun Coorey','2022-02-03'),
('','S-00003','Dasun Coorey','2022-02-04'),
('','S-00003','Dasun Coorey','2022-02-05'),
('','S-00003','Dasun Coorey','2022-02-06'),
('','S-00003','Dasun Coorey','2022-02-07'),
('','S-00003','Dasun Coorey','2022-02-08'),
('','S-00003','Dasun Coorey','2022-02-09'),
('','S-00003','Dasun Coorey','2022-02-10'),
('','S-00003','Dasun Coorey','2022-02-11'),
('','S-00003','Dasun Coorey','2022-02-12'),
('','S-00003','Dasun Coorey','2022-02-13'),
('','S-00003','Dasun Coorey','2022-02-14'),
('','S-00003','Dasun Coorey','2022-02-15'),
('','S-00003','Dasun Coorey','2022-02-16'),
('','S-00003','Dasun Coorey','2022-02-17'),
('','S-00003','Dasun Coorey','2022-02-18'),
('','S-00003','Dasun Coorey','2022-02-19'),
('','S-00003','Dasun Coorey','2022-02-20'),
('','S-00003','Dasun Coorey','2022-03-01'),
('','S-00003','Dasun Coorey','2022-03-02'),
('','S-00003','Dasun Coorey','2022-03-03'),
('','S-00003','Dasun Coorey','2022-03-04'),
('','S-00003','Dasun Coorey','2022-03-05'),
('','S-00003','Dasun Coorey','2022-03-06'),
('','S-00003','Dasun Coorey','2022-03-07'),
('','S-00003','Dasun Coorey','2022-03-08'),
('','S-00003','Dasun Coorey','2022-03-09'),
('','S-00003','Dasun Coorey','2022-03-10'),
('','S-00003','Dasun Coorey','2022-03-11'),
('','S-00003','Dasun Coorey','2022-03-12'),
('','S-00003','Dasun Coorey','2022-03-13'),
('','S-00003','Dasun Coorey','2022-03-14'),
('','S-00003','Dasun Coorey','2022-03-15'),
('','S-00003','Dasun Coorey','2022-03-16'),
('','S-00003','Dasun Coorey','2022-03-17'),
('','S-00003','Dasun Coorey','2022-03-18'),
('','S-00003','Dasun Coorey','2022-03-19'),
('','S-00003','Dasun Coorey','2022-03-20'),
('','S-00003','Dasun Coorey','2022-04-01'),
('','S-00003','Dasun Coorey','2022-04-02'),
('','S-00003','Dasun Coorey','2022-04-03'),
('','S-00003','Dasun Coorey','2022-04-04'),
('','S-00003','Dasun Coorey','2022-04-05'),
('','S-00003','Dasun Coorey','2022-04-06'),
('','S-00003','Dasun Coorey','2022-04-07'),
('','S-00003','Dasun Coorey','2022-04-08'),
('','S-00003','Dasun Coorey','2022-04-09'),
('','S-00003','Dasun Coorey','2022-04-10'),
('','S-00003','Dasun Coorey','2022-04-11'),
('','S-00003','Dasun Coorey','2022-04-12'),
('','S-00003','Dasun Coorey','2022-04-13'),
('','S-00003','Dasun Coorey','2022-04-14'),
('','S-00003','Dasun Coorey','2022-04-15'),
('','S-00003','Dasun Coorey','2022-04-16'),
('','S-00003','Dasun Coorey','2022-04-17'),
('','S-00003','Dasun Coorey','2022-04-18'),
('','S-00003','Dasun Coorey','2022-04-19'),
('','S-00003','Dasun Coorey','2022-04-20'),
('','S-00003','Dasun Coorey','2022-05-01'),
('','S-00003','Dasun Coorey','2022-05-02'),
('','S-00003','Dasun Coorey','2022-05-03'),
('','S-00003','Dasun Coorey','2022-05-04'),
('','S-00003','Dasun Coorey','2022-05-05'),
('','S-00003','Dasun Coorey','2022-05-06'),
('','S-00003','Dasun Coorey','2022-05-07'),
('','S-00003','Dasun Coorey','2022-05-08'),
('','S-00003','Dasun Coorey','2022-05-09'),
('','S-00003','Dasun Coorey','2022-05-10'),
('','S-00003','Dasun Coorey','2022-05-11'),
('','S-00003','Dasun Coorey','2022-05-12'),
('','S-00003','Dasun Coorey','2022-05-13'),
('','S-00003','Dasun Coorey','2022-05-14'),
('','S-00003','Dasun Coorey','2022-05-15'),
('','S-00003','Dasun Coorey','2022-05-16'),
('','S-00003','Dasun Coorey','2022-05-17'),
('','S-00003','Dasun Coorey','2022-05-18'),
('','S-00003','Dasun Coorey','2022-05-19'),
('','S-00003','Dasun Coorey','2022-05-20'),




('','S-00004','Tharindu Madhawa','2022-01-01'),
('','S-00004','Tharindu Madhawa','2022-01-02'),
('','S-00004','Tharindu Madhawa','2022-01-03'),
('','S-00004','Tharindu Madhawa','2022-01-04'),
('','S-00004','Tharindu Madhawa','2022-01-05'),
('','S-00004','Tharindu Madhawa','2022-01-06'),
('','S-00004','Tharindu Madhawa','2022-01-07'),
('','S-00004','Tharindu Madhawa','2022-01-08'),
('','S-00004','Tharindu Madhawa','2022-01-09'),
('','S-00004','Tharindu Madhawa','2022-01-10'),
('','S-00004','Tharindu Madhawa','2022-01-11'),
('','S-00004','Tharindu Madhawa','2022-01-12'),
('','S-00004','Tharindu Madhawa','2022-01-13'),
('','S-00004','Tharindu Madhawa','2022-01-14'),
('','S-00004','Tharindu Madhawa','2022-01-15'),
('','S-00004','Tharindu Madhawa','2022-01-16'),
('','S-00004','Tharindu Madhawa','2022-01-17'),
('','S-00004','Tharindu Madhawa','2022-01-18'),
('','S-00004','Tharindu Madhawa','2022-01-19'),
('','S-00004','Tharindu Madhawa','2022-01-20'),
('','S-00004','Tharindu Madhawa','2022-02-01'),
('','S-00004','Tharindu Madhawa','2022-02-02'),
('','S-00004','Tharindu Madhawa','2022-02-03'),
('','S-00004','Tharindu Madhawa','2022-02-04'),
('','S-00004','Tharindu Madhawa','2022-02-05'),
('','S-00004','Tharindu Madhawa','2022-02-06'),
('','S-00004','Tharindu Madhawa','2022-02-07'),
('','S-00004','Tharindu Madhawa','2022-02-08'),
('','S-00004','Tharindu Madhawa','2022-02-09'),
('','S-00004','Tharindu Madhawa','2022-02-10'),
('','S-00004','Tharindu Madhawa','2022-02-11'),
('','S-00004','Tharindu Madhawa','2022-02-12'),
('','S-00004','Tharindu Madhawa','2022-02-13'),
('','S-00004','Tharindu Madhawa','2022-02-14'),
('','S-00004','Tharindu Madhawa','2022-02-15'),
('','S-00004','Tharindu Madhawa','2022-02-16'),
('','S-00004','Tharindu Madhawa','2022-02-17'),
('','S-00004','Tharindu Madhawa','2022-02-18'),
('','S-00004','Tharindu Madhawa','2022-02-19'),
('','S-00004','Tharindu Madhawa','2022-02-20'),
('','S-00004','Tharindu Madhawa','2022-03-01'),
('','S-00004','Tharindu Madhawa','2022-03-02'),
('','S-00004','Tharindu Madhawa','2022-03-03'),
('','S-00004','Tharindu Madhawa','2022-03-04'),
('','S-00004','Tharindu Madhawa','2022-03-05'),
('','S-00004','Tharindu Madhawa','2022-03-06'),
('','S-00004','Tharindu Madhawa','2022-03-07'),
('','S-00004','Tharindu Madhawa','2022-03-08'),
('','S-00004','Tharindu Madhawa','2022-03-09'),
('','S-00004','Tharindu Madhawa','2022-03-10'),
('','S-00004','Tharindu Madhawa','2022-03-11'),
('','S-00004','Tharindu Madhawa','2022-03-12'),
('','S-00004','Tharindu Madhawa','2022-03-13'),
('','S-00004','Tharindu Madhawa','2022-03-14'),
('','S-00004','Tharindu Madhawa','2022-03-15'),
('','S-00004','Tharindu Madhawa','2022-03-16'),
('','S-00004','Tharindu Madhawa','2022-03-17'),
('','S-00004','Tharindu Madhawa','2022-03-18'),
('','S-00004','Tharindu Madhawa','2022-03-19'),
('','S-00004','Tharindu Madhawa','2022-03-20'),
('','S-00004','Tharindu Madhawa','2022-04-01'),
('','S-00004','Tharindu Madhawa','2022-04-02'),
('','S-00004','Tharindu Madhawa','2022-04-03'),
('','S-00004','Tharindu Madhawa','2022-04-04'),
('','S-00004','Tharindu Madhawa','2022-04-05'),
('','S-00004','Tharindu Madhawa','2022-04-06'),
('','S-00004','Tharindu Madhawa','2022-04-07'),
('','S-00004','Tharindu Madhawa','2022-04-08'),
('','S-00004','Tharindu Madhawa','2022-04-09'),
('','S-00004','Tharindu Madhawa','2022-04-10'),
('','S-00004','Tharindu Madhawa','2022-04-11'),
('','S-00004','Tharindu Madhawa','2022-04-12'),
('','S-00004','Tharindu Madhawa','2022-04-13'),
('','S-00004','Tharindu Madhawa','2022-04-14'),
('','S-00004','Tharindu Madhawa','2022-04-15'),
('','S-00004','Tharindu Madhawa','2022-04-16'),
('','S-00004','Tharindu Madhawa','2022-04-17'),
('','S-00004','Tharindu Madhawa','2022-04-18'),
('','S-00004','Tharindu Madhawa','2022-04-19'),
('','S-00004','Tharindu Madhawa','2022-04-20'),
('','S-00004','Tharindu Madhawa','2022-05-01'),
('','S-00004','Tharindu Madhawa','2022-05-02'),
('','S-00004','Tharindu Madhawa','2022-05-03'),
('','S-00004','Tharindu Madhawa','2022-05-04'),
('','S-00004','Tharindu Madhawa','2022-05-05'),
('','S-00004','Tharindu Madhawa','2022-05-06'),
('','S-00004','Tharindu Madhawa','2022-05-07'),
('','S-00004','Tharindu Madhawa','2022-05-08'),
('','S-00004','Tharindu Madhawa','2022-05-09'),
('','S-00004','Tharindu Madhawa','2022-05-10'),
('','S-00004','Tharindu Madhawa','2022-05-11'),
('','S-00004','Tharindu Madhawa','2022-05-12'),
('','S-00004','Tharindu Madhawa','2022-05-13'),
('','S-00004','Tharindu Madhawa','2022-05-14'),
('','S-00004','Tharindu Madhawa','2022-05-15'),
('','S-00004','Tharindu Madhawa','2022-05-16'),
('','S-00004','Tharindu Madhawa','2022-05-17'),
('','S-00004','Tharindu Madhawa','2022-05-18'),
('','S-00004','Tharindu Madhawa','2022-05-19'),
('','S-00004','Tharindu Madhawa','2022-05-20'),




('','S-00005','Janidu Jayasanka','2022-01-01'),
('','S-00005','Janidu Jayasanka','2022-01-02'),
('','S-00005','Janidu Jayasanka','2022-01-03'),
('','S-00005','Janidu Jayasanka','2022-01-04'),
('','S-00005','Janidu Jayasanka','2022-01-05'),
('','S-00005','Janidu Jayasanka','2022-01-06'),
('','S-00005','Janidu Jayasanka','2022-01-07'),
('','S-00005','Janidu Jayasanka','2022-01-08'),
('','S-00005','Janidu Jayasanka','2022-01-09'),
('','S-00005','Janidu Jayasanka','2022-01-10'),
('','S-00005','Janidu Jayasanka','2022-01-11'),
('','S-00005','Janidu Jayasanka','2022-01-12'),
('','S-00005','Janidu Jayasanka','2022-01-13'),
('','S-00005','Janidu Jayasanka','2022-01-14'),
('','S-00005','Janidu Jayasanka','2022-01-15'),
('','S-00005','Janidu Jayasanka','2022-01-16'),
('','S-00005','Janidu Jayasanka','2022-01-17'),
('','S-00005','Janidu Jayasanka','2022-01-18'),
('','S-00005','Janidu Jayasanka','2022-01-19'),
('','S-00005','Janidu Jayasanka','2022-01-20'),
('','S-00005','Janidu Jayasanka','2022-02-01'),
('','S-00005','Janidu Jayasanka','2022-02-02'),
('','S-00005','Janidu Jayasanka','2022-02-03'),
('','S-00005','Janidu Jayasanka','2022-02-04'),
('','S-00005','Janidu Jayasanka','2022-02-05'),
('','S-00005','Janidu Jayasanka','2022-02-06'),
('','S-00005','Janidu Jayasanka','2022-02-07'),
('','S-00005','Janidu Jayasanka','2022-02-08'),
('','S-00005','Janidu Jayasanka','2022-02-09'),
('','S-00005','Janidu Jayasanka','2022-02-10'),
('','S-00005','Janidu Jayasanka','2022-02-11'),
('','S-00005','Janidu Jayasanka','2022-02-12'),
('','S-00005','Janidu Jayasanka','2022-02-13'),
('','S-00005','Janidu Jayasanka','2022-02-14'),
('','S-00005','Janidu Jayasanka','2022-02-15'),
('','S-00005','Janidu Jayasanka','2022-02-16'),
('','S-00005','Janidu Jayasanka','2022-02-17'),
('','S-00005','Janidu Jayasanka','2022-02-18'),
('','S-00005','Janidu Jayasanka','2022-02-19'),
('','S-00005','Janidu Jayasanka','2022-02-20'),
('','S-00005','Janidu Jayasanka','2022-03-01'),
('','S-00005','Janidu Jayasanka','2022-03-02'),
('','S-00005','Janidu Jayasanka','2022-03-03'),
('','S-00005','Janidu Jayasanka','2022-03-04'),
('','S-00005','Janidu Jayasanka','2022-03-05'),
('','S-00005','Janidu Jayasanka','2022-03-06'),
('','S-00005','Janidu Jayasanka','2022-03-07'),
('','S-00005','Janidu Jayasanka','2022-03-08'),
('','S-00005','Janidu Jayasanka','2022-03-09'),
('','S-00005','Janidu Jayasanka','2022-03-10'),
('','S-00005','Janidu Jayasanka','2022-03-11'),
('','S-00005','Janidu Jayasanka','2022-03-12'),
('','S-00005','Janidu Jayasanka','2022-03-13'),
('','S-00005','Janidu Jayasanka','2022-03-14'),
('','S-00005','Janidu Jayasanka','2022-03-15'),
('','S-00005','Janidu Jayasanka','2022-03-16'),
('','S-00005','Janidu Jayasanka','2022-03-17'),
('','S-00005','Janidu Jayasanka','2022-03-18'),
('','S-00005','Janidu Jayasanka','2022-03-19'),
('','S-00005','Janidu Jayasanka','2022-03-20'),
('','S-00005','Janidu Jayasanka','2022-04-01'),
('','S-00005','Janidu Jayasanka','2022-04-02'),
('','S-00005','Janidu Jayasanka','2022-04-03'),
('','S-00005','Janidu Jayasanka','2022-04-04'),
('','S-00005','Janidu Jayasanka','2022-04-05'),
('','S-00005','Janidu Jayasanka','2022-04-06'),
('','S-00005','Janidu Jayasanka','2022-04-07'),
('','S-00005','Janidu Jayasanka','2022-04-08'),
('','S-00005','Janidu Jayasanka','2022-04-09'),
('','S-00005','Janidu Jayasanka','2022-04-10'),
('','S-00005','Janidu Jayasanka','2022-04-11'),
('','S-00005','Janidu Jayasanka','2022-04-12'),
('','S-00005','Janidu Jayasanka','2022-04-13'),
('','S-00005','Janidu Jayasanka','2022-04-14'),
('','S-00005','Janidu Jayasanka','2022-04-15'),
('','S-00005','Janidu Jayasanka','2022-04-16'),
('','S-00005','Janidu Jayasanka','2022-04-17'),
('','S-00005','Janidu Jayasanka','2022-04-18'),
('','S-00005','Janidu Jayasanka','2022-04-19'),
('','S-00005','Janidu Jayasanka','2022-04-20'),
('','S-00005','Janidu Jayasanka','2022-05-01'),
('','S-00005','Janidu Jayasanka','2022-05-02'),
('','S-00005','Janidu Jayasanka','2022-05-03'),
('','S-00005','Janidu Jayasanka','2022-05-04'),
('','S-00005','Janidu Jayasanka','2022-05-05'),
('','S-00005','Janidu Jayasanka','2022-05-06'),
('','S-00005','Janidu Jayasanka','2022-05-07'),
('','S-00005','Janidu Jayasanka','2022-05-08'),
('','S-00005','Janidu Jayasanka','2022-05-09'),
('','S-00005','Janidu Jayasanka','2022-05-10'),
('','S-00005','Janidu Jayasanka','2022-05-11'),
('','S-00005','Janidu Jayasanka','2022-05-12'),
('','S-00005','Janidu Jayasanka','2022-05-13'),
('','S-00005','Janidu Jayasanka','2022-05-14'),
('','S-00005','Janidu Jayasanka','2022-05-15'),
('','S-00005','Janidu Jayasanka','2022-05-16'),
('','S-00005','Janidu Jayasanka','2022-05-17'),
('','S-00005','Janidu Jayasanka','2022-05-18'),
('','S-00005','Janidu Jayasanka','2022-05-19'),
('','S-00005','Janidu Jayasanka','2022-05-20'),





('','S-00006','Pasindu Deshan','2022-01-01'),
('','S-00006','Pasindu Deshan','2022-01-02'),
('','S-00006','Pasindu Deshan','2022-01-03'),
('','S-00006','Pasindu Deshan','2022-01-04'),
('','S-00006','Pasindu Deshan','2022-01-05'),
('','S-00006','Pasindu Deshan','2022-01-06'),
('','S-00006','Pasindu Deshan','2022-01-07'),
('','S-00006','Pasindu Deshan','2022-01-08'),
('','S-00006','Pasindu Deshan','2022-01-09'),
('','S-00006','Pasindu Deshan','2022-01-10'),
('','S-00006','Pasindu Deshan','2022-01-11'),
('','S-00006','Pasindu Deshan','2022-01-12'),
('','S-00006','Pasindu Deshan','2022-01-13'),
('','S-00006','Pasindu Deshan','2022-01-14'),
('','S-00006','Pasindu Deshan','2022-01-15'),
('','S-00006','Pasindu Deshan','2022-01-16'),
('','S-00006','Pasindu Deshan','2022-01-17'),
('','S-00006','Pasindu Deshan','2022-01-18'),
('','S-00006','Pasindu Deshan','2022-01-19'),
('','S-00006','Pasindu Deshan','2022-01-20'),
('','S-00006','Pasindu Deshan','2022-02-01'),
('','S-00006','Pasindu Deshan','2022-02-02'),
('','S-00006','Pasindu Deshan','2022-02-03'),
('','S-00006','Pasindu Deshan','2022-02-04'),
('','S-00006','Pasindu Deshan','2022-02-05'),
('','S-00006','Pasindu Deshan','2022-02-06'),
('','S-00006','Pasindu Deshan','2022-02-07'),
('','S-00006','Pasindu Deshan','2022-02-08'),
('','S-00006','Pasindu Deshan','2022-02-09'),
('','S-00006','Pasindu Deshan','2022-02-10'),
('','S-00006','Pasindu Deshan','2022-02-11'),
('','S-00006','Pasindu Deshan','2022-02-12'),
('','S-00006','Pasindu Deshan','2022-02-13'),
('','S-00006','Pasindu Deshan','2022-02-14'),
('','S-00006','Pasindu Deshan','2022-02-15'),
('','S-00006','Pasindu Deshan','2022-02-16'),
('','S-00006','Pasindu Deshan','2022-02-17'),
('','S-00006','Pasindu Deshan','2022-02-18'),
('','S-00006','Pasindu Deshan','2022-02-19'),
('','S-00006','Pasindu Deshan','2022-02-20'),
('','S-00006','Pasindu Deshan','2022-03-01'),
('','S-00006','Pasindu Deshan','2022-03-02'),
('','S-00006','Pasindu Deshan','2022-03-03'),
('','S-00006','Pasindu Deshan','2022-03-04'),
('','S-00006','Pasindu Deshan','2022-03-05'),
('','S-00006','Pasindu Deshan','2022-03-06'),
('','S-00006','Pasindu Deshan','2022-03-07'),
('','S-00006','Pasindu Deshan','2022-03-08'),
('','S-00006','Pasindu Deshan','2022-03-09'),
('','S-00006','Pasindu Deshan','2022-03-10'),
('','S-00006','Pasindu Deshan','2022-03-11'),
('','S-00006','Pasindu Deshan','2022-03-12'),
('','S-00006','Pasindu Deshan','2022-03-13'),
('','S-00006','Pasindu Deshan','2022-03-14'),
('','S-00006','Pasindu Deshan','2022-03-15'),
('','S-00006','Pasindu Deshan','2022-03-16'),
('','S-00006','Pasindu Deshan','2022-03-17'),
('','S-00006','Pasindu Deshan','2022-03-18'),
('','S-00006','Pasindu Deshan','2022-03-19'),
('','S-00006','Pasindu Deshan','2022-03-20'),
('','S-00006','Pasindu Deshan','2022-04-01'),
('','S-00006','Pasindu Deshan','2022-04-02'),
('','S-00006','Pasindu Deshan','2022-04-03'),
('','S-00006','Pasindu Deshan','2022-04-04'),
('','S-00006','Pasindu Deshan','2022-04-05'),
('','S-00006','Pasindu Deshan','2022-04-06'),
('','S-00006','Pasindu Deshan','2022-04-07'),
('','S-00006','Pasindu Deshan','2022-04-08'),
('','S-00006','Pasindu Deshan','2022-04-09'),
('','S-00006','Pasindu Deshan','2022-04-10'),
('','S-00006','Pasindu Deshan','2022-04-11'),
('','S-00006','Pasindu Deshan','2022-04-12'),
('','S-00006','Pasindu Deshan','2022-04-13'),
('','S-00006','Pasindu Deshan','2022-04-14'),
('','S-00006','Pasindu Deshan','2022-04-15'),
('','S-00006','Pasindu Deshan','2022-04-16'),
('','S-00006','Pasindu Deshan','2022-04-17'),
('','S-00006','Pasindu Deshan','2022-04-18'),
('','S-00006','Pasindu Deshan','2022-04-19'),
('','S-00006','Pasindu Deshan','2022-04-20'),
('','S-00006','Pasindu Deshan','2022-05-01'),
('','S-00006','Pasindu Deshan','2022-05-02'),
('','S-00006','Pasindu Deshan','2022-05-03'),
('','S-00006','Pasindu Deshan','2022-05-04'),
('','S-00006','Pasindu Deshan','2022-05-05'),
('','S-00006','Pasindu Deshan','2022-05-06'),
('','S-00006','Pasindu Deshan','2022-05-07'),
('','S-00006','Pasindu Deshan','2022-05-08'),
('','S-00006','Pasindu Deshan','2022-05-09'),
('','S-00006','Pasindu Deshan','2022-05-10'),
('','S-00006','Pasindu Deshan','2022-05-11'),
('','S-00006','Pasindu Deshan','2022-05-12'),
('','S-00006','Pasindu Deshan','2022-05-13'),
('','S-00006','Pasindu Deshan','2022-05-14'),
('','S-00006','Pasindu Deshan','2022-05-15'),
('','S-00006','Pasindu Deshan','2022-05-16'),
('','S-00006','Pasindu Deshan','2022-05-17'),
('','S-00006','Pasindu Deshan','2022-05-18'),
('','S-00006','Pasindu Deshan','2022-05-19'),
('','S-00006','Pasindu Deshan','2022-05-20'),





('','S-00007','Victor Ivan','2022-01-01'),
('','S-00007','Victor Ivan','2022-01-02'),
('','S-00007','Victor Ivan','2022-01-03'),
('','S-00007','Victor Ivan','2022-01-04'),
('','S-00007','Victor Ivan','2022-01-05'),
('','S-00007','Victor Ivan','2022-01-06'),
('','S-00007','Victor Ivan','2022-01-07'),
('','S-00007','Victor Ivan','2022-01-08'),
('','S-00007','Victor Ivan','2022-01-09'),
('','S-00007','Victor Ivan','2022-01-10'),
('','S-00007','Victor Ivan','2022-01-11'),
('','S-00007','Victor Ivan','2022-01-12'),
('','S-00007','Victor Ivan','2022-01-13'),
('','S-00007','Victor Ivan','2022-01-14'),
('','S-00007','Victor Ivan','2022-01-15'),
('','S-00007','Victor Ivan','2022-01-16'),
('','S-00007','Victor Ivan','2022-01-17'),
('','S-00007','Victor Ivan','2022-01-18'),
('','S-00007','Victor Ivan','2022-01-19'),
('','S-00007','Victor Ivan','2022-01-20'),
('','S-00007','Victor Ivan','2022-02-01'),
('','S-00007','Victor Ivan','2022-02-02'),
('','S-00007','Victor Ivan','2022-02-03'),
('','S-00007','Victor Ivan','2022-02-04'),
('','S-00007','Victor Ivan','2022-02-05'),
('','S-00007','Victor Ivan','2022-02-06'),
('','S-00007','Victor Ivan','2022-02-07'),
('','S-00007','Victor Ivan','2022-02-08'),
('','S-00007','Victor Ivan','2022-02-09'),
('','S-00007','Victor Ivan','2022-02-10'),
('','S-00007','Victor Ivan','2022-02-11'),
('','S-00007','Victor Ivan','2022-02-12'),
('','S-00007','Victor Ivan','2022-02-13'),
('','S-00007','Victor Ivan','2022-02-14'),
('','S-00007','Victor Ivan','2022-02-15'),
('','S-00007','Victor Ivan','2022-02-16'),
('','S-00007','Victor Ivan','2022-02-17'),
('','S-00007','Victor Ivan','2022-02-18'),
('','S-00007','Victor Ivan','2022-02-19'),
('','S-00007','Victor Ivan','2022-02-20'),
('','S-00007','Victor Ivan','2022-03-01'),
('','S-00007','Victor Ivan','2022-03-02'),
('','S-00007','Victor Ivan','2022-03-03'),
('','S-00007','Victor Ivan','2022-03-04'),
('','S-00007','Victor Ivan','2022-03-05'),
('','S-00007','Victor Ivan','2022-03-06'),
('','S-00007','Victor Ivan','2022-03-07'),
('','S-00007','Victor Ivan','2022-03-08'),
('','S-00007','Victor Ivan','2022-03-09'),
('','S-00007','Victor Ivan','2022-03-10'),
('','S-00007','Victor Ivan','2022-03-11'),
('','S-00007','Victor Ivan','2022-03-12'),
('','S-00007','Victor Ivan','2022-03-13'),
('','S-00007','Victor Ivan','2022-03-14'),
('','S-00007','Victor Ivan','2022-03-15'),
('','S-00007','Victor Ivan','2022-03-16'),
('','S-00007','Victor Ivan','2022-03-17'),
('','S-00007','Victor Ivan','2022-03-18'),
('','S-00007','Victor Ivan','2022-03-19'),
('','S-00007','Victor Ivan','2022-03-20'),
('','S-00007','Victor Ivan','2022-04-01'),
('','S-00007','Victor Ivan','2022-04-02'),
('','S-00007','Victor Ivan','2022-04-03'),
('','S-00007','Victor Ivan','2022-04-04'),
('','S-00007','Victor Ivan','2022-04-05'),
('','S-00007','Victor Ivan','2022-04-06'),
('','S-00007','Victor Ivan','2022-04-07'),
('','S-00007','Victor Ivan','2022-04-08'),
('','S-00007','Victor Ivan','2022-04-09'),
('','S-00007','Victor Ivan','2022-04-10'),
('','S-00007','Victor Ivan','2022-04-11'),
('','S-00007','Victor Ivan','2022-04-12'),
('','S-00007','Victor Ivan','2022-04-13'),
('','S-00007','Victor Ivan','2022-04-14'),
('','S-00007','Victor Ivan','2022-04-15'),
('','S-00007','Victor Ivan','2022-04-16'),
('','S-00007','Victor Ivan','2022-04-17'),
('','S-00007','Victor Ivan','2022-04-18'),
('','S-00007','Victor Ivan','2022-04-19'),
('','S-00007','Victor Ivan','2022-04-20'),
('','S-00007','Victor Ivan','2022-05-01'),
('','S-00007','Victor Ivan','2022-05-02'),
('','S-00007','Victor Ivan','2022-05-03'),
('','S-00007','Victor Ivan','2022-05-04'),
('','S-00007','Victor Ivan','2022-05-05'),
('','S-00007','Victor Ivan','2022-05-06'),
('','S-00007','Victor Ivan','2022-05-07'),
('','S-00007','Victor Ivan','2022-05-08'),
('','S-00007','Victor Ivan','2022-05-09'),
('','S-00007','Victor Ivan','2022-05-10'),
('','S-00007','Victor Ivan','2022-05-11'),
('','S-00007','Victor Ivan','2022-05-12'),
('','S-00007','Victor Ivan','2022-05-13'),
('','S-00007','Victor Ivan','2022-05-14'),
('','S-00007','Victor Ivan','2022-05-15'),
('','S-00007','Victor Ivan','2022-05-16'),
('','S-00007','Victor Ivan','2022-05-17'),
('','S-00007','Victor Ivan','2022-05-18'),
('','S-00007','Victor Ivan','2022-05-19'),
('','S-00007','Victor Ivan','2022-05-20'),





('','S-00008','Jayod Jayasinghe','2022-01-01'),
('','S-00008','Jayod Jayasinghe','2022-01-02'),
('','S-00008','Jayod Jayasinghe','2022-01-03'),
('','S-00008','Jayod Jayasinghe','2022-01-04'),
('','S-00008','Jayod Jayasinghe','2022-01-05'),
('','S-00008','Jayod Jayasinghe','2022-01-06'),
('','S-00008','Jayod Jayasinghe','2022-01-07'),
('','S-00008','Jayod Jayasinghe','2022-01-08'),
('','S-00008','Jayod Jayasinghe','2022-01-09'),
('','S-00008','Jayod Jayasinghe','2022-01-10'),
('','S-00008','Jayod Jayasinghe','2022-01-11'),
('','S-00008','Jayod Jayasinghe','2022-01-12'),
('','S-00008','Jayod Jayasinghe','2022-01-13'),
('','S-00008','Jayod Jayasinghe','2022-01-14'),
('','S-00008','Jayod Jayasinghe','2022-01-15'),
('','S-00008','Jayod Jayasinghe','2022-01-16'),
('','S-00008','Jayod Jayasinghe','2022-01-17'),
('','S-00008','Jayod Jayasinghe','2022-01-18'),
('','S-00008','Jayod Jayasinghe','2022-01-19'),
('','S-00008','Jayod Jayasinghe','2022-01-20'),
('','S-00008','Jayod Jayasinghe','2022-02-01'),
('','S-00008','Jayod Jayasinghe','2022-02-02'),
('','S-00008','Jayod Jayasinghe','2022-02-03'),
('','S-00008','Jayod Jayasinghe','2022-02-04'),
('','S-00008','Jayod Jayasinghe','2022-02-05'),
('','S-00008','Jayod Jayasinghe','2022-02-06'),
('','S-00008','Jayod Jayasinghe','2022-02-07'),
('','S-00008','Jayod Jayasinghe','2022-02-08'),
('','S-00008','Jayod Jayasinghe','2022-02-09'),
('','S-00008','Jayod Jayasinghe','2022-02-10'),
('','S-00008','Jayod Jayasinghe','2022-02-11'),
('','S-00008','Jayod Jayasinghe','2022-02-12'),
('','S-00008','Jayod Jayasinghe','2022-02-13'),
('','S-00008','Jayod Jayasinghe','2022-02-14'),
('','S-00008','Jayod Jayasinghe','2022-02-15'),
('','S-00008','Jayod Jayasinghe','2022-02-16'),
('','S-00008','Jayod Jayasinghe','2022-02-17'),
('','S-00008','Jayod Jayasinghe','2022-02-18'),
('','S-00008','Jayod Jayasinghe','2022-02-19'),
('','S-00008','Jayod Jayasinghe','2022-02-20'),
('','S-00008','Jayod Jayasinghe','2022-03-01'),
('','S-00008','Jayod Jayasinghe','2022-03-02'),
('','S-00008','Jayod Jayasinghe','2022-03-03'),
('','S-00008','Jayod Jayasinghe','2022-03-04'),
('','S-00008','Jayod Jayasinghe','2022-03-05'),
('','S-00008','Jayod Jayasinghe','2022-03-06'),
('','S-00008','Jayod Jayasinghe','2022-03-07'),
('','S-00008','Jayod Jayasinghe','2022-03-08'),
('','S-00008','Jayod Jayasinghe','2022-03-09'),
('','S-00008','Jayod Jayasinghe','2022-03-10'),
('','S-00008','Jayod Jayasinghe','2022-03-11'),
('','S-00008','Jayod Jayasinghe','2022-03-12'),
('','S-00008','Jayod Jayasinghe','2022-03-13'),
('','S-00008','Jayod Jayasinghe','2022-03-14'),
('','S-00008','Jayod Jayasinghe','2022-03-15'),
('','S-00008','Jayod Jayasinghe','2022-03-16'),
('','S-00008','Jayod Jayasinghe','2022-03-17'),
('','S-00008','Jayod Jayasinghe','2022-03-18'),
('','S-00008','Jayod Jayasinghe','2022-03-19'),
('','S-00008','Jayod Jayasinghe','2022-03-20'),
('','S-00008','Jayod Jayasinghe','2022-04-01'),
('','S-00008','Jayod Jayasinghe','2022-04-02'),
('','S-00008','Jayod Jayasinghe','2022-04-03'),
('','S-00008','Jayod Jayasinghe','2022-04-04'),
('','S-00008','Jayod Jayasinghe','2022-04-05'),
('','S-00008','Jayod Jayasinghe','2022-04-06'),
('','S-00008','Jayod Jayasinghe','2022-04-07'),
('','S-00008','Jayod Jayasinghe','2022-04-08'),
('','S-00008','Jayod Jayasinghe','2022-04-09'),
('','S-00008','Jayod Jayasinghe','2022-04-10'),
('','S-00008','Jayod Jayasinghe','2022-04-11'),
('','S-00008','Jayod Jayasinghe','2022-04-12'),
('','S-00008','Jayod Jayasinghe','2022-04-13'),
('','S-00008','Jayod Jayasinghe','2022-04-14'),
('','S-00008','Jayod Jayasinghe','2022-04-15'),
('','S-00008','Jayod Jayasinghe','2022-04-16'),
('','S-00008','Jayod Jayasinghe','2022-04-17'),
('','S-00008','Jayod Jayasinghe','2022-04-18'),
('','S-00008','Jayod Jayasinghe','2022-04-19'),
('','S-00008','Jayod Jayasinghe','2022-04-20'),
('','S-00008','Jayod Jayasinghe','2022-05-01'),
('','S-00008','Jayod Jayasinghe','2022-05-02'),
('','S-00008','Jayod Jayasinghe','2022-05-03'),
('','S-00008','Jayod Jayasinghe','2022-05-04'),
('','S-00008','Jayod Jayasinghe','2022-05-05'),
('','S-00008','Jayod Jayasinghe','2022-05-06'),
('','S-00008','Jayod Jayasinghe','2022-05-07'),
('','S-00008','Jayod Jayasinghe','2022-05-08'),
('','S-00008','Jayod Jayasinghe','2022-05-09'),
('','S-00008','Jayod Jayasinghe','2022-05-10'),
('','S-00008','Jayod Jayasinghe','2022-05-11'),
('','S-00008','Jayod Jayasinghe','2022-05-12'),
('','S-00008','Jayod Jayasinghe','2022-05-13'),
('','S-00008','Jayod Jayasinghe','2022-05-14'),
('','S-00008','Jayod Jayasinghe','2022-05-15'),
('','S-00008','Jayod Jayasinghe','2022-05-16'),
('','S-00008','Jayod Jayasinghe','2022-05-17'),
('','S-00008','Jayod Jayasinghe','2022-05-18'),
('','S-00008','Jayod Jayasinghe','2022-05-19'),
('','S-00008','Jayod Jayasinghe','2022-05-20'),







('','S-00009','Tharumal Wijesinghe','2022-01-01'),
('','S-00009','Tharumal Wijesinghe','2022-01-02'),
('','S-00009','Tharumal Wijesinghe','2022-01-03'),
('','S-00009','Tharumal Wijesinghe','2022-01-04'),
('','S-00009','Tharumal Wijesinghe','2022-01-05'),
('','S-00009','Tharumal Wijesinghe','2022-01-06'),
('','S-00009','Tharumal Wijesinghe','2022-01-07'),
('','S-00009','Tharumal Wijesinghe','2022-01-08'),
('','S-00009','Tharumal Wijesinghe','2022-01-09'),
('','S-00009','Tharumal Wijesinghe','2022-01-10'),
('','S-00009','Tharumal Wijesinghe','2022-01-11'),
('','S-00009','Tharumal Wijesinghe','2022-01-12'),
('','S-00009','Tharumal Wijesinghe','2022-01-13'),
('','S-00009','Tharumal Wijesinghe','2022-01-14'),
('','S-00009','Tharumal Wijesinghe','2022-01-15'),
('','S-00009','Tharumal Wijesinghe','2022-01-16'),
('','S-00009','Tharumal Wijesinghe','2022-01-17'),
('','S-00009','Tharumal Wijesinghe','2022-01-18'),
('','S-00009','Tharumal Wijesinghe','2022-01-19'),
('','S-00009','Tharumal Wijesinghe','2022-01-20'),
('','S-00009','Tharumal Wijesinghe','2022-02-01'),
('','S-00009','Tharumal Wijesinghe','2022-02-02'),
('','S-00009','Tharumal Wijesinghe','2022-02-03'),
('','S-00009','Tharumal Wijesinghe','2022-02-04'),
('','S-00009','Tharumal Wijesinghe','2022-02-05'),
('','S-00009','Tharumal Wijesinghe','2022-02-06'),
('','S-00009','Tharumal Wijesinghe','2022-02-07'),
('','S-00009','Tharumal Wijesinghe','2022-02-08'),
('','S-00009','Tharumal Wijesinghe','2022-02-09'),
('','S-00009','Tharumal Wijesinghe','2022-02-10'),
('','S-00009','Tharumal Wijesinghe','2022-02-11'),
('','S-00009','Tharumal Wijesinghe','2022-02-12'),
('','S-00009','Tharumal Wijesinghe','2022-02-13'),
('','S-00009','Tharumal Wijesinghe','2022-02-14'),
('','S-00009','Tharumal Wijesinghe','2022-02-15'),
('','S-00009','Tharumal Wijesinghe','2022-02-16'),
('','S-00009','Tharumal Wijesinghe','2022-02-17'),
('','S-00009','Tharumal Wijesinghe','2022-02-18'),
('','S-00009','Tharumal Wijesinghe','2022-02-19'),
('','S-00009','Tharumal Wijesinghe','2022-02-20'),
('','S-00009','Tharumal Wijesinghe','2022-03-01'),
('','S-00009','Tharumal Wijesinghe','2022-03-02'),
('','S-00009','Tharumal Wijesinghe','2022-03-03'),
('','S-00009','Tharumal Wijesinghe','2022-03-04'),
('','S-00009','Tharumal Wijesinghe','2022-03-05'),
('','S-00009','Tharumal Wijesinghe','2022-03-06'),
('','S-00009','Tharumal Wijesinghe','2022-03-07'),
('','S-00009','Tharumal Wijesinghe','2022-03-08'),
('','S-00009','Tharumal Wijesinghe','2022-03-09'),
('','S-00009','Tharumal Wijesinghe','2022-03-10'),
('','S-00009','Tharumal Wijesinghe','2022-03-11'),
('','S-00009','Tharumal Wijesinghe','2022-03-12'),
('','S-00009','Tharumal Wijesinghe','2022-03-13'),
('','S-00009','Tharumal Wijesinghe','2022-03-14'),
('','S-00009','Tharumal Wijesinghe','2022-03-15'),
('','S-00009','Tharumal Wijesinghe','2022-03-16'),
('','S-00009','Tharumal Wijesinghe','2022-03-17'),
('','S-00009','Tharumal Wijesinghe','2022-03-18'),
('','S-00009','Tharumal Wijesinghe','2022-03-19'),
('','S-00009','Tharumal Wijesinghe','2022-03-20'),
('','S-00009','Tharumal Wijesinghe','2022-04-01'),
('','S-00009','Tharumal Wijesinghe','2022-04-02'),
('','S-00009','Tharumal Wijesinghe','2022-04-03'),
('','S-00009','Tharumal Wijesinghe','2022-04-04'),
('','S-00009','Tharumal Wijesinghe','2022-04-05'),
('','S-00009','Tharumal Wijesinghe','2022-04-06'),
('','S-00009','Tharumal Wijesinghe','2022-04-07'),
('','S-00009','Tharumal Wijesinghe','2022-04-08'),
('','S-00009','Tharumal Wijesinghe','2022-04-09'),
('','S-00009','Tharumal Wijesinghe','2022-04-10'),
('','S-00009','Tharumal Wijesinghe','2022-04-11'),
('','S-00009','Tharumal Wijesinghe','2022-04-12'),
('','S-00009','Tharumal Wijesinghe','2022-04-13'),
('','S-00009','Tharumal Wijesinghe','2022-04-14'),
('','S-00009','Tharumal Wijesinghe','2022-04-15'),
('','S-00009','Tharumal Wijesinghe','2022-04-16'),
('','S-00009','Tharumal Wijesinghe','2022-04-17'),
('','S-00009','Tharumal Wijesinghe','2022-04-18'),
('','S-00009','Tharumal Wijesinghe','2022-04-19'),
('','S-00009','Tharumal Wijesinghe','2022-04-20'),
('','S-00009','Tharumal Wijesinghe','2022-05-01'),
('','S-00009','Tharumal Wijesinghe','2022-05-02'),
('','S-00009','Tharumal Wijesinghe','2022-05-03'),
('','S-00009','Tharumal Wijesinghe','2022-05-04'),
('','S-00009','Tharumal Wijesinghe','2022-05-05'),
('','S-00009','Tharumal Wijesinghe','2022-05-06'),
('','S-00009','Tharumal Wijesinghe','2022-05-07'),
('','S-00009','Tharumal Wijesinghe','2022-05-08'),
('','S-00009','Tharumal Wijesinghe','2022-05-09'),
('','S-00009','Tharumal Wijesinghe','2022-05-10'),
('','S-00009','Tharumal Wijesinghe','2022-05-11'),
('','S-00009','Tharumal Wijesinghe','2022-05-12'),
('','S-00009','Tharumal Wijesinghe','2022-05-13'),
('','S-00009','Tharumal Wijesinghe','2022-05-14'),
('','S-00009','Tharumal Wijesinghe','2022-05-15'),
('','S-00009','Tharumal Wijesinghe','2022-05-16'),
('','S-00009','Tharumal Wijesinghe','2022-05-17'),
('','S-00009','Tharumal Wijesinghe','2022-05-18'),
('','S-00009','Tharumal Wijesinghe','2022-05-19'),
('','S-00009','Tharumal Wijesinghe','2022-05-20'),






('','S-00010','Rekha Perera','2022-01-01'),
('','S-00010','Rekha Perera','2022-01-02'),
('','S-00010','Rekha Perera','2022-01-03'),
('','S-00010','Rekha Perera','2022-01-04'),
('','S-00010','Rekha Perera','2022-01-05'),
('','S-00010','Rekha Perera','2022-01-06'),
('','S-00010','Rekha Perera','2022-01-07'),
('','S-00010','Rekha Perera','2022-01-08'),
('','S-00010','Rekha Perera','2022-01-09'),
('','S-00010','Rekha Perera','2022-01-10'),
('','S-00010','Rekha Perera','2022-01-11'),
('','S-00010','Rekha Perera','2022-01-12'),
('','S-00010','Rekha Perera','2022-01-13'),
('','S-00010','Rekha Perera','2022-01-14'),
('','S-00010','Rekha Perera','2022-01-15'),
('','S-00010','Rekha Perera','2022-01-16'),
('','S-00010','Rekha Perera','2022-01-17'),
('','S-00010','Rekha Perera','2022-01-18'),
('','S-00010','Rekha Perera','2022-01-19'),
('','S-00010','Rekha Perera','2022-01-20'),
('','S-00010','Rekha Perera','2022-02-01'),
('','S-00010','Rekha Perera','2022-02-02'),
('','S-00010','Rekha Perera','2022-02-03'),
('','S-00010','Rekha Perera','2022-02-04'),
('','S-00010','Rekha Perera','2022-02-05'),
('','S-00010','Rekha Perera','2022-02-06'),
('','S-00010','Rekha Perera','2022-02-07'),
('','S-00010','Rekha Perera','2022-02-08'),
('','S-00010','Rekha Perera','2022-02-09'),
('','S-00010','Rekha Perera','2022-02-10'),
('','S-00010','Rekha Perera','2022-02-11'),
('','S-00010','Rekha Perera','2022-02-12'),
('','S-00010','Rekha Perera','2022-02-13'),
('','S-00010','Rekha Perera','2022-02-14'),
('','S-00010','Rekha Perera','2022-02-15'),
('','S-00010','Rekha Perera','2022-02-16'),
('','S-00010','Rekha Perera','2022-02-17'),
('','S-00010','Rekha Perera','2022-02-18'),
('','S-00010','Rekha Perera','2022-02-19'),
('','S-00010','Rekha Perera','2022-02-20'),
('','S-00010','Rekha Perera','2022-03-01'),
('','S-00010','Rekha Perera','2022-03-02'),
('','S-00010','Rekha Perera','2022-03-03'),
('','S-00010','Rekha Perera','2022-03-04'),
('','S-00010','Rekha Perera','2022-03-05'),
('','S-00010','Rekha Perera','2022-03-06'),
('','S-00010','Rekha Perera','2022-03-07'),
('','S-00010','Rekha Perera','2022-03-08'),
('','S-00010','Rekha Perera','2022-03-09'),
('','S-00010','Rekha Perera','2022-03-10'),
('','S-00010','Rekha Perera','2022-03-11'),
('','S-00010','Rekha Perera','2022-03-12'),
('','S-00010','Rekha Perera','2022-03-13'),
('','S-00010','Rekha Perera','2022-03-14'),
('','S-00010','Rekha Perera','2022-03-15'),
('','S-00010','Rekha Perera','2022-03-16'),
('','S-00010','Rekha Perera','2022-03-17'),
('','S-00010','Rekha Perera','2022-03-18'),
('','S-00010','Rekha Perera','2022-03-19'),
('','S-00010','Rekha Perera','2022-03-20'),
('','S-00010','Rekha Perera','2022-04-01'),
('','S-00010','Rekha Perera','2022-04-02'),
('','S-00010','Rekha Perera','2022-04-03'),
('','S-00010','Rekha Perera','2022-04-04'),
('','S-00010','Rekha Perera','2022-04-05'),
('','S-00010','Rekha Perera','2022-04-06'),
('','S-00010','Rekha Perera','2022-04-07'),
('','S-00010','Rekha Perera','2022-04-08'),
('','S-00010','Rekha Perera','2022-04-09'),
('','S-00010','Rekha Perera','2022-04-10'),
('','S-00010','Rekha Perera','2022-04-11'),
('','S-00010','Rekha Perera','2022-04-12'),
('','S-00010','Rekha Perera','2022-04-13'),
('','S-00010','Rekha Perera','2022-04-14'),
('','S-00010','Rekha Perera','2022-04-15'),
('','S-00010','Rekha Perera','2022-04-16'),
('','S-00010','Rekha Perera','2022-04-17'),
('','S-00010','Rekha Perera','2022-04-18'),
('','S-00010','Rekha Perera','2022-04-19'),
('','S-00010','Rekha Perera','2022-04-20'),
('','S-00010','Rekha Perera','2022-05-01'),
('','S-00010','Rekha Perera','2022-05-02'),
('','S-00010','Rekha Perera','2022-05-03'),
('','S-00010','Rekha Perera','2022-05-04'),
('','S-00010','Rekha Perera','2022-05-05'),
('','S-00010','Rekha Perera','2022-05-06'),
('','S-00010','Rekha Perera','2022-05-07'),
('','S-00010','Rekha Perera','2022-05-08'),
('','S-00010','Rekha Perera','2022-05-09'),
('','S-00010','Rekha Perera','2022-05-10'),
('','S-00010','Rekha Perera','2022-05-11'),
('','S-00010','Rekha Perera','2022-05-12'),
('','S-00010','Rekha Perera','2022-05-13'),
('','S-00010','Rekha Perera','2022-05-14'),
('','S-00010','Rekha Perera','2022-05-15'),
('','S-00010','Rekha Perera','2022-05-16'),
('','S-00010','Rekha Perera','2022-05-17'),
('','S-00010','Rekha Perera','2022-05-18'),
('','S-00010','Rekha Perera','2022-05-19'),
('','S-00010','Rekha Perera','2022-05-20'),





('','S-00011','Ruvini Ahangama','2022-01-01'),
('','S-00011','Ruvini Ahangama','2022-01-02'),
('','S-00011','Ruvini Ahangama','2022-01-03'),
('','S-00011','Ruvini Ahangama','2022-01-04'),
('','S-00011','Ruvini Ahangama','2022-01-05'),
('','S-00011','Ruvini Ahangama','2022-01-06'),
('','S-00011','Ruvini Ahangama','2022-01-07'),
('','S-00011','Ruvini Ahangama','2022-01-08'),
('','S-00011','Ruvini Ahangama','2022-01-09'),
('','S-00011','Ruvini Ahangama','2022-01-10'),
('','S-00011','Ruvini Ahangama','2022-01-11'),
('','S-00011','Ruvini Ahangama','2022-01-12'),
('','S-00011','Ruvini Ahangama','2022-01-13'),
('','S-00011','Ruvini Ahangama','2022-01-14'),
('','S-00011','Ruvini Ahangama','2022-01-15'),
('','S-00011','Ruvini Ahangama','2022-01-16'),
('','S-00011','Ruvini Ahangama','2022-01-17'),
('','S-00011','Ruvini Ahangama','2022-01-18'),
('','S-00011','Ruvini Ahangama','2022-01-19'),
('','S-00011','Ruvini Ahangama','2022-01-20'),
('','S-00011','Ruvini Ahangama','2022-02-01'),
('','S-00011','Ruvini Ahangama','2022-02-02'),
('','S-00011','Ruvini Ahangama','2022-02-03'),
('','S-00011','Ruvini Ahangama','2022-02-04'),
('','S-00011','Ruvini Ahangama','2022-02-05'),
('','S-00011','Ruvini Ahangama','2022-02-06'),
('','S-00011','Ruvini Ahangama','2022-02-07'),
('','S-00011','Ruvini Ahangama','2022-02-08'),
('','S-00011','Ruvini Ahangama','2022-02-09'),
('','S-00011','Ruvini Ahangama','2022-02-10'),
('','S-00011','Ruvini Ahangama','2022-02-11'),
('','S-00011','Ruvini Ahangama','2022-02-12'),
('','S-00011','Ruvini Ahangama','2022-02-13'),
('','S-00011','Ruvini Ahangama','2022-02-14'),
('','S-00011','Ruvini Ahangama','2022-02-15'),
('','S-00011','Ruvini Ahangama','2022-02-16'),
('','S-00011','Ruvini Ahangama','2022-02-17'),
('','S-00011','Ruvini Ahangama','2022-02-18'),
('','S-00011','Ruvini Ahangama','2022-02-19'),
('','S-00011','Ruvini Ahangama','2022-02-20'),
('','S-00011','Ruvini Ahangama','2022-03-01'),
('','S-00011','Ruvini Ahangama','2022-03-02'),
('','S-00011','Ruvini Ahangama','2022-03-03'),
('','S-00011','Ruvini Ahangama','2022-03-04'),
('','S-00011','Ruvini Ahangama','2022-03-05'),
('','S-00011','Ruvini Ahangama','2022-03-06'),
('','S-00011','Ruvini Ahangama','2022-03-07'),
('','S-00011','Ruvini Ahangama','2022-03-08'),
('','S-00011','Ruvini Ahangama','2022-03-09'),
('','S-00011','Ruvini Ahangama','2022-03-10'),
('','S-00011','Ruvini Ahangama','2022-03-11'),
('','S-00011','Ruvini Ahangama','2022-03-12'),
('','S-00011','Ruvini Ahangama','2022-03-13'),
('','S-00011','Ruvini Ahangama','2022-03-14'),
('','S-00011','Ruvini Ahangama','2022-03-15'),
('','S-00011','Ruvini Ahangama','2022-03-16'),
('','S-00011','Ruvini Ahangama','2022-03-17'),
('','S-00011','Ruvini Ahangama','2022-03-18'),
('','S-00011','Ruvini Ahangama','2022-03-19'),
('','S-00011','Ruvini Ahangama','2022-03-20'),
('','S-00011','Ruvini Ahangama','2022-04-01'),
('','S-00011','Ruvini Ahangama','2022-04-02'),
('','S-00011','Ruvini Ahangama','2022-04-03'),
('','S-00011','Ruvini Ahangama','2022-04-04'),
('','S-00011','Ruvini Ahangama','2022-04-05'),
('','S-00011','Ruvini Ahangama','2022-04-06'),
('','S-00011','Ruvini Ahangama','2022-04-07'),
('','S-00011','Ruvini Ahangama','2022-04-08'),
('','S-00011','Ruvini Ahangama','2022-04-09'),
('','S-00011','Ruvini Ahangama','2022-04-10'),
('','S-00011','Ruvini Ahangama','2022-04-11'),
('','S-00011','Ruvini Ahangama','2022-04-12'),
('','S-00011','Ruvini Ahangama','2022-04-13'),
('','S-00011','Ruvini Ahangama','2022-04-14'),
('','S-00011','Ruvini Ahangama','2022-04-15'),
('','S-00011','Ruvini Ahangama','2022-04-16'),
('','S-00011','Ruvini Ahangama','2022-04-17'),
('','S-00011','Ruvini Ahangama','2022-04-18'),
('','S-00011','Ruvini Ahangama','2022-04-19'),
('','S-00011','Ruvini Ahangama','2022-04-20'),
('','S-00011','Ruvini Ahangama','2022-05-01'),
('','S-00011','Ruvini Ahangama','2022-05-02'),
('','S-00011','Ruvini Ahangama','2022-05-03'),
('','S-00011','Ruvini Ahangama','2022-05-04'),
('','S-00011','Ruvini Ahangama','2022-05-05'),
('','S-00011','Ruvini Ahangama','2022-05-06'),
('','S-00011','Ruvini Ahangama','2022-05-07'),
('','S-00011','Ruvini Ahangama','2022-05-08'),
('','S-00011','Ruvini Ahangama','2022-05-09'),
('','S-00011','Ruvini Ahangama','2022-05-10'),
('','S-00011','Ruvini Ahangama','2022-05-11'),
('','S-00011','Ruvini Ahangama','2022-05-12'),
('','S-00011','Ruvini Ahangama','2022-05-13'),
('','S-00011','Ruvini Ahangama','2022-05-14'),
('','S-00011','Ruvini Ahangama','2022-05-15'),
('','S-00011','Ruvini Ahangama','2022-05-16'),
('','S-00011','Ruvini Ahangama','2022-05-17'),
('','S-00011','Ruvini Ahangama','2022-05-18'),
('','S-00011','Ruvini Ahangama','2022-05-19'),
('','S-00011','Ruvini Ahangama','2022-05-20'),






('','S-00012','Tharupa Amarasinghe','2022-01-01'),
('','S-00012','Tharupa Amarasinghe','2022-01-02'),
('','S-00012','Tharupa Amarasinghe','2022-01-03'),
('','S-00012','Tharupa Amarasinghe','2022-01-04'),
('','S-00012','Tharupa Amarasinghe','2022-01-05'),
('','S-00012','Tharupa Amarasinghe','2022-01-06'),
('','S-00012','Tharupa Amarasinghe','2022-01-07'),
('','S-00012','Tharupa Amarasinghe','2022-01-08'),
('','S-00012','Tharupa Amarasinghe','2022-01-09'),
('','S-00012','Tharupa Amarasinghe','2022-01-10'),
('','S-00012','Tharupa Amarasinghe','2022-01-11'),
('','S-00012','Tharupa Amarasinghe','2022-01-12'),
('','S-00012','Tharupa Amarasinghe','2022-01-13'),
('','S-00012','Tharupa Amarasinghe','2022-01-14'),
('','S-00012','Tharupa Amarasinghe','2022-01-15'),
('','S-00012','Tharupa Amarasinghe','2022-01-16'),
('','S-00012','Tharupa Amarasinghe','2022-01-17'),
('','S-00012','Tharupa Amarasinghe','2022-01-18'),
('','S-00012','Tharupa Amarasinghe','2022-01-19'),
('','S-00012','Tharupa Amarasinghe','2022-01-20'),
('','S-00012','Tharupa Amarasinghe','2022-02-01'),
('','S-00012','Tharupa Amarasinghe','2022-02-02'),
('','S-00012','Tharupa Amarasinghe','2022-02-03'),
('','S-00012','Tharupa Amarasinghe','2022-02-04'),
('','S-00012','Tharupa Amarasinghe','2022-02-05'),
('','S-00012','Tharupa Amarasinghe','2022-02-06'),
('','S-00012','Tharupa Amarasinghe','2022-02-07'),
('','S-00012','Tharupa Amarasinghe','2022-02-08'),
('','S-00012','Tharupa Amarasinghe','2022-02-09'),
('','S-00012','Tharupa Amarasinghe','2022-02-10'),
('','S-00012','Tharupa Amarasinghe','2022-02-11'),
('','S-00012','Tharupa Amarasinghe','2022-02-12'),
('','S-00012','Tharupa Amarasinghe','2022-02-13'),
('','S-00012','Tharupa Amarasinghe','2022-02-14'),
('','S-00012','Tharupa Amarasinghe','2022-02-15'),
('','S-00012','Tharupa Amarasinghe','2022-02-16'),
('','S-00012','Tharupa Amarasinghe','2022-02-17'),
('','S-00012','Tharupa Amarasinghe','2022-02-18'),
('','S-00012','Tharupa Amarasinghe','2022-02-19'),
('','S-00012','Tharupa Amarasinghe','2022-02-20'),
('','S-00012','Tharupa Amarasinghe','2022-03-01'),
('','S-00012','Tharupa Amarasinghe','2022-03-02'),
('','S-00012','Tharupa Amarasinghe','2022-03-03'),
('','S-00012','Tharupa Amarasinghe','2022-03-04'),
('','S-00012','Tharupa Amarasinghe','2022-03-05'),
('','S-00012','Tharupa Amarasinghe','2022-03-06'),
('','S-00012','Tharupa Amarasinghe','2022-03-07'),
('','S-00012','Tharupa Amarasinghe','2022-03-08'),
('','S-00012','Tharupa Amarasinghe','2022-03-09'),
('','S-00012','Tharupa Amarasinghe','2022-03-10'),
('','S-00012','Tharupa Amarasinghe','2022-03-11'),
('','S-00012','Tharupa Amarasinghe','2022-03-12'),
('','S-00012','Tharupa Amarasinghe','2022-03-13'),
('','S-00012','Tharupa Amarasinghe','2022-03-14'),
('','S-00012','Tharupa Amarasinghe','2022-03-15'),
('','S-00012','Tharupa Amarasinghe','2022-03-16'),
('','S-00012','Tharupa Amarasinghe','2022-03-17'),
('','S-00012','Tharupa Amarasinghe','2022-03-18'),
('','S-00012','Tharupa Amarasinghe','2022-03-19'),
('','S-00012','Tharupa Amarasinghe','2022-03-20'),
('','S-00012','Tharupa Amarasinghe','2022-04-01'),
('','S-00012','Tharupa Amarasinghe','2022-04-02'),
('','S-00012','Tharupa Amarasinghe','2022-04-03'),
('','S-00012','Tharupa Amarasinghe','2022-04-04'),
('','S-00012','Tharupa Amarasinghe','2022-04-05'),
('','S-00012','Tharupa Amarasinghe','2022-04-06'),
('','S-00012','Tharupa Amarasinghe','2022-04-07'),
('','S-00012','Tharupa Amarasinghe','2022-04-08'),
('','S-00012','Tharupa Amarasinghe','2022-04-09'),
('','S-00012','Tharupa Amarasinghe','2022-04-10'),
('','S-00012','Tharupa Amarasinghe','2022-04-11'),
('','S-00012','Tharupa Amarasinghe','2022-04-12'),
('','S-00012','Tharupa Amarasinghe','2022-04-13'),
('','S-00012','Tharupa Amarasinghe','2022-04-14'),
('','S-00012','Tharupa Amarasinghe','2022-04-15'),
('','S-00012','Tharupa Amarasinghe','2022-04-16'),
('','S-00012','Tharupa Amarasinghe','2022-04-17'),
('','S-00012','Tharupa Amarasinghe','2022-04-18'),
('','S-00012','Tharupa Amarasinghe','2022-04-19'),
('','S-00012','Tharupa Amarasinghe','2022-04-20'),
('','S-00012','Tharupa Amarasinghe','2022-05-01'),
('','S-00012','Tharupa Amarasinghe','2022-05-02'),
('','S-00012','Tharupa Amarasinghe','2022-05-03'),
('','S-00012','Tharupa Amarasinghe','2022-05-04'),
('','S-00012','Tharupa Amarasinghe','2022-05-05'),
('','S-00012','Tharupa Amarasinghe','2022-05-06'),
('','S-00012','Tharupa Amarasinghe','2022-05-07'),
('','S-00012','Tharupa Amarasinghe','2022-05-08'),
('','S-00012','Tharupa Amarasinghe','2022-05-09'),
('','S-00012','Tharupa Amarasinghe','2022-05-10'),
('','S-00012','Tharupa Amarasinghe','2022-05-11'),
('','S-00012','Tharupa Amarasinghe','2022-05-12'),
('','S-00012','Tharupa Amarasinghe','2022-05-13'),
('','S-00012','Tharupa Amarasinghe','2022-05-14'),
('','S-00012','Tharupa Amarasinghe','2022-05-15'),
('','S-00012','Tharupa Amarasinghe','2022-05-16'),
('','S-00012','Tharupa Amarasinghe','2022-05-17'),
('','S-00012','Tharupa Amarasinghe','2022-05-18'),
('','S-00012','Tharupa Amarasinghe','2022-05-19'),
('','S-00012','Tharupa Amarasinghe','2022-05-20'),





('','S-00013','Thurunu Jayasighe','2022-01-01'),
('','S-00013','Thurunu Jayasighe','2022-01-02'),
('','S-00013','Thurunu Jayasighe','2022-01-03'),
('','S-00013','Thurunu Jayasighe','2022-01-04'),
('','S-00013','Thurunu Jayasighe','2022-01-05'),
('','S-00013','Thurunu Jayasighe','2022-01-06'),
('','S-00013','Thurunu Jayasighe','2022-01-07'),
('','S-00013','Thurunu Jayasighe','2022-01-08'),
('','S-00013','Thurunu Jayasighe','2022-01-09'),
('','S-00013','Thurunu Jayasighe','2022-01-10'),
('','S-00013','Thurunu Jayasighe','2022-01-11'),
('','S-00013','Thurunu Jayasighe','2022-01-12'),
('','S-00013','Thurunu Jayasighe','2022-01-13'),
('','S-00013','Thurunu Jayasighe','2022-01-14'),
('','S-00013','Thurunu Jayasighe','2022-01-15'),
('','S-00013','Thurunu Jayasighe','2022-01-16'),
('','S-00013','Thurunu Jayasighe','2022-01-17'),
('','S-00013','Thurunu Jayasighe','2022-01-18'),
('','S-00013','Thurunu Jayasighe','2022-01-19'),
('','S-00013','Thurunu Jayasighe','2022-01-20'),
('','S-00013','Thurunu Jayasighe','2022-02-01'),
('','S-00013','Thurunu Jayasighe','2022-02-02'),
('','S-00013','Thurunu Jayasighe','2022-02-03'),
('','S-00013','Thurunu Jayasighe','2022-02-04'),
('','S-00013','Thurunu Jayasighe','2022-02-05'),
('','S-00013','Thurunu Jayasighe','2022-02-06'),
('','S-00013','Thurunu Jayasighe','2022-02-07'),
('','S-00013','Thurunu Jayasighe','2022-02-08'),
('','S-00013','Thurunu Jayasighe','2022-02-09'),
('','S-00013','Thurunu Jayasighe','2022-02-10'),
('','S-00013','Thurunu Jayasighe','2022-02-11'),
('','S-00013','Thurunu Jayasighe','2022-02-12'),
('','S-00013','Thurunu Jayasighe','2022-02-13'),
('','S-00013','Thurunu Jayasighe','2022-02-14'),
('','S-00013','Thurunu Jayasighe','2022-02-15'),
('','S-00013','Thurunu Jayasighe','2022-02-16'),
('','S-00013','Thurunu Jayasighe','2022-02-17'),
('','S-00013','Thurunu Jayasighe','2022-02-18'),
('','S-00013','Thurunu Jayasighe','2022-02-19'),
('','S-00013','Thurunu Jayasighe','2022-02-20'),
('','S-00013','Thurunu Jayasighe','2022-03-01'),
('','S-00013','Thurunu Jayasighe','2022-03-02'),
('','S-00013','Thurunu Jayasighe','2022-03-03'),
('','S-00013','Thurunu Jayasighe','2022-03-04'),
('','S-00013','Thurunu Jayasighe','2022-03-05'),
('','S-00013','Thurunu Jayasighe','2022-03-06'),
('','S-00013','Thurunu Jayasighe','2022-03-07'),
('','S-00013','Thurunu Jayasighe','2022-03-08'),
('','S-00013','Thurunu Jayasighe','2022-03-09'),
('','S-00013','Thurunu Jayasighe','2022-03-10'),
('','S-00013','Thurunu Jayasighe','2022-03-11'),
('','S-00013','Thurunu Jayasighe','2022-03-12'),
('','S-00013','Thurunu Jayasighe','2022-03-13'),
('','S-00013','Thurunu Jayasighe','2022-03-14'),
('','S-00013','Thurunu Jayasighe','2022-03-15'),
('','S-00013','Thurunu Jayasighe','2022-03-16'),
('','S-00013','Thurunu Jayasighe','2022-03-17'),
('','S-00013','Thurunu Jayasighe','2022-03-18'),
('','S-00013','Thurunu Jayasighe','2022-03-19'),
('','S-00013','Thurunu Jayasighe','2022-03-20'),
('','S-00013','Thurunu Jayasighe','2022-04-01'),
('','S-00013','Thurunu Jayasighe','2022-04-02'),
('','S-00013','Thurunu Jayasighe','2022-04-03'),
('','S-00013','Thurunu Jayasighe','2022-04-04'),
('','S-00013','Thurunu Jayasighe','2022-04-05'),
('','S-00013','Thurunu Jayasighe','2022-04-06'),
('','S-00013','Thurunu Jayasighe','2022-04-07'),
('','S-00013','Thurunu Jayasighe','2022-04-08'),
('','S-00013','Thurunu Jayasighe','2022-04-09'),
('','S-00013','Thurunu Jayasighe','2022-04-10'),
('','S-00013','Thurunu Jayasighe','2022-04-11'),
('','S-00013','Thurunu Jayasighe','2022-04-12'),
('','S-00013','Thurunu Jayasighe','2022-04-13'),
('','S-00013','Thurunu Jayasighe','2022-04-14'),
('','S-00013','Thurunu Jayasighe','2022-04-15'),
('','S-00013','Thurunu Jayasighe','2022-04-16'),
('','S-00013','Thurunu Jayasighe','2022-04-17'),
('','S-00013','Thurunu Jayasighe','2022-04-18'),
('','S-00013','Thurunu Jayasighe','2022-04-19'),
('','S-00013','Thurunu Jayasighe','2022-04-20'),
('','S-00013','Thurunu Jayasighe','2022-05-01'),
('','S-00013','Thurunu Jayasighe','2022-05-02'),
('','S-00013','Thurunu Jayasighe','2022-05-03'),
('','S-00013','Thurunu Jayasighe','2022-05-04'),
('','S-00013','Thurunu Jayasighe','2022-05-05'),
('','S-00013','Thurunu Jayasighe','2022-05-06'),
('','S-00013','Thurunu Jayasighe','2022-05-07'),
('','S-00013','Thurunu Jayasighe','2022-05-08'),
('','S-00013','Thurunu Jayasighe','2022-05-09'),
('','S-00013','Thurunu Jayasighe','2022-05-10'),
('','S-00013','Thurunu Jayasighe','2022-05-11'),
('','S-00013','Thurunu Jayasighe','2022-05-12'),
('','S-00013','Thurunu Jayasighe','2022-05-13'),
('','S-00013','Thurunu Jayasighe','2022-05-14'),
('','S-00013','Thurunu Jayasighe','2022-05-15'),
('','S-00013','Thurunu Jayasighe','2022-05-16'),
('','S-00013','Thurunu Jayasighe','2022-05-17'),
('','S-00013','Thurunu Jayasighe','2022-05-18'),
('','S-00013','Thurunu Jayasighe','2022-05-19'),
('','S-00013','Thurunu Jayasighe','2022-05-20'),





('','S-00014','Timal Rukshan','2022-01-01'),
('','S-00014','Timal Rukshan','2022-01-02'),
('','S-00014','Timal Rukshan','2022-01-03'),
('','S-00014','Timal Rukshan','2022-01-04'),
('','S-00014','Timal Rukshan','2022-01-05'),
('','S-00014','Timal Rukshan','2022-01-06'),
('','S-00014','Timal Rukshan','2022-01-07'),
('','S-00014','Timal Rukshan','2022-01-08'),
('','S-00014','Timal Rukshan','2022-01-09'),
('','S-00014','Timal Rukshan','2022-01-10'),
('','S-00014','Timal Rukshan','2022-01-11'),
('','S-00014','Timal Rukshan','2022-01-12'),
('','S-00014','Timal Rukshan','2022-01-13'),
('','S-00014','Timal Rukshan','2022-01-14'),
('','S-00014','Timal Rukshan','2022-01-15'),
('','S-00014','Timal Rukshan','2022-01-16'),
('','S-00014','Timal Rukshan','2022-01-17'),
('','S-00014','Timal Rukshan','2022-01-18'),
('','S-00014','Timal Rukshan','2022-01-19'),
('','S-00014','Timal Rukshan','2022-01-20'),
('','S-00014','Timal Rukshan','2022-02-01'),
('','S-00014','Timal Rukshan','2022-02-02'),
('','S-00014','Timal Rukshan','2022-02-03'),
('','S-00014','Timal Rukshan','2022-02-04'),
('','S-00014','Timal Rukshan','2022-02-05'),
('','S-00014','Timal Rukshan','2022-02-06'),
('','S-00014','Timal Rukshan','2022-02-07'),
('','S-00014','Timal Rukshan','2022-02-08'),
('','S-00014','Timal Rukshan','2022-02-09'),
('','S-00014','Timal Rukshan','2022-02-10'),
('','S-00014','Timal Rukshan','2022-02-11'),
('','S-00014','Timal Rukshan','2022-02-12'),
('','S-00014','Timal Rukshan','2022-02-13'),
('','S-00014','Timal Rukshan','2022-02-14'),
('','S-00014','Timal Rukshan','2022-02-15'),
('','S-00014','Timal Rukshan','2022-02-16'),
('','S-00014','Timal Rukshan','2022-02-17'),
('','S-00014','Timal Rukshan','2022-02-18'),
('','S-00014','Timal Rukshan','2022-02-19'),
('','S-00014','Timal Rukshan','2022-02-20'),
('','S-00014','Timal Rukshan','2022-03-01'),
('','S-00014','Timal Rukshan','2022-03-02'),
('','S-00014','Timal Rukshan','2022-03-03'),
('','S-00014','Timal Rukshan','2022-03-04'),
('','S-00014','Timal Rukshan','2022-03-05'),
('','S-00014','Timal Rukshan','2022-03-06'),
('','S-00014','Timal Rukshan','2022-03-07'),
('','S-00014','Timal Rukshan','2022-03-08'),
('','S-00014','Timal Rukshan','2022-03-09'),
('','S-00014','Timal Rukshan','2022-03-10'),
('','S-00014','Timal Rukshan','2022-03-11'),
('','S-00014','Timal Rukshan','2022-03-12'),
('','S-00014','Timal Rukshan','2022-03-13'),
('','S-00014','Timal Rukshan','2022-03-14'),
('','S-00014','Timal Rukshan','2022-03-15'),
('','S-00014','Timal Rukshan','2022-03-16'),
('','S-00014','Timal Rukshan','2022-03-17'),
('','S-00014','Timal Rukshan','2022-03-18'),
('','S-00014','Timal Rukshan','2022-03-19'),
('','S-00014','Timal Rukshan','2022-03-20'),
('','S-00014','Timal Rukshan','2022-04-01'),
('','S-00014','Timal Rukshan','2022-04-02'),
('','S-00014','Timal Rukshan','2022-04-03'),
('','S-00014','Timal Rukshan','2022-04-04'),
('','S-00014','Timal Rukshan','2022-04-05'),
('','S-00014','Timal Rukshan','2022-04-06'),
('','S-00014','Timal Rukshan','2022-04-07'),
('','S-00014','Timal Rukshan','2022-04-08'),
('','S-00014','Timal Rukshan','2022-04-09'),
('','S-00014','Timal Rukshan','2022-04-10'),
('','S-00014','Timal Rukshan','2022-04-11'),
('','S-00014','Timal Rukshan','2022-04-12'),
('','S-00014','Timal Rukshan','2022-04-13'),
('','S-00014','Timal Rukshan','2022-04-14'),
('','S-00014','Timal Rukshan','2022-04-15'),
('','S-00014','Timal Rukshan','2022-04-16'),
('','S-00014','Timal Rukshan','2022-04-17'),
('','S-00014','Timal Rukshan','2022-04-18'),
('','S-00014','Timal Rukshan','2022-04-19'),
('','S-00014','Timal Rukshan','2022-04-20'),
('','S-00014','Timal Rukshan','2022-05-01'),
('','S-00014','Timal Rukshan','2022-05-02'),
('','S-00014','Timal Rukshan','2022-05-03'),
('','S-00014','Timal Rukshan','2022-05-04'),
('','S-00014','Timal Rukshan','2022-05-05'),
('','S-00014','Timal Rukshan','2022-05-06'),
('','S-00014','Timal Rukshan','2022-05-07'),
('','S-00014','Timal Rukshan','2022-05-08'),
('','S-00014','Timal Rukshan','2022-05-09'),
('','S-00014','Timal Rukshan','2022-05-10'),
('','S-00014','Timal Rukshan','2022-05-11'),
('','S-00014','Timal Rukshan','2022-05-12'),
('','S-00014','Timal Rukshan','2022-05-13'),
('','S-00014','Timal Rukshan','2022-05-14'),
('','S-00014','Timal Rukshan','2022-05-15'),
('','S-00014','Timal Rukshan','2022-05-16'),
('','S-00014','Timal Rukshan','2022-05-17'),
('','S-00014','Timal Rukshan','2022-05-18'),
('','S-00014','Timal Rukshan','2022-05-19'),
('','S-00014','Timal Rukshan','2022-05-20'),




('','S-00015','Rukshan Samarasinghe','2022-01-01'),
('','S-00015','Rukshan Samarasinghe','2022-01-02'),
('','S-00015','Rukshan Samarasinghe','2022-01-03'),
('','S-00015','Rukshan Samarasinghe','2022-01-04'),
('','S-00015','Rukshan Samarasinghe','2022-01-05'),
('','S-00015','Rukshan Samarasinghe','2022-01-06'),
('','S-00015','Rukshan Samarasinghe','2022-01-07'),
('','S-00015','Rukshan Samarasinghe','2022-01-08'),
('','S-00015','Rukshan Samarasinghe','2022-01-09'),
('','S-00015','Rukshan Samarasinghe','2022-01-10'),
('','S-00015','Rukshan Samarasinghe','2022-01-11'),
('','S-00015','Rukshan Samarasinghe','2022-01-12'),
('','S-00015','Rukshan Samarasinghe','2022-01-13'),
('','S-00015','Rukshan Samarasinghe','2022-01-14'),
('','S-00015','Rukshan Samarasinghe','2022-01-15'),
('','S-00015','Rukshan Samarasinghe','2022-01-16'),
('','S-00015','Rukshan Samarasinghe','2022-01-17'),
('','S-00015','Rukshan Samarasinghe','2022-01-18'),
('','S-00015','Rukshan Samarasinghe','2022-01-19'),
('','S-00015','Rukshan Samarasinghe','2022-01-20'),
('','S-00015','Rukshan Samarasinghe','2022-02-01'),
('','S-00015','Rukshan Samarasinghe','2022-02-02'),
('','S-00015','Rukshan Samarasinghe','2022-02-03'),
('','S-00015','Rukshan Samarasinghe','2022-02-04'),
('','S-00015','Rukshan Samarasinghe','2022-02-05'),
('','S-00015','Rukshan Samarasinghe','2022-02-06'),
('','S-00015','Rukshan Samarasinghe','2022-02-07'),
('','S-00015','Rukshan Samarasinghe','2022-02-08'),
('','S-00015','Rukshan Samarasinghe','2022-02-09'),
('','S-00015','Rukshan Samarasinghe','2022-02-10'),
('','S-00015','Rukshan Samarasinghe','2022-02-11'),
('','S-00015','Rukshan Samarasinghe','2022-02-12'),
('','S-00015','Rukshan Samarasinghe','2022-02-13'),
('','S-00015','Rukshan Samarasinghe','2022-02-14'),
('','S-00015','Rukshan Samarasinghe','2022-02-15'),
('','S-00015','Rukshan Samarasinghe','2022-02-16'),
('','S-00015','Rukshan Samarasinghe','2022-02-17'),
('','S-00015','Rukshan Samarasinghe','2022-02-18'),
('','S-00015','Rukshan Samarasinghe','2022-02-19'),
('','S-00015','Rukshan Samarasinghe','2022-02-20'),
('','S-00015','Rukshan Samarasinghe','2022-03-01'),
('','S-00015','Rukshan Samarasinghe','2022-03-02'),
('','S-00015','Rukshan Samarasinghe','2022-03-03'),
('','S-00015','Rukshan Samarasinghe','2022-03-04'),
('','S-00015','Rukshan Samarasinghe','2022-03-05'),
('','S-00015','Rukshan Samarasinghe','2022-03-06'),
('','S-00015','Rukshan Samarasinghe','2022-03-07'),
('','S-00015','Rukshan Samarasinghe','2022-03-08'),
('','S-00015','Rukshan Samarasinghe','2022-03-09'),
('','S-00015','Rukshan Samarasinghe','2022-03-10'),
('','S-00015','Rukshan Samarasinghe','2022-03-11'),
('','S-00015','Rukshan Samarasinghe','2022-03-12'),
('','S-00015','Rukshan Samarasinghe','2022-03-13'),
('','S-00015','Rukshan Samarasinghe','2022-03-14'),
('','S-00015','Rukshan Samarasinghe','2022-03-15'),
('','S-00015','Rukshan Samarasinghe','2022-03-16'),
('','S-00015','Rukshan Samarasinghe','2022-03-17'),
('','S-00015','Rukshan Samarasinghe','2022-03-18'),
('','S-00015','Rukshan Samarasinghe','2022-03-19'),
('','S-00015','Rukshan Samarasinghe','2022-03-20'),
('','S-00015','Rukshan Samarasinghe','2022-04-01'),
('','S-00015','Rukshan Samarasinghe','2022-04-02'),
('','S-00015','Rukshan Samarasinghe','2022-04-03'),
('','S-00015','Rukshan Samarasinghe','2022-04-04'),
('','S-00015','Rukshan Samarasinghe','2022-04-05'),
('','S-00015','Rukshan Samarasinghe','2022-04-06'),
('','S-00015','Rukshan Samarasinghe','2022-04-07'),
('','S-00015','Rukshan Samarasinghe','2022-04-08'),
('','S-00015','Rukshan Samarasinghe','2022-04-09'),
('','S-00015','Rukshan Samarasinghe','2022-04-10'),
('','S-00015','Rukshan Samarasinghe','2022-04-11'),
('','S-00015','Rukshan Samarasinghe','2022-04-12'),
('','S-00015','Rukshan Samarasinghe','2022-04-13'),
('','S-00015','Rukshan Samarasinghe','2022-04-14'),
('','S-00015','Rukshan Samarasinghe','2022-04-15'),
('','S-00015','Rukshan Samarasinghe','2022-04-16'),
('','S-00015','Rukshan Samarasinghe','2022-04-17'),
('','S-00015','Rukshan Samarasinghe','2022-04-18'),
('','S-00015','Rukshan Samarasinghe','2022-04-19'),
('','S-00015','Rukshan Samarasinghe','2022-04-20'),
('','S-00015','Rukshan Samarasinghe','2022-05-01'),
('','S-00015','Rukshan Samarasinghe','2022-05-02'),
('','S-00015','Rukshan Samarasinghe','2022-05-03'),
('','S-00015','Rukshan Samarasinghe','2022-05-04'),
('','S-00015','Rukshan Samarasinghe','2022-05-05'),
('','S-00015','Rukshan Samarasinghe','2022-05-06'),
('','S-00015','Rukshan Samarasinghe','2022-05-07'),
('','S-00015','Rukshan Samarasinghe','2022-05-08'),
('','S-00015','Rukshan Samarasinghe','2022-05-09'),
('','S-00015','Rukshan Samarasinghe','2022-05-10'),
('','S-00015','Rukshan Samarasinghe','2022-05-11'),
('','S-00015','Rukshan Samarasinghe','2022-05-12'),
('','S-00015','Rukshan Samarasinghe','2022-05-13'),
('','S-00015','Rukshan Samarasinghe','2022-05-14'),
('','S-00015','Rukshan Samarasinghe','2022-05-15'),
('','S-00015','Rukshan Samarasinghe','2022-05-16'),
('','S-00015','Rukshan Samarasinghe','2022-05-17'),
('','S-00015','Rukshan Samarasinghe','2022-05-18'),
('','S-00015','Rukshan Samarasinghe','2022-05-19'),
('','S-00015','Rukshan Samarasinghe','2022-05-20'),



('','S-00016','Amarabandu Roopasinge','2022-01-01'),
('','S-00016','Amarabandu Roopasinge','2022-01-02'),
('','S-00016','Amarabandu Roopasinge','2022-01-03'),
('','S-00016','Amarabandu Roopasinge','2022-01-04'),
('','S-00016','Amarabandu Roopasinge','2022-01-05'),
('','S-00016','Amarabandu Roopasinge','2022-01-06'),
('','S-00016','Amarabandu Roopasinge','2022-01-07'),
('','S-00016','Amarabandu Roopasinge','2022-01-08'),
('','S-00016','Amarabandu Roopasinge','2022-01-09'),
('','S-00016','Amarabandu Roopasinge','2022-01-10'),
('','S-00016','Amarabandu Roopasinge','2022-01-11'),
('','S-00016','Amarabandu Roopasinge','2022-01-12'),
('','S-00016','Amarabandu Roopasinge','2022-01-13'),
('','S-00016','Amarabandu Roopasinge','2022-01-14'),
('','S-00016','Amarabandu Roopasinge','2022-01-15'),
('','S-00016','Amarabandu Roopasinge','2022-01-16'),
('','S-00016','Amarabandu Roopasinge','2022-01-17'),
('','S-00016','Amarabandu Roopasinge','2022-01-18'),
('','S-00016','Amarabandu Roopasinge','2022-01-19'),
('','S-00016','Amarabandu Roopasinge','2022-01-20'),
('','S-00016','Amarabandu Roopasinge','2022-02-01'),
('','S-00016','Amarabandu Roopasinge','2022-02-02'),
('','S-00016','Amarabandu Roopasinge','2022-02-03'),
('','S-00016','Amarabandu Roopasinge','2022-02-04'),
('','S-00016','Amarabandu Roopasinge','2022-02-05'),
('','S-00016','Amarabandu Roopasinge','2022-02-06'),
('','S-00016','Amarabandu Roopasinge','2022-02-07'),
('','S-00016','Amarabandu Roopasinge','2022-02-08'),
('','S-00016','Amarabandu Roopasinge','2022-02-09'),
('','S-00016','Amarabandu Roopasinge','2022-02-10'),
('','S-00016','Amarabandu Roopasinge','2022-02-11'),
('','S-00016','Amarabandu Roopasinge','2022-02-12'),
('','S-00016','Amarabandu Roopasinge','2022-02-13'),
('','S-00016','Amarabandu Roopasinge','2022-02-14'),
('','S-00016','Amarabandu Roopasinge','2022-02-15'),
('','S-00016','Amarabandu Roopasinge','2022-02-16'),
('','S-00016','Amarabandu Roopasinge','2022-02-17'),
('','S-00016','Amarabandu Roopasinge','2022-02-18'),
('','S-00016','Amarabandu Roopasinge','2022-02-19'),
('','S-00016','Amarabandu Roopasinge','2022-02-20'),
('','S-00016','Amarabandu Roopasinge','2022-03-01'),
('','S-00016','Amarabandu Roopasinge','2022-03-02'),
('','S-00016','Amarabandu Roopasinge','2022-03-03'),
('','S-00016','Amarabandu Roopasinge','2022-03-04'),
('','S-00016','Amarabandu Roopasinge','2022-03-05'),
('','S-00016','Amarabandu Roopasinge','2022-03-06'),
('','S-00016','Amarabandu Roopasinge','2022-03-07'),
('','S-00016','Amarabandu Roopasinge','2022-03-08'),
('','S-00016','Amarabandu Roopasinge','2022-03-09'),
('','S-00016','Amarabandu Roopasinge','2022-03-10'),
('','S-00016','Amarabandu Roopasinge','2022-03-11'),
('','S-00016','Amarabandu Roopasinge','2022-03-12'),
('','S-00016','Amarabandu Roopasinge','2022-03-13'),
('','S-00016','Amarabandu Roopasinge','2022-03-14'),
('','S-00016','Amarabandu Roopasinge','2022-03-15'),
('','S-00016','Amarabandu Roopasinge','2022-03-16'),
('','S-00016','Amarabandu Roopasinge','2022-03-17'),
('','S-00016','Amarabandu Roopasinge','2022-03-18'),
('','S-00016','Amarabandu Roopasinge','2022-03-19'),
('','S-00016','Amarabandu Roopasinge','2022-03-20'),
('','S-00016','Amarabandu Roopasinge','2022-04-01'),
('','S-00016','Amarabandu Roopasinge','2022-04-02'),
('','S-00016','Amarabandu Roopasinge','2022-04-03'),
('','S-00016','Amarabandu Roopasinge','2022-04-04'),
('','S-00016','Amarabandu Roopasinge','2022-04-05'),
('','S-00016','Amarabandu Roopasinge','2022-04-06'),
('','S-00016','Amarabandu Roopasinge','2022-04-07'),
('','S-00016','Amarabandu Roopasinge','2022-04-08'),
('','S-00016','Amarabandu Roopasinge','2022-04-09'),
('','S-00016','Amarabandu Roopasinge','2022-04-10'),
('','S-00016','Amarabandu Roopasinge','2022-04-11'),
('','S-00016','Amarabandu Roopasinge','2022-04-12'),
('','S-00016','Amarabandu Roopasinge','2022-04-13'),
('','S-00016','Amarabandu Roopasinge','2022-04-14'),
('','S-00016','Amarabandu Roopasinge','2022-04-15'),
('','S-00016','Amarabandu Roopasinge','2022-04-16'),
('','S-00016','Amarabandu Roopasinge','2022-04-17'),
('','S-00016','Amarabandu Roopasinge','2022-04-18'),
('','S-00016','Amarabandu Roopasinge','2022-04-19'),
('','S-00016','Amarabandu Roopasinge','2022-04-20'),
('','S-00016','Amarabandu Roopasinge','2022-05-01'),
('','S-00016','Amarabandu Roopasinge','2022-05-02'),
('','S-00016','Amarabandu Roopasinge','2022-05-03'),
('','S-00016','Amarabandu Roopasinge','2022-05-04'),
('','S-00016','Amarabandu Roopasinge','2022-05-05'),
('','S-00016','Amarabandu Roopasinge','2022-05-06'),
('','S-00016','Amarabandu Roopasinge','2022-05-07'),
('','S-00016','Amarabandu Roopasinge','2022-05-08'),
('','S-00016','Amarabandu Roopasinge','2022-05-09'),
('','S-00016','Amarabandu Roopasinge','2022-05-10'),
('','S-00016','Amarabandu Roopasinge','2022-05-11'),
('','S-00016','Amarabandu Roopasinge','2022-05-12'),
('','S-00016','Amarabandu Roopasinge','2022-05-13'),
('','S-00016','Amarabandu Roopasinge','2022-05-14'),
('','S-00016','Amarabandu Roopasinge','2022-05-15'),
('','S-00016','Amarabandu Roopasinge','2022-05-16'),
('','S-00016','Amarabandu Roopasinge','2022-05-17'),
('','S-00016','Amarabandu Roopasinge','2022-05-18'),
('','S-00016','Amarabandu Roopasinge','2022-05-19'),
('','S-00016','Amarabandu Roopasinge','2022-05-20'),




('','S-00017','Roopa Randini','2022-01-01'),
('','S-00017','Roopa Randini','2022-01-02'),
('','S-00017','Roopa Randini','2022-01-03'),
('','S-00017','Roopa Randini','2022-01-04'),
('','S-00017','Roopa Randini','2022-01-05'),
('','S-00017','Roopa Randini','2022-01-06'),
('','S-00017','Roopa Randini','2022-01-07'),
('','S-00017','Roopa Randini','2022-01-08'),
('','S-00017','Roopa Randini','2022-01-09'),
('','S-00017','Roopa Randini','2022-01-10'),
('','S-00017','Roopa Randini','2022-01-11'),
('','S-00017','Roopa Randini','2022-01-12'),
('','S-00017','Roopa Randini','2022-01-13'),
('','S-00017','Roopa Randini','2022-01-14'),
('','S-00017','Roopa Randini','2022-01-15'),
('','S-00017','Roopa Randini','2022-01-16'),
('','S-00017','Roopa Randini','2022-01-17'),
('','S-00017','Roopa Randini','2022-01-18'),
('','S-00017','Roopa Randini','2022-01-19'),
('','S-00017','Roopa Randini','2022-01-20'),
('','S-00017','Roopa Randini','2022-02-01'),
('','S-00017','Roopa Randini','2022-02-02'),
('','S-00017','Roopa Randini','2022-02-03'),
('','S-00017','Roopa Randini','2022-02-04'),
('','S-00017','Roopa Randini','2022-02-05'),
('','S-00017','Roopa Randini','2022-02-06'),
('','S-00017','Roopa Randini','2022-02-07'),
('','S-00017','Roopa Randini','2022-02-08'),
('','S-00017','Roopa Randini','2022-02-09'),
('','S-00017','Roopa Randini','2022-02-10'),
('','S-00017','Roopa Randini','2022-02-11'),
('','S-00017','Roopa Randini','2022-02-12'),
('','S-00017','Roopa Randini','2022-02-13'),
('','S-00017','Roopa Randini','2022-02-14'),
('','S-00017','Roopa Randini','2022-02-15'),
('','S-00017','Roopa Randini','2022-02-16'),
('','S-00017','Roopa Randini','2022-02-17'),
('','S-00017','Roopa Randini','2022-02-18'),
('','S-00017','Roopa Randini','2022-02-19'),
('','S-00017','Roopa Randini','2022-02-20'),
('','S-00017','Roopa Randini','2022-03-01'),
('','S-00017','Roopa Randini','2022-03-02'),
('','S-00017','Roopa Randini','2022-03-03'),
('','S-00017','Roopa Randini','2022-03-04'),
('','S-00017','Roopa Randini','2022-03-05'),
('','S-00017','Roopa Randini','2022-03-06'),
('','S-00017','Roopa Randini','2022-03-07'),
('','S-00017','Roopa Randini','2022-03-08'),
('','S-00017','Roopa Randini','2022-03-09'),
('','S-00017','Roopa Randini','2022-03-10'),
('','S-00017','Roopa Randini','2022-03-11'),
('','S-00017','Roopa Randini','2022-03-12'),
('','S-00017','Roopa Randini','2022-03-13'),
('','S-00017','Roopa Randini','2022-03-14'),
('','S-00017','Roopa Randini','2022-03-15'),
('','S-00017','Roopa Randini','2022-03-16'),
('','S-00017','Roopa Randini','2022-03-17'),
('','S-00017','Roopa Randini','2022-03-18'),
('','S-00017','Roopa Randini','2022-03-19'),
('','S-00017','Roopa Randini','2022-03-20'),
('','S-00017','Roopa Randini','2022-04-01'),
('','S-00017','Roopa Randini','2022-04-02'),
('','S-00017','Roopa Randini','2022-04-03'),
('','S-00017','Roopa Randini','2022-04-04'),
('','S-00017','Roopa Randini','2022-04-05'),
('','S-00017','Roopa Randini','2022-04-06'),
('','S-00017','Roopa Randini','2022-04-07'),
('','S-00017','Roopa Randini','2022-04-08'),
('','S-00017','Roopa Randini','2022-04-09'),
('','S-00017','Roopa Randini','2022-04-10'),
('','S-00017','Roopa Randini','2022-04-11'),
('','S-00017','Roopa Randini','2022-04-12'),
('','S-00017','Roopa Randini','2022-04-13'),
('','S-00017','Roopa Randini','2022-04-14'),
('','S-00017','Roopa Randini','2022-04-15'),
('','S-00017','Roopa Randini','2022-04-16'),
('','S-00017','Roopa Randini','2022-04-17'),
('','S-00017','Roopa Randini','2022-04-18'),
('','S-00017','Roopa Randini','2022-04-19'),
('','S-00017','Roopa Randini','2022-04-20'),
('','S-00017','Roopa Randini','2022-05-01'),
('','S-00017','Roopa Randini','2022-05-02'),
('','S-00017','Roopa Randini','2022-05-03'),
('','S-00017','Roopa Randini','2022-05-04'),
('','S-00017','Roopa Randini','2022-05-05'),
('','S-00017','Roopa Randini','2022-05-06'),
('','S-00017','Roopa Randini','2022-05-07'),
('','S-00017','Roopa Randini','2022-05-08'),
('','S-00017','Roopa Randini','2022-05-09'),
('','S-00017','Roopa Randini','2022-05-10'),
('','S-00017','Roopa Randini','2022-05-11'),
('','S-00017','Roopa Randini','2022-05-12'),
('','S-00017','Roopa Randini','2022-05-13'),
('','S-00017','Roopa Randini','2022-05-14'),
('','S-00017','Roopa Randini','2022-05-15'),
('','S-00017','Roopa Randini','2022-05-16'),
('','S-00017','Roopa Randini','2022-05-17'),
('','S-00017','Roopa Randini','2022-05-18'),
('','S-00017','Roopa Randini','2022-05-19'),
('','S-00017','Roopa Randini','2022-05-20'),




('','S-00018','Tissa Madhawa','2022-01-01'),
('','S-00018','Tissa Madhawa','2022-01-02'),
('','S-00018','Tissa Madhawa','2022-01-03'),
('','S-00018','Tissa Madhawa','2022-01-04'),
('','S-00018','Tissa Madhawa','2022-01-05'),
('','S-00018','Tissa Madhawa','2022-01-06'),
('','S-00018','Tissa Madhawa','2022-01-07'),
('','S-00018','Tissa Madhawa','2022-01-08'),
('','S-00018','Tissa Madhawa','2022-01-09'),
('','S-00018','Tissa Madhawa','2022-01-10'),
('','S-00018','Tissa Madhawa','2022-01-11'),
('','S-00018','Tissa Madhawa','2022-01-12'),
('','S-00018','Tissa Madhawa','2022-01-13'),
('','S-00018','Tissa Madhawa','2022-01-14'),
('','S-00018','Tissa Madhawa','2022-01-15'),
('','S-00018','Tissa Madhawa','2022-01-16'),
('','S-00018','Tissa Madhawa','2022-01-17'),
('','S-00018','Tissa Madhawa','2022-01-18'),
('','S-00018','Tissa Madhawa','2022-01-19'),
('','S-00018','Tissa Madhawa','2022-01-20'),
('','S-00018','Tissa Madhawa','2022-02-01'),
('','S-00018','Tissa Madhawa','2022-02-02'),
('','S-00018','Tissa Madhawa','2022-02-03'),
('','S-00018','Tissa Madhawa','2022-02-04'),
('','S-00018','Tissa Madhawa','2022-02-05'),
('','S-00018','Tissa Madhawa','2022-02-06'),
('','S-00018','Tissa Madhawa','2022-02-07'),
('','S-00018','Tissa Madhawa','2022-02-08'),
('','S-00018','Tissa Madhawa','2022-02-09'),
('','S-00018','Tissa Madhawa','2022-02-10'),
('','S-00018','Tissa Madhawa','2022-02-11'),
('','S-00018','Tissa Madhawa','2022-02-12'),
('','S-00018','Tissa Madhawa','2022-02-13'),
('','S-00018','Tissa Madhawa','2022-02-14'),
('','S-00018','Tissa Madhawa','2022-02-15'),
('','S-00018','Tissa Madhawa','2022-02-16'),
('','S-00018','Tissa Madhawa','2022-02-17'),
('','S-00018','Tissa Madhawa','2022-02-18'),
('','S-00018','Tissa Madhawa','2022-02-19'),
('','S-00018','Tissa Madhawa','2022-02-20'),
('','S-00018','Tissa Madhawa','2022-03-01'),
('','S-00018','Tissa Madhawa','2022-03-02'),
('','S-00018','Tissa Madhawa','2022-03-03'),
('','S-00018','Tissa Madhawa','2022-03-04'),
('','S-00018','Tissa Madhawa','2022-03-05'),
('','S-00018','Tissa Madhawa','2022-03-06'),
('','S-00018','Tissa Madhawa','2022-03-07'),
('','S-00018','Tissa Madhawa','2022-03-08'),
('','S-00018','Tissa Madhawa','2022-03-09'),
('','S-00018','Tissa Madhawa','2022-03-10'),
('','S-00018','Tissa Madhawa','2022-03-11'),
('','S-00018','Tissa Madhawa','2022-03-12'),
('','S-00018','Tissa Madhawa','2022-03-13'),
('','S-00018','Tissa Madhawa','2022-03-14'),
('','S-00018','Tissa Madhawa','2022-03-15'),
('','S-00018','Tissa Madhawa','2022-03-16'),
('','S-00018','Tissa Madhawa','2022-03-17'),
('','S-00018','Tissa Madhawa','2022-03-18'),
('','S-00018','Tissa Madhawa','2022-03-19'),
('','S-00018','Tissa Madhawa','2022-03-20'),
('','S-00018','Tissa Madhawa','2022-04-01'),
('','S-00018','Tissa Madhawa','2022-04-02'),
('','S-00018','Tissa Madhawa','2022-04-03'),
('','S-00018','Tissa Madhawa','2022-04-04'),
('','S-00018','Tissa Madhawa','2022-04-05'),
('','S-00018','Tissa Madhawa','2022-04-06'),
('','S-00018','Tissa Madhawa','2022-04-07'),
('','S-00018','Tissa Madhawa','2022-04-08'),
('','S-00018','Tissa Madhawa','2022-04-09'),
('','S-00018','Tissa Madhawa','2022-04-10'),
('','S-00018','Tissa Madhawa','2022-04-11'),
('','S-00018','Tissa Madhawa','2022-04-12'),
('','S-00018','Tissa Madhawa','2022-04-13'),
('','S-00018','Tissa Madhawa','2022-04-14'),
('','S-00018','Tissa Madhawa','2022-04-15'),
('','S-00018','Tissa Madhawa','2022-04-16'),
('','S-00018','Tissa Madhawa','2022-04-17'),
('','S-00018','Tissa Madhawa','2022-04-18'),
('','S-00018','Tissa Madhawa','2022-04-19'),
('','S-00018','Tissa Madhawa','2022-04-20'),
('','S-00018','Tissa Madhawa','2022-05-01'),
('','S-00018','Tissa Madhawa','2022-05-02'),
('','S-00018','Tissa Madhawa','2022-05-03'),
('','S-00018','Tissa Madhawa','2022-05-04'),
('','S-00018','Tissa Madhawa','2022-05-05'),
('','S-00018','Tissa Madhawa','2022-05-06'),
('','S-00018','Tissa Madhawa','2022-05-07'),
('','S-00018','Tissa Madhawa','2022-05-08'),
('','S-00018','Tissa Madhawa','2022-05-09'),
('','S-00018','Tissa Madhawa','2022-05-10'),
('','S-00018','Tissa Madhawa','2022-05-11'),
('','S-00018','Tissa Madhawa','2022-05-12'),
('','S-00018','Tissa Madhawa','2022-05-13'),
('','S-00018','Tissa Madhawa','2022-05-14'),
('','S-00018','Tissa Madhawa','2022-05-15'),
('','S-00018','Tissa Madhawa','2022-05-16'),
('','S-00018','Tissa Madhawa','2022-05-17'),
('','S-00018','Tissa Madhawa','2022-05-18'),
('','S-00018','Tissa Madhawa','2022-05-19'),
('','S-00018','Tissa Madhawa','2022-05-20'),




('','S-00019','Kithsiri Jayasanka','2022-01-01'),
('','S-00019','Kithsiri Jayasanka','2022-01-02'),
('','S-00019','Kithsiri Jayasanka','2022-01-03'),
('','S-00019','Kithsiri Jayasanka','2022-01-04'),
('','S-00019','Kithsiri Jayasanka','2022-01-05'),
('','S-00019','Kithsiri Jayasanka','2022-01-06'),
('','S-00019','Kithsiri Jayasanka','2022-01-07'),
('','S-00019','Kithsiri Jayasanka','2022-01-08'),
('','S-00019','Kithsiri Jayasanka','2022-01-09'),
('','S-00019','Kithsiri Jayasanka','2022-01-10'),
('','S-00019','Kithsiri Jayasanka','2022-01-11'),
('','S-00019','Kithsiri Jayasanka','2022-01-12'),
('','S-00019','Kithsiri Jayasanka','2022-01-13'),
('','S-00019','Kithsiri Jayasanka','2022-01-14'),
('','S-00019','Kithsiri Jayasanka','2022-01-15'),
('','S-00019','Kithsiri Jayasanka','2022-01-16'),
('','S-00019','Kithsiri Jayasanka','2022-01-17'),
('','S-00019','Kithsiri Jayasanka','2022-01-18'),
('','S-00019','Kithsiri Jayasanka','2022-01-19'),
('','S-00019','Kithsiri Jayasanka','2022-01-20'),
('','S-00019','Kithsiri Jayasanka','2022-02-01'),
('','S-00019','Kithsiri Jayasanka','2022-02-02'),
('','S-00019','Kithsiri Jayasanka','2022-02-03'),
('','S-00019','Kithsiri Jayasanka','2022-02-04'),
('','S-00019','Kithsiri Jayasanka','2022-02-05'),
('','S-00019','Kithsiri Jayasanka','2022-02-06'),
('','S-00019','Kithsiri Jayasanka','2022-02-07'),
('','S-00019','Kithsiri Jayasanka','2022-02-08'),
('','S-00019','Kithsiri Jayasanka','2022-02-09'),
('','S-00019','Kithsiri Jayasanka','2022-02-10'),
('','S-00019','Kithsiri Jayasanka','2022-02-11'),
('','S-00019','Kithsiri Jayasanka','2022-02-12'),
('','S-00019','Kithsiri Jayasanka','2022-02-13'),
('','S-00019','Kithsiri Jayasanka','2022-02-14'),
('','S-00019','Kithsiri Jayasanka','2022-02-15'),
('','S-00019','Kithsiri Jayasanka','2022-02-16'),
('','S-00019','Kithsiri Jayasanka','2022-02-17'),
('','S-00019','Kithsiri Jayasanka','2022-02-18'),
('','S-00019','Kithsiri Jayasanka','2022-02-19'),
('','S-00019','Kithsiri Jayasanka','2022-02-20'),
('','S-00019','Kithsiri Jayasanka','2022-03-01'),
('','S-00019','Kithsiri Jayasanka','2022-03-02'),
('','S-00019','Kithsiri Jayasanka','2022-03-03'),
('','S-00019','Kithsiri Jayasanka','2022-03-04'),
('','S-00019','Kithsiri Jayasanka','2022-03-05'),
('','S-00019','Kithsiri Jayasanka','2022-03-06'),
('','S-00019','Kithsiri Jayasanka','2022-03-07'),
('','S-00019','Kithsiri Jayasanka','2022-03-08'),
('','S-00019','Kithsiri Jayasanka','2022-03-09'),
('','S-00019','Kithsiri Jayasanka','2022-03-10'),
('','S-00019','Kithsiri Jayasanka','2022-03-11'),
('','S-00019','Kithsiri Jayasanka','2022-03-12'),
('','S-00019','Kithsiri Jayasanka','2022-03-13'),
('','S-00019','Kithsiri Jayasanka','2022-03-14'),
('','S-00019','Kithsiri Jayasanka','2022-03-15'),
('','S-00019','Kithsiri Jayasanka','2022-03-16'),
('','S-00019','Kithsiri Jayasanka','2022-03-17'),
('','S-00019','Kithsiri Jayasanka','2022-03-18'),
('','S-00019','Kithsiri Jayasanka','2022-03-19'),
('','S-00019','Kithsiri Jayasanka','2022-03-20'),
('','S-00019','Kithsiri Jayasanka','2022-04-01'),
('','S-00019','Kithsiri Jayasanka','2022-04-02'),
('','S-00019','Kithsiri Jayasanka','2022-04-03'),
('','S-00019','Kithsiri Jayasanka','2022-04-04'),
('','S-00019','Kithsiri Jayasanka','2022-04-05'),
('','S-00019','Kithsiri Jayasanka','2022-04-06'),
('','S-00019','Kithsiri Jayasanka','2022-04-07'),
('','S-00019','Kithsiri Jayasanka','2022-04-08'),
('','S-00019','Kithsiri Jayasanka','2022-04-09'),
('','S-00019','Kithsiri Jayasanka','2022-04-10'),
('','S-00019','Kithsiri Jayasanka','2022-04-11'),
('','S-00019','Kithsiri Jayasanka','2022-04-12'),
('','S-00019','Kithsiri Jayasanka','2022-04-13'),
('','S-00019','Kithsiri Jayasanka','2022-04-14'),
('','S-00019','Kithsiri Jayasanka','2022-04-15'),
('','S-00019','Kithsiri Jayasanka','2022-04-16'),
('','S-00019','Kithsiri Jayasanka','2022-04-17'),
('','S-00019','Kithsiri Jayasanka','2022-04-18'),
('','S-00019','Kithsiri Jayasanka','2022-04-19'),
('','S-00019','Kithsiri Jayasanka','2022-04-20'),
('','S-00019','Kithsiri Jayasanka','2022-05-01'),
('','S-00019','Kithsiri Jayasanka','2022-05-02'),
('','S-00019','Kithsiri Jayasanka','2022-05-03'),
('','S-00019','Kithsiri Jayasanka','2022-05-04'),
('','S-00019','Kithsiri Jayasanka','2022-05-05'),
('','S-00019','Kithsiri Jayasanka','2022-05-06'),
('','S-00019','Kithsiri Jayasanka','2022-05-07'),
('','S-00019','Kithsiri Jayasanka','2022-05-08'),
('','S-00019','Kithsiri Jayasanka','2022-05-09'),
('','S-00019','Kithsiri Jayasanka','2022-05-10'),
('','S-00019','Kithsiri Jayasanka','2022-05-11'),
('','S-00019','Kithsiri Jayasanka','2022-05-12'),
('','S-00019','Kithsiri Jayasanka','2022-05-13'),
('','S-00019','Kithsiri Jayasanka','2022-05-14'),
('','S-00019','Kithsiri Jayasanka','2022-05-15'),
('','S-00019','Kithsiri Jayasanka','2022-05-16'),
('','S-00019','Kithsiri Jayasanka','2022-05-17'),
('','S-00019','Kithsiri Jayasanka','2022-05-18'),
('','S-00019','Kithsiri Jayasanka','2022-05-19'),
('','S-00019','Kithsiri Jayasanka','2022-05-20'),





('','S-00020','Ranjith Deshan','2022-01-01'),
('','S-00020','Ranjith Deshan','2022-01-02'),
('','S-00020','Ranjith Deshan','2022-01-03'),
('','S-00020','Ranjith Deshan','2022-01-04'),
('','S-00020','Ranjith Deshan','2022-01-05'),
('','S-00020','Ranjith Deshan','2022-01-06'),
('','S-00020','Ranjith Deshan','2022-01-07'),
('','S-00020','Ranjith Deshan','2022-01-08'),
('','S-00020','Ranjith Deshan','2022-01-09'),
('','S-00020','Ranjith Deshan','2022-01-10'),
('','S-00020','Ranjith Deshan','2022-01-11'),
('','S-00020','Ranjith Deshan','2022-01-12'),
('','S-00020','Ranjith Deshan','2022-01-13'),
('','S-00020','Ranjith Deshan','2022-01-14'),
('','S-00020','Ranjith Deshan','2022-01-15'),
('','S-00020','Ranjith Deshan','2022-01-16'),
('','S-00020','Ranjith Deshan','2022-01-17'),
('','S-00020','Ranjith Deshan','2022-01-18'),
('','S-00020','Ranjith Deshan','2022-01-19'),
('','S-00020','Ranjith Deshan','2022-01-20'),
('','S-00020','Ranjith Deshan','2022-02-01'),
('','S-00020','Ranjith Deshan','2022-02-02'),
('','S-00020','Ranjith Deshan','2022-02-03'),
('','S-00020','Ranjith Deshan','2022-02-04'),
('','S-00020','Ranjith Deshan','2022-02-05'),
('','S-00020','Ranjith Deshan','2022-02-06'),
('','S-00020','Ranjith Deshan','2022-02-07'),
('','S-00020','Ranjith Deshan','2022-02-08'),
('','S-00020','Ranjith Deshan','2022-02-09'),
('','S-00020','Ranjith Deshan','2022-02-10'),
('','S-00020','Ranjith Deshan','2022-02-11'),
('','S-00020','Ranjith Deshan','2022-02-12'),
('','S-00020','Ranjith Deshan','2022-02-13'),
('','S-00020','Ranjith Deshan','2022-02-14'),
('','S-00020','Ranjith Deshan','2022-02-15'),
('','S-00020','Ranjith Deshan','2022-02-16'),
('','S-00020','Ranjith Deshan','2022-02-17'),
('','S-00020','Ranjith Deshan','2022-02-18'),
('','S-00020','Ranjith Deshan','2022-02-19'),
('','S-00020','Ranjith Deshan','2022-02-20'),
('','S-00020','Ranjith Deshan','2022-03-01'),
('','S-00020','Ranjith Deshan','2022-03-02'),
('','S-00020','Ranjith Deshan','2022-03-03'),
('','S-00020','Ranjith Deshan','2022-03-04'),
('','S-00020','Ranjith Deshan','2022-03-05'),
('','S-00020','Ranjith Deshan','2022-03-06'),
('','S-00020','Ranjith Deshan','2022-03-07'),
('','S-00020','Ranjith Deshan','2022-03-08'),
('','S-00020','Ranjith Deshan','2022-03-09'),
('','S-00020','Ranjith Deshan','2022-03-10'),
('','S-00020','Ranjith Deshan','2022-03-11'),
('','S-00020','Ranjith Deshan','2022-03-12'),
('','S-00020','Ranjith Deshan','2022-03-13'),
('','S-00020','Ranjith Deshan','2022-03-14'),
('','S-00020','Ranjith Deshan','2022-03-15'),
('','S-00020','Ranjith Deshan','2022-03-16'),
('','S-00020','Ranjith Deshan','2022-03-17'),
('','S-00020','Ranjith Deshan','2022-03-18'),
('','S-00020','Ranjith Deshan','2022-03-19'),
('','S-00020','Ranjith Deshan','2022-03-20'),
('','S-00020','Ranjith Deshan','2022-04-01'),
('','S-00020','Ranjith Deshan','2022-04-02'),
('','S-00020','Ranjith Deshan','2022-04-03'),
('','S-00020','Ranjith Deshan','2022-04-04'),
('','S-00020','Ranjith Deshan','2022-04-05'),
('','S-00020','Ranjith Deshan','2022-04-06'),
('','S-00020','Ranjith Deshan','2022-04-07'),
('','S-00020','Ranjith Deshan','2022-04-08'),
('','S-00020','Ranjith Deshan','2022-04-09'),
('','S-00020','Ranjith Deshan','2022-04-10'),
('','S-00020','Ranjith Deshan','2022-04-11'),
('','S-00020','Ranjith Deshan','2022-04-12'),
('','S-00020','Ranjith Deshan','2022-04-13'),
('','S-00020','Ranjith Deshan','2022-04-14'),
('','S-00020','Ranjith Deshan','2022-04-15'),
('','S-00020','Ranjith Deshan','2022-04-16'),
('','S-00020','Ranjith Deshan','2022-04-17'),
('','S-00020','Ranjith Deshan','2022-04-18'),
('','S-00020','Ranjith Deshan','2022-04-19'),
('','S-00020','Ranjith Deshan','2022-04-20'),
('','S-00020','Ranjith Deshan','2022-05-01'),
('','S-00020','Ranjith Deshan','2022-05-02'),
('','S-00020','Ranjith Deshan','2022-05-03'),
('','S-00020','Ranjith Deshan','2022-05-04'),
('','S-00020','Ranjith Deshan','2022-05-05'),
('','S-00020','Ranjith Deshan','2022-05-06'),
('','S-00020','Ranjith Deshan','2022-05-07'),
('','S-00020','Ranjith Deshan','2022-05-08'),
('','S-00020','Ranjith Deshan','2022-05-09'),
('','S-00020','Ranjith Deshan','2022-05-10'),
('','S-00020','Ranjith Deshan','2022-05-11'),
('','S-00020','Ranjith Deshan','2022-05-12'),
('','S-00020','Ranjith Deshan','2022-05-13'),
('','S-00020','Ranjith Deshan','2022-05-14'),
('','S-00020','Ranjith Deshan','2022-05-15'),
('','S-00020','Ranjith Deshan','2022-05-16'),
('','S-00020','Ranjith Deshan','2022-05-17'),
('','S-00020','Ranjith Deshan','2022-05-18'),
('','S-00020','Ranjith Deshan','2022-05-19'),
('','S-00020','Ranjith Deshan','2022-05-20'),






('','S-00021','Ruvindu Ivan','2022-01-01'),
('','S-00021','Ruvindu Ivan','2022-01-02'),
('','S-00021','Ruvindu Ivan','2022-01-03'),
('','S-00021','Ruvindu Ivan','2022-01-04'),
('','S-00021','Ruvindu Ivan','2022-01-05'),
('','S-00021','Ruvindu Ivan','2022-01-06'),
('','S-00021','Ruvindu Ivan','2022-01-07'),
('','S-00021','Ruvindu Ivan','2022-01-08'),
('','S-00021','Ruvindu Ivan','2022-01-09'),
('','S-00021','Ruvindu Ivan','2022-01-10'),
('','S-00021','Ruvindu Ivan','2022-01-11'),
('','S-00021','Ruvindu Ivan','2022-01-12'),
('','S-00021','Ruvindu Ivan','2022-01-13'),
('','S-00021','Ruvindu Ivan','2022-01-14'),
('','S-00021','Ruvindu Ivan','2022-01-15'),
('','S-00021','Ruvindu Ivan','2022-01-16'),
('','S-00021','Ruvindu Ivan','2022-01-17'),
('','S-00021','Ruvindu Ivan','2022-01-18'),
('','S-00021','Ruvindu Ivan','2022-01-19'),
('','S-00021','Ruvindu Ivan','2022-01-20'),
('','S-00021','Ruvindu Ivan','2022-02-01'),
('','S-00021','Ruvindu Ivan','2022-02-02'),
('','S-00021','Ruvindu Ivan','2022-02-03'),
('','S-00021','Ruvindu Ivan','2022-02-04'),
('','S-00021','Ruvindu Ivan','2022-02-05'),
('','S-00021','Ruvindu Ivan','2022-02-06'),
('','S-00021','Ruvindu Ivan','2022-02-07'),
('','S-00021','Ruvindu Ivan','2022-02-08'),
('','S-00021','Ruvindu Ivan','2022-02-09'),
('','S-00021','Ruvindu Ivan','2022-02-10'),
('','S-00021','Ruvindu Ivan','2022-02-11'),
('','S-00021','Ruvindu Ivan','2022-02-12'),
('','S-00021','Ruvindu Ivan','2022-02-13'),
('','S-00021','Ruvindu Ivan','2022-02-14'),
('','S-00021','Ruvindu Ivan','2022-02-15'),
('','S-00021','Ruvindu Ivan','2022-02-16'),
('','S-00021','Ruvindu Ivan','2022-02-17'),
('','S-00021','Ruvindu Ivan','2022-02-18'),
('','S-00021','Ruvindu Ivan','2022-02-19'),
('','S-00021','Ruvindu Ivan','2022-02-20'),
('','S-00021','Ruvindu Ivan','2022-03-01'),
('','S-00021','Ruvindu Ivan','2022-03-02'),
('','S-00021','Ruvindu Ivan','2022-03-03'),
('','S-00021','Ruvindu Ivan','2022-03-04'),
('','S-00021','Ruvindu Ivan','2022-03-05'),
('','S-00021','Ruvindu Ivan','2022-03-06'),
('','S-00021','Ruvindu Ivan','2022-03-07'),
('','S-00021','Ruvindu Ivan','2022-03-08'),
('','S-00021','Ruvindu Ivan','2022-03-09'),
('','S-00021','Ruvindu Ivan','2022-03-10'),
('','S-00021','Ruvindu Ivan','2022-03-11'),
('','S-00021','Ruvindu Ivan','2022-03-12'),
('','S-00021','Ruvindu Ivan','2022-03-13'),
('','S-00021','Ruvindu Ivan','2022-03-14'),
('','S-00021','Ruvindu Ivan','2022-03-15'),
('','S-00021','Ruvindu Ivan','2022-03-16'),
('','S-00021','Ruvindu Ivan','2022-03-17'),
('','S-00021','Ruvindu Ivan','2022-03-18'),
('','S-00021','Ruvindu Ivan','2022-03-19'),
('','S-00021','Ruvindu Ivan','2022-03-20'),
('','S-00021','Ruvindu Ivan','2022-04-01'),
('','S-00021','Ruvindu Ivan','2022-04-02'),
('','S-00021','Ruvindu Ivan','2022-04-03'),
('','S-00021','Ruvindu Ivan','2022-04-04'),
('','S-00021','Ruvindu Ivan','2022-04-05'),
('','S-00021','Ruvindu Ivan','2022-04-06'),
('','S-00021','Ruvindu Ivan','2022-04-07'),
('','S-00021','Ruvindu Ivan','2022-04-08'),
('','S-00021','Ruvindu Ivan','2022-04-09'),
('','S-00021','Ruvindu Ivan','2022-04-10'),
('','S-00021','Ruvindu Ivan','2022-04-11'),
('','S-00021','Ruvindu Ivan','2022-04-12'),
('','S-00021','Ruvindu Ivan','2022-04-13'),
('','S-00021','Ruvindu Ivan','2022-04-14'),
('','S-00021','Ruvindu Ivan','2022-04-15'),
('','S-00021','Ruvindu Ivan','2022-04-16'),
('','S-00021','Ruvindu Ivan','2022-04-17'),
('','S-00021','Ruvindu Ivan','2022-04-18'),
('','S-00021','Ruvindu Ivan','2022-04-19'),
('','S-00021','Ruvindu Ivan','2022-04-20'),
('','S-00021','Ruvindu Ivan','2022-05-01'),
('','S-00021','Ruvindu Ivan','2022-05-02'),
('','S-00021','Ruvindu Ivan','2022-05-03'),
('','S-00021','Ruvindu Ivan','2022-05-04'),
('','S-00021','Ruvindu Ivan','2022-05-05'),
('','S-00021','Ruvindu Ivan','2022-05-06'),
('','S-00021','Ruvindu Ivan','2022-05-07'),
('','S-00021','Ruvindu Ivan','2022-05-08'),
('','S-00021','Ruvindu Ivan','2022-05-09'),
('','S-00021','Ruvindu Ivan','2022-05-10'),
('','S-00021','Ruvindu Ivan','2022-05-11'),
('','S-00021','Ruvindu Ivan','2022-05-12'),
('','S-00021','Ruvindu Ivan','2022-05-13'),
('','S-00021','Ruvindu Ivan','2022-05-14'),
('','S-00021','Ruvindu Ivan','2022-05-15'),
('','S-00021','Ruvindu Ivan','2022-05-16'),
('','S-00021','Ruvindu Ivan','2022-05-17'),
('','S-00021','Ruvindu Ivan','2022-05-18'),
('','S-00021','Ruvindu Ivan','2022-05-19'),
('','S-00021','Ruvindu Ivan','2022-05-20'),






('','S-00022','Ranimini Jayasinghe','2022-01-01'),
('','S-00022','Ranimini Jayasinghe','2022-01-02'),
('','S-00022','Ranimini Jayasinghe','2022-01-03'),
('','S-00022','Ranimini Jayasinghe','2022-01-04'),
('','S-00022','Ranimini Jayasinghe','2022-01-05'),
('','S-00022','Ranimini Jayasinghe','2022-01-06'),
('','S-00022','Ranimini Jayasinghe','2022-01-07'),
('','S-00022','Ranimini Jayasinghe','2022-01-08'),
('','S-00022','Ranimini Jayasinghe','2022-01-09'),
('','S-00022','Ranimini Jayasinghe','2022-01-10'),
('','S-00022','Ranimini Jayasinghe','2022-01-11'),
('','S-00022','Ranimini Jayasinghe','2022-01-12'),
('','S-00022','Ranimini Jayasinghe','2022-01-13'),
('','S-00022','Ranimini Jayasinghe','2022-01-14'),
('','S-00022','Ranimini Jayasinghe','2022-01-15'),
('','S-00022','Ranimini Jayasinghe','2022-01-16'),
('','S-00022','Ranimini Jayasinghe','2022-01-17'),
('','S-00022','Ranimini Jayasinghe','2022-01-18'),
('','S-00022','Ranimini Jayasinghe','2022-01-19'),
('','S-00022','Ranimini Jayasinghe','2022-01-20'),
('','S-00022','Ranimini Jayasinghe','2022-02-01'),
('','S-00022','Ranimini Jayasinghe','2022-02-02'),
('','S-00022','Ranimini Jayasinghe','2022-02-03'),
('','S-00022','Ranimini Jayasinghe','2022-02-04'),
('','S-00022','Ranimini Jayasinghe','2022-02-05'),
('','S-00022','Ranimini Jayasinghe','2022-02-06'),
('','S-00022','Ranimini Jayasinghe','2022-02-07'),
('','S-00022','Ranimini Jayasinghe','2022-02-08'),
('','S-00022','Ranimini Jayasinghe','2022-02-09'),
('','S-00022','Ranimini Jayasinghe','2022-02-10'),
('','S-00022','Ranimini Jayasinghe','2022-02-11'),
('','S-00022','Ranimini Jayasinghe','2022-02-12'),
('','S-00022','Ranimini Jayasinghe','2022-02-13'),
('','S-00022','Ranimini Jayasinghe','2022-02-14'),
('','S-00022','Ranimini Jayasinghe','2022-02-15'),
('','S-00022','Ranimini Jayasinghe','2022-02-16'),
('','S-00022','Ranimini Jayasinghe','2022-02-17'),
('','S-00022','Ranimini Jayasinghe','2022-02-18'),
('','S-00022','Ranimini Jayasinghe','2022-02-19'),
('','S-00022','Ranimini Jayasinghe','2022-02-20'),
('','S-00022','Ranimini Jayasinghe','2022-03-01'),
('','S-00022','Ranimini Jayasinghe','2022-03-02'),
('','S-00022','Ranimini Jayasinghe','2022-03-03'),
('','S-00022','Ranimini Jayasinghe','2022-03-04'),
('','S-00022','Ranimini Jayasinghe','2022-03-05'),
('','S-00022','Ranimini Jayasinghe','2022-03-06'),
('','S-00022','Ranimini Jayasinghe','2022-03-07'),
('','S-00022','Ranimini Jayasinghe','2022-03-08'),
('','S-00022','Ranimini Jayasinghe','2022-03-09'),
('','S-00022','Ranimini Jayasinghe','2022-03-10'),
('','S-00022','Ranimini Jayasinghe','2022-03-11'),
('','S-00022','Ranimini Jayasinghe','2022-03-12'),
('','S-00022','Ranimini Jayasinghe','2022-03-13'),
('','S-00022','Ranimini Jayasinghe','2022-03-14'),
('','S-00022','Ranimini Jayasinghe','2022-03-15'),
('','S-00022','Ranimini Jayasinghe','2022-03-16'),
('','S-00022','Ranimini Jayasinghe','2022-03-17'),
('','S-00022','Ranimini Jayasinghe','2022-03-18'),
('','S-00022','Ranimini Jayasinghe','2022-03-19'),
('','S-00022','Ranimini Jayasinghe','2022-03-20'),
('','S-00022','Ranimini Jayasinghe','2022-04-01'),
('','S-00022','Ranimini Jayasinghe','2022-04-02'),
('','S-00022','Ranimini Jayasinghe','2022-04-03'),
('','S-00022','Ranimini Jayasinghe','2022-04-04'),
('','S-00022','Ranimini Jayasinghe','2022-04-05'),
('','S-00022','Ranimini Jayasinghe','2022-04-06'),
('','S-00022','Ranimini Jayasinghe','2022-04-07'),
('','S-00022','Ranimini Jayasinghe','2022-04-08'),
('','S-00022','Ranimini Jayasinghe','2022-04-09'),
('','S-00022','Ranimini Jayasinghe','2022-04-10'),
('','S-00022','Ranimini Jayasinghe','2022-04-11'),
('','S-00022','Ranimini Jayasinghe','2022-04-12'),
('','S-00022','Ranimini Jayasinghe','2022-04-13'),
('','S-00022','Ranimini Jayasinghe','2022-04-14'),
('','S-00022','Ranimini Jayasinghe','2022-04-15'),
('','S-00022','Ranimini Jayasinghe','2022-04-16'),
('','S-00022','Ranimini Jayasinghe','2022-04-17'),
('','S-00022','Ranimini Jayasinghe','2022-04-18'),
('','S-00022','Ranimini Jayasinghe','2022-04-19'),
('','S-00022','Ranimini Jayasinghe','2022-04-20'),
('','S-00022','Ranimini Jayasinghe','2022-05-01'),
('','S-00022','Ranimini Jayasinghe','2022-05-02'),
('','S-00022','Ranimini Jayasinghe','2022-05-03'),
('','S-00022','Ranimini Jayasinghe','2022-05-04'),
('','S-00022','Ranimini Jayasinghe','2022-05-05'),
('','S-00022','Ranimini Jayasinghe','2022-05-06'),
('','S-00022','Ranimini Jayasinghe','2022-05-07'),
('','S-00022','Ranimini Jayasinghe','2022-05-08'),
('','S-00022','Ranimini Jayasinghe','2022-05-09'),
('','S-00022','Ranimini Jayasinghe','2022-05-10'),
('','S-00022','Ranimini Jayasinghe','2022-05-11'),
('','S-00022','Ranimini Jayasinghe','2022-05-12'),
('','S-00022','Ranimini Jayasinghe','2022-05-13'),
('','S-00022','Ranimini Jayasinghe','2022-05-14'),
('','S-00022','Ranimini Jayasinghe','2022-05-15'),
('','S-00022','Ranimini Jayasinghe','2022-05-16'),
('','S-00022','Ranimini Jayasinghe','2022-05-17'),
('','S-00022','Ranimini Jayasinghe','2022-05-18'),
('','S-00022','Ranimini Jayasinghe','2022-05-19'),
('','S-00022','Ranimini Jayasinghe','2022-05-20'),





('','S-00023','Ravini Wijesinghe','2022-01-01'),
('','S-00023','Ravini Wijesinghe','2022-01-02'),
('','S-00023','Ravini Wijesinghe','2022-01-03'),
('','S-00023','Ravini Wijesinghe','2022-01-04'),
('','S-00023','Ravini Wijesinghe','2022-01-05'),
('','S-00023','Ravini Wijesinghe','2022-01-06'),
('','S-00023','Ravini Wijesinghe','2022-01-07'),
('','S-00023','Ravini Wijesinghe','2022-01-08'),
('','S-00023','Ravini Wijesinghe','2022-01-09'),
('','S-00023','Ravini Wijesinghe','2022-01-10'),
('','S-00023','Ravini Wijesinghe','2022-01-11'),
('','S-00023','Ravini Wijesinghe','2022-01-12'),
('','S-00023','Ravini Wijesinghe','2022-01-13'),
('','S-00023','Ravini Wijesinghe','2022-01-14'),
('','S-00023','Ravini Wijesinghe','2022-01-15'),
('','S-00023','Ravini Wijesinghe','2022-01-16'),
('','S-00023','Ravini Wijesinghe','2022-01-17'),
('','S-00023','Ravini Wijesinghe','2022-01-18'),
('','S-00023','Ravini Wijesinghe','2022-01-19'),
('','S-00023','Ravini Wijesinghe','2022-01-20'),
('','S-00023','Ravini Wijesinghe','2022-02-01'),
('','S-00023','Ravini Wijesinghe','2022-02-02'),
('','S-00023','Ravini Wijesinghe','2022-02-03'),
('','S-00023','Ravini Wijesinghe','2022-02-04'),
('','S-00023','Ravini Wijesinghe','2022-02-05'),
('','S-00023','Ravini Wijesinghe','2022-02-06'),
('','S-00023','Ravini Wijesinghe','2022-02-07'),
('','S-00023','Ravini Wijesinghe','2022-02-08'),
('','S-00023','Ravini Wijesinghe','2022-02-09'),
('','S-00023','Ravini Wijesinghe','2022-02-10'),
('','S-00023','Ravini Wijesinghe','2022-02-11'),
('','S-00023','Ravini Wijesinghe','2022-02-12'),
('','S-00023','Ravini Wijesinghe','2022-02-13'),
('','S-00023','Ravini Wijesinghe','2022-02-14'),
('','S-00023','Ravini Wijesinghe','2022-02-15'),
('','S-00023','Ravini Wijesinghe','2022-02-16'),
('','S-00023','Ravini Wijesinghe','2022-02-17'),
('','S-00023','Ravini Wijesinghe','2022-02-18'),
('','S-00023','Ravini Wijesinghe','2022-02-19'),
('','S-00023','Ravini Wijesinghe','2022-02-20'),
('','S-00023','Ravini Wijesinghe','2022-03-01'),
('','S-00023','Ravini Wijesinghe','2022-03-02'),
('','S-00023','Ravini Wijesinghe','2022-03-03'),
('','S-00023','Ravini Wijesinghe','2022-03-04'),
('','S-00023','Ravini Wijesinghe','2022-03-05'),
('','S-00023','Ravini Wijesinghe','2022-03-06'),
('','S-00023','Ravini Wijesinghe','2022-03-07'),
('','S-00023','Ravini Wijesinghe','2022-03-08'),
('','S-00023','Ravini Wijesinghe','2022-03-09'),
('','S-00023','Ravini Wijesinghe','2022-03-10'),
('','S-00023','Ravini Wijesinghe','2022-03-11'),
('','S-00023','Ravini Wijesinghe','2022-03-12'),
('','S-00023','Ravini Wijesinghe','2022-03-13'),
('','S-00023','Ravini Wijesinghe','2022-03-14'),
('','S-00023','Ravini Wijesinghe','2022-03-15'),
('','S-00023','Ravini Wijesinghe','2022-03-16'),
('','S-00023','Ravini Wijesinghe','2022-03-17'),
('','S-00023','Ravini Wijesinghe','2022-03-18'),
('','S-00023','Ravini Wijesinghe','2022-03-19'),
('','S-00023','Ravini Wijesinghe','2022-03-20'),
('','S-00023','Ravini Wijesinghe','2022-04-01'),
('','S-00023','Ravini Wijesinghe','2022-04-02'),
('','S-00023','Ravini Wijesinghe','2022-04-03'),
('','S-00023','Ravini Wijesinghe','2022-04-04'),
('','S-00023','Ravini Wijesinghe','2022-04-05'),
('','S-00023','Ravini Wijesinghe','2022-04-06'),
('','S-00023','Ravini Wijesinghe','2022-04-07'),
('','S-00023','Ravini Wijesinghe','2022-04-08'),
('','S-00023','Ravini Wijesinghe','2022-04-09'),
('','S-00023','Ravini Wijesinghe','2022-04-10'),
('','S-00023','Ravini Wijesinghe','2022-04-11'),
('','S-00023','Ravini Wijesinghe','2022-04-12'),
('','S-00023','Ravini Wijesinghe','2022-04-13'),
('','S-00023','Ravini Wijesinghe','2022-04-14'),
('','S-00023','Ravini Wijesinghe','2022-04-15'),
('','S-00023','Ravini Wijesinghe','2022-04-16'),
('','S-00023','Ravini Wijesinghe','2022-04-17'),
('','S-00023','Ravini Wijesinghe','2022-04-18'),
('','S-00023','Ravini Wijesinghe','2022-04-19'),
('','S-00023','Ravini Wijesinghe','2022-04-20'),
('','S-00023','Ravini Wijesinghe','2022-05-01'),
('','S-00023','Ravini Wijesinghe','2022-05-02'),
('','S-00023','Ravini Wijesinghe','2022-05-03'),
('','S-00023','Ravini Wijesinghe','2022-05-04'),
('','S-00023','Ravini Wijesinghe','2022-05-05'),
('','S-00023','Ravini Wijesinghe','2022-05-06'),
('','S-00023','Ravini Wijesinghe','2022-05-07'),
('','S-00023','Ravini Wijesinghe','2022-05-08'),
('','S-00023','Ravini Wijesinghe','2022-05-09'),
('','S-00023','Ravini Wijesinghe','2022-05-10'),
('','S-00023','Ravini Wijesinghe','2022-05-11'),
('','S-00023','Ravini Wijesinghe','2022-05-12'),
('','S-00023','Ravini Wijesinghe','2022-05-13'),
('','S-00023','Ravini Wijesinghe','2022-05-14'),
('','S-00023','Ravini Wijesinghe','2022-05-15'),
('','S-00023','Ravini Wijesinghe','2022-05-16'),
('','S-00023','Ravini Wijesinghe','2022-05-17'),
('','S-00023','Ravini Wijesinghe','2022-05-18'),
('','S-00023','Ravini Wijesinghe','2022-05-19'),
('','S-00023','Ravini Wijesinghe','2022-05-20'),





('','S-00024','Minoli Perera','2022-01-01'),
('','S-00024','Minoli Perera','2022-01-02'),
('','S-00024','Minoli Perera','2022-01-03'),
('','S-00024','Minoli Perera','2022-01-04'),
('','S-00024','Minoli Perera','2022-01-05'),
('','S-00024','Minoli Perera','2022-01-06'),
('','S-00024','Minoli Perera','2022-01-07'),
('','S-00024','Minoli Perera','2022-01-08'),
('','S-00024','Minoli Perera','2022-01-09'),
('','S-00024','Minoli Perera','2022-01-10'),
('','S-00024','Minoli Perera','2022-01-11'),
('','S-00024','Minoli Perera','2022-01-12'),
('','S-00024','Minoli Perera','2022-01-13'),
('','S-00024','Minoli Perera','2022-01-14'),
('','S-00024','Minoli Perera','2022-01-15'),
('','S-00024','Minoli Perera','2022-01-16'),
('','S-00024','Minoli Perera','2022-01-17'),
('','S-00024','Minoli Perera','2022-01-18'),
('','S-00024','Minoli Perera','2022-01-19'),
('','S-00024','Minoli Perera','2022-01-20'),
('','S-00024','Minoli Perera','2022-02-01'),
('','S-00024','Minoli Perera','2022-02-02'),
('','S-00024','Minoli Perera','2022-02-03'),
('','S-00024','Minoli Perera','2022-02-04'),
('','S-00024','Minoli Perera','2022-02-05'),
('','S-00024','Minoli Perera','2022-02-06'),
('','S-00024','Minoli Perera','2022-02-07'),
('','S-00024','Minoli Perera','2022-02-08'),
('','S-00024','Minoli Perera','2022-02-09'),
('','S-00024','Minoli Perera','2022-02-10'),
('','S-00024','Minoli Perera','2022-02-11'),
('','S-00024','Minoli Perera','2022-02-12'),
('','S-00024','Minoli Perera','2022-02-13'),
('','S-00024','Minoli Perera','2022-02-14'),
('','S-00024','Minoli Perera','2022-02-15'),
('','S-00024','Minoli Perera','2022-02-16'),
('','S-00024','Minoli Perera','2022-02-17'),
('','S-00024','Minoli Perera','2022-02-18'),
('','S-00024','Minoli Perera','2022-02-19'),
('','S-00024','Minoli Perera','2022-02-20'),
('','S-00024','Minoli Perera','2022-03-01'),
('','S-00024','Minoli Perera','2022-03-02'),
('','S-00024','Minoli Perera','2022-03-03'),
('','S-00024','Minoli Perera','2022-03-04'),
('','S-00024','Minoli Perera','2022-03-05'),
('','S-00024','Minoli Perera','2022-03-06'),
('','S-00024','Minoli Perera','2022-03-07'),
('','S-00024','Minoli Perera','2022-03-08'),
('','S-00024','Minoli Perera','2022-03-09'),
('','S-00024','Minoli Perera','2022-03-10'),
('','S-00024','Minoli Perera','2022-03-11'),
('','S-00024','Minoli Perera','2022-03-12'),
('','S-00024','Minoli Perera','2022-03-13'),
('','S-00024','Minoli Perera','2022-03-14'),
('','S-00024','Minoli Perera','2022-03-15'),
('','S-00024','Minoli Perera','2022-03-16'),
('','S-00024','Minoli Perera','2022-03-17'),
('','S-00024','Minoli Perera','2022-03-18'),
('','S-00024','Minoli Perera','2022-03-19'),
('','S-00024','Minoli Perera','2022-03-20'),
('','S-00024','Minoli Perera','2022-04-01'),
('','S-00024','Minoli Perera','2022-04-02'),
('','S-00024','Minoli Perera','2022-04-03'),
('','S-00024','Minoli Perera','2022-04-04'),
('','S-00024','Minoli Perera','2022-04-05'),
('','S-00024','Minoli Perera','2022-04-06'),
('','S-00024','Minoli Perera','2022-04-07'),
('','S-00024','Minoli Perera','2022-04-08'),
('','S-00024','Minoli Perera','2022-04-09'),
('','S-00024','Minoli Perera','2022-04-10'),
('','S-00024','Minoli Perera','2022-04-11'),
('','S-00024','Minoli Perera','2022-04-12'),
('','S-00024','Minoli Perera','2022-04-13'),
('','S-00024','Minoli Perera','2022-04-14'),
('','S-00024','Minoli Perera','2022-04-15'),
('','S-00024','Minoli Perera','2022-04-16'),
('','S-00024','Minoli Perera','2022-04-17'),
('','S-00024','Minoli Perera','2022-04-18'),
('','S-00024','Minoli Perera','2022-04-19'),
('','S-00024','Minoli Perera','2022-04-20'),
('','S-00024','Minoli Perera','2022-05-01'),
('','S-00024','Minoli Perera','2022-05-02'),
('','S-00024','Minoli Perera','2022-05-03'),
('','S-00024','Minoli Perera','2022-05-04'),
('','S-00024','Minoli Perera','2022-05-05'),
('','S-00024','Minoli Perera','2022-05-06'),
('','S-00024','Minoli Perera','2022-05-07'),
('','S-00024','Minoli Perera','2022-05-08'),
('','S-00024','Minoli Perera','2022-05-09'),
('','S-00024','Minoli Perera','2022-05-10'),
('','S-00024','Minoli Perera','2022-05-11'),
('','S-00024','Minoli Perera','2022-05-12'),
('','S-00024','Minoli Perera','2022-05-13'),
('','S-00024','Minoli Perera','2022-05-14'),
('','S-00024','Minoli Perera','2022-05-15'),
('','S-00024','Minoli Perera','2022-05-16'),
('','S-00024','Minoli Perera','2022-05-17'),
('','S-00024','Minoli Perera','2022-05-18'),
('','S-00024','Minoli Perera','2022-05-19'),
('','S-00024','Minoli Perera','2022-05-20'),






('','S-00025','Vidumina Ahangama','2022-01-01'),
('','S-00025','Vidumina Ahangama','2022-01-02'),
('','S-00025','Vidumina Ahangama','2022-01-03'),
('','S-00025','Vidumina Ahangama','2022-01-04'),
('','S-00025','Vidumina Ahangama','2022-01-05'),
('','S-00025','Vidumina Ahangama','2022-01-06'),
('','S-00025','Vidumina Ahangama','2022-01-07'),
('','S-00025','Vidumina Ahangama','2022-01-08'),
('','S-00025','Vidumina Ahangama','2022-01-09'),
('','S-00025','Vidumina Ahangama','2022-01-10'),
('','S-00025','Vidumina Ahangama','2022-01-11'),
('','S-00025','Vidumina Ahangama','2022-01-12'),
('','S-00025','Vidumina Ahangama','2022-01-13'),
('','S-00025','Vidumina Ahangama','2022-01-14'),
('','S-00025','Vidumina Ahangama','2022-01-15'),
('','S-00025','Vidumina Ahangama','2022-01-16'),
('','S-00025','Vidumina Ahangama','2022-01-17'),
('','S-00025','Vidumina Ahangama','2022-01-18'),
('','S-00025','Vidumina Ahangama','2022-01-19'),
('','S-00025','Vidumina Ahangama','2022-01-20'),
('','S-00025','Vidumina Ahangama','2022-02-01'),
('','S-00025','Vidumina Ahangama','2022-02-02'),
('','S-00025','Vidumina Ahangama','2022-02-03'),
('','S-00025','Vidumina Ahangama','2022-02-04'),
('','S-00025','Vidumina Ahangama','2022-02-05'),
('','S-00025','Vidumina Ahangama','2022-02-06'),
('','S-00025','Vidumina Ahangama','2022-02-07'),
('','S-00025','Vidumina Ahangama','2022-02-08'),
('','S-00025','Vidumina Ahangama','2022-02-09'),
('','S-00025','Vidumina Ahangama','2022-02-10'),
('','S-00025','Vidumina Ahangama','2022-02-11'),
('','S-00025','Vidumina Ahangama','2022-02-12'),
('','S-00025','Vidumina Ahangama','2022-02-13'),
('','S-00025','Vidumina Ahangama','2022-02-14'),
('','S-00025','Vidumina Ahangama','2022-02-15'),
('','S-00025','Vidumina Ahangama','2022-02-16'),
('','S-00025','Vidumina Ahangama','2022-02-17'),
('','S-00025','Vidumina Ahangama','2022-02-18'),
('','S-00025','Vidumina Ahangama','2022-02-19'),
('','S-00025','Vidumina Ahangama','2022-02-20'),
('','S-00025','Vidumina Ahangama','2022-03-01'),
('','S-00025','Vidumina Ahangama','2022-03-02'),
('','S-00025','Vidumina Ahangama','2022-03-03'),
('','S-00025','Vidumina Ahangama','2022-03-04'),
('','S-00025','Vidumina Ahangama','2022-03-05'),
('','S-00025','Vidumina Ahangama','2022-03-06'),
('','S-00025','Vidumina Ahangama','2022-03-07'),
('','S-00025','Vidumina Ahangama','2022-03-08'),
('','S-00025','Vidumina Ahangama','2022-03-09'),
('','S-00025','Vidumina Ahangama','2022-03-10'),
('','S-00025','Vidumina Ahangama','2022-03-11'),
('','S-00025','Vidumina Ahangama','2022-03-12'),
('','S-00025','Vidumina Ahangama','2022-03-13'),
('','S-00025','Vidumina Ahangama','2022-03-14'),
('','S-00025','Vidumina Ahangama','2022-03-15'),
('','S-00025','Vidumina Ahangama','2022-03-16'),
('','S-00025','Vidumina Ahangama','2022-03-17'),
('','S-00025','Vidumina Ahangama','2022-03-18'),
('','S-00025','Vidumina Ahangama','2022-03-19'),
('','S-00025','Vidumina Ahangama','2022-03-20'),
('','S-00025','Vidumina Ahangama','2022-04-01'),
('','S-00025','Vidumina Ahangama','2022-04-02'),
('','S-00025','Vidumina Ahangama','2022-04-03'),
('','S-00025','Vidumina Ahangama','2022-04-04'),
('','S-00025','Vidumina Ahangama','2022-04-05'),
('','S-00025','Vidumina Ahangama','2022-04-06'),
('','S-00025','Vidumina Ahangama','2022-04-07'),
('','S-00025','Vidumina Ahangama','2022-04-08'),
('','S-00025','Vidumina Ahangama','2022-04-09'),
('','S-00025','Vidumina Ahangama','2022-04-10'),
('','S-00025','Vidumina Ahangama','2022-04-11'),
('','S-00025','Vidumina Ahangama','2022-04-12'),
('','S-00025','Vidumina Ahangama','2022-04-13'),
('','S-00025','Vidumina Ahangama','2022-04-14'),
('','S-00025','Vidumina Ahangama','2022-04-15'),
('','S-00025','Vidumina Ahangama','2022-04-16'),
('','S-00025','Vidumina Ahangama','2022-04-17'),
('','S-00025','Vidumina Ahangama','2022-04-18'),
('','S-00025','Vidumina Ahangama','2022-04-19'),
('','S-00025','Vidumina Ahangama','2022-04-20'),
('','S-00025','Vidumina Ahangama','2022-05-01'),
('','S-00025','Vidumina Ahangama','2022-05-02'),
('','S-00025','Vidumina Ahangama','2022-05-03'),
('','S-00025','Vidumina Ahangama','2022-05-04'),
('','S-00025','Vidumina Ahangama','2022-05-05'),
('','S-00025','Vidumina Ahangama','2022-05-06'),
('','S-00025','Vidumina Ahangama','2022-05-07'),
('','S-00025','Vidumina Ahangama','2022-05-08'),
('','S-00025','Vidumina Ahangama','2022-05-09'),
('','S-00025','Vidumina Ahangama','2022-05-10'),
('','S-00025','Vidumina Ahangama','2022-05-11'),
('','S-00025','Vidumina Ahangama','2022-05-12'),
('','S-00025','Vidumina Ahangama','2022-05-13'),
('','S-00025','Vidumina Ahangama','2022-05-14'),
('','S-00025','Vidumina Ahangama','2022-05-15'),
('','S-00025','Vidumina Ahangama','2022-05-16'),
('','S-00025','Vidumina Ahangama','2022-05-17'),
('','S-00025','Vidumina Ahangama','2022-05-18'),
('','S-00025','Vidumina Ahangama','2022-05-19'),
('','S-00025','Vidumina Ahangama','2022-05-20'),







('','S-00026','Chathuranga Amarasinghe','2022-01-01'),
('','S-00026','Chathuranga Amarasinghe','2022-01-02'),
('','S-00026','Chathuranga Amarasinghe','2022-01-03'),
('','S-00026','Chathuranga Amarasinghe','2022-01-04'),
('','S-00026','Chathuranga Amarasinghe','2022-01-05'),
('','S-00026','Chathuranga Amarasinghe','2022-01-06'),
('','S-00026','Chathuranga Amarasinghe','2022-01-07'),
('','S-00026','Chathuranga Amarasinghe','2022-01-08'),
('','S-00026','Chathuranga Amarasinghe','2022-01-09'),
('','S-00026','Chathuranga Amarasinghe','2022-01-10'),
('','S-00026','Chathuranga Amarasinghe','2022-01-11'),
('','S-00026','Chathuranga Amarasinghe','2022-01-12'),
('','S-00026','Chathuranga Amarasinghe','2022-01-13'),
('','S-00026','Chathuranga Amarasinghe','2022-01-14'),
('','S-00026','Chathuranga Amarasinghe','2022-01-15'),
('','S-00026','Chathuranga Amarasinghe','2022-01-16'),
('','S-00026','Chathuranga Amarasinghe','2022-01-17'),
('','S-00026','Chathuranga Amarasinghe','2022-01-18'),
('','S-00026','Chathuranga Amarasinghe','2022-01-19'),
('','S-00026','Chathuranga Amarasinghe','2022-01-20'),
('','S-00026','Chathuranga Amarasinghe','2022-02-01'),
('','S-00026','Chathuranga Amarasinghe','2022-02-02'),
('','S-00026','Chathuranga Amarasinghe','2022-02-03'),
('','S-00026','Chathuranga Amarasinghe','2022-02-04'),
('','S-00026','Chathuranga Amarasinghe','2022-02-05'),
('','S-00026','Chathuranga Amarasinghe','2022-02-06'),
('','S-00026','Chathuranga Amarasinghe','2022-02-07'),
('','S-00026','Chathuranga Amarasinghe','2022-02-08'),
('','S-00026','Chathuranga Amarasinghe','2022-02-09'),
('','S-00026','Chathuranga Amarasinghe','2022-02-10'),
('','S-00026','Chathuranga Amarasinghe','2022-02-11'),
('','S-00026','Chathuranga Amarasinghe','2022-02-12'),
('','S-00026','Chathuranga Amarasinghe','2022-02-13'),
('','S-00026','Chathuranga Amarasinghe','2022-02-14'),
('','S-00026','Chathuranga Amarasinghe','2022-02-15'),
('','S-00026','Chathuranga Amarasinghe','2022-02-16'),
('','S-00026','Chathuranga Amarasinghe','2022-02-17'),
('','S-00026','Chathuranga Amarasinghe','2022-02-18'),
('','S-00026','Chathuranga Amarasinghe','2022-02-19'),
('','S-00026','Chathuranga Amarasinghe','2022-02-20'),
('','S-00026','Chathuranga Amarasinghe','2022-03-01'),
('','S-00026','Chathuranga Amarasinghe','2022-03-02'),
('','S-00026','Chathuranga Amarasinghe','2022-03-03'),
('','S-00026','Chathuranga Amarasinghe','2022-03-04'),
('','S-00026','Chathuranga Amarasinghe','2022-03-05'),
('','S-00026','Chathuranga Amarasinghe','2022-03-06'),
('','S-00026','Chathuranga Amarasinghe','2022-03-07'),
('','S-00026','Chathuranga Amarasinghe','2022-03-08'),
('','S-00026','Chathuranga Amarasinghe','2022-03-09'),
('','S-00026','Chathuranga Amarasinghe','2022-03-10'),
('','S-00026','Chathuranga Amarasinghe','2022-03-11'),
('','S-00026','Chathuranga Amarasinghe','2022-03-12'),
('','S-00026','Chathuranga Amarasinghe','2022-03-13'),
('','S-00026','Chathuranga Amarasinghe','2022-03-14'),
('','S-00026','Chathuranga Amarasinghe','2022-03-15'),
('','S-00026','Chathuranga Amarasinghe','2022-03-16'),
('','S-00026','Chathuranga Amarasinghe','2022-03-17'),
('','S-00026','Chathuranga Amarasinghe','2022-03-18'),
('','S-00026','Chathuranga Amarasinghe','2022-03-19'),
('','S-00026','Chathuranga Amarasinghe','2022-03-20'),
('','S-00026','Chathuranga Amarasinghe','2022-04-01'),
('','S-00026','Chathuranga Amarasinghe','2022-04-02'),
('','S-00026','Chathuranga Amarasinghe','2022-04-03'),
('','S-00026','Chathuranga Amarasinghe','2022-04-04'),
('','S-00026','Chathuranga Amarasinghe','2022-04-05'),
('','S-00026','Chathuranga Amarasinghe','2022-04-06'),
('','S-00026','Chathuranga Amarasinghe','2022-04-07'),
('','S-00026','Chathuranga Amarasinghe','2022-04-08'),
('','S-00026','Chathuranga Amarasinghe','2022-04-09'),
('','S-00026','Chathuranga Amarasinghe','2022-04-10'),
('','S-00026','Chathuranga Amarasinghe','2022-04-11'),
('','S-00026','Chathuranga Amarasinghe','2022-04-12'),
('','S-00026','Chathuranga Amarasinghe','2022-04-13'),
('','S-00026','Chathuranga Amarasinghe','2022-04-14'),
('','S-00026','Chathuranga Amarasinghe','2022-04-15'),
('','S-00026','Chathuranga Amarasinghe','2022-04-16'),
('','S-00026','Chathuranga Amarasinghe','2022-04-17'),
('','S-00026','Chathuranga Amarasinghe','2022-04-18'),
('','S-00026','Chathuranga Amarasinghe','2022-04-19'),
('','S-00026','Chathuranga Amarasinghe','2022-04-20'),
('','S-00026','Chathuranga Amarasinghe','2022-05-01'),
('','S-00026','Chathuranga Amarasinghe','2022-05-02'),
('','S-00026','Chathuranga Amarasinghe','2022-05-03'),
('','S-00026','Chathuranga Amarasinghe','2022-05-04'),
('','S-00026','Chathuranga Amarasinghe','2022-05-05'),
('','S-00026','Chathuranga Amarasinghe','2022-05-06'),
('','S-00026','Chathuranga Amarasinghe','2022-05-07'),
('','S-00026','Chathuranga Amarasinghe','2022-05-08'),
('','S-00026','Chathuranga Amarasinghe','2022-05-09'),
('','S-00026','Chathuranga Amarasinghe','2022-05-10'),
('','S-00026','Chathuranga Amarasinghe','2022-05-11'),
('','S-00026','Chathuranga Amarasinghe','2022-05-12'),
('','S-00026','Chathuranga Amarasinghe','2022-05-13'),
('','S-00026','Chathuranga Amarasinghe','2022-05-14'),
('','S-00026','Chathuranga Amarasinghe','2022-05-15'),
('','S-00026','Chathuranga Amarasinghe','2022-05-16'),
('','S-00026','Chathuranga Amarasinghe','2022-05-17'),
('','S-00026','Chathuranga Amarasinghe','2022-05-18'),
('','S-00026','Chathuranga Amarasinghe','2022-05-19'),
('','S-00026','Chathuranga Amarasinghe','2022-05-20'),







('','S-00027','Deshan Jayasighe','2022-01-01'),
('','S-00027','Deshan Jayasighe','2022-01-02'),
('','S-00027','Deshan Jayasighe','2022-01-03'),
('','S-00027','Deshan Jayasighe','2022-01-04'),
('','S-00027','Deshan Jayasighe','2022-01-05'),
('','S-00027','Deshan Jayasighe','2022-01-06'),
('','S-00027','Deshan Jayasighe','2022-01-07'),
('','S-00027','Deshan Jayasighe','2022-01-08'),
('','S-00027','Deshan Jayasighe','2022-01-09'),
('','S-00027','Deshan Jayasighe','2022-01-10'),
('','S-00027','Deshan Jayasighe','2022-01-11'),
('','S-00027','Deshan Jayasighe','2022-01-12'),
('','S-00027','Deshan Jayasighe','2022-01-13'),
('','S-00027','Deshan Jayasighe','2022-01-14'),
('','S-00027','Deshan Jayasighe','2022-01-15'),
('','S-00027','Deshan Jayasighe','2022-01-16'),
('','S-00027','Deshan Jayasighe','2022-01-17'),
('','S-00027','Deshan Jayasighe','2022-01-18'),
('','S-00027','Deshan Jayasighe','2022-01-19'),
('','S-00027','Deshan Jayasighe','2022-01-20'),
('','S-00027','Deshan Jayasighe','2022-02-01'),
('','S-00027','Deshan Jayasighe','2022-02-02'),
('','S-00027','Deshan Jayasighe','2022-02-03'),
('','S-00027','Deshan Jayasighe','2022-02-04'),
('','S-00027','Deshan Jayasighe','2022-02-05'),
('','S-00027','Deshan Jayasighe','2022-02-06'),
('','S-00027','Deshan Jayasighe','2022-02-07'),
('','S-00027','Deshan Jayasighe','2022-02-08'),
('','S-00027','Deshan Jayasighe','2022-02-09'),
('','S-00027','Deshan Jayasighe','2022-02-10'),
('','S-00027','Deshan Jayasighe','2022-02-11'),
('','S-00027','Deshan Jayasighe','2022-02-12'),
('','S-00027','Deshan Jayasighe','2022-02-13'),
('','S-00027','Deshan Jayasighe','2022-02-14'),
('','S-00027','Deshan Jayasighe','2022-02-15'),
('','S-00027','Deshan Jayasighe','2022-02-16'),
('','S-00027','Deshan Jayasighe','2022-02-17'),
('','S-00027','Deshan Jayasighe','2022-02-18'),
('','S-00027','Deshan Jayasighe','2022-02-19'),
('','S-00027','Deshan Jayasighe','2022-02-20'),
('','S-00027','Deshan Jayasighe','2022-03-01'),
('','S-00027','Deshan Jayasighe','2022-03-02'),
('','S-00027','Deshan Jayasighe','2022-03-03'),
('','S-00027','Deshan Jayasighe','2022-03-04'),
('','S-00027','Deshan Jayasighe','2022-03-05'),
('','S-00027','Deshan Jayasighe','2022-03-06'),
('','S-00027','Deshan Jayasighe','2022-03-07'),
('','S-00027','Deshan Jayasighe','2022-03-08'),
('','S-00027','Deshan Jayasighe','2022-03-09'),
('','S-00027','Deshan Jayasighe','2022-03-10'),
('','S-00027','Deshan Jayasighe','2022-03-11'),
('','S-00027','Deshan Jayasighe','2022-03-12'),
('','S-00027','Deshan Jayasighe','2022-03-13'),
('','S-00027','Deshan Jayasighe','2022-03-14'),
('','S-00027','Deshan Jayasighe','2022-03-15'),
('','S-00027','Deshan Jayasighe','2022-03-16'),
('','S-00027','Deshan Jayasighe','2022-03-17'),
('','S-00027','Deshan Jayasighe','2022-03-18'),
('','S-00027','Deshan Jayasighe','2022-03-19'),
('','S-00027','Deshan Jayasighe','2022-03-20'),
('','S-00027','Deshan Jayasighe','2022-04-01'),
('','S-00027','Deshan Jayasighe','2022-04-02'),
('','S-00027','Deshan Jayasighe','2022-04-03'),
('','S-00027','Deshan Jayasighe','2022-04-04'),
('','S-00027','Deshan Jayasighe','2022-04-05'),
('','S-00027','Deshan Jayasighe','2022-04-06'),
('','S-00027','Deshan Jayasighe','2022-04-07'),
('','S-00027','Deshan Jayasighe','2022-04-08'),
('','S-00027','Deshan Jayasighe','2022-04-09'),
('','S-00027','Deshan Jayasighe','2022-04-10'),
('','S-00027','Deshan Jayasighe','2022-04-11'),
('','S-00027','Deshan Jayasighe','2022-04-12'),
('','S-00027','Deshan Jayasighe','2022-04-13'),
('','S-00027','Deshan Jayasighe','2022-04-14'),
('','S-00027','Deshan Jayasighe','2022-04-15'),
('','S-00027','Deshan Jayasighe','2022-04-16'),
('','S-00027','Deshan Jayasighe','2022-04-17'),
('','S-00027','Deshan Jayasighe','2022-04-18'),
('','S-00027','Deshan Jayasighe','2022-04-19'),
('','S-00027','Deshan Jayasighe','2022-04-20'),
('','S-00027','Deshan Jayasighe','2022-05-01'),
('','S-00027','Deshan Jayasighe','2022-05-02'),
('','S-00027','Deshan Jayasighe','2022-05-03'),
('','S-00027','Deshan Jayasighe','2022-05-04'),
('','S-00027','Deshan Jayasighe','2022-05-05'),
('','S-00027','Deshan Jayasighe','2022-05-06'),
('','S-00027','Deshan Jayasighe','2022-05-07'),
('','S-00027','Deshan Jayasighe','2022-05-08'),
('','S-00027','Deshan Jayasighe','2022-05-09'),
('','S-00027','Deshan Jayasighe','2022-05-10'),
('','S-00027','Deshan Jayasighe','2022-05-11'),
('','S-00027','Deshan Jayasighe','2022-05-12'),
('','S-00027','Deshan Jayasighe','2022-05-13'),
('','S-00027','Deshan Jayasighe','2022-05-14'),
('','S-00027','Deshan Jayasighe','2022-05-15'),
('','S-00027','Deshan Jayasighe','2022-05-16'),
('','S-00027','Deshan Jayasighe','2022-05-17'),
('','S-00027','Deshan Jayasighe','2022-05-18'),
('','S-00027','Deshan Jayasighe','2022-05-19'),
('','S-00027','Deshan Jayasighe','2022-05-20'),






('','S-00028','Anjana Rukshan','2022-01-01'),
('','S-00028','Anjana Rukshan','2022-01-02'),
('','S-00028','Anjana Rukshan','2022-01-03'),
('','S-00028','Anjana Rukshan','2022-01-04'),
('','S-00028','Anjana Rukshan','2022-01-05'),
('','S-00028','Anjana Rukshan','2022-01-06'),
('','S-00028','Anjana Rukshan','2022-01-07'),
('','S-00028','Anjana Rukshan','2022-01-08'),
('','S-00028','Anjana Rukshan','2022-01-09'),
('','S-00028','Anjana Rukshan','2022-01-10'),
('','S-00028','Anjana Rukshan','2022-01-11'),
('','S-00028','Anjana Rukshan','2022-01-12'),
('','S-00028','Anjana Rukshan','2022-01-13'),
('','S-00028','Anjana Rukshan','2022-01-14'),
('','S-00028','Anjana Rukshan','2022-01-15'),
('','S-00028','Anjana Rukshan','2022-01-16'),
('','S-00028','Anjana Rukshan','2022-01-17'),
('','S-00028','Anjana Rukshan','2022-01-18'),
('','S-00028','Anjana Rukshan','2022-01-19'),
('','S-00028','Anjana Rukshan','2022-01-20'),
('','S-00028','Anjana Rukshan','2022-02-01'),
('','S-00028','Anjana Rukshan','2022-02-02'),
('','S-00028','Anjana Rukshan','2022-02-03'),
('','S-00028','Anjana Rukshan','2022-02-04'),
('','S-00028','Anjana Rukshan','2022-02-05'),
('','S-00028','Anjana Rukshan','2022-02-06'),
('','S-00028','Anjana Rukshan','2022-02-07'),
('','S-00028','Anjana Rukshan','2022-02-08'),
('','S-00028','Anjana Rukshan','2022-02-09'),
('','S-00028','Anjana Rukshan','2022-02-10'),
('','S-00028','Anjana Rukshan','2022-02-11'),
('','S-00028','Anjana Rukshan','2022-02-12'),
('','S-00028','Anjana Rukshan','2022-02-13'),
('','S-00028','Anjana Rukshan','2022-02-14'),
('','S-00028','Anjana Rukshan','2022-02-15'),
('','S-00028','Anjana Rukshan','2022-02-16'),
('','S-00028','Anjana Rukshan','2022-02-17'),
('','S-00028','Anjana Rukshan','2022-02-18'),
('','S-00028','Anjana Rukshan','2022-02-19'),
('','S-00028','Anjana Rukshan','2022-02-20'),
('','S-00028','Anjana Rukshan','2022-03-01'),
('','S-00028','Anjana Rukshan','2022-03-02'),
('','S-00028','Anjana Rukshan','2022-03-03'),
('','S-00028','Anjana Rukshan','2022-03-04'),
('','S-00028','Anjana Rukshan','2022-03-05'),
('','S-00028','Anjana Rukshan','2022-03-06'),
('','S-00028','Anjana Rukshan','2022-03-07'),
('','S-00028','Anjana Rukshan','2022-03-08'),
('','S-00028','Anjana Rukshan','2022-03-09'),
('','S-00028','Anjana Rukshan','2022-03-10'),
('','S-00028','Anjana Rukshan','2022-03-11'),
('','S-00028','Anjana Rukshan','2022-03-12'),
('','S-00028','Anjana Rukshan','2022-03-13'),
('','S-00028','Anjana Rukshan','2022-03-14'),
('','S-00028','Anjana Rukshan','2022-03-15'),
('','S-00028','Anjana Rukshan','2022-03-16'),
('','S-00028','Anjana Rukshan','2022-03-17'),
('','S-00028','Anjana Rukshan','2022-03-18'),
('','S-00028','Anjana Rukshan','2022-03-19'),
('','S-00028','Anjana Rukshan','2022-03-20'),
('','S-00028','Anjana Rukshan','2022-04-01'),
('','S-00028','Anjana Rukshan','2022-04-02'),
('','S-00028','Anjana Rukshan','2022-04-03'),
('','S-00028','Anjana Rukshan','2022-04-04'),
('','S-00028','Anjana Rukshan','2022-04-05'),
('','S-00028','Anjana Rukshan','2022-04-06'),
('','S-00028','Anjana Rukshan','2022-04-07'),
('','S-00028','Anjana Rukshan','2022-04-08'),
('','S-00028','Anjana Rukshan','2022-04-09'),
('','S-00028','Anjana Rukshan','2022-04-10'),
('','S-00028','Anjana Rukshan','2022-04-11'),
('','S-00028','Anjana Rukshan','2022-04-12'),
('','S-00028','Anjana Rukshan','2022-04-13'),
('','S-00028','Anjana Rukshan','2022-04-14'),
('','S-00028','Anjana Rukshan','2022-04-15'),
('','S-00028','Anjana Rukshan','2022-04-16'),
('','S-00028','Anjana Rukshan','2022-04-17'),
('','S-00028','Anjana Rukshan','2022-04-18'),
('','S-00028','Anjana Rukshan','2022-04-19'),
('','S-00028','Anjana Rukshan','2022-04-20'),
('','S-00028','Anjana Rukshan','2022-05-01'),
('','S-00028','Anjana Rukshan','2022-05-02'),
('','S-00028','Anjana Rukshan','2022-05-03'),
('','S-00028','Anjana Rukshan','2022-05-04'),
('','S-00028','Anjana Rukshan','2022-05-05'),
('','S-00028','Anjana Rukshan','2022-05-06'),
('','S-00028','Anjana Rukshan','2022-05-07'),
('','S-00028','Anjana Rukshan','2022-05-08'),
('','S-00028','Anjana Rukshan','2022-05-09'),
('','S-00028','Anjana Rukshan','2022-05-10'),
('','S-00028','Anjana Rukshan','2022-05-11'),
('','S-00028','Anjana Rukshan','2022-05-12'),
('','S-00028','Anjana Rukshan','2022-05-13'),
('','S-00028','Anjana Rukshan','2022-05-14'),
('','S-00028','Anjana Rukshan','2022-05-15'),
('','S-00028','Anjana Rukshan','2022-05-16'),
('','S-00028','Anjana Rukshan','2022-05-17'),
('','S-00028','Anjana Rukshan','2022-05-18'),
('','S-00028','Anjana Rukshan','2022-05-19'),
('','S-00028','Anjana Rukshan','2022-05-20'),






('','S-00029','Heshan Samarasinghe','2022-01-01'),
('','S-00029','Heshan Samarasinghe','2022-01-02'),
('','S-00029','Heshan Samarasinghe','2022-01-03'),
('','S-00029','Heshan Samarasinghe','2022-01-04'),
('','S-00029','Heshan Samarasinghe','2022-01-05'),
('','S-00029','Heshan Samarasinghe','2022-01-06'),
('','S-00029','Heshan Samarasinghe','2022-01-07'),
('','S-00029','Heshan Samarasinghe','2022-01-08'),
('','S-00029','Heshan Samarasinghe','2022-01-09'),
('','S-00029','Heshan Samarasinghe','2022-01-10'),
('','S-00029','Heshan Samarasinghe','2022-01-11'),
('','S-00029','Heshan Samarasinghe','2022-01-12'),
('','S-00029','Heshan Samarasinghe','2022-01-13'),
('','S-00029','Heshan Samarasinghe','2022-01-14'),
('','S-00029','Heshan Samarasinghe','2022-01-15'),
('','S-00029','Heshan Samarasinghe','2022-01-16'),
('','S-00029','Heshan Samarasinghe','2022-01-17'),
('','S-00029','Heshan Samarasinghe','2022-01-18'),
('','S-00029','Heshan Samarasinghe','2022-01-19'),
('','S-00029','Heshan Samarasinghe','2022-01-20'),
('','S-00029','Heshan Samarasinghe','2022-02-01'),
('','S-00029','Heshan Samarasinghe','2022-02-02'),
('','S-00029','Heshan Samarasinghe','2022-02-03'),
('','S-00029','Heshan Samarasinghe','2022-02-04'),
('','S-00029','Heshan Samarasinghe','2022-02-05'),
('','S-00029','Heshan Samarasinghe','2022-02-06'),
('','S-00029','Heshan Samarasinghe','2022-02-07'),
('','S-00029','Heshan Samarasinghe','2022-02-08'),
('','S-00029','Heshan Samarasinghe','2022-02-09'),
('','S-00029','Heshan Samarasinghe','2022-02-10'),
('','S-00029','Heshan Samarasinghe','2022-02-11'),
('','S-00029','Heshan Samarasinghe','2022-02-12'),
('','S-00029','Heshan Samarasinghe','2022-02-13'),
('','S-00029','Heshan Samarasinghe','2022-02-14'),
('','S-00029','Heshan Samarasinghe','2022-02-15'),
('','S-00029','Heshan Samarasinghe','2022-02-16'),
('','S-00029','Heshan Samarasinghe','2022-02-17'),
('','S-00029','Heshan Samarasinghe','2022-02-18'),
('','S-00029','Heshan Samarasinghe','2022-02-19'),
('','S-00029','Heshan Samarasinghe','2022-02-20'),
('','S-00029','Heshan Samarasinghe','2022-03-01'),
('','S-00029','Heshan Samarasinghe','2022-03-02'),
('','S-00029','Heshan Samarasinghe','2022-03-03'),
('','S-00029','Heshan Samarasinghe','2022-03-04'),
('','S-00029','Heshan Samarasinghe','2022-03-05'),
('','S-00029','Heshan Samarasinghe','2022-03-06'),
('','S-00029','Heshan Samarasinghe','2022-03-07'),
('','S-00029','Heshan Samarasinghe','2022-03-08'),
('','S-00029','Heshan Samarasinghe','2022-03-09'),
('','S-00029','Heshan Samarasinghe','2022-03-10'),
('','S-00029','Heshan Samarasinghe','2022-03-11'),
('','S-00029','Heshan Samarasinghe','2022-03-12'),
('','S-00029','Heshan Samarasinghe','2022-03-13'),
('','S-00029','Heshan Samarasinghe','2022-03-14'),
('','S-00029','Heshan Samarasinghe','2022-03-15'),
('','S-00029','Heshan Samarasinghe','2022-03-16'),
('','S-00029','Heshan Samarasinghe','2022-03-17'),
('','S-00029','Heshan Samarasinghe','2022-03-18'),
('','S-00029','Heshan Samarasinghe','2022-03-19'),
('','S-00029','Heshan Samarasinghe','2022-03-20'),
('','S-00029','Heshan Samarasinghe','2022-04-01'),
('','S-00029','Heshan Samarasinghe','2022-04-02'),
('','S-00029','Heshan Samarasinghe','2022-04-03'),
('','S-00029','Heshan Samarasinghe','2022-04-04'),
('','S-00029','Heshan Samarasinghe','2022-04-05'),
('','S-00029','Heshan Samarasinghe','2022-04-06'),
('','S-00029','Heshan Samarasinghe','2022-04-07'),
('','S-00029','Heshan Samarasinghe','2022-04-08'),
('','S-00029','Heshan Samarasinghe','2022-04-09'),
('','S-00029','Heshan Samarasinghe','2022-04-10'),
('','S-00029','Heshan Samarasinghe','2022-04-11'),
('','S-00029','Heshan Samarasinghe','2022-04-12'),
('','S-00029','Heshan Samarasinghe','2022-04-13'),
('','S-00029','Heshan Samarasinghe','2022-04-14'),
('','S-00029','Heshan Samarasinghe','2022-04-15'),
('','S-00029','Heshan Samarasinghe','2022-04-16'),
('','S-00029','Heshan Samarasinghe','2022-04-17'),
('','S-00029','Heshan Samarasinghe','2022-04-18'),
('','S-00029','Heshan Samarasinghe','2022-04-19'),
('','S-00029','Heshan Samarasinghe','2022-04-20'),
('','S-00029','Heshan Samarasinghe','2022-05-01'),
('','S-00029','Heshan Samarasinghe','2022-05-02'),
('','S-00029','Heshan Samarasinghe','2022-05-03'),
('','S-00029','Heshan Samarasinghe','2022-05-04'),
('','S-00029','Heshan Samarasinghe','2022-05-05'),
('','S-00029','Heshan Samarasinghe','2022-05-06'),
('','S-00029','Heshan Samarasinghe','2022-05-07'),
('','S-00029','Heshan Samarasinghe','2022-05-08'),
('','S-00029','Heshan Samarasinghe','2022-05-09'),
('','S-00029','Heshan Samarasinghe','2022-05-10'),
('','S-00029','Heshan Samarasinghe','2022-05-11'),
('','S-00029','Heshan Samarasinghe','2022-05-12'),
('','S-00029','Heshan Samarasinghe','2022-05-13'),
('','S-00029','Heshan Samarasinghe','2022-05-14'),
('','S-00029','Heshan Samarasinghe','2022-05-15'),
('','S-00029','Heshan Samarasinghe','2022-05-16'),
('','S-00029','Heshan Samarasinghe','2022-05-17'),
('','S-00029','Heshan Samarasinghe','2022-05-18'),
('','S-00029','Heshan Samarasinghe','2022-05-19'),
('','S-00029','Heshan Samarasinghe','2022-05-20'),






('','S-00030','Madhawa Roopasinge','2022-01-01'),
('','S-00030','Madhawa Roopasinge','2022-01-02'),
('','S-00030','Madhawa Roopasinge','2022-01-03'),
('','S-00030','Madhawa Roopasinge','2022-01-04'),
('','S-00030','Madhawa Roopasinge','2022-01-05'),
('','S-00030','Madhawa Roopasinge','2022-01-06'),
('','S-00030','Madhawa Roopasinge','2022-01-07'),
('','S-00030','Madhawa Roopasinge','2022-01-08'),
('','S-00030','Madhawa Roopasinge','2022-01-09'),
('','S-00030','Madhawa Roopasinge','2022-01-10'),
('','S-00030','Madhawa Roopasinge','2022-01-11'),
('','S-00030','Madhawa Roopasinge','2022-01-12'),
('','S-00030','Madhawa Roopasinge','2022-01-13'),
('','S-00030','Madhawa Roopasinge','2022-01-14'),
('','S-00030','Madhawa Roopasinge','2022-01-15'),
('','S-00030','Madhawa Roopasinge','2022-01-16'),
('','S-00030','Madhawa Roopasinge','2022-01-17'),
('','S-00030','Madhawa Roopasinge','2022-01-18'),
('','S-00030','Madhawa Roopasinge','2022-01-19'),
('','S-00030','Madhawa Roopasinge','2022-01-20'),
('','S-00030','Madhawa Roopasinge','2022-02-01'),
('','S-00030','Madhawa Roopasinge','2022-02-02'),
('','S-00030','Madhawa Roopasinge','2022-02-03'),
('','S-00030','Madhawa Roopasinge','2022-02-04'),
('','S-00030','Madhawa Roopasinge','2022-02-05'),
('','S-00030','Madhawa Roopasinge','2022-02-06'),
('','S-00030','Madhawa Roopasinge','2022-02-07'),
('','S-00030','Madhawa Roopasinge','2022-02-08'),
('','S-00030','Madhawa Roopasinge','2022-02-09'),
('','S-00030','Madhawa Roopasinge','2022-02-10'),
('','S-00030','Madhawa Roopasinge','2022-02-11'),
('','S-00030','Madhawa Roopasinge','2022-02-12'),
('','S-00030','Madhawa Roopasinge','2022-02-13'),
('','S-00030','Madhawa Roopasinge','2022-02-14'),
('','S-00030','Madhawa Roopasinge','2022-02-15'),
('','S-00030','Madhawa Roopasinge','2022-02-16'),
('','S-00030','Madhawa Roopasinge','2022-02-17'),
('','S-00030','Madhawa Roopasinge','2022-02-18'),
('','S-00030','Madhawa Roopasinge','2022-02-19'),
('','S-00030','Madhawa Roopasinge','2022-02-20'),
('','S-00030','Madhawa Roopasinge','2022-03-01'),
('','S-00030','Madhawa Roopasinge','2022-03-02'),
('','S-00030','Madhawa Roopasinge','2022-03-03'),
('','S-00030','Madhawa Roopasinge','2022-03-04'),
('','S-00030','Madhawa Roopasinge','2022-03-05'),
('','S-00030','Madhawa Roopasinge','2022-03-06'),
('','S-00030','Madhawa Roopasinge','2022-03-07'),
('','S-00030','Madhawa Roopasinge','2022-03-08'),
('','S-00030','Madhawa Roopasinge','2022-03-09'),
('','S-00030','Madhawa Roopasinge','2022-03-10'),
('','S-00030','Madhawa Roopasinge','2022-03-11'),
('','S-00030','Madhawa Roopasinge','2022-03-12'),
('','S-00030','Madhawa Roopasinge','2022-03-13'),
('','S-00030','Madhawa Roopasinge','2022-03-14'),
('','S-00030','Madhawa Roopasinge','2022-03-15'),
('','S-00030','Madhawa Roopasinge','2022-03-16'),
('','S-00030','Madhawa Roopasinge','2022-03-17'),
('','S-00030','Madhawa Roopasinge','2022-03-18'),
('','S-00030','Madhawa Roopasinge','2022-03-19'),
('','S-00030','Madhawa Roopasinge','2022-03-20'),
('','S-00030','Madhawa Roopasinge','2022-04-01'),
('','S-00030','Madhawa Roopasinge','2022-04-02'),
('','S-00030','Madhawa Roopasinge','2022-04-03'),
('','S-00030','Madhawa Roopasinge','2022-04-04'),
('','S-00030','Madhawa Roopasinge','2022-04-05'),
('','S-00030','Madhawa Roopasinge','2022-04-06'),
('','S-00030','Madhawa Roopasinge','2022-04-07'),
('','S-00030','Madhawa Roopasinge','2022-04-08'),
('','S-00030','Madhawa Roopasinge','2022-04-09'),
('','S-00030','Madhawa Roopasinge','2022-04-10'),
('','S-00030','Madhawa Roopasinge','2022-04-11'),
('','S-00030','Madhawa Roopasinge','2022-04-12'),
('','S-00030','Madhawa Roopasinge','2022-04-13'),
('','S-00030','Madhawa Roopasinge','2022-04-14'),
('','S-00030','Madhawa Roopasinge','2022-04-15'),
('','S-00030','Madhawa Roopasinge','2022-04-16'),
('','S-00030','Madhawa Roopasinge','2022-04-17'),
('','S-00030','Madhawa Roopasinge','2022-04-18'),
('','S-00030','Madhawa Roopasinge','2022-04-19'),
('','S-00030','Madhawa Roopasinge','2022-04-20'),
('','S-00030','Madhawa Roopasinge','2022-05-01'),
('','S-00030','Madhawa Roopasinge','2022-05-02'),
('','S-00030','Madhawa Roopasinge','2022-05-03'),
('','S-00030','Madhawa Roopasinge','2022-05-04'),
('','S-00030','Madhawa Roopasinge','2022-05-05'),
('','S-00030','Madhawa Roopasinge','2022-05-06'),
('','S-00030','Madhawa Roopasinge','2022-05-07'),
('','S-00030','Madhawa Roopasinge','2022-05-08'),
('','S-00030','Madhawa Roopasinge','2022-05-09'),
('','S-00030','Madhawa Roopasinge','2022-05-10'),
('','S-00030','Madhawa Roopasinge','2022-05-11'),
('','S-00030','Madhawa Roopasinge','2022-05-12'),
('','S-00030','Madhawa Roopasinge','2022-05-13'),
('','S-00030','Madhawa Roopasinge','2022-05-14'),
('','S-00030','Madhawa Roopasinge','2022-05-15'),
('','S-00030','Madhawa Roopasinge','2022-05-16'),
('','S-00030','Madhawa Roopasinge','2022-05-17'),
('','S-00030','Madhawa Roopasinge','2022-05-18'),
('','S-00030','Madhawa Roopasinge','2022-05-19'),
('','S-00030','Madhawa Roopasinge','2022-05-20'),







('','S-00031','Madhawi Randini','2022-01-01'),
('','S-00031','Madhawi Randini','2022-01-02'),
('','S-00031','Madhawi Randini','2022-01-03'),
('','S-00031','Madhawi Randini','2022-01-04'),
('','S-00031','Madhawi Randini','2022-01-05'),
('','S-00031','Madhawi Randini','2022-01-06'),
('','S-00031','Madhawi Randini','2022-01-07'),
('','S-00031','Madhawi Randini','2022-01-08'),
('','S-00031','Madhawi Randini','2022-01-09'),
('','S-00031','Madhawi Randini','2022-01-10'),
('','S-00031','Madhawi Randini','2022-01-11'),
('','S-00031','Madhawi Randini','2022-01-12'),
('','S-00031','Madhawi Randini','2022-01-13'),
('','S-00031','Madhawi Randini','2022-01-14'),
('','S-00031','Madhawi Randini','2022-01-15'),
('','S-00031','Madhawi Randini','2022-01-16'),
('','S-00031','Madhawi Randini','2022-01-17'),
('','S-00031','Madhawi Randini','2022-01-18'),
('','S-00031','Madhawi Randini','2022-01-19'),
('','S-00031','Madhawi Randini','2022-01-20'),
('','S-00031','Madhawi Randini','2022-02-01'),
('','S-00031','Madhawi Randini','2022-02-02'),
('','S-00031','Madhawi Randini','2022-02-03'),
('','S-00031','Madhawi Randini','2022-02-04'),
('','S-00031','Madhawi Randini','2022-02-05'),
('','S-00031','Madhawi Randini','2022-02-06'),
('','S-00031','Madhawi Randini','2022-02-07'),
('','S-00031','Madhawi Randini','2022-02-08'),
('','S-00031','Madhawi Randini','2022-02-09'),
('','S-00031','Madhawi Randini','2022-02-10'),
('','S-00031','Madhawi Randini','2022-02-11'),
('','S-00031','Madhawi Randini','2022-02-12'),
('','S-00031','Madhawi Randini','2022-02-13'),
('','S-00031','Madhawi Randini','2022-02-14'),
('','S-00031','Madhawi Randini','2022-02-15'),
('','S-00031','Madhawi Randini','2022-02-16'),
('','S-00031','Madhawi Randini','2022-02-17'),
('','S-00031','Madhawi Randini','2022-02-18'),
('','S-00031','Madhawi Randini','2022-02-19'),
('','S-00031','Madhawi Randini','2022-02-20'),
('','S-00031','Madhawi Randini','2022-03-01'),
('','S-00031','Madhawi Randini','2022-03-02'),
('','S-00031','Madhawi Randini','2022-03-03'),
('','S-00031','Madhawi Randini','2022-03-04'),
('','S-00031','Madhawi Randini','2022-03-05'),
('','S-00031','Madhawi Randini','2022-03-06'),
('','S-00031','Madhawi Randini','2022-03-07'),
('','S-00031','Madhawi Randini','2022-03-08'),
('','S-00031','Madhawi Randini','2022-03-09'),
('','S-00031','Madhawi Randini','2022-03-10'),
('','S-00031','Madhawi Randini','2022-03-11'),
('','S-00031','Madhawi Randini','2022-03-12'),
('','S-00031','Madhawi Randini','2022-03-13'),
('','S-00031','Madhawi Randini','2022-03-14'),
('','S-00031','Madhawi Randini','2022-03-15'),
('','S-00031','Madhawi Randini','2022-03-16'),
('','S-00031','Madhawi Randini','2022-03-17'),
('','S-00031','Madhawi Randini','2022-03-18'),
('','S-00031','Madhawi Randini','2022-03-19'),
('','S-00031','Madhawi Randini','2022-03-20'),
('','S-00031','Madhawi Randini','2022-04-01'),
('','S-00031','Madhawi Randini','2022-04-02'),
('','S-00031','Madhawi Randini','2022-04-03'),
('','S-00031','Madhawi Randini','2022-04-04'),
('','S-00031','Madhawi Randini','2022-04-05'),
('','S-00031','Madhawi Randini','2022-04-06'),
('','S-00031','Madhawi Randini','2022-04-07'),
('','S-00031','Madhawi Randini','2022-04-08'),
('','S-00031','Madhawi Randini','2022-04-09'),
('','S-00031','Madhawi Randini','2022-04-10'),
('','S-00031','Madhawi Randini','2022-04-11'),
('','S-00031','Madhawi Randini','2022-04-12'),
('','S-00031','Madhawi Randini','2022-04-13'),
('','S-00031','Madhawi Randini','2022-04-14'),
('','S-00031','Madhawi Randini','2022-04-15'),
('','S-00031','Madhawi Randini','2022-04-16'),
('','S-00031','Madhawi Randini','2022-04-17'),
('','S-00031','Madhawi Randini','2022-04-18'),
('','S-00031','Madhawi Randini','2022-04-19'),
('','S-00031','Madhawi Randini','2022-04-20'),
('','S-00031','Madhawi Randini','2022-05-01'),
('','S-00031','Madhawi Randini','2022-05-02'),
('','S-00031','Madhawi Randini','2022-05-03'),
('','S-00031','Madhawi Randini','2022-05-04'),
('','S-00031','Madhawi Randini','2022-05-05'),
('','S-00031','Madhawi Randini','2022-05-06'),
('','S-00031','Madhawi Randini','2022-05-07'),
('','S-00031','Madhawi Randini','2022-05-08'),
('','S-00031','Madhawi Randini','2022-05-09'),
('','S-00031','Madhawi Randini','2022-05-10'),
('','S-00031','Madhawi Randini','2022-05-11'),
('','S-00031','Madhawi Randini','2022-05-12'),
('','S-00031','Madhawi Randini','2022-05-13'),
('','S-00031','Madhawi Randini','2022-05-14'),
('','S-00031','Madhawi Randini','2022-05-15'),
('','S-00031','Madhawi Randini','2022-05-16'),
('','S-00031','Madhawi Randini','2022-05-17'),
('','S-00031','Madhawi Randini','2022-05-18'),
('','S-00031','Madhawi Randini','2022-05-19'),
('','S-00031','Madhawi Randini','2022-05-20'),




('','S-00032','Sulochana Satharasinghe','2022-01-01'),
('','S-00032','Sulochana Satharasinghe','2022-01-02'),
('','S-00032','Sulochana Satharasinghe','2022-01-03'),
('','S-00032','Sulochana Satharasinghe','2022-01-04'),
('','S-00032','Sulochana Satharasinghe','2022-01-05'),
('','S-00032','Sulochana Satharasinghe','2022-01-06'),
('','S-00032','Sulochana Satharasinghe','2022-01-07'),
('','S-00032','Sulochana Satharasinghe','2022-01-08'),
('','S-00032','Sulochana Satharasinghe','2022-01-09'),
('','S-00032','Sulochana Satharasinghe','2022-01-10'),
('','S-00032','Sulochana Satharasinghe','2022-01-11'),
('','S-00032','Sulochana Satharasinghe','2022-01-12'),
('','S-00032','Sulochana Satharasinghe','2022-01-13'),
('','S-00032','Sulochana Satharasinghe','2022-01-14'),
('','S-00032','Sulochana Satharasinghe','2022-01-15'),
('','S-00032','Sulochana Satharasinghe','2022-01-16'),
('','S-00032','Sulochana Satharasinghe','2022-01-17'),
('','S-00032','Sulochana Satharasinghe','2022-01-18'),
('','S-00032','Sulochana Satharasinghe','2022-01-19'),
('','S-00032','Sulochana Satharasinghe','2022-01-20'),
('','S-00032','Sulochana Satharasinghe','2022-02-01'),
('','S-00032','Sulochana Satharasinghe','2022-02-02'),
('','S-00032','Sulochana Satharasinghe','2022-02-03'),
('','S-00032','Sulochana Satharasinghe','2022-02-04'),
('','S-00032','Sulochana Satharasinghe','2022-02-05'),
('','S-00032','Sulochana Satharasinghe','2022-02-06'),
('','S-00032','Sulochana Satharasinghe','2022-02-07'),
('','S-00032','Sulochana Satharasinghe','2022-02-08'),
('','S-00032','Sulochana Satharasinghe','2022-02-09'),
('','S-00032','Sulochana Satharasinghe','2022-02-10'),
('','S-00032','Sulochana Satharasinghe','2022-02-11'),
('','S-00032','Sulochana Satharasinghe','2022-02-12'),
('','S-00032','Sulochana Satharasinghe','2022-02-13'),
('','S-00032','Sulochana Satharasinghe','2022-02-14'),
('','S-00032','Sulochana Satharasinghe','2022-02-15'),
('','S-00032','Sulochana Satharasinghe','2022-02-16'),
('','S-00032','Sulochana Satharasinghe','2022-02-17'),
('','S-00032','Sulochana Satharasinghe','2022-02-18'),
('','S-00032','Sulochana Satharasinghe','2022-02-19'),
('','S-00032','Sulochana Satharasinghe','2022-02-20'),
('','S-00032','Sulochana Satharasinghe','2022-03-01'),
('','S-00032','Sulochana Satharasinghe','2022-03-02'),
('','S-00032','Sulochana Satharasinghe','2022-03-03'),
('','S-00032','Sulochana Satharasinghe','2022-03-04'),
('','S-00032','Sulochana Satharasinghe','2022-03-05'),
('','S-00032','Sulochana Satharasinghe','2022-03-06'),
('','S-00032','Sulochana Satharasinghe','2022-03-07'),
('','S-00032','Sulochana Satharasinghe','2022-03-08'),
('','S-00032','Sulochana Satharasinghe','2022-03-09'),
('','S-00032','Sulochana Satharasinghe','2022-03-10'),
('','S-00032','Sulochana Satharasinghe','2022-03-11'),
('','S-00032','Sulochana Satharasinghe','2022-03-12'),
('','S-00032','Sulochana Satharasinghe','2022-03-13'),
('','S-00032','Sulochana Satharasinghe','2022-03-14'),
('','S-00032','Sulochana Satharasinghe','2022-03-15'),
('','S-00032','Sulochana Satharasinghe','2022-03-16'),
('','S-00032','Sulochana Satharasinghe','2022-03-17'),
('','S-00032','Sulochana Satharasinghe','2022-03-18'),
('','S-00032','Sulochana Satharasinghe','2022-03-19'),
('','S-00032','Sulochana Satharasinghe','2022-03-20'),
('','S-00032','Sulochana Satharasinghe','2022-04-01'),
('','S-00032','Sulochana Satharasinghe','2022-04-02'),
('','S-00032','Sulochana Satharasinghe','2022-04-03'),
('','S-00032','Sulochana Satharasinghe','2022-04-04'),
('','S-00032','Sulochana Satharasinghe','2022-04-05'),
('','S-00032','Sulochana Satharasinghe','2022-04-06'),
('','S-00032','Sulochana Satharasinghe','2022-04-07'),
('','S-00032','Sulochana Satharasinghe','2022-04-08'),
('','S-00032','Sulochana Satharasinghe','2022-04-09'),
('','S-00032','Sulochana Satharasinghe','2022-04-10'),
('','S-00032','Sulochana Satharasinghe','2022-04-11'),
('','S-00032','Sulochana Satharasinghe','2022-04-12'),
('','S-00032','Sulochana Satharasinghe','2022-04-13'),
('','S-00032','Sulochana Satharasinghe','2022-04-14'),
('','S-00032','Sulochana Satharasinghe','2022-04-15'),
('','S-00032','Sulochana Satharasinghe','2022-04-16'),
('','S-00032','Sulochana Satharasinghe','2022-04-17'),
('','S-00032','Sulochana Satharasinghe','2022-04-18'),
('','S-00032','Sulochana Satharasinghe','2022-04-19'),
('','S-00032','Sulochana Satharasinghe','2022-04-20'),
('','S-00032','Sulochana Satharasinghe','2022-05-01'),
('','S-00032','Sulochana Satharasinghe','2022-05-02'),
('','S-00032','Sulochana Satharasinghe','2022-05-03'),
('','S-00032','Sulochana Satharasinghe','2022-05-04'),
('','S-00032','Sulochana Satharasinghe','2022-05-05'),
('','S-00032','Sulochana Satharasinghe','2022-05-06'),
('','S-00032','Sulochana Satharasinghe','2022-05-07'),
('','S-00032','Sulochana Satharasinghe','2022-05-08'),
('','S-00032','Sulochana Satharasinghe','2022-05-09'),
('','S-00032','Sulochana Satharasinghe','2022-05-10'),
('','S-00032','Sulochana Satharasinghe','2022-05-11'),
('','S-00032','Sulochana Satharasinghe','2022-05-12'),
('','S-00032','Sulochana Satharasinghe','2022-05-13'),
('','S-00032','Sulochana Satharasinghe','2022-05-14'),
('','S-00032','Sulochana Satharasinghe','2022-05-15'),
('','S-00032','Sulochana Satharasinghe','2022-05-16'),
('','S-00032','Sulochana Satharasinghe','2022-05-17'),
('','S-00032','Sulochana Satharasinghe','2022-05-18'),
('','S-00032','Sulochana Satharasinghe','2022-05-19'),
('','S-00032','Sulochana Satharasinghe','2022-05-20'),






('','S-00033','Irine Fernando','2022-01-01'),
('','S-00033','Irine Fernando','2022-01-02'),
('','S-00033','Irine Fernando','2022-01-03'),
('','S-00033','Irine Fernando','2022-01-04'),
('','S-00033','Irine Fernando','2022-01-05'),
('','S-00033','Irine Fernando','2022-01-06'),
('','S-00033','Irine Fernando','2022-01-07'),
('','S-00033','Irine Fernando','2022-01-08'),
('','S-00033','Irine Fernando','2022-01-09'),
('','S-00033','Irine Fernando','2022-01-10'),
('','S-00033','Irine Fernando','2022-01-11'),
('','S-00033','Irine Fernando','2022-01-12'),
('','S-00033','Irine Fernando','2022-01-13'),
('','S-00033','Irine Fernando','2022-01-14'),
('','S-00033','Irine Fernando','2022-01-15'),
('','S-00033','Irine Fernando','2022-01-16'),
('','S-00033','Irine Fernando','2022-01-17'),
('','S-00033','Irine Fernando','2022-01-18'),
('','S-00033','Irine Fernando','2022-01-19'),
('','S-00033','Irine Fernando','2022-01-20'),
('','S-00033','Irine Fernando','2022-02-01'),
('','S-00033','Irine Fernando','2022-02-02'),
('','S-00033','Irine Fernando','2022-02-03'),
('','S-00033','Irine Fernando','2022-02-04'),
('','S-00033','Irine Fernando','2022-02-05'),
('','S-00033','Irine Fernando','2022-02-06'),
('','S-00033','Irine Fernando','2022-02-07'),
('','S-00033','Irine Fernando','2022-02-08'),
('','S-00033','Irine Fernando','2022-02-09'),
('','S-00033','Irine Fernando','2022-02-10'),
('','S-00033','Irine Fernando','2022-02-11'),
('','S-00033','Irine Fernando','2022-02-12'),
('','S-00033','Irine Fernando','2022-02-13'),
('','S-00033','Irine Fernando','2022-02-14'),
('','S-00033','Irine Fernando','2022-02-15'),
('','S-00033','Irine Fernando','2022-02-16'),
('','S-00033','Irine Fernando','2022-02-17'),
('','S-00033','Irine Fernando','2022-02-18'),
('','S-00033','Irine Fernando','2022-02-19'),
('','S-00033','Irine Fernando','2022-02-20'),
('','S-00033','Irine Fernando','2022-03-01'),
('','S-00033','Irine Fernando','2022-03-02'),
('','S-00033','Irine Fernando','2022-03-03'),
('','S-00033','Irine Fernando','2022-03-04'),
('','S-00033','Irine Fernando','2022-03-05'),
('','S-00033','Irine Fernando','2022-03-06'),
('','S-00033','Irine Fernando','2022-03-07'),
('','S-00033','Irine Fernando','2022-03-08'),
('','S-00033','Irine Fernando','2022-03-09'),
('','S-00033','Irine Fernando','2022-03-10'),
('','S-00033','Irine Fernando','2022-03-11'),
('','S-00033','Irine Fernando','2022-03-12'),
('','S-00033','Irine Fernando','2022-03-13'),
('','S-00033','Irine Fernando','2022-03-14'),
('','S-00033','Irine Fernando','2022-03-15'),
('','S-00033','Irine Fernando','2022-03-16'),
('','S-00033','Irine Fernando','2022-03-17'),
('','S-00033','Irine Fernando','2022-03-18'),
('','S-00033','Irine Fernando','2022-03-19'),
('','S-00033','Irine Fernando','2022-03-20'),
('','S-00033','Irine Fernando','2022-04-01'),
('','S-00033','Irine Fernando','2022-04-02'),
('','S-00033','Irine Fernando','2022-04-03'),
('','S-00033','Irine Fernando','2022-04-04'),
('','S-00033','Irine Fernando','2022-04-05'),
('','S-00033','Irine Fernando','2022-04-06'),
('','S-00033','Irine Fernando','2022-04-07'),
('','S-00033','Irine Fernando','2022-04-08'),
('','S-00033','Irine Fernando','2022-04-09'),
('','S-00033','Irine Fernando','2022-04-10'),
('','S-00033','Irine Fernando','2022-04-11'),
('','S-00033','Irine Fernando','2022-04-12'),
('','S-00033','Irine Fernando','2022-04-13'),
('','S-00033','Irine Fernando','2022-04-14'),
('','S-00033','Irine Fernando','2022-04-15'),
('','S-00033','Irine Fernando','2022-04-16'),
('','S-00033','Irine Fernando','2022-04-17'),
('','S-00033','Irine Fernando','2022-04-18'),
('','S-00033','Irine Fernando','2022-04-19'),
('','S-00033','Irine Fernando','2022-04-20'),
('','S-00033','Irine Fernando','2022-05-01'),
('','S-00033','Irine Fernando','2022-05-02'),
('','S-00033','Irine Fernando','2022-05-03'),
('','S-00033','Irine Fernando','2022-05-04'),
('','S-00033','Irine Fernando','2022-05-05'),
('','S-00033','Irine Fernando','2022-05-06'),
('','S-00033','Irine Fernando','2022-05-07'),
('','S-00033','Irine Fernando','2022-05-08'),
('','S-00033','Irine Fernando','2022-05-09'),
('','S-00033','Irine Fernando','2022-05-10'),
('','S-00033','Irine Fernando','2022-05-11'),
('','S-00033','Irine Fernando','2022-05-12'),
('','S-00033','Irine Fernando','2022-05-13'),
('','S-00033','Irine Fernando','2022-05-14'),
('','S-00033','Irine Fernando','2022-05-15'),
('','S-00033','Irine Fernando','2022-05-16'),
('','S-00033','Irine Fernando','2022-05-17'),
('','S-00033','Irine Fernando','2022-05-18'),
('','S-00033','Irine Fernando','2022-05-19'),
('','S-00033','Irine Fernando','2022-05-20');



INSERT INTO outstanding (id,customer_id,customer_name,useraccount_id,register_id,membership_id)
VALUES
('','C-00001','Uchitha Kosgoda','UA-00004','RE-00001','M-00001'),
('','C-00002','Janith Jayasinghe','UA-00005','RE-00002','M-00002'),
('','C-00003','Asitha Latheef','UA-00006','RE-00003','M-00003'),
('','C-00004','Dilan Sanka','UA-00007','RE-00004','M-00004'),
('','C-00005','Sanka Denuwan','UA-00008','RE-00005','M-00005'),
('','C-00006','Dulitha Amarasinghe','UA-00009','RE-00006','M-00006'),
('','C-00007','Punidu Imesha Kosgoda','UA-00010','RE-00007','M-00007'),
('','C-00008','Jayesh Jayasanka','UA-00011','RE-00008','M-00008'),
('','C-00009','Ravibandu Roopasinghe','UA-00012','RE-00009','M-00009'),
('','C-00010','Ravindu Pathirana','UA-00013','RE-00010','M-00010'),
('','C-00011','Jayanidu Jayasanka','UA-00014','RE-00011','M-00011');








ALTER TABLE customer
ADD COLUMN `age` INT(2) NULL; 



ALTER TABLE leave_process
MODIFY COLUMN `status` VARCHAR(8) NULL; 






insert into expenses(DATE,payment_id,payment_payment_type_id,amount,status1)
						SELECT DATE,id,payment_type_id,amount,status FROM payment;


insert into equipment_purchases(purchased_date,payment_id,payment_payment_type_id,cost,status1)
								SELECT  DATE,id,payment_type_id,amount,status FROM payment;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

