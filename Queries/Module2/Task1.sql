CREATE VIEW OrdersView AS
Select o.Id, o.Quantity, o.TotalCost
FROM littlelemondb.orders o
WHERE o.Quantity > 2;

Select * from OrdersView;