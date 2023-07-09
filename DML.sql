INSERT INTO customers (CustomerName, PhoneNumber, Email)
	VALUES
    ("Ibrahim Aidaruz", 0906657637, "aidaruz@gmail.com"),
    ("Abdalla Kasim",0906657636, "kasim@gmail.com"),
    ("Hanad Diiriye", 0906657635, "diiriye@gmail.com");
SELECT * FROM customers;

DELETE FROM customers WHERE CustomerID >3;

INSERT INTO menus (MenuName, Cuisine)
	VALUES 
    ("Menu 1", "French Cuisine"),
    ("Menu 2", "French Cuisine"),
    ("Menu 1", "Chinese Cuisine"),
    ("Menu 2", "Chinese Cuisine");
SELECT * FROM menus;

INSERT INTO items (CourseName, StarterName, DesertName)
	VALUES 
    ("Course 1", "Starter 1", "Desert 1"),
    ("Course 1", "Starter 2", "Desert 3"),
    ("Course 3", "Starter 2", "Desert 1"),
    ("Course 1", "Starter 3", "Desert 1");
SELECT * from items;

INSERT INTO menuitems 
		VALUES (1,2),
        (2,1),
        (3,2),
        (2,2);
SELECT * FROM menuitems;

INSERT INTO orders (TotalCost, CustomerID, MenuID)
		VALUES (20,1,1),
        (30,2,3),
        (20,2,1),
        (20,3,2);
    
SELECT * FROM orders;
DELETE FROM orders where OrderID > 4;

