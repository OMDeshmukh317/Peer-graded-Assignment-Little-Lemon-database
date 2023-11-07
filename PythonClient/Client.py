import mysql.connector as connector

connection = connector.connect(user = "root", password = "root", db = "littlelemondb")

cursor = connection.cursor()

show_tables_query = "SHOW tables" 
cursor.execute(show_tables_query)

result = cursor.fetchall()
print(result)

#SHOW customer info for orders > 60

get_customers_query = """SELECT CONCAT(c.FirstName, " ", c.LastName) as CustomerFullName,
    c.Phone as Contact,
    o.TotalCost as OrderPrice
    FROM Orders o
    INNER JOIN Bookings b ON (o.Bookings_Id = b.Id)
    INNER JOIN Customer c ON (b.Customer_Id = c.Id)
    WHERE o.TotalCost > 60
"""

cursor.execute(get_customers_query)

print("Customers with orders where price > 60:")
for row in cursor:
    print("Name: ", row[0], ", contact: ", row[1], ", order price: ", str(row[2]))