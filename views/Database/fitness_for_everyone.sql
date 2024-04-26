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



INSERT INTO role (id,name)
VALUES('','Administrator'),('','Clerk'),('','Instructor'),('','Customer');


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
('','Senuri','@#Fitness1234','R-00004','Senuri','Hapugoda');




-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`schedule_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`schedule_details` (
  `id` VARCHAR(8) NOT NULL,
  `given_date` DATE NULL,
  `renew_date` DATE NULL,
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
  PRIMARY KEY (`id`, `staff_id`, `customer_id`),
  CONSTRAINT `fk_customer_details_staff1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `Fitness_For_Everyone`.`staff` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_details_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Fitness_For_Everyone`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_customer_details_staff1_idx` ON `Fitness_For_Everyone`.`customer_details` (`staff_id` ASC) VISIBLE;

CREATE INDEX `fk_customer_details_customer1_idx` ON `Fitness_For_Everyone`.`customer_details` (`customer_id` ASC) VISIBLE;

USE fitness_for_everyone;
ALTER TABLE customer_details ADD exercises VARCHAR(20000);


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








DELIMITER $$
create trigger schedule_insert_trigger after INSERT  on customer_details
  for each row
   begin
   if(NEW.id IS NOT NULL AND 150<NEW.height<160 AND 45<NEW.weight<55  )then 
    insert into customer_details(customer_details_id,exercise) values (NEW.id,'Day 01 --> Bench Press 8*3, Flys Machine 8*3,Pull Over 8*3, Lat Pull Down 8*3, Shoulder Press 8*3, D/B Curl 8*3  Day 02-->  D/B Extension 8*3, Press Down 8*3, Squats 8*3, Leg Curl 8*3, Leg Extension 8*3, Calf 8*3 ');
  END if;
  
     if(NEW.id IS NOT NULL AND 160<NEW.height<170 AND 55<NEW.weight<70  )then 
    insert into customer_details(customer_details_id,exercise) values (NEW.id,'Day 01 --> Bench Press 8*3, Flys Machine 8*3,Pull Over 8*3, Lat Pull Down 8*3, Shoulder Press 8*3, D/B Curl 8*3  Day 02-->  D/B Extension 8*3, Press Down 8*3, Squats 8*3, Leg Curl 8*3, Leg Extension 8*3, Calf 8*3 ');
  END if;

END$$
DELIMITER ;



DELIMITER $$
create trigger schedule_update_trigger after UPDATE  on customer_details
  for each row
  begin
   if(NEW.id IS NOT NULL AND 150<NEW.height<160 AND 45<NEW.weight<55  )then 
    insert into customer_details(customer_details_id,exercise) values (NEW.id,'Day 01 --> Bench Press 8*3, Flys Machine 8*3,Pull Over 8*3, Lat Pull Down 8*3, Shoulder Press 8*3, D/B Curl 8*3  Day 02-->  D/B Extension 8*3, Press Down 8*3, Squats 8*3, Leg Curl 8*3, Leg Extension 8*3, Calf 8*3 ');
  END if;
  
     if(NEW.id IS NOT NULL AND 160<NEW.height<170 AND 55<NEW.weight<70  )then 
    insert into customer_details(customer_details_id,exercise) values (NEW.id,'Day 01 --> Bench Press 8*3, Flys Machine 8*3,Pull Over 8*3, Lat Pull Down 8*3, Shoulder Press 8*3, D/B Curl 8*3  Day 02-->  D/B Extension 8*3, Press Down 8*3, Squats 8*3, Leg Curl 8*3, Leg Extension 8*3, Calf 8*3 ');
  END if;

END$$
DELIMITER ;
















DELIMITER $$
create trigger schedule1_insert_trigger after INSERT  on customer_details
  for each row
   begin
   if(NEW.id IS NOT NULL AND 150<NEW.height<160 AND 45<NEW.weight<55  )then 
    insert into schedule_details(customer_details_id,exercise) values (NEW.id,'Day 01 --> Bench Press 8*3, Flys Machine 8*3,Pull Over 8*3, Lat Pull Down 8*3, Shoulder Press 8*3, D/B Curl 8*3  Day 02-->  D/B Extension 8*3, Press Down 8*3, Squats 8*3, Leg Curl 8*3, Leg Extension 8*3, Calf 8*3 ');
  END if;
  
     if(NEW.id IS NOT NULL AND 160<NEW.height<170 AND 55<NEW.weight<70  )then 
    insert into schedule_details(customer_details_id,exercise) values (NEW.id,'Day 01 --> Bench Press 8*3, Flys Machine 8*3,Pull Over 8*3, Lat Pull Down 8*3, Shoulder Press 8*3, D/B Curl 8*3  Day 02-->  D/B Extension 8*3, Press Down 8*3, Squats 8*3, Leg Curl 8*3, Leg Extension 8*3, Calf 8*3 ');
  END if;

END$$
DELIMITER ;



DELIMITER $$
create trigger schedule1_update_trigger after UPDATE  on customer_details
  for each row
  begin
   if(NEW.id IS NOT NULL AND 150<NEW.height<160 AND 45<NEW.weight<55  )then 
    insert into schedule_details(customer_details_id,exercise) values (NEW.id,'Day 01 --> Bench Press 8*3, Flys Machine 8*3,Pull Over 8*3, Lat Pull Down 8*3, Shoulder Press 8*3, D/B Curl 8*3  Day 02-->  D/B Extension 8*3, Press Down 8*3, Squats 8*3, Leg Curl 8*3, Leg Extension 8*3, Calf 8*3 ');
  END if;
  
     if(NEW.id IS NOT NULL AND 160<NEW.height<170 AND 55<NEW.weight<70  )then 
    insert into schedule_details(customer_details_id,exercise) values (NEW.id,'Day 01 --> Bench Press 8*3, Flys Machine 8*3,Pull Over 8*3, Lat Pull Down 8*3, Shoulder Press 8*3, D/B Curl 8*3  Day 02-->  D/B Extension 8*3, Press Down 8*3, Squats 8*3, Leg Curl 8*3, Leg Extension 8*3, Calf 8*3 ');
  END if;

END$$
DELIMITER ;



DELIMITER $$
create trigger schedule1_delete_trigger after DELETE  on customer_details
  for each row
   begin
  
    delete from schedule_details where id=OLD.id;


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
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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

INSERT INTO designation (id,name)
VALUES('','Administrator/Owner'),('','Clerk'),('','Instructor');



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

INSERT INTO gender (id,gender)
VALUES('','Male'),('','Female');

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



INSERT INTO staff (id,fname,lname,designation_id,gender_id,telephone,address,email,DESCRIPTION,useraccount_id,useraccount_role_id)
VALUES
('','Dasun','Santha','D-00001','G-00001','0','','','','UA-00001','R-00001'),

('','Ashan','Himaru','D-00002','G-00001','0','','','','UA-00002','R-00002'),
('','Dasun','Coorey','D-00002','G-00001','0','','','','UA-00003','R-00002'),

('','Tharindu','Madhawa','D-00003','G-00001','0','','','','UA-00004','R-00003'),
('','Janidu','Jayasanka','D-00003','G-00001','0','','','','UA-00005','R-00003'),
('','Pasindu','deshan','D-00003','G-00001','0','','','','UA-00006','R-00003'),
('','Victor','Ivan','D-00003','G-00001','0','','','','UA-00007','R-00003'),
('','Jayod','Jayasinghe','D-00003','G-00001','0','','','','UA-00008','R-00003'),
('','Tharumal','Wijesinghe','D-00003','G-00001','0','','','','UA-00009','R-00003'),
('','Rekha','Perera','D-00003','G-00002','0','','','','UA-00010','R-00003'),
('','Ruvini','Ahangama','D-00003','G-00002','0','','','','UA-00011','R-00003'),
('','Tharupa','Amarasinghe','D-00003','G-00002','0','','','','UA-00012','R-00003'),
('','Thurunu','Jayasighe','D-00003','G-00001','0','','','','UA-00013','R-00003'),
('','Timal','Rukshan','D-00003','G-00001','0','','','','UA-00014','R-00003'),
('','Rukshan','Samarasinghe','D-00003','G-00001','0','','','','UA-00015','R-00003'),
('','Amarabandu','Roopasinge','D-00003','G-00001','0','','','','UA-00016','R-00003'),
('','Roopa','Randini','D-00003','G-00001','0','','','','UA-00017','R-00003'),
('','Chapa','Satharasinghe','D-00003','G-00002','0','','','','UA-00018','R-00003');















-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`membership` (
  `id` VARCHAR(8) NOT NULL,
  `name` VARCHAR(200) NULL,
  `description` VARCHAR(2000) NULL,
  `fee` DECIMAL(11,2) NULL,
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

INSERT INTO membership (id,name,description,fee)
VALUES
('','Heavy User CARDIO-Any Time 03 Months Period','Any Time of Working Hours 5A.M to 10P.M  03 Months Period',11000),
('','Heavy User CARDIO-Any Time 06 Months Period','Any Time of Working Hours 5A.M to 10P.M  06 Months Period',20000),
('','Heavy User CARDIO-Any Time 01 Year Period','Any Time of Working Hours 5A.M to 10P.M  01 Year Period',36000),
('','Heavy User CARDIO-Any Time 02 Year Period','Any Time of Working Hours 5A.M to 10P.M  02 Year Period',64000),

('','PROFESSIONAL USER-Any Time 03 Months Period','Any Time of Working Hours 5A.M to 10P.M  03 Months Period',12000),
('','PROFESSIONAL USER-Any Time 06 Months Period','Any Time of Working Hours 5A.M to 10P.M  06 Months Period',22000),
('','PROFESSIONAL USER-Any Time 01 Year Period','Any Time of Working Hours 5A.M to 10P.M  01 Year Period',40000),
('','PROFESSIONAL USER-Any Time 02 Year Period','Any Time of Working Hours 5A.M to 10P.M  02 Year Period',75000),

('','FOR NORMAL USERS_MEN_LITE-Morning Hours 03 Months Period','Morning Hours 5A.M to 8A.M  03 Months Period',9000),
('','FOR NORMAL USERS_MEN_LITE-Morning Hours 06 Months Period','Morning Hours 5A.M to 8A.M  06 Months Period',16000),
('','FOR NORMAL USERS_MEN_LITE-Morning Hours 01 Year Period','Morning Hours 5A.M to 8A.M  01 Year Period',28000),
('','FOR NORMAL USERS_MEN_LITE-Morning Hours 02 Year Period','Morning Hours 5A.M to 8A.M  02 Year Period',50000),
('','FOR NORMAL USERS_MEN_BASIC-Afternoon Hours 03 Months Period','Afternoon Hours 3P.M to 10P.M  03 Months Period',10000),
('','FOR NORMAL USERS_MEN_BASIC-Afternoon Hours 06 Months Period','Afternoon Hours 3P.M to 10P.M  06 Months Period',18000),
('','FOR NORMAL USERS_MEN_BASIC-Afternoon Hours 01 Year Period','Afternoon Hours 3P.M to 10P.M  01 Year Period',32000),
('','FOR NORMAL USERS_MEN_BASIC-Afternoon Hours 02 Year Period','Afternoon Hours 3P.M to 10P.M  02 Year Period',56000),
('','FOR NORMAL USERS_MEN_PRO-Any Time 03 Months Period','Any Time of Working Hours 5A.M to 10P.M  03 Months Period',11000),
('','FOR NORMAL USERS_MEN_PRO-Any Time 06 Months Period','Any Time of Working Hours 5A.M to 10P.M  06 Months Period',20000),
('','FOR NORMAL USERS_MEN_PRO-Any Time 01 Year Period','Any Time of Working Hours 5A.M to 10P.M  01 Year Period',36000),
('','FOR NORMAL USERS_MEN_PRO-Any Time 02 Year Period','Any Time of Working Hours 5A.M to 10P.M  02 Year Period',64000),

('','FOR NORMAL USERS_WOMEN_LITE-Morning Hours 03 Months Period','Morning Hours 5A.M to 8A.M  03 Months Period',7000),
('','FOR NORMAL USERS_WOMEN_LITE-Morning Hours 06 Months Period','Morning Hours 5A.M to 8A.M  06 Months Period',12000),
('','FOR NORMAL USERS_WOMEN_LITE-Morning Hours 01 Year Period','Morning Hours 5A.M to 8A.M  01 Year Period',22000),
('','FOR NORMAL USERS_WOMEN_LITE-Morning Hours 02 Year Period','Morning Hours 5A.M to 8A.M  02 Year Period',42000),
('','FOR NORMAL USERS_WOMEN_BASIC-Afternoon Hours 03 Months Period','Afternoon Hours 3P.M to 10P.M  03 Months Period',8000),
('','FOR NORMAL USERS_WOMEN_BASIC-Afternoon Hours 06 Months Period','Afternoon Hours 3P.M to 10P.M  06 Months Period',14000),
('','FOR NORMAL USERS_WOMEN_BASIC-Afternoon Hours 01 Year Period','Afternoon Hours 3P.M to 10P.M  01 Year Period',26000),
('','FOR NORMAL USERS_WOMEN_BASIC-Afternoon Hours 02 Year Period','Afternoon Hours 3P.M to 10P.M  02 Year Period',50000),
('','FOR NORMAL USERS_WOMEN_PRO-Any Time 03 Months Period','Any Time of Working Hours 5A.M to 10P.M  03 Months Period',9000),
('','FOR NORMAL USERS_WOMEN_PRO-Any Time 06 Months Period','Any Time of Working Hours 5A.M to 10P.M  06 Months Period',16000),
('','FOR NORMAL USERS_WOMEN_PRO-Any Time 01 Year Period','Any Time of Working Hours 5A.M to 10P.M  01 Year Period',30000),
('','FOR NORMAL USERS_WOMEN_PRO-Any Time 02 Year Period','Any Time of Working Hours 5A.M to 10P.M  02 Year Period',58000),

('','FOR NORMAL USERS_TEENAGERS_LITE-Morning Hours 03 Months Period','Morning Hours 5A.M to 8A.M  03 Months Period',5000),
('','FOR NORMAL USERS_TEENAGERS_LITE-Morning Hours 06 Months Period','Morning Hours 5A.M to 8A.M  06 Months Period',8000),
('','FOR NORMAL USERS_TEENAGERS_LITE-Morning Hours 01 Year Period','Morning Hours 5A.M to 8A.M  01 Year Period',14000),
('','FOR NORMAL USERS_TEENAGERS_LITE-Morning Hours 02 Year Period','Morning Hours 5A.M to 8A.M  02 Year Period',26000),
('','FOR NORMAL USERS_TEENAGERS_BASIC-Afternoon Hours 03 Months Period','Afternoon Hours 3P.M to 10P.M  03 Months Period',6000),
('','FOR NORMAL USERS_TEENAGERS_BASIC-Afternoon Hours 06 Months Period','Afternoon Hours 3P.M to 10P.M  06 Months Period',10000),
('','FOR NORMAL USERS_TEENAGERS_BASIC-Afternoon Hours 01 Year Period','Afternoon Hours 3P.M to 10P.M  01 Year Period',18000),
('','FOR NORMAL USERS_TEENAGERS_BASIC-Afternoon Hours 02 Year Period','Afternoon Hours 3P.M to 10P.M  02 Year Period',32000),
('','FOR NORMAL USERS_TEENAGERS_PRO-Any Time 03 Months Period','Any Time of Working Hours 5A.M to 10P.M  03 Months Period',7000),
('','FOR NORMAL USERS_TEENAGERS_PRO-Any Time 06 Months Period','Any Time of Working Hours 5A.M to 10P.M  06 Months Period',12000),
('','FOR NORMAL USERS_TEENAGERS_PRO-Any Time 01 Year Period','Any Time of Working Hours 5A.M to 10P.M  01 Year Period',20000),
('','FOR NORMAL USERS_TEENAGERS_PRO-Any Time 02 Year Period','Any Time of Working Hours 5A.M to 10P.M  02 Year Period',38000)
;



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


INSERT INTO payment_type (id,payment_type_name)
VALUES('','Cash'),('','Card');


-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`payment` (
  `id` VARCHAR(8) NOT NULL,
  `amount` DECIMAL(11,2) NULL,
  `date` DATE NOT NULL DEFAULT '2022-01-01',
  `payment_type_id` VARCHAR(8) NOT NULL,
  `status` VARCHAR(12) NOT NULL,
  `remarks` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`, `payment_type_id`),
  CONSTRAINT `fk_payment_payment_type1`
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





INSERT INTO payment (id,amount,date,payment_type_id,status,remarks)
VALUES
('','15520','','PT-00001','Equipment',''),
('','7850','','PT-00002','Equipment',''),
('','2555','','PT-00003','Expense',''),
('','1500','','PT-00004','Expense',''),
('','20000','','PT-00005','Equipment',''),
('','12578','','PT-00006','Equipment',''),
('','3758','','PT-00007','Expense',''),
('','4890','','PT-00008','Equipment',''),
('','9250','','PT-00009','Equipment',''),
('','2450','','PT-00010','Expense',''),
('','3450','','PT-00011','Equipment',''),
('','25000','','PT-00012','Equipment',''),
('','4550','','PT-00013','Equipment',''),
('','1450','','PT-00014','Expense',''),
('','1785','','PT-00015','Expense',''),
('','9850','','PT-00016','Equipment',''),
('','5580','','PT-00017','Equipment',''),
('','1250','','PT-00018','Expense',''),
('','13550','','PT-00019','Equipment',''),
('','3650','','PT-00020','Expense',''),
('','7950','','PT-00021','Equipment',''),
('','2250','','PT-00022','Expense',''),
('','2360','','PT-00023','Expense',''),
('','6680','','PT-00024','Equipment',''),
('','6150','','PT-00025','Equipment',''),
('','4250','','PT-00026','Equipment',''),
('','3450','','PT-00027','Expense',''),
('','8750','','PT-00028','Equipment',''),
('','7560','','PT-00029','Equipment',''),
('','7560','','PT-00029','Equipment','');





















-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`membership_payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`membership_payment` (
  `id` VARCHAR(8) NOT NULL,
  `membership_name` VARCHAR(45) NULL,
  `date` DATE NOT NULL DEFAULT '2022-01-01',
  `amount` DECIMAL(11,2) NULL,
  `payment_payment_type_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`, `payment_payment_type_id`),
  CONSTRAINT `fk_membership_payment_payment1`
    FOREIGN KEY ( `payment_payment_type_id`)
    REFERENCES `Fitness_For_Everyone`.`payment_type` ( `payment_type_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_membership_payment_payment1_idx` ON `Fitness_For_Everyone`.`membership_payment` (`payment_id` ASC, `payment_payment_type_id` ASC) VISIBLE;



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



INSERT INTO membership_payment (id,membership_name,amount,date,payment_payment_type_id)
VALUES
('','','','','PT-00001'),
('','','','','PT-00002'),
('','','','','PT-00003'),
('','','','','PT-00004'),
('','','','','PT-00005'),
('','','','','PT-00006'),
('','','','','PT-00007'),
('','','','','PT-00008'),
('','','','','PT-00009'),
('','','','','PT-00010'),
('','','','','PT-00011'),
('','','','','PT-00012'),
('','','','','PT-00013'),
('','','','','PT-00014'),
('','','','','PT-00015'),
('','','','','PT-00016'),
('','','','','PT-00017'),
('','','','','PT-00018'),
('','','','','PT-00019'),
('','','','','PT-00020'),
('','','','','PT-00021'),
('','','','','PT-00022'),
('','','','','PT-00023'),
('','','','','PT-00024'),
('','','','','PT-00025'),
('','','','','PT-00026'),
('','','','','PT-00027'),
('','','','','PT-00028'),
('','','','','PT-00029'),
('','','','','PT-00030'),
('','','','','PT-00031'),
('','','','','PT-00032'),
('','','','','PT-00033'),
('','','','','PT-00034'),
('','','','','PT-00035'),
('','','','','PT-00036'),
('','','','','PT-00037'),
('','','','','PT-00038'),
('','','','','PT-00039'),
('','','','','PT-00040'),
('','','','','PT-00041'),
('','','','','PT-00042'),
('','','','','PT-00043'),
('','','','','PT-00044'),
('','','','','PT-00045'),
('','','','','PT-00046'),
('','','','','PT-00047'),
('','','','','PT-00048'),
('','','','','PT-00049'),
('','','','','PT-00050');


















-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`register`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`register` (
  `id` VARCHAR(8) NOT NULL,
  `date` DATE NOT NULL DEFAULT '2022-01-01',
  `remark` VARCHAR(2000) NULL,
  `reg_fee` DECIMAL(11,2) NULL,
  `membership_id` VARCHAR(8) NOT NULL,
  `membership_payment_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`, `membership_id`, `membership_payment_id`),
  CONSTRAINT `fk_register_membership1`
    FOREIGN KEY (`membership_id`)
    REFERENCES `Fitness_For_Everyone`.`membership` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_register_membership_payment1`
    FOREIGN KEY (`membership_payment_id`)
    REFERENCES `Fitness_For_Everyone`.`membership_payment` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_register_membership1_idx` ON `Fitness_For_Everyone`.`register` (`membership_id` ASC) VISIBLE;

CREATE INDEX `fk_register_membership_payment1_idx` ON `Fitness_For_Everyone`.`register` (`membership_payment_id` ASC) VISIBLE;



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




INSERT INTO register (id,date,remark,reg_fee,membership_id,membership_payment_id)
VALUES
('','','','M-00001','PT-00001'),
('','','','M-00002','PT-00002'),
('','','','M-00003','PT-00003'),
('','','','M-00004','PT-00004'),
('','','','M-00005','PT-00005'),
('','','','M-00006','PT-00006'),
('','','','M-00007','PT-00007'),
('','','','M-00008','PT-00008'),
('','','','M-00009','PT-00009'),
('','','','M-00010','PT-00010'),
('','','','M-00011','PT-00011'),
('','','','M-00012','PT-00012'),
('','','','M-00013','PT-00013'),
('','','','M-00014','PT-00014'),
('','','','M-00015','PT-00015'),
('','','','M-00016','PT-00016'),
('','','','M-00017','PT-00017'),
('','','','M-00018','PT-00018'),
('','','','M-00019','PT-00019'),
('','','','M-00020','PT-00020'),
('','','','M-00021','PT-00021'),
('','','','M-00022','PT-00022'),
('','','','M-00023','PT-00023'),
('','','','M-00024','PT-00024'),
('','','','M-00025','PT-00025'),
('','','','M-00026','PT-00026'),
('','','','M-00027','PT-00027'),
('','','','M-00028','PT-00028'),
('','','','M-00029','PT-00029'),
('','','','M-00030','PT-00030'),
('','','','M-00031','PT-00031'),
('','','','M-00032','PT-00032'),
('','','','M-00033','PT-00033'),
('','','','M-00034','PT-00034'),
('','','','M-00035','PT-00035'),
('','','','M-00036','PT-00036'),
('','','','M-00037','PT-00037'),
('','','','M-00038','PT-00038'),
('','','','M-00039','PT-00039'),
('','','','M-00040','PT-00040'),
('','','','M-00041','PT-00041'),
('','','','M-00042','PT-00042'),
('','','','M-00043','PT-00043'),
('','','','M-00044','PT-00044'),
('','','','M-00045','PT-00045'),
('','','','M-00046','PT-00046'),
('','','','M-00047','PT-00047'),
('','','','M-00048','PT-00048'),
('','','','M-00049','PT-00049'),
('','','','M-00050','PT-00050');





























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
  `register_id` VARCHAR(8) NOT NULL,
  `register_membership_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`, `useraccount_id`, `gender_id`, `register_id`, `register_membership_id`),
  CONSTRAINT `fk_customer_useraccount1`
    FOREIGN KEY (`useraccount_id`)
    REFERENCES `Fitness_For_Everyone`.`useraccount` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_gender1`
    FOREIGN KEY (`gender_id`)
    REFERENCES `Fitness_For_Everyone`.`gender` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_register1`
    FOREIGN KEY (`register_id` , `register_membership_id`)
    REFERENCES `Fitness_For_Everyone`.`register` (`id` , `membership_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_customer_useraccount1_idx` ON `Fitness_For_Everyone`.`customer` (`useraccount_id` ASC) VISIBLE;

CREATE INDEX `fk_customer_gender1_idx` ON `Fitness_For_Everyone`.`customer` (`gender_id` ASC) VISIBLE;

CREATE INDEX `fk_customer_register1_idx` ON `Fitness_For_Everyone`.`customer` (`register_id` ASC, `register_membership_id` ASC) VISIBLE;





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



INSERT INTO register (id,fname,lname,address,telephone,email,dob,doj,useraccount_id,gender_id,register_id,register_membership_id)
VALUES


('','Uchitha','Kosgoda','','0','','','','UA-00019','G-00001','R-00001','M-00001'),
('','Janith','Jayasinghe','','0','','','','UA-00020','G-00001','R-00002','M-00001'),
('','Asitha','Latheef','','0','','','','UA-00021','G-00001','R-00003','M-00001'),
('','Dilan','Sanka','','0','','','','UA-00022','G-00001','R-00005','M-00001'),
('','Sanka','Denuwan','','0','','','','UA-00023','G-00001','R-00006','M-00001'),
('','Dulitha','Amarasinghe','','0','','','','UA-00024','G-00001','R-00007','M-00001'),
('','Punidu','Imesha','','0','','','','UA-00025','G-00001','R-00008','M-00001'),
('','Imesha','Fernando','','0','','','','UA-00026','G-00001','R-00009','M-00001'),
('','Jayesh','Jayasanka','','0','','','','UA-00027','G-00001','R-00010','M-00001'),
('','Ravibandu','Roopasinghe','','0','','','','UA-00028','G-00001','R-00011','M-00001'),
('','Ravindu','Pathirana','','0','','','','UA-00029','G-00001','R-00012','M-00001'),
('','Jayanidu','Jayasanka','','0','','','','UA-00030','G-00001','R-00013','M-00001'),
('','Ravi','Kumudesh','','0','','','','UA-00031','G-00001','R-00014','M-00001'),
('','Kumudu','Pathirana','','0','','','','UA-00032','G-00001','R-00015','M-00001'),
('','Pathirana','Kosgoda','','0','','','','UA-00033','G-00001','R-00016','M-00001'),
('','Malith','Peiris','','0','','','','UA-00034','G-00001','R-00017','M-00001'),
('','Ajith','Niwad','','0','','','','UA-00035','G-00001','R-00018','M-00001'),
('','Shihan','Jayashantha','','0','','','','UA-00036','G-00001','R-00019','M-00001'),
('','Dinesh','Kosgoda','','0','','','','UA-00037','G-00001','R-00020','M-00001'),
('','Ranga','Sameera','','0','','','','UA-00038','G-00001','R-00021','M-00001'),
('','Shirantha','Wijesinghe','','0','','','','UA-00039','G-00001','R-00022','M-00001'),
('','Ranil','Nilukshan','','0','','','','UA-00040','G-00001','R-00023','M-00001'),
('','Uditha','Wijesekara','','0','','','','UA-00041','G-00001','R-00024','M-00001'),
('','Nirosha','Perera','','0','','','','UA-00042','G-00001','R-00025','M-00001'),
('','Suminda','Fernando','','0','','','','UA-00043','G-00001','R-00026','M-00001'),
('','Surindi','Wijeweera','','0','','','','UA-00044','G-00001','R-00027','M-00001'),
('','Diliki','Alwis','','0','','','','UA-00045','G-00001','R-00028','M-00001'),
('','Senuri','Hapugoda','','0','','','','UA-00046','G-00001','R-00029','M-00001');









-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`leave_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`leave_details` (
  `id` VARCHAR(8) NOT NULL ,
  `staff_id` VARCHAR(8) NULL,
  `date` DATE NULL,
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

INSERT INTO salary_details (id,payment,designation)
VALUES('',45000,'Senior Accounts Clerk'),('',35000,'Junior Accounts Clerk'),('',2000,'Senior Instructor'),('',1500,'Junior Instructor');



-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`leave_process`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`leave_process` (
  `id` VARCHAR(8) NOT NULL,
  `staff_id` VARCHAR(8) NULL,
  `staff_member_name` VARCHAR(50) NULL,
  `date` DATE NULL,
  `remark` VARCHAR(2000) NULL,
  `status` VARCHAR(8)  NULL,
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


DELIMITER $$
create trigger leave_process_insert_trigger after insert on leave_details
  for each row
   begin
    insert into leave_process(staff_id, staff_member_name, date, leave_details_id) values (new.staff_id, new.staff_member_name, new.date, new.id);
END$$
DELIMITER ;


DELIMITER $$
create trigger leave_process_update_trigger after update on leave_details
  for each row
   begin
    insert into leave_process(staff_id, staff_member_name, date, leave_details_id) values (new.staff_id, new.staff_member_name, new.date, new.id);
END$$
DELIMITER ;

DELIMITER $$
create trigger leave_process_delete_trigger after DELETE  on leave_details
  for each row
   begin
  
    delete from leave_process where id=OLD.id;


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
  `name` VARCHAR(45) NULL,
  `status` VARCHAR(8) NULL,
  `remark` VARCHAR(2000) NULL,
  `cost` DECIMAL(11,2) NULL,
  `purchased_date` DATE NULL,
  `vendor_name` VARCHAR(45) NULL,
  `quantity` INT NULL,
  `vendor_id` VARCHAR(8) NOT NULL,
  `payment_id` VARCHAR(8) NOT NULL,
  `payment_payment_type_id` VARCHAR(8) NOT NULL,
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
  `id` VARCHAR(8) NOT NULL,
  `date` DATE NULL,
  `intime` TIME NULL,
  `outtime` TIME NULL,
  `staff_id` VARCHAR(8) NOT NULL,
  `staff_designation_id` VARCHAR(8) NOT NULL,
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
  SET NEW.id = CONCAT('A-', LPAD(LAST_INSERT_ID(), 5, '0'));
END$$
DELIMITER ;





-- -----------------------------------------------------
-- Table `Fitness_For_Everyone`.`salary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fitness_For_Everyone`.`salary` (
  `id` VARCHAR(8) NOT NULL,
  `date` DATE NULL,
  `remark` VARCHAR(2000) NULL,
  `deduction` DECIMAL(11,2) NULL,
  `incentives` DECIMAL(11,2) NULL,
  `salary_details_id` VARCHAR(9) NOT NULL,
  `attendance_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`, `salary_details_id`, `attendance_id`),
  CONSTRAINT `fk_salary_salary_details1`
    FOREIGN KEY (`salary_details_id`)
    REFERENCES `Fitness_For_Everyone`.`salary_details` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_salary_attendance1`
    FOREIGN KEY (`attendance_id`)
    REFERENCES `Fitness_For_Everyone`.`attendance` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_salary_salary_details1_idx` ON `Fitness_For_Everyone`.`salary` (`salary_details_id` ASC) VISIBLE;

CREATE INDEX `fk_salary_attendance1_idx` ON `Fitness_For_Everyone`.`salary` (`attendance_id` ASC) VISIBLE;





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
  `remark` VARCHAR(45) NULL,
  `amount` DECIMAL(11,2) NULL,
  `payment` VARCHAR(45) NULL,
  `customer_name` VARCHAR(45) NULL,
  `customer_id` VARCHAR(8) NULL,
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
  `amount` DECIMAL(11,2) NULL,
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
  `month` VARCHAR(45) NULL,
  `details` VARCHAR(45) NULL,
  `amount` DECIMAL(11,2) NULL,
  `payment_id` VARCHAR(8) NOT NULL,
  `payment_payment_type_id` VARCHAR(8) NOT NULL,
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
















SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

