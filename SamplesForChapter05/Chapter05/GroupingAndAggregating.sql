USE AdventureWorks
GO

--List unique TerritoryName values with
--either DISTINCT or GROUP BY
SELECT DISTINCT TerritoryName
FROM Sales.VSalesPerson

SELECT TerritoryName
FROM Sales.VSalesPerson
GROUP BY TerritoryName
GO

--Group TerritoryName values within 
--TerritoryGroup values
SELECT TerritoryGroup, TerritoryName
FROM Sales.VSalesPerson
GROUP BY TerritoryGroup, TerritoryName
GO

--Compute a count within a group
SELECT TerritoryGroup, TerritoryName, COUNT(*) 'Sales persons'
FROM Sales.VSalesPerson
GROUP BY TerritoryGroup, TerritoryName
GO

--Territory counting by removing null values
--and ordering TerritoryName within TerritoryGroup
SELECT TerritoryGroup, TerritoryName, COUNT(*) 'Sales persons'
FROM Sales.VSalesPerson
GROUP BY TerritoryGroup, TerritoryName
HAVING TerritoryGroup IS NOT NULL
ORDER BY TerritoryGroup, TerritoryName
GO

--Compute row count, sum of a calculated column and
--a data column by territory ID
SELECT TerritoryID, COUNT(*) 'Persons/territory',
    CAST(SUM(SalesYTD*CommissionPct) AS dec(12,2)) 'Commissions',
    SUM(Bonus) 'Bonuses',
    CAST(SUM(SalesYTD*CommissionPct) +
        SUM(Bonus) AS dec(12,2)) 'Cs + Bs'
FROM Sales.SalesPerson
WHERE TerritoryID IS NOT NULL
GROUP BY TerritoryID
GO

--Number of items ordered and sum of prices for items
--ordered by sales order ID
SELECT TOP 5 SalesOrderID, COUNT(OrderQty) 'Items ordered', 
    CAST(SUM(LineTotal) AS dec(12,2)) 'Price of items ordered'
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID


--Number of items ordered and price of items ordered for
--above average sales orders
DECLARE @totsales dec(12,2), @numofsales int
SET @totsales = (SELECT SUM(LineTotal) FROM Sales.SalesOrderDetail)
SET @numofsales = (SELECT COUNT(SalesOrderID) FROM Sales.SalesOrderHeader)
SELECT @totsales 'Total sales revenue', 
    @numofsales 'Number of sales', 
    @totsales/@numofsales 'Average revenue/sale'


SELECT TOP 5 SalesOrderID, COUNT(OrderQty) 'Items ordered', 
    SUM(LineTotal) 'Price of items ordered'
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LineTotal) > @totsales/@numofsales
GO


