SELECT mi.Name
FROM MenyItem mi
INNER JOIN OrderMenyItem omi ON (omi.MenyItem_Id = mi.Id)
INNER JOIN Orders o ON (o.Id = omi.Orders_Id)
WHERE o.Quantity > 2