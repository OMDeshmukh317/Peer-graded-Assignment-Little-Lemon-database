-- honestly, to create a valid booking we need a customer, not only date and table no

DELIMITER //

CREATE FUNCTION GetCustomer(ClientFirstName VARCHAR(100), ClientLastName VARCHAR(100), ClientPhone INT)
RETURNS INT DETERMINISTIC
RETURN (
SELECT Id FROM Customer c 
    WHERE c.FirstName = ClientFirstName AND c.LastName = ClientLastName AND c.Phone = ClientPhone
    LIMIT 1
);

CREATE PROCEDURE AddValidBooking(IN BookingDateTime DATETIME,
	IN TableNumber INT,
    IN ClientFirstName VARCHAR(100),
    IN ClientLastName VARCHAR(100),
    IN ClientPhone INT)
BEGIN
	DECLARE ClientId INT;
	DECLARE bookingsCount INT;
	DECLARE result VARCHAR(100);

	START TRANSACTION;
	
    SET ClientId = GetCustomer(ClientFirstName, ClientLastName, ClientPhone);
    IF ClientId IS NULL
		THEN INSERT INTO Customer(FirstName, LastName, Phone) VALUES (ClientFirstName, ClientLastName, ClientPhone);
        SET ClientId = GetCustomer(ClientFirstName, ClientLastName, ClientPhone);
	END IF;
    
    SELECT COUNT(b.Id) INTO bookingsCount FROM Bookings b 
        WHERE b.Date > DATE_SUB(BookingDateTime, INTERVAL 1 HOUR) 
        AND b.Date < DATE_ADD(BookingDateTime, INTERVAL 2 HOUR) 
        AND b.TableNumber = TableNumber;
    
    IF bookingsCount > 0
		THEN SET result = CONCAT("Table ", TableNumber, " is taken during this timeslot: ", BookingDateTime);
        ROLLBACK;
	ELSE     
		INSERT INTO Bookings(Date, TableNumber, Customer_Id) VALUES (BookingDateTime, TableNumber, ClientId);
		SET result = CONCAT("Table ", TableNumber, " is free for this timeslot: ", BookingDateTime, ". Booking created successfully");
        COMMIT;  
	END IF;
    
	SELECT result;
    
END//

DELIMITER ;

CALL AddValidBooking("2023-11-02 21:00:00", 1, "Johanna", "Moore", 66677778);
select * from customer;