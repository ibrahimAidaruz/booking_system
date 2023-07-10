-- Task 1
CREATE TABLE bookings 
	(BookingID INT NOT NULL AUTO_INCREMENT,
     BookingDate DATE NOT NULL,
     TableNumber INT NOT NULL,
     CustomerID INT NOT NULL,
     PRIMARY KEY ( BookingID),
     FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID));
     
INSERT INTO bookings (bookingDate, TableNumber, CustomerID)
VALUES 
	('2020-10-2', 1,1),
    ('2020-08-6', 2,2),
    ('2020-09-7', 5,1);

SELECT * from bookings;

-- task 2

DELIMITER $$
CREATE PROCEDURE checkBooking ( BookingDate Date, TableNumber INT)
BEGIN
SELECT * FROM bookings where BookingDate = BookingDate AND TableNumber = TableNumber ;
END$$
DELIMITER ;

DROP PROCEDURE checkBooking;
CALL checkBooking ('2020-10-2', 1);

-- TASK 4

DELIMITER $$
CREATE PROCEDURE addBooking (BookingID INT, BookingDate Date, TableNumber INT, CustomerID INT)
INSERT INTO bookings (bookingDate, TableNumber, CustomerID)
VALUES 
	('2020-10-2', 1,1)
DELIMITER ;

DROP PROCEDURE addBooking;
CALL addBooking (1,'2020-10-2', 6, 3);

select * From Bookings;

-- TASK 5

DELIMITER $$
CREATE PROCEDURE updateBooking (BookingID INT, BookingDate Date, TableNumber INT, CustomerID INT)
UPDATE booking
SET BookingDate = BookingDate, TableNumber=TableNumber, CustomerID = CustomerID
WHERE BookingID = BookingID;
DELIMITER ;

DROP PROCEDURE updateBooking;
CALL addBooking (1,'2020-10-2', 6, 3);

-- TASK 6
DELIMITER $$
CREATE PROCEDURE cancelBooking (BookingID INT)
DELETE FROM booking
WHERE BookingID = BookingID;
DELIMITER ;

DROP PROCEDURE cancelBooking;
CALL cancelBooking (1,'2020-10-2', 6, 3);