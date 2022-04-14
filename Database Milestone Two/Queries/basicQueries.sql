
SELECT passengerID , passFName FROM Passenger WHERE passFName LIKE "A%" ;

SELECT ticketID , fare FROM Ticket WHERE fare BETWEEN 1000 AND 1500 ; 

SELECT ticketID , destination FROM Ticket WHERE destination IN ("JED" , "DMM") ; 

SELECT cID , Dname , birthdate FROM Dependent ORDER BY birthdate ; 

SELECT passengerID , flightID , foodPreference FROM Ticket WHERE foodPreference IS NOT NULL ;