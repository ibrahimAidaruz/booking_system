-- Task 1
CREATE OR REPLACE VIEW OrdersView  AS 
	 SELECT orderID , TotalCost from orders
     where TotalCost < 30;
     
Select * FROM OrdersView;

-- Task 2
SELECT c.CustomerID, CustomerName, TotalCost, MenuName, StarterName
FROM customers c 
JOIN orders o ON  c.CustomerID =  o.CustomerID 
JOIN menus m ON o.MenuID = m.MenuID 
JOIN menuitems mi ON mi.MenuID = m.MenuID
JOIN items i ON mi.MenuItemID = i.MenuItemID;

-- Task 3
SELECT MenuName
FROM orders o
JOIN menus m ON o.MenuID = m.MenuID
where o.TotalCost < 30;