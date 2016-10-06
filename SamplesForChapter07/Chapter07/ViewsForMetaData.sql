USE AdventureWorks
GO

--Drop previously existing version of view
IF OBJECT_ID('dbo.vSalePersonNamePhoneEmail', 'VIEW') IS NOT NULL
    DROP VIEW dbo.vSalePersonNamePhoneEmail
IF OBJECT_ID('HumanResources.vSalePersonNamePhoneEmail', 'VIEW') IS NOT NULL
    DROP VIEW HumanResources.vSalePersonNamePhoneEmail
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

SELECT *
FROM sys.views


--Comparison of sys.views with INFORMATION_SCHEMA.VIEWS
SELECT name, schema_id
FROM sys.views
WHERE name = 'vSalePersonNamePhoneEmail'

SELECT TABLE_NAME, TABLE_SCHEMA, TABLE_Catalog
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME = 'vSalePersonNamePhoneEmail'
GO

--Enhancement of sys.views with sys.schemas
--and DB_NAME function
SELECT v.name 'View name',
    s.name 'Schema name',
    DB_NAME() 'Database name'
FROM sys.views v JOIN sys.schemas s
ON v.schema_id = s.schema_id
WHERE v.name = 'vSalePersonNamePhoneEmail'
GO


--For display in book
SET NOCOUNT ON
SELECT CAST(name AS nvarchar(25)) 'name', schema_id
FROM sys.views
WHERE name = 'vSalePersonNamePhoneEmail'

SELECT CAST(TABLE_NAME AS nvarchar(25)) 'TABLE_NAME', 
    CAST(TABLE_SCHEMA AS nvarchar(12)) 'TABLE_SCHEMA', 
    CAST(TABLE_Catalog AS nvarchar(14)) 'TABLE_Catalog'
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME = 'vSalePersonNamePhoneEmail'
GO

SELECT CAST(v.name AS nvarchar(25)) 'View name',
    cast(s.name AS nvarchar(12)) 'Schema name',
    CAST(DB_NAME() AS nvarchar(14)) 'Database name'
FROM sys.views v JOIN sys.schemas s
ON v.schema_id = s.schema_id
WHERE v.name = 'vSalePersonNamePhoneEmail'
GO
SET NOCOUNT OFF

--Column type summary
SELECT c.name, t.name 'data type', c.max_length, c.is_identity
FROM sys.columns c JOIN sys.types t
ON t.system_type_id = c.system_type_id AND 
    t.system_type_id = t.user_type_id
where object_id = 
    (SELECT OBJECT_ID('dbo.vSalePersonNamePhoneEmail', 'VIEW'))

--For display in book
SELECT CAST(c.name AS nvarchar(13)) 'Column', 
    CAST(t.name AS nvarchar(8)) 'data type', 
    c.max_length, 
    c.is_identity
FROM sys.columns c JOIN sys.types t
ON t.system_type_id = c.system_type_id AND 
    t.system_type_id = t.user_type_id
WHERE object_id IN 
    (SELECT OBJECT_ID('dbo.vSalePersonNamePhoneEmail', 'VIEW'))

--Drop custom views from the AdventureWorks database
DROP VIEW vSalePersonNamePhoneEmail
GO


