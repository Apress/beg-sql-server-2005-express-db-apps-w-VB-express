USE AdventureWorks
GO

--Using comparison operators in a WHERE clause
SELECT DISTINCT SalesQuota FROM Sales.SalesPerson

SELECT SalesPersonID, SalesQuota, 
    CAST(SalesYTD AS dec(12,2)) 'Sales this year' , 
    CAST(SalesLastYear AS dec(12,2)) 'Sales last year'
FROM Sales.SalesPerson
WHERE SalesQuota <=250000

SELECT SalesPersonID, SalesQuota, 
    CAST(SalesYTD AS dec(12,2)) 'Sales this year' , 
    CAST(SalesLastYear AS dec(12,2)) 'Sales last year'
FROM Sales.SalesPerson
WHERE SalesQuota >250000

SELECT SalesPersonID, SalesQuota, 
    CAST(SalesYTD AS dec(12,2)) 'Sales this year' , 
    CAST(SalesLastYear AS dec(12,2)) 'Sales last year'
FROM Sales.SalesPerson
WHERE SalesQuota IS NULL

--Using the BETWEEN operator in a WHERE clause
SELECT SalesPersonID, SalesQuota, 
    CAST(SalesYTD AS dec(12,2)) 'Sales this year' , 
    CAST(SalesLastYear AS dec(12,2)) 'Sales last year'
FROM Sales.SalesPerson
WHERE SalesYTD BETWEEN 200000 AND 650000

SELECT Count(*) 'SalesYTD outside BETWEEN'
FROM Sales.SalesPerson
WHERE SalesYTD NOT BETWEEN 200000 AND 650000

SELECT SalesPersonID, SalesQuota,
    CAST(SalesYTD AS dec(12,2)) 'Sales this year' ,
    CAST(SalesLastYear AS dec(12,2)) 'Sales last year'
FROM Sales.vSalesPerson
WHERE SalesYTD BETWEEN 200000 AND 650000 OR
    SalesYTD > 5000000


--Using IN operator in a WHERE clause
SELECT COUNT(*)
FROM Sales.SalesPerson
WHERE SalesQuota IN(250000, 300000)

SELECT COUNT(*)
FROM Sales.SalesPerson
WHERE SalesQuota NOT IN(250000, 300000)

SELECT SalesPersonID, CountryRegionName
FROM Sales.vSalesPerson
WHERE CountryRegionName IN ('United States', 'Canada')

SELECT SalesPersonID, CountryRegionName
FROM Sales.vSalesPerson
WHERE CountryRegionName NOT IN ('United States', 'Canada')



