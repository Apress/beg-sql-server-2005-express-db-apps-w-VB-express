USE AdventureWorks
GO

SELECT TOP 5 SalesOrderID 'Order ID',
    CONVERT(varchar,OrderDate,101) 'Order date'
FROM Sales.SalesOrderHeader

SELECT TOP 5 OrderID 'Order ID',
    CONVERT(varchar,OrderDate,101) 'Order date'
FROM Northwind.dbo.Orders

USE Northwind
GO

SELECT TOP 5 OrderID 'Order ID',
    CONVERT(varchar,OrderDate,101) 'Order date'
FROM Orders

SELECT TOP 5 SalesOrderID 'Order ID',
    CONVERT(varchar,OrderDate,101) 'Order date'
FROM AdventureWorks.Sales.SalesOrderHeader

USE AdventureWorks
GO

SELECT TOP 3 SalesPersonID, FirstName, LastName, 
	CAST(SalesYTD AS dec(12,2)) 'YTD Sales'
FROM Sales.vSalesPerson
