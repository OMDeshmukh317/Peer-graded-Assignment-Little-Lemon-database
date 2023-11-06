DELIMITER //
CREATE PROCEDURE AddBooking(
	IN BookingId INT,
	IN CustomerId INT,
	IN TableNumber INT,
	IN BookingDate DATETIME)
BEGIN
	INSERT INTO Bookings(Id, Date, TableNumber, Customer_Id) 
    VALUES (BookingId, BookingDate, TableNumber, CustomerId);
    SELECT "New booking added" as Confirmation;
END//
DELIMITER ;

CALL AddBooking(13, 3, 4, "2023-11-05 17:20:00");
    