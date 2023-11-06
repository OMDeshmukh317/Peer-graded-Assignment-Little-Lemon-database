Select o.Id,
 o.TotalCost,
 c.Id,
 (
	select m.Cuisine
	FROM OrderMenyItem omi
	INNER JOIN MenyItem mi On (mi.Id = omi.MenyItem_Id)
    INNER JOIN Menu m on (mi.Menu_Id = m.Id)
    WHERE omi.Orders_Id = o.Id
	GROUP BY m.Id
    LIMIT 1
) AS Cuisine,
 concat(c.FirstName, " " , c.LastName) as FullName,
 (
	select GROUP_CONCAT(mi.Name SEPARATOR ", ")
	FROM OrderMenyItem omi
	INNER JOIN MenyItem mi On (mi.Id = omi.MenyItem_Id)
    WHERE omi.Orders_Id = o.Id
	GROUP BY omi.Orders_Id
) AS MenyItemsOrdered
FROM Orders o
INNER JOIN Bookings b on (b.Id = o.Bookings_Id)
INNER JOIN Customer c on (b.Customer_Id = c.Id)