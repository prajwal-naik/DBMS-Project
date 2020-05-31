USE COVID19;
DELIMITER $$
CREATE TRIGGER CONTACT_INSERT
AFTER INSERT
ON CONTACTS FOR EACH ROW
BEGIN 
	IF NEW.test=1 THEN
    	INSERT INTO PATIENTS(name, address, gender, phone, tested_on, discharged, ward_no)
        VALUES(new.name, new.address, new.gender, new.phone, CURDATE(), NULL, new.ward);
    END IF;
END $$


DELIMITER $$
CREATE TRIGGER CONTACT_UPDATE
AFTER INSERT
ON CONTACTS FOR EACH ROW
BEGIN 
	IF NEW.test=1 THEN
    	INSERT INTO PATIENTS(name, address, gender, phone, tested_on, discharged, ward_no)
        VALUES(new.name, new.address, new.gender, new.phone, CURDATE(), NULL, new.ward);
    END IF;
END $$


