USE AdventureWorks
GO

SELECT CAST(cr.Name AS nvarchar(14)) 'Region',
    CAST(st.Name AS nvarchar(14)) 'Territory',
    s.SalesPersonID,
    CAST(c.FirstName AS nvarchar(8)) 'FirstName',
    CAST(c.LastName AS nvarchar(17)) 'LastName',
    s.SalesYTD,
    s.SalesLastYear
FROM Sales.SalesPerson s JOIN HumanResources.Employee e
ON e.EmployeeID = s.SalesPersonID JOIN Person.Contact c
ON c.ContactID = e.ContactID LEFT JOIN Sales.SalesTerritory st
ON st.TerritoryID = s.TerritoryID LEFT JOIN Person.CountryRegion cr
ON cr.CountryRegionCode = st.CountryRegionCode


