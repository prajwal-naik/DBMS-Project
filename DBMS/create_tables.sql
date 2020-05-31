CREATE DATABASE COVID19;
USE COVID19;


CREATE TABLE COUNTRY(
    country_id int NOT NULL,
    country_name varchar(30) NOT NULL,
    PRIMARY KEY(country_id)
);


CREATE TABLE WARD(
    ward_no int NOT NULL PRIMARY KEY,
    ward_name VARCHAR(30) NOT NULL
);


CREATE TABLE HOSPITAL(
    h_no int PRIMARY KEY,
    h_name varchar(30) NOT NULL,
    h_address varchar(100),
    h_ward int NOT NULL,
    FOREIGN KEY(h_ward) REFERENCES WARD(ward_no)
        ON DELETE RESTRICT ON UPDATE CASCADE
);
    

CREATE TABLE PATIENTS(
    p_id int PRIMARY KEY AUTO_INCREMENT, 
    name varchar(30) NOT NULL,
    address varchar(100),
    gender char,
    phone VARCHAR(10) NOT NULL,
    tested_on date NOT NULL,
    discharged date, 
    ward_no int NOT NULL,
    h_no int NOT NULL DEFAULT 1,
    FOREIGN KEY(ward_no) REFERENCES WARD(ward_no)
        ON DELETE RESTRICT      ON UPDATE CASCADE,
    FOREIGN KEY(h_no) REFERENCES HOSPITAL(h_no)
        ON DELETE RESTRICT    ON UPDATE CASCADE
);


CREATE TABLE TRAVEL_HISTORY(
    patient_id int NOT NULL,
    country_id int NOT NULL,
    arrival_date date,
    PRIMARY KEY(patient_id, country_id),
    FOREIGN KEY(patient_id) REFERENCES PATIENTS(p_id)
        ON DELETE RESTRICT      ON UPDATE CASCADE,
    FOREIGN KEY(country_id) REFERENCES COUNTRY(country_id)
        ON DELETE RESTRICT      ON UPDATE CASCADE
);


CREATE TABLE CONTACTS(
    contact_id int PRIMARY KEY,
    name varchar(30) NOT NULL,
    address varchar(100) NOT NULL,
    gender char,
    phone VARCHAR(10) NOT NULL,
    ward int,
    type_of_contact int(1) NOT NULL,
    test int NOT NULL,
    FOREIGN KEY(ward) REFERENCES WARD(ward_no)
        ON DELETE RESTRICT     ON UPDATE CASCADE,
    CONSTRAINT chk_phone 
    	CHECK (phone NOT LIKE '%[^0-9]%'),
	CONSTRAINT chk_type 
    	CHECK (type_of_contact=1 or type_of_contact=2 or type_of_contact=3),
    CONSTRAINT chk_test 
    	CHECK (test=0 or test=1)
);
    

CREATE TABLE PATIENT_CONTACTS(
    patient_id int NOT NULL,
    contact_id int NOT NULL,
    contact_date date NOT NULL,
    PRIMARY KEY(patient_id, contact_id),
    FOREIGN KEY(patient_id) REFERENCES PATIENTS(p_id)
        ON DELETE RESTRICT   ON UPDATE CASCADE,
    FOREIGN KEY(contact_id) REFERENCES CONTACTS(contact_id)
        ON DELETE CASCADE       ON UPDATE CASCADE
);


CREATE TABLE SECONDARY_CONTACTS(
    contact_id_1 int NOT NULL,
    contact_id_2 int NOT NULL,
    contact_date date NOT NULL,
    PRIMARY KEY(contact_id_1, contact_id_2),
    FOREIGN KEY(contact_id_1) REFERENCES CONTACTS(contact_id)
        ON DELETE CASCADE   ON UPDATE CASCADE,
    FOREIGN KEY(contact_id_2) REFERENCES CONTACTS(contact_id)
        ON DELETE CASCADE   ON UPDATE CASCADE
);

