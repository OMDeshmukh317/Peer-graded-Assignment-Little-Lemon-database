PREPARE GetOrderDetail FROM "SELECT o.Id, o.Quantity, o.TotalCost
	FROM Orders o
	INNER JOIN Bookings b ON (b.Id = o.Bookings_Id)
	INNER JOIN Customer c ON (c.Id = b.Customer_Id)
	WHERE c.Id = ?";
    
SET @id = 2;
EXECUTE GetOrderDetail USING @id;