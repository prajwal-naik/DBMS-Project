USE COVID19;
INSERT INTO COUNTRY VALUES
(101, "China"),
(102, "France"),
(103, "USA"),
(104, "Spain"),
(105, "UK"),
(106,"Canada"),
(107, "Italy");


INSERT INTO WARD VALUES
(1, "Dasarahalli"),
(2, "Byatrayanapura"),
(3, "Banashankari"),
(4, "Jayanagar"),
(5, "Yeshwantpur");


INSERT INTO HOSPITAL VALUES
(1, "Victoria Hospital", "Fort Rd, near City Market, New Tharagupet", 3),
(2, "Columbia Asia Hospital", "Brigade Gateway", 5),
(3, "Apollo Speciality Hospital", "100ft Road, near St. Thomas Church", 1),
(4, "People Tree Hospital", "Outer ring road, Gorguntepalya", 2),
(5, "Fortis Speciality Hospital", "2nd cross, Majestic", 4),
(6, "Jayadeva Healthcare Center", "Silkboard Junction", 5),
(7, "Om Multispeciality Hospital", "3rd Main Road, KR Circle", 3);


INSERT INTO PATIENTS VALUES
(1001, "Pablo Escobar", "21, 2nd cross, Crubs Road", "M", "9834721811", "2020-02-12", "2020-04-17", 3, 2),
(1002, "Robert Mugabe", "A003, Monarch Apartments, Dunhill Circle", "M", "972611811", "2020-03-21", NULL, 5, 1),
(1003, "Muyammar Gadaffi", "4, Libyan Street, KR Market", "M", "8294221811", "2020-01-21", "2020-2-19", 4, 6),
(1004, "Jiang Quing", "G12, Mosque Road, Jayanagar", "F", "9834712223", "2020-04-22", NULL, 1, 2),
(1005, "Ramamurthy Gowda", "772, Muniswamy Layout, Crubs Road", "M", "9887237811", "2020-01-02", NULL, 2, 5),
(1006, "Judy Agarwal", "22, Church Street", "F", "9834219231", "2020-02-18", "2020-03-29", 4, 7),
(1007, "Ria Kapoor", "44, Raja Apartments, Jayanagar", "F", "9863201811", "2020-02-14", NULL, 4, 4),
(1008, "Hermano Juan", "76, Lakshmi Layout, Mahadevpura", "M", "9212221811", "2020-05-09", NULL, 5, 3),
(1009, "Ramesh Ramore", "B321, Jayashree Nilaya, Sitaramnagar", "M", "9137741811", "2020-02-11", "2020-04-17", 4, 3),
(1010, "Monica Gaztambide", "56, Jacob's Creek, Zumba Road", "M", "9834918831", "2020-03-05", NULL, 1, 5);


INSERT INTO CONTACTS VALUES
(1, "Arya Stark", "34, Jacob Road, Nelamangala", "F", "8727176368", 3, 3,0),
(2, "Rob Stark", "Zulu Market Road, RT Nagar", "M", "8798157368", 5, 2, 0),
(3, "Maisy Williams", "21 Ranna Road, Hebbal", "F", "8726615638", 1, 2, 0),
(4, "Milana James", "32 Razo Mansion, Mekhri Circle", "M", "8721837268", 5, 1, 0),
(5, "Sake Choo", "23, Steeler Circle Road, Jodhpur", "F", "8727192761", 4, 1, 0);


INSERT INTO PATIENT_CONTACTS VALUES
(1001, 4, "2020-03-14"), 
(1003, 1, "2020-04-12"), 
(1002, 1, "2020-03-14"), 
(1007, 5, "2020-04-02");


INSERT INTO SECONDARY_CONTACTS VALUES
(5, 2, "2020-04-01"),
(4, 3, "2020-03-12"),
(3, 1, "2020-03-13");



INSERT INTO TRAVEL_HISTORY VALUES
(1004, 103, "2020-04-20"),
(1003, 101, "2019-12-25"),
(1006, 105, "2020-02-10"),
(1010, 107, "2020-03-01"),
(1002, 104, "2020-03-01"),
(1002, 101, "2020-03-18");


