USE AdventureWorks
GO

--Make stored proc in default schema
IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_SalePersonNamePhoneEmail')
    DROP PROCEDURE usp_SalePersonNamePhoneEmail
GO

CREATE PROCEDURE usp_SalePersonNamePhoneEmail
AS
SELECT s.TerritoryID, c.LastName, c.Phone, c.EmailAddress
FROM Sales.SalesPerson S JOIN HumanResources.Employee e
ON s.SalesPersonID = e.EmployeeID
JOIN Person.Contact c
ON c.ContactID = e.ContactID
GO

--Invoke stored proc
EXEC usp_SalePersonNamePhoneEmail
GO

--Drop stored proc
DROP PROCEDURE usp_SalePersonNamePhoneEmail
GO

--For display in book
--Make stored proc in default schema
IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_SalePersonNamePhoneEmail')
    DROP PROCEDURE usp_SalePersonNamePhoneEmail
GO

CREATE PROCEDURE usp_SalePersonNamePhoneEmail
AS
SELECT s.TerritoryID,
    CAST(c.LastName AS nvarchar(17)) 'LastName',
    CAST(c.Phone AS nvarchar(19)) 'Phone',
    CAST(c.EmailAddress AS nvarchar(28)) 'EmailAddress'
FROM Sales.SalesPerson S JOIN HumanResources.Employee e
ON s.SalesPersonID = e.EmployeeID
JOIN Person.Contact c
ON c.ContactID = e.ContactID
GO

--Invoke stored proc
EXEC usp_SalePersonNamePhoneEmail
GO

--Drop stored proc
DROP PROCEDURE usp_SalePersonNamePhoneEmail
GO


--Searches for usp_ProductCategoryCountSubcategory in
--any schema and drops stored proc in Production schema
IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_ProductCategoryCountSubcategory')
    DROP PROCEDURE
        Production.usp_ProductCategoryCountSubcategory
GO

--Create a stored proc with two result sets
CREATE PROCEDURE
    Production.usp_ProductCategoryCountSubcategory
AS

SELECT ProductCategoryID, Name
FROM Production.ProductCategory
ORDER BY ProductCategoryID

SELECT ProductCategoryID, COUNT(*) 'No. Subcategories'
FROM Production.ProductSubcategory
GROUP BY ProductCategoryID
ORDER BY ProductCategoryID
GO

--Invoke stored proc
EXEC Production.usp_ProductCategoryCountSubcategory
GO

--Drop stored proc
DROP PROCEDURE
    Production.usp_ProductCategoryCountSubcategory
GO

--For display in book
--Searches for usp_ProductCategoryCountSubcategory in
--any schema and drops stored proc in Production schema
IF EXISTS(SELECT * FROM sys.objects o JOIN sys.schemas s
    ON o.schema_id = s.schema_id
    WHERE o.type = 'P' AND
    s.name = 'Production' AND
    o.name = 'usp_ProductCategoryCountSubcategory')
    DROP PROCEDURE
        Production.usp_ProductCategoryCountSubcategory
GO

--Create a stored proc with two result sets
CREATE PROCEDURE
    Production.usp_ProductCategoryCountSubcategory
AS

SELECT ProductCategoryID, CAST(Name AS nvarchar(11)) 'Name'
FROM Production.ProductCategory
ORDER BY ProductCategoryID

SELECT ProductCategoryID, COUNT(*) 'No. Subcategories'
FROM Production.ProductSubcategory
GROUP BY ProductCategoryID
ORDER BY ProductCategoryID
GO

--Invoke stored proc
EXEC Production.usp_ProductCategoryCountSubcategory
GO

--Drop stored proc
DROP PROCEDURE
    Production.usp_ProductCategoryCountSubcategory
GO
