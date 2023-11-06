DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
	SELECT MAX(Quantity) as "Max Qantity in Order" FROM Orders;
END//
DELIMITER ;

CALL GetMaxQuantity()