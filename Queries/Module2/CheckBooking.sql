DELIMITER //
CREATE PROCEDURE CheckBooking(IN BookingDateTime DATETIME, IN TableNo INT)
BEGIN
	DECLARE bookingExists BOOL;
	DECLARE result VARCHAR(200);
	SET bookingExists = EXISTS(SELECT b.Id FROM Bookings b WHERE b.Date = BookingDateTime AND b.TableNumber = TableNo);

	IF bookingExists = true 
		THEN SET result = CONCAT("Table ", TableNo, " is already booked for this timeslot: ", BookingDateTime);
	ELSE SET result = CONCAT("Table ", TableNo, " is free for this timeslot: ", BookingDateTime);
    END IF;

	SELECT result;
END//
DELIMITER ;

CALL CheckBooking("2023-11-04 18:00:00", 6)