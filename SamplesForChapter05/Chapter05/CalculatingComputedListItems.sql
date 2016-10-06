USE AdventureWorks
GO

--Computated value with numbers in list
SELECT TOP 3 SalesOrderID, OrderQty, UnitPrice, 
    (OrderQty*UnitPrice) 'Line total before discount',
    LineTotal
FROM Sales.SalesOrderDetail

--Conversion with CAST function for computated value
--with numbers in list
SELECT TOP 3 SalesOrderID, OrderQty, UnitPrice, 
    CAST((OrderQty*UnitPrice) AS dec(10,2)) 
    'Line total before discount', 
    LineTotal
FROM Sales.SalesOrderDetail

--Conversion with CONVERT function for computated value
--with numbers in list
SELECT TOP 3 SalesOrderID, OrderQty, UnitPrice, 
    CONVERT(dec(10,2),OrderQty*UnitPrice) 
    'Line total before discount', 
    LineTotal
FROM Sales.SalesOrderDetail

--Computated value with characters in list without
--editing extra blank space
SELECT TOP 3 FirstName, MiddleName, LastName,
    FirstName + ' ' + ISNULL(MiddleName, '') 
    + ' ' + LastName 'Full name'
FROM Person.Contact

--Computated value with characters in list with
--editing extra blank space
SELECT TOP 3 FirstName, MiddleName, LastName,
    REPLACE(FirstName + ' ' + ISNULL(MiddleName, '') 
    + ' ' + LastName, '  ', ' ') 'Full name'
FROM Person.Contact


