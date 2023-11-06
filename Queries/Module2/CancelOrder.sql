DELIMITER //
CREATE PROCEDURE CancelOrder(IN OrderId INT)
BEGIN
	DELETE FROM Orders WHERE Id = OrderId;
    SELECT CONCAT("Order with id=", OrderId, " was removed") AS  Confirmation;
END //
DELIMITER ;

CALL CancelOrder(6);