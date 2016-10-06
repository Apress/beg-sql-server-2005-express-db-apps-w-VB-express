USE AdventureWorks
GO

--Create function to list all sales persons
IF EXISTS(
    SELECT * FROM sys.objects
    WHERE type = 'IF' AND schema_id = SCHEMA_ID('dbo')
    AND name = 'uifListAllSalesPersons')
    DROP FUNCTION dbo.uifListAllSalesPersons
GO

CREATE FUNCTION dbo.uifListAllSalesPersons()
RETURNS table
AS
RETURN (
    SELECT s.SalesPersonID, c.FirstName, c.LastName, 
        st.Name 'TerritoryName', c.Phone
    FROM Sales.SalesPerson s 
        JOIN HumanResources.Employee e 
        ON s.SalesPersonID = e.EmployeeID
        JOIN Person.Contact c
        ON e.ContactID = c.ContactID 
        LEFT JOIN Sales.SalesTerritory st 
        ON s.TerritoryID = st.TerritoryID)
GO

--Invoke the function to list all sales persons
SELECT TOP 3 * FROM uifListAllSalesPersons()
GO

--For display in book
SELECT TOP 3 SalesPersonID, 
    CAST(FirstName AS nvarchar(9)) 'FirstName',
    CAST(LastName AS nvarchar(17)) 'LastName',
    CAST(TerritoryName AS nvarchar(14)) 'TerritoryName',
    CAST(Phone AS nvarchar(19)) 'Phone'
FROM uifListAllSalesPersons()


--Drop inline function
DROP FUNCTION dbo.uifListAllSalesPersons
GO


--Create function to list sales persons from a territory
IF EXISTS(
    SELECT * FROM sys.objects
    WHERE type = 'IF' AND schema_id = SCHEMA_ID('dbo')
    AND name = 'uifListSalesPersonsInTerritory')
    DROP FUNCTION dbo.uifListSalesPersonsInTerritory
GO

CREATE FUNCTION
    dbo.uifListSalesPersonsInTerritory(@t AS nvarchar(50))
RETURNS table
AS
RETURN (
    SELECT SalesPersonID, FirstName, LastName,
        TerritoryName, Phone
    FROM Sales.vSalesPerson
        WHERE TerritoryName = @t)
GO

--Invoke the function to list sales persons for a territory
DECLARE @t as nvarchar(50)

SET @t = 'Canada'
SELECT * FROM dbo.uifListSalesPersonsInTerritory(@t)

--For display in book
SELECT TOP 3 SalesPersonID, 
    CAST(FirstName AS nvarchar(9)) 'FirstName',
    CAST(LastName AS nvarchar(12)) 'LastName',
    CAST(TerritoryName AS nvarchar(13)) 'TerritoryName',
    CAST(Phone AS nvarchar(12)) 'Phone'
FROM dbo.uifListSalesPersonsInTerritory(@t)

SET @t = 'Northwest'
SELECT * FROM uifListSalesPersonsInTerritory(@t)

--For display in book
SELECT TOP 3 SalesPersonID, 
    CAST(FirstName AS nvarchar(9)) 'FirstName',
    CAST(LastName AS nvarchar(12)) 'LastName',
    CAST(TerritoryName AS nvarchar(13)) 'TerritoryName',
    CAST(Phone AS nvarchar(12)) 'Phone'
FROM dbo.uifListSalesPersonsInTerritory(@t)
GO

--Drop inline function
DROP FUNCTION dbo.uifListSalesPersonsInTerritory
GO


--Create function to list sales persons from a territory
IF EXISTS(
    SELECT * FROM sys.objects
    WHERE type = 'IF' AND schema_id = SCHEMA_ID('dbo')
    AND name = 'uifListSalesPersonsInTerritory')
    DROP FUNCTION dbo.uifListSalesPersonsInTerritory
GO

CREATE FUNCTION
    dbo.uifListSalesPersonsInTerritory(@t AS nvarchar(50))
RETURNS table
AS
RETURN (
    SELECT SalesPersonID, FirstName, LastName,
        TerritoryName, Phone
    FROM Sales.vSalesPerson
        WHERE TerritoryName = @t)
GO

--Update and restore LastName column value through IF udf
DECLARE @t as nvarchar(50)
SET @t = 'Canada'
SELECT * FROM dbo.uifListSalesPersonsInTerritory(@t)

--For display in book
SELECT TOP 3 SalesPersonID, 
    CAST(FirstName AS nvarchar(9)) 'FirstName',
    CAST(LastName AS nvarchar(12)) 'LastName',
    CAST(TerritoryName AS nvarchar(13)) 'TerritoryName',
    CAST(Phone AS nvarchar(12)) 'Phone'
FROM dbo.uifListSalesPersonsInTerritory(@t)


UPDATE dbo.uifListSalesPersonsInTerritory(@t)
SET LastName = 'Vargax'
WHERE SalesPersonID = 278

SELECT * FROM dbo.uifListSalesPersonsInTerritory(@t)

--For display in book
SELECT TOP 3 SalesPersonID, 
    CAST(FirstName AS nvarchar(9)) 'FirstName',
    CAST(LastName AS nvarchar(12)) 'LastName',
    CAST(TerritoryName AS nvarchar(13)) 'TerritoryName',
    CAST(Phone AS nvarchar(12)) 'Phone'
FROM dbo.uifListSalesPersonsInTerritory(@t)

UPDATE dbo.uifListSalesPersonsInTerritory(@t)
SET LastName = 'Vargas'
WHERE SalesPersonID = 278

SELECT * FROM dbo.uifListSalesPersonsInTerritory(@t)

--For display in book
SELECT TOP 3 SalesPersonID, 
    CAST(FirstName AS nvarchar(9)) 'FirstName',
    CAST(LastName AS nvarchar(12)) 'LastName',
    CAST(TerritoryName AS nvarchar(13)) 'TerritoryName',
    CAST(Phone AS nvarchar(12)) 'Phone'
FROM dbo.uifListSalesPersonsInTerritory(@t)

--Drop inline function
DROP FUNCTION dbo.uifListSalesPersonsInTerritory



