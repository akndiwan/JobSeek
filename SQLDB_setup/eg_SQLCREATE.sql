CREATE TABLE [Company](
cID NUMERIC(3) NOT NULL,
cName VARCHAR(30)
CONSTRAINT pk_Company_cID PRIMARY  KEY (cID));

CREATE TABLE [Location](
locID  NUMERIC(3) NOT NULL,
state CHAR(20),
city CHAR(10),
zipcode NUMERIC(5),
CONSTRAINT pk_Location_locID PRIMARY KEY (locID) );

CREATE TABLE [Student] (
sID NUMERIC(9) NOT NULL, 
uID NUMERIC(3), 
fName VARCHAR(20),
lName varchar(20),
gender char(1),
        address varchar(30),
phoneNo NUMERIC(10),
gpa decimal(2,1), 
gradYear NUMERIC(4), 
workAuth varchar(10),
seeksFor varchar(30),
CONSTRAINT pk_Student_sID PRIMARY KEY (sID),
CONSTRAINT fk_Student_uID FOREIGN KEY (uID)
    REFERENCES [University] (uID)
        ON DELETE CASCADE ON UPDATE NO ACTION  );

CREATE TABLE [Position](
pID NUMERIC(3) NOT NULL,
locID NUMERIC(3),
cID NUMERIC(3),
workAuthReq VARCHAR(20), 
Type VARCHAR(20),
PositionName VARCHAR(30)
CONSTRAINT pk_Position_pID PRIMARY  KEY (pID),
CONSTRAINT fk_Position_locID FOREIGN KEY (locID)
    REFERENCES [Location] (locID)
        ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT fk_Position_cID FOREIGN KEY (cID)
    REFERENCES [Company] (cID)
        ON DELETE CASCADE ON UPDATE NO ACTION );

CREATE TABLE [Applies](
        sID NUMERIC(9),
        pID NUMERIC(3),
CONSTRAINT fk_Applies_pID FOREIGN KEY (pID)
    REFERENCES [Position] (pID)
        ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT fk_Applies_sID FOREIGN KEY (sID)
    REFERENCES [Student] (sID)
        ON DELETE CASCADE ON UPDATE NO ACTION );

CREATE TABLE [Skills]( 
skillID NUMERIC(3) NOT NULL, 
pID NUMERIC(3),
skillName VARCHAR(20),
CONSTRAINT pk_Skills_skillID PRIMARY KEY (skillID),
CONSTRAINT fk_Skills_pID FOREIGN KEY (pID)
    REFERENCES [Position] (pID) 
ON DELETE NO ACTION ON UPDATE NO ACTION);


CREATE TABLE [University] (
uID NUMERIC(3) NOT NULL,    
uName varchar(40),    
uLoc varchar(40),  
CONSTRAINT pk_University_uID PRIMARY  KEY (uID) );
