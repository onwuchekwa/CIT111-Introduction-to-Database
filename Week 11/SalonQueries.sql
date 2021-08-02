-- ========================================================================
USE jennysaloncit111;
-- ========================================================================
-- ========================================================================
-- Query 1 : #1
-- ========================================================================
SELECT 
	CONCAT(FirstName, ' ', LastName) AS Customer_Name, Name, Type, Price
FROM product p
	JOIN transactiondetail td
		ON p.ProductID = td.ProductID
	JOIN transaction t
		ON td.TranID = t.TranID
	JOIN customer c
		ON t.CustomerID = c.CustomerID
ORDER BY c.LastName ASC;

-- ========================================================================
-- Query 2 : #2
-- ========================================================================
SELECT 
	CONCAT(FirstName, ' ', LastName) AS Customer_Name, SUM(Price * Quantity) AS Total_Spend
FROM product p
	JOIN transactiondetail td
		ON p.ProductID = td.ProductID
	JOIN transaction t
		ON td.TranID = t.TranID
	JOIN customer c
		ON t.CustomerID = c.CustomerID
GROUP BY c.CustomerID
ORDER BY Total_Spend DESC;

-- ========================================================================
-- Query 3 : #3
-- ========================================================================
SELECT 
	CONCAT(EmpFirstName, ' ', EmpLastName) AS Employee_Name, SUM(Price * Quantity) AS Total_Revenue
FROM product p
	JOIN transactiondetail td
		ON p.ProductID = td.ProductID
	JOIN transaction t
		ON td.TranID = t.TranID
	JOIN employee e
		ON t.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total_Revenue DESC;

-- ========================================================================
-- Query 4 : #4
-- ========================================================================
SELECT 
	CONCAT(e1.EmpFirstName, ' ', e1.EmpLastName) AS Employee, 
    e1.Title, e1.HireDate, 
    CONCAT(e2.EmpFirstName, ' ', e2.EmpLastName) AS Manager, 
    e2.Title AS ManagerTitle
FROM Employee e1   
LEFT OUTER JOIN Employee e2      
	ON e1.ManagerID = e2.EmployeeID;