USE AdventureWorks
SELECT TOP 3 SalesPersonID, SalesYTD, SalesLastYear
FROM Sales.SalesPerson
ORDER BY SalesYTD DESC