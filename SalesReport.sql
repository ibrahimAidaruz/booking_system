-- Task 1
CREATE OR REPLACE VIEW OrdersView  AS
SELECT orderID , TotalCost
from orders
where TotalCost < 30;

Select *
FROM OrdersView;

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

-- Task 4
CREATE PROCEDURE getHighestCost()
select MAX(TotalCost) as Expensive
from orders;

-- Task 5
PREPARE getOrderDetail FROM 'SELECT * FROM Orders WHERE orderID = ? ';

SET @order_id = 2;
EXECUTE getOrderDetail USING
@order_id;

-- Task 6
CREATE PROCEDURE cancelOrder(id INT)
DELETE from orders
WHERE orderID <= id;

call filterTotalCost
(30)