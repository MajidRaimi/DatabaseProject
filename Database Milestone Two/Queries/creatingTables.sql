CREATE TABLE Pilot (
    pilotID INT PRIMARY KEY , 
    pilotFName VARCHAR(24) NOT NULL , 
    pilotLName VARCHAR(24) NOT NULL , 
    pilotLicense VARCHAR(128) NOT NULL ,
    flightID VARCHAR(24) NOT NULL , 
    designation VARCHAR(48) NOT NULL , 
    contactNumber INT NOT NULL  
) ; 

CREATE TABLE Airline (
    manufacturer VARCHAR(48) NOT NULL , 
    modelNumber VARCHAR(48) NOT NULL , 
    airlineID INT PRIMARY KEY , 
    aeroplaneID VARCHAR(24) NOT NULL 
) ; 

CREATE TABLE Flight (
    flightID INT PRIMARY KEY , 
    airplaneID INT NOT NULL , 
    departureDate DATE NOT NULL , 
    departureTime TIME NOT NULL , 
    arrivalDate DATE NOT NULL , 
    arrivalTime TIME NOT NULL ,  
    fromFlight VARCHAR(48) NOT NULL , 
    toFlight VARCHAR(48) NOT NULL , 
    po_ssn INT NOT NULL
) ; 


CREATE TABLE Passenger (
    passengerID INT PRIMARY KEY ,
    passFName VARCHAR(24) NOT NULL , 
    passLName VARCHAR(24) NOT NULL , 
    emailAddress VARCHAR(24) NOT NULL ,
    maillingAddress VARCHAR(24) NOT NULL ,
    contactNumber INT NOT NULL ,
    frequentFlyeNumber INT NOT NULL ,
    flightID INT NOT NULL , 

    FOREIGN KEY(flightID) REFERENCES Flight(flightID)  ON DELETE CASCADE ON UPDATE CASCADE 
) ; 

-- Add haSSN As A Foreign Key  

CREATE TABLE BoardingPass (
    boardID INT PRIMARY KEY , 
    haSSN INT NOT NULL , 
    flightID INT NOT NULL , 

    FOREIGN KEY(haSSN) REFERENCES Passenger(passengerID) ON DELETE CASCADE ON UPDATE CASCADE , 
    FOREIGN KEY(flightID) REFERENCES Flight(flightID)  ON DELETE CASCADE ON UPDATE CASCADE  
) ; 


CREATE TABLE Ticket (
    ticketID INT PRIMARY KEY , 
    passengerID INT NOT NULL ,
    flightID INT NOT NULL ,
    origin VARCHAR(48) NOT NULL ,
    destination VARCHAR(48) NOT NULL ,
    fare VARCHAR(48) NOT NULL ,
    currency VARCHAR(3) NOT NULL ,
    invoiceNumber VARCHAR(12) , 
    foodPreference VARCHAR(24) , 
    getsSSN INT NOT NULL , 

    FOREIGN KEY(getsSSN) REFERENCES BoardingPass(boardID) ON DELETE CASCADE ON UPDATE CASCADE 
) ; 


CREATE TABLE CrewMember (
    crewID INT PRIMARY KEY , 
    flightID INT NOT NULL , 
    cFName VARCHAR(24) NOT NULL , 
    cMName VARCHAR(24) NOT NULL ,
    cLName VARCHAR(24) NOT NULL ,
    conNumber INT NOT NULL , 
    destination VARCHAR(48) NOT NULL ,

    FOREIGN KEY(flightID) REFERENCES Flight(flightID) ON DELETE CASCADE ON UPDATE CASCADE 

) ; 

CREATE TABLE Dependent (
    cID INT PRIMARY KEY ,
    Dname VARCHAR(24) NOT NULL ,
    relationship VARCHAR(12) NOT NULL , 
    birthdate DATE NOT NULL , 

    FOREIGN KEY(cID) REFERENCES CrewMember(crewID) ON DELETE CASCADE ON UPDATE CASCADE 
) 

CREATE TABLE UseTable (
    airlineID INT NOT NULL ,
    flightID INT NOT NULL , 

    FOREIGN KEY(airlineID) REFERENCES Airline(airlineID) ON DELETE CASCADE ON UPDATE CASCADE , 
    FOREIGN KEY(flightID) REFERENCES Flight(flightID)  ON DELETE CASCADE ON UPDATE CASCADE 

) ;
