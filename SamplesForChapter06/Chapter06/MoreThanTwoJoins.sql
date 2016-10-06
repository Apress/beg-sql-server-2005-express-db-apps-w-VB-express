USE AdventureWorks
GO

--Two-table join: Sales.SalesPerson and HumanResources.Employee
SELECT s.SalesPersonID, s.SalesQuota, e.ContactID
FROM Sales.SalesPerson s JOIN HumanResources.Employee e
ON s.SalesPersonID = e.EmployeeID

--Three-table join: Sales.SalesPerson, HumanResources.Employee,
--and Person.Contact
SELECT s.SalesPersonID, s.SalesQuota, c.LastName
FROM Sales.SalesPerson s JOIN HumanResources.Employee e
ON s.SalesPersonID = e.EmployeeID
JOIN Person.Contact c ON e.ContactID = c.ContactID

--Four-table join: Sales.SalesPerson, HumanResources.Employee,
--Person.Contact, and Sales.SalesTerritory; Left Join forces in
--three presons with null TerritoryID values
SELECT t.Name 'Territory name', s.SalesPersonID, s.SalesQuota, c.LastName
FROM Sales.SalesPerson s JOIN HumanResources.Employee e
ON s.SalesPersonID = e.EmployeeID
JOIN Person.Contact c ON e.ContactID = c.ContactID
LEFT JOIN Sales.SalesTerritory t ON s.TerritoryID = t.TerritoryID
ORDER BY s.TerritoryID

--SalesYTD, SalesLastYear, and Percent change by Territory name
SELECT t.Name 'Territory name', 
    SUM(s.SalesYTD) 'YTD Sales', 
    SUM(s.SalesLastYear) 'Sales last year', 
    CAST(((SUM(s.SalesYTD) - SUM(s.SalesLastYear))/
    SUM(s.SalesLastYear))*100 
    AS DEC(12,2)) 'Percent change'
FROM Sales.SalesPerson s JOIN HumanResources.Employee e
ON s.SalesPersonID = e.EmployeeID
JOIN Person.Contact c ON e.ContactID = c.ContactID
JOIN Sales.SalesTerritory t ON s.TerritoryID = t.TerritoryID
GROUP BY t.Name
ORDER BY t.Name





