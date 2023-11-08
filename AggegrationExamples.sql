USE SalesOrdersExample;

--SELECT * FROM Orders

-- Find the # of customers who live in each state in the database. (4 rows)
--SELECT COUNT(*) AS NumCustomers, CustState FROM Customers
--GROUP BY CustState

-- Find the # of orders that took place on each day. (181 rows)
--SELECT TOP 10 COUNT(*) AS NumOrders, OrderDate FROM Orders
--GROUP BY OrderDate
--ORDER BY NumOrders DESC, OrderDate DESC

-- Find the # of orders that took place on October 5, 2017 (NumOrders = 10);
--SELECT COUNT(*) AS NumOrders FROM orders
--WHERE OrderDate = '2017-10-05'
--GROUP BY OrderDate

-- Find the # of orders that took place in the month of October. (31 rows)
--SELECT COUNT(*) AS NumOrders FROM orders
--WHERE OrderDate BETWEEN '2017-10-01' AND '2017-10-31'

-- Find the # of orders that took place in the month of October if the total
-- orders are higher than 5. (10 rows)
--SELECT COUNT(*) AS NumOrders, OrderDate FROM orders
--WHERE OrderDate BETWEEN '2017-10-01' AND '2017-10-31'
--GROUP BY OrderDate HAVING COUNT(*) >5
--ORDER BY NumOrders DESC

-- Find the # of orders that took place in the month of October if the total
--orders are higher than 5. Order the results by total orders. (10 rows)
--SELECT COUNT(*) AS NumOrders, OrderDate FROM orders
--WHERE OrderDate BETWEEN '2017-10-01' AND '2017-10-31'
--GROUP BY OrderDate HAVING COUNT(*) >5
--ORDER BY NumOrders DESC

-- Find the # of orders that took place in one of the following days.
-- 2017-10-05
-- 2017-12-25
-- 2017-11-26 (3 rows)
--SELECT OrderDate, COUNT(*) AS NumOrders FROM Orders
--WHERE OrderDate IN ('2017-10-05', '2017-12-25', '2017-11-26')
--GROUP BY OrderDate

-- Find the order date, product ordered, and # of orders. (865 rows) 
--SELECT ProductNumber, SUM(QuantityOrdered) FROM Orders 
--INNER JOIN Order_Details ON Orders.OrderNumber = Order_Details.OrderNumber
--GROUP BY OrderDate, ProductNumber

--SELECT * FROM Orders 
--INNER JOIN Order_Details ON Orders.OrderNumber = Order_Details.OrderNumber

--SELECT Orders.OrderDate, Orders.CustomerID, COUNT(*) AS NumOrders FROM Orders
--GROUP BY  OrderDate, CustomerID
--ORDER BY NumOrders DESC;

-- Now filter the previous query by orders greater than 2. (6 rows)
--SELECT Orders.OrderDate, Orders.CustomerID, COUNT(*) AS NumOrders FROM Orders
--GROUP BY  OrderDate, CustomerID
--HAVING COUNT(*) > 2
--ORDER BY NumOrders DESC;

-- Find the # of orders in any given year. (12 rows)
--SELECT COUNT(*) AS NumOrders, DATEPART(YEAR, OrderDate) AS OrderYear FROM Orders
--GROUP BY DATEPART(YEAR, OrderDate)


-- Find the # of orders in any given month. (7 rows)
--SELECT COUNT(*) AS NumOrders, DATEPART(MONTH, OrderDate) AS OrderMonth FROM Orders
--GROUP BY DATEPART(MONTH, OrderDate)

-- Find the # of orders in any given month and the latest ship on date. (7 rows)
--SELECT * FROM Orders
--WHERE DATEPART(MONTH, OrderDate) = 10

--SELECT 
--	COUNT(*) AS NumOrders, 
--	DATEPART(MONTH, OrderDate) AS OrderMonth, 
--	MAX(ShipDate) AS LatestOrder 
--FROM Orders
--GROUP BY DATEPART(MONTH, OrderDate)

-- Find THE # of orders in any given year and month combination.
-- Use the short hand functions instead of DATEPART (7 rows)


-- Find product names, product vendor and retail price
SELECT 
	ProductName, 
	VendName, 
	RetailPrice, 
	WholesalePrice, 
	(RetailPrice - WholesalePrice) AS Profit,
	(100 * (
INNER JOIN Product_Vendors ON Products.ProductNumber = Product_Vendors.ProductNumber
INNER JOIN Vendors ON Product_Vendors.VendorID = Vendors.VendorID