--1 table branch
CREATE TABLE Branch (
    branchNo CHAR(4) PRIMARY KEY,
    street VARCHAR(30),
    city VARCHAR(20),
    postcode VARCHAR(10)
);

INSERT INTO Branch (branchNo, street, city, postcode)
VALUES
('B005' , '22 Deer Rd', 'London', 'SW1 4EH'),
('B007', '16 Argyll St', 'berdeen', 'AB2 3SU'),
('B003', '163 Main St', 'Glasgow', 'G11 9QX'),
('B004', '32 Manse Rd', 'Bristol', 'B5599 INZ'),
('B002', '56 Cllover Dr', 'Lomdon', 'NW10 6EU')
    
SELECT * FROM branch;

--2 table staff
CREATE TABLE Staff (
    staffNo CHAR(5) PRIMARY KEY,
    fName VARCHAR(15),
    lName VARCHAR(15),
    position VARCHAR(15),
    sex CHAR(1),
    DOB VARCHAR(20),
    salary NUMERIC(8,2),
    branchNo CHAR(4),
    FOREIGN KEY (branchNo) REFERENCES Branch(branchNo)
);

INSERT INTO Staff
(staffNo, fName, lName, position, sex, DOB, salary, branchNo)
VALUES
('SL21' , 'John', 'White', 'Manager', 'M', '1-Okt-45', 30000, 'B005'),
('SG37', 'Ann', 'Beech', 'Assistant', 'F', '10-Nov-60', 12000, 'B003'),
('SG14', 'David', 'Fond', 'Supervisor', 'M', '26-May-58', 18000, 'B003'),
('SA9', 'Mary', 'Howe', 'Assistant', 'F', '19-FEb-70', 9000, 'B007'),
('SG5', 'Susan', 'brand', 'Manager', 'F', '5-Jun-40', 24000, 'B003'),
('SL41', 'Julie', 'Lee', 'Assistant', 'F', '13-Jun-63', 9000, 'B005');

SELECT * FROM staff;

--3 table property for rent
CREATE TABLE PropertyForRent (
    propertyNo CHAR(4) PRIMARY KEY,
    street VARCHAR(30),
    city VARCHAR(20),
    postcode VARCHAR(10),
    type VARCHAR(10),
    rooms INT,
    rent NUMERIC(8,2),
    ownerNo CHAR(4),
    staffNo CHAR(5),
    branchNo CHAR(4)
);

INSERT INTO PropertyForRent
(propertyNo, street, city, postcode, type, rooms, rent, ownerNo, staffNo, branchNo)
VALUES
('PA14', '16 Holhead', 'Aberdeen', 'AB7 5SU', 'House', 6, 650, 'CO46', 'SA9', 'B007'),
('PL94', '6 Argyll St', 'London', 'NW2', 'Flat', 4, 400, 'CO87', 'SL41', 'B005'),
('PG4', '6 Lawrence St', 'Glasgow', 'G11 9QX', 'Flat', 3, 350, 'CO40', NULL, 'B003'),
('PG36', '2 Manor Rd', 'Glasgow', 'G32 4QX', 'Flat', 3, 375, 'CO93', 'SG37', 'B003'),
('PG21', '18 Dale Rd', 'Glasgow', 'G12', 'House', 5, 600, 'CO87', 'SG37', 'B003'),
('PG16', '5 Novar Dr', 'Glasgow', 'G12 9AX', 'Flat', 4, 450, 'CO93', 'SG14', 'B003');

SELECT * FROM PropertyForRent;

--4 table client
CREATE TABLE Client (
    clientNo CHAR(4) PRIMARY KEY,
    fName VARCHAR(15),
    lName VARCHAR(15),
    telNo VARCHAR(15),
    prefType VARCHAR(10),
    maxRent NUMERIC(8,2),
);

INSERT INTO Client
(clientNo, fName, lName, telNo, prefType, maxRent)
VALUES
('CR76', 'John', 'Kay', '0207-774-5632', 'Flat', 425),
('CR56', 'Aline', 'Stewart', '0141-848-1825', 'Flat', 350),
('CR74', 'Mike', 'Ritchie', '01475-392178', 'House', 750),
('CR62', 'Mary', 'Treggar', '01224-196720', 'Flat', 600);

SELECT * From client;

--5 table private owner
CREATE TABLE PrivateOwner (
    ownerNo CHAR(4) PRIMARY KEY,
    fName VARCHAR(15),
    lName VARCHAR(15),
    address VARCHAR(50),
    telNo VARCHAR(15),
);

INSERT INTO PrivateOwner
(ownerNo, fName, lName, address, telNo)
VALUES
('CO46', 'Joe', 'Keogh', '2 Fergus Dr, Aberdeen AB2 7SX', '01224-861212'),
('CO87', 'Carol', 'Farrel', '6 Achray St, Glasgow G32 9DX', '0141-357-7419'),
('CO40', 'Tina', 'Murphy', '63 Well St, Glasgow G42', '0141-943-1728'),
('CO93', 'Tony', 'Shaw', '12 Park Pl, Glasgow G4 0QR', '0141-225-7025');

SELECT * From client;

--6 table viewing
CREATE TABLE Viewing (
    clientNo CHAR(4),
    propertyNo CHAR(4),
    viewDate DATE,
    comment VARCHAR(50),
    PRIMARY KEY (clientNo, propertyNo),
    FOREIGN KEY (clientNo) REFERENCES Client(clientNo),
    FOREIGN KEY (propertyNo) REFERENCES PropertyForRent(propertyNo)
);

INSERT INTO Viewing
(clientNo, propertyNo, viewDate, comment)
VALUES
('CR56', 'PA14', '2004-05-24', 'too small'),
('CR76', 'PG4', '2004-04-20', 'too remote'),
('CR56', 'PG4', '2004-05-26', NULL),
('CR62', 'PA14', '2004-05-14', 'no dining room'),
('CR56', 'PG36', '2004-04-28', NULL);

SELECT * From viewing;


-- 7 table regstration
CREATE TABLE Registration (
    clientNo CHAR(4),
    branchNo CHAR(4),
    staffNo CHAR(5),
    dateJoined DATE,
    PRIMARY KEY (clientNo, branchNo),
    FOREIGN KEY (clientNo) REFERENCES Client(clientNo),
    FOREIGN KEY (branchNo) REFERENCES Branch(branchNo),
    FOREIGN KEY (staffNo) REFERENCES Staff(staffNo)
);


INSERT INTO Registration
(clientNo, branchNo, staffNo, dateJoined)
VALUES
('CR76', 'B005', 'SL41', '2004-01-02'),
('CR56', 'B003', 'SG37', '2003-04-11'),
('CR74', 'B003', 'SG37', '2002-11-16'),
('CR62', 'B007', 'SA9', '2003-03-07');

SELECT * From registration;

