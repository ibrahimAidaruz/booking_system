-- Task 1
CREATE PROCEDURE getHighestCost()
select MAX(TotalCost) as Expensive from orders;

-- Task 2
PREPARE getOrderDetail FROM 'SELECT * FROM Orders WHERE orderID = ? ';

SET @order_id = 2;
EXECUTE getOrderDetail USING @order_id;

-- Task 3
CREATE PROCEDURE cancelOrder(id INT)
DELETE from orders
WHERE orderID <= id;

call filterTotalCost(30)

