DELIMITER //
CREATE PROCEDURE CancelBooking(IN BookingId INT)
BEGIN
	DELETE FROM bookings b
    WHERE Id = BookingId;
    
    SELECT CONCAT("Booking with id ", BookingId, " was cancelled") as Confirmation;
END //
DELIMITER ;

CALL CancelBooking(13);