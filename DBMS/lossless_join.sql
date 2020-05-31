USE COVID19;
CREATE TABLE MASTER_PATIENT
(
    p_id int PRIMARY KEY AUTO_INCREMENT, 
    name varchar(30) NOT NULL,
    address varchar(100),
    gender char,
    phone VARCHAR(10) NOT NULL,
    tested_on date NOT NULL,
    discharged date, 
    ward_no int NOT NULL,
    h_no int NOT NULL DEFAULT 1,
    h_name varchar(30) NOT NULL,
    h_address varchar(100),
    h_ward int NOT NULL,
    FOREIGN KEY(ward_no) REFERENCES WARD(ward_no)
        ON DELETE RESTRICT      ON UPDATE CASCADE,
    FOREIGN KEY(h_ward) REFERENCES WARD(ward_no)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO MASTER_PATIENT VALUES
(1001, "Pablo Escobar", "21, 2nd cross, Crubs Road", "M", "9834721811", "2020-02-12", "2020-04-17", 3, 2, "Columbia Asia Hospital", "Brigade Gateway", 5),
(1002, "Robert Mugabe", "A003, Monarch Apartments, Dunhill Circle", "M", "972611811", "2020-03-21", NULL, 5, 1, "Victoria Hospital", "Fort Rd, near City Market, New Tharagupet", 3),
(1003, "Muyammar Gadaffi", "4, Libyan Street, KR Market", "M", "8294221811", "2020-01-21", "2020-2-19", 4, 6, "Jayadeva Healthcare Center", "Silkboard Junction", 5),
(1004, "Jiang Quing", "G12, Mosque Road, Jayanagar", "F", "9834712223", "2020-04-22", NULL, 1, 2, "Columbia Asia Hospital", "Brigade Gateway", 5),
(1005, "Ramamurthy Gowda", "772, Muniswamy Layout, Crubs Road", "M", "9887237811", "2020-01-02", NULL, 2, 5, "Fortis Speciality Hospital", "2nd cross, Majestic", 4),
(1006, "Judy Agarwal", "22, Church Street", "F", "9834219231", "2020-02-18", "2020-03-29", 4, 7, "Om Multispeciality Hospital", "3rd Main Road, KR Circle", 3),
(1007, "Ria Kapoor", "44, Raja Apartments, Jayanagar", "F", "9863201811", "2020-02-14", NULL, 4, 4, "People Tree Hospital", "Outer ring road, Gorguntepalya", 2),
(1008, "Hermano Juan", "76, Lakshmi Layout, Mahadevpura", "M", "9212221811", "2020-05-09", NULL, 5, 3, "Apollo Speciality Hospital", "100ft Road, near St. Thomas Church", 1),
(1009, "Ramesh Ramore", "B321, Jayashree Nilaya, Sitaramnagar", "M", "9137741811", "2020-02-11", "2020-04-17", 4, 3, "Apollo Speciality Hospital", "100ft Road, near St. Thomas Church", 1),
(1010, "Monica Gaztambide", "56, Jacob's Creek, Zumba Road", "M", "9834918831", "2020-03-05", NULL, 1, 5, "Fortis Speciality Hospital", "2nd cross, Majestic", 4);


SELECT 
    h_no, 
    p_id, 
    name, 
    address, 
    gender, 
    phone, 
    tested_on, 
    discharged, 
    ward_no, 
    h_name, 
    h_address, 
    h_ward 
FROM 
    MASTER_PATIENT
EXCEPT
SELECT 
    * 
FROM 
(
    PATIENTS NATURAL JOIN HOSPITAL
);