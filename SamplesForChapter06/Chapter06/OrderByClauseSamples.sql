USE AdventureWorks
GO

--Display two ProductCategory columns in
--unspecified order, by ascending ProductCategoryID
--order, by descending ProductCategoryID
--order, by descending Name order
SELECT ProductCategoryID, Name
FROM Production.ProductCategory

SELECT ProductCategoryID, Name
FROM Production.ProductCategory
ORDER BY ProductCategoryID

SELECT ProductCategoryID, Name
FROM Production.ProductCategory
ORDER BY ProductCategoryID DESC

SELECT ProductCategoryID, Name
FROM Production.ProductCategory
ORDER BY Name DESC
GO

--Not sorting and sorting on two columns; trailing
--TerritoryGroup by DESC moves null column values
--to the bottom
SELECT TerritoryGroup, FirstName, LastName, Phone
FROM Sales.vSalesPerson


SELECT TerritoryGroup, FirstName, LastName, Phone
FROM Sales.vSalesPerson
ORDER BY TerritoryGroup, LastName
GO

--Select the bottom two SubTotal column values
--without and with ties 
SELECT TOP 2 SalesOrderID, SubTotal
FROM Sales.SalesOrderHeader
ORDER BY Subtotal ASC

SELECT TOP 2 WITH TIES SalesOrderID, SubTotal
FROM Sales.SalesOrderHeader
ORDER BY Subtotal ASC

--SELECT the top two SubTotal column values
SELECT TOP 2 SalesOrderID, SubTotal
FROM Sales.SalesOrderHeader
ORDER BY Subtotal DESC

