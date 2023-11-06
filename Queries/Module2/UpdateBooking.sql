DELIMITER //
CREATE PROCEDURE UpdateBooking(IN BookingId INT, IN BookingDate datetime)
BEGIN
	UPDATE bookings b
    SET b.Date = BookingDate
    WHERE Id = BookingId;
    
    SELECT CONCAT("Booking with id ", BookingId, " was updated") as Confirmation;
END //
DELIMITER ;

CALL UpdateBooking(13, "2023-11-05 18:10:00");