CREATE TABLE BRANCH (
branchNo varchar(80) PRIMARY KEY, 
street varchar(80),
city varchar (80),
postcode varchar (80)
)


INSERT INTO Branch (branchNo, street, city, postcode)
VALUES
('B005' , '22 Deer Rd', 'London', 'SW1 4EH'),
('B007', '16 Argyll St', 'berdeen', 'AB2 3SU'),
('B003', '163 Main St', 'Glasgow', 'G11 9QX'),
('B004', '32 Manse Rd', 'Bristol', 'B5599 INZ'),
('B002', '56 Cllover Dr', 'Lomdon', 'NW10 6EU')
    
SELECT * FROM branch;

CREATE TABLE staff (
staff_no varchar(80) PRIMARY KEY, 
f_name varchar (80),
l_name varchar (80),
sex varchar (80),
position varchar (80),
DOB varchar (80),
salary int
FOREIGN KEY (branchNo) REFERENCES Branch(branchNo)
)


INSERT INTO staff (staff_no,f_name, l_name, position, sex, DOB, salary) VALUES
('SL21' , 'John', 'White', 'Manager', 'M', "1-Okt-45", 30000),
('SG37', 'Ann', 'Beech', 'Assistant', 'F', "10-Nov-60", 12000),
('SG 14', 'David', 'Fond', 'Supervisor', 'M', "26-May-58", 18000),
('SA9', 'Mary', 'Howe', 'Assistant', 'F', "19-FEb-70", 9000),
('SG5', 'Susan', 'brand', 'Manager', 'F', "5-Jun-40", 24000),
('SL41', 'Julie', 'Lee', 'Assistant', 'F', "13-Jun-63", 9000);
;

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


CREATE TABLE Client (
    clientNo CHAR(4) PRIMARY KEY,
    fName VARCHAR(15),
    lName VARCHAR(15),
    telNo VARCHAR(15),
    prefType VARCHAR(10),
    maxRent NUMERIC(8,2),
    eMail VARCHAR(50)
);

CREATE TABLE PrivateOwner (
    ownerNo CHAR(4) PRIMARY KEY,
    fName VARCHAR(15),
    lName VARCHAR(15),
    address VARCHAR(50),
    telNo VARCHAR(15),
    eMail VARCHAR(50),
    password VARCHAR(40)
);
