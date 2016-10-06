USE AdventureWorks
GO


--For lineitems with an OrderQty of > 12, display average 
--LineTotal for and calculate difference from
--average for top 10 orders; uncorrelated subquery in list
SELECT TOP 10 sd1.SalesOrderID 'OrderID', p.Name, sd1.OrderQty,
    sd1.LineTotal, 
    (SELECT AVG(sd2.Linetotal) FROM sales.SalesOrderDetail sd2
        WHERE sd2.OrderQty > 12) 'Avg. > 12',
    LineTotal - (SELECT AVG(Linetotal) 
        FROM sales.SalesOrderDetail sd2  
        WHERE OrderQty > 12) 'Diff. from Avg.'
FROM Sales.SalesOrderDetail sd1
JOIN Production.Product p
ON sd1.ProductID = p.ProductID
WHERE OrderQty > 12
ORDER BY LineTotal DESC

--For first twenty-nine orders, display SalesOrderID, ProductID, LineTotal
--and SubTotal for order; correlated subquery returns order
--SubTotal values
SELECT TOP 29 sd.SalesOrderID, sd. ProductID, sd.LineTotal, 
    (SELECT sh.SubTotal FROM sales.SalesOrderHeader sh 
        WHERE sh.SalesOrderID = sd.SalesOrderID) 'SubTotal'
FROM Sales.SalesOrderDetail sd

--Return above average sales persons; subsquery in 
--WHERE clause with comparison operator
SELECT s.SalesPersonID, 
    REPLACE(c.FirstName + ' ' + ISNULL(c.MiddleName, '') + ' ' 
        + c.LastName, '  ', ' ') 'Sales person name',
    s.SalesYTD
FROM Sales.SalesPerson s
JOIN HumanResources.Employee e
ON s.SalesPersonID = e.EmployeeID
JOIN Person.Contact c
ON c.ContactID = e.ContactID
WHERE SalesYTD > (SELECT AVG(ss.SalesYTD) FROM Sales.SalesPerson ss)
ORDER BY s.SalesYTD DESC

--Return the contact info for stores from any of the
--top 3 sales territories
SELECT cu.TerritoryID, cu.CustomerID, s.Name, 
    REPLACE(co.FirstName + ' ' + ISNULL(co.MiddleName, '') + ' ' 
        + co.LastName, '  ', ' ') 'Store contact',
    co.Phone
FROM Sales.Customer cu
JOIN Sales.Store s
ON cu.CustomerID = s.CustomerID
JOIN Sales.StoreContact sc
ON sc.CustomerID = s.CustomerID
JOIN Person.Contact co
ON co.ContactID = sc.ContactID
WHERE cu.TerritoryID IN (SELECT TOP 3 TerritoryID 
    FROM Sales.SalesPerson 
    GROUP BY TerritoryID 
    ORDER BY SUM(SalesYTD) DESC)
ORDER BY cu.TerritoryID, cu.CustomerID

--Return count of customers by State/Province within
--Country/Region; subquery in WHREE clause with IN operator
--and responding to user input
DECLARE @alpha AS nvarchar(25)
SET @alpha = 'A'

SELECT cr.Name 'Country/Region', sp.Name 'State/Province',
    COUNT(*) 'Customer Count'
FROM Sales.Customer c
JOIN Sales.CustomerAddress ca
ON c.CustomerID = ca.CustomerID
JOIN Person.Address a
on a.AddressID = ca.AddressID
JOIN Person.StateProvince sp
ON a.StateProvinceID = sp.StateProvinceID
JOIN Person.CountryRegion cr
ON cr.CountryRegionCode = sp.CountryRegionCode
WHERE cr.Name IN (SELECT sq.Name
    FROM Person.CountryRegion sq
    WHERE sq.Name LIKE @alpha + '%')
GROUP BY cr.Name, sp.Name
ORDER BY COUNT(*) DESC


--Return count of customers by territory name within
--Country/Region; subquery in WHREE clause with IN operator
--and responding to user input
DECLARE @alpha AS nvarchar(25)
SET @alpha = 'U'

SELECT cr.Name 'Country/Region', st.Name 'Territory',
    COUNT(*) 'Customer Count'
FROM Sales.Customer c
JOIN Sales.SalesTerritory st
ON c.TerritoryID = st.TerritoryID
JOIN Person.CountryRegion cr
ON st.CountryRegionCode = cr.CountryRegionCode
WHERE cr.Name IN (SELECT sq.Name
    FROM Person.CountryRegion sq
    WHERE sq.Name LIKE @alpha + '%')
GROUP BY cr.Name, st.Name
ORDER BY cr.Name, st.Name

--For book display
DECLARE @alpha AS nvarchar(25)
SET @alpha = 'U'

SELECT CAST(cr.Name AS nvarchar(14)) 'Country/Region', 
    CAST(st.Name AS nvarchar(14)) 'Territory',
    COUNT(*) 'Customer Count'
FROM Sales.Customer c
JOIN Sales.SalesTerritory st
ON c.TerritoryID = st.TerritoryID
JOIN Person.CountryRegion cr
ON st.CountryRegionCode = cr.CountryRegionCode
WHERE cr.Name IN (SELECT sq.Name
    FROM Person.CountryRegion sq
    WHERE sq.Name LIKE @alpha + '%')
GROUP BY cr.Name, st.Name
ORDER BY cr.Name, st.Name

--Correlated subquery returns rows from sd1 where
--sd1.LineTotal is greater than average Linetotal for
--current ProductID in sd1; correlated subquery recomputes 
--a new average LineTotal value for each new row in sd1
SELECT SalesOrderID, ProductID, LineTotal
FROM Sales.SalesOrderDetail sd1
WHERE sd1.LineTotal >
    (SELECT AVG (sd2.LineTotal)
     FROM Sales.SalesOrderDetail sd2
     WHERE sd2.ProductID = sd1.ProductID)
ORDER BY SalesOrderID, ProductID


