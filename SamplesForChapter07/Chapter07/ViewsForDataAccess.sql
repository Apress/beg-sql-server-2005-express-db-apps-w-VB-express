USE AdventureWorks
GO

--Drop previously existing version of view
IF OBJECT_ID('dbo.vSalePersonNamePhoneEmail', 'VIEW') IS NOT NULL
    DROP VIEW dbo.vSalePersonNamePhoneEmail
GO

--Create dbo.vSalePersonNamePhoneEmail view
CREATE VIEW dbo.vSalePersonNamePhoneEmail
AS
SELECT s.SalesPersonID, c.FirstName, c.MiddleName,
    c.LastName, c.Phone, c.EmailAddress
FROM Sales.SalesPerson S JOIN HumanResources.Employee e
ON s.SalesPersonID = e.EmployeeID
JOIN Person.Contact c
ON c.ContactID = e.ContactID
GO

--Select from dbo.vSalePersonNamePhoneEmail
SELECT  SalesPersonID, FirstName, LastName,
    Phone, EmailAddress
FROM dbo.vSalePersonNamePhoneEmail
WHERE LastName LIKE 'A%'

--For display in book
SELECT SalesPersonID,
    CAST(FirstName AS nvarchar(9)) 'FirstName',
    CAST(LastName AS nvarchar(15)) 'LastName',
    CAST(Phone AS nvarchar(12)) 'Phone',
    CAST(EmailAddress AS nvarchar(30)) 'EmailAddress'
FROM dbo.vSalePersonNamePhoneEmail
WHERE LastName LIKE 'A%'

--Drop previously existing version of view in schema
IF EXISTS(SELECT *
    FROM sys.views
    WHERE name = 'vSalePersonNamePhoneEmail' AND schema_id = 
		SCHEMA_ID('HumanResources'))
    DROP VIEW HumanResources.vSalePersonNamePhoneEmail
GO

--Create HumanResources.vSalePersonNamePhoneEmail view
CREATE VIEW HumanResources.vSalePersonNamePhoneEmail
AS
SELECT s.SalesPersonID, c.FirstName, c.MiddleName,
    c.LastName, c.Phone, c.EmailAddress
FROM Sales.SalesPerson S JOIN HumanResources.Employee e
ON s.SalesPersonID = e.EmployeeID
JOIN Person.Contact c
ON c.ContactID = e.ContactID
GO

--Select from HumanResources.vSalePersonNamePhoneEmail
SELECT  SalesPersonID, FirstName, LastName,
    Phone, EmailAddress
FROM HumanResources.vSalePersonNamePhoneEmail
WHERE LastName LIKE 'A%'
GO

--List vSalePersonNamePhoneEmail views from sys.views
--and INFORMATION_SCHEMA.VIEWS
SELECT name, schema_id
FROM sys.views
WHERE name = 'vSalePersonNamePhoneEmail'

SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME = 'vSalePersonNamePhoneEmail'
GO

--For display in book
SELECT CAST(name AS nvarchar(25)) 'name', schema_id
FROM sys.views
WHERE name = 'vSalePersonNamePhoneEmail'

SELECT CAST(TABLE_NAME AS nvarchar(25)) 'TABLE_NAME', CAST(TABLE_SCHEMA AS nvarchar(14)) 'TABLE_SCHEMA'
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME = 'vSalePersonNamePhoneEmail'
GO

--Drop custom views from the AdventureWorks database
DROP VIEW dbo.vSalePersonNamePhoneEmail
DROP VIEW HumanResources.vSalePersonNamePhoneEmail
GO

