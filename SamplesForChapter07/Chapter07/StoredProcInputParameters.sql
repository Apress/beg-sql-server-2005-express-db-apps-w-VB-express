USE AdventureWorks
GO

--Drop prior instance of stored proc
IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_SalesPersonInATerritory')
    DROP PROCEDURE usp_SalesPersonInATerritory
GO

--Create a stored proc with an input parameter
CREATE PROCEDURE usp_SalesPersonInATerritory
@TID int
AS
SELECT s.TerritoryID, c.LastName, c.Phone
FROM Sales.SalesPerson S JOIN HumanResources.Employee e
ON s.SalesPersonID = e.EmployeeID
JOIN Person.Contact c
ON c.ContactID = e.ContactID
WHERE s.TerritoryID = @TID
GO

--Run the stored proc with two different
--parameter values
EXEC usp_SalesPersonInATerritory 1
GO
EXEC usp_SalesPersonInATerritory 2
GO

--Failing to input a parameter can cause a failure
--EXEC usp_SalesPersonInATerritory
--GO

--Drop stored proc
DROP PROCEDURE usp_SalesPersonInATerritory
GO

--For display in book
--Drop prior instance of stored proc
IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_SalesPersonInATerritory')
    DROP PROCEDURE usp_SalesPersonInATerritory
GO

--Create a stored proc with an input parameter
CREATE PROCEDURE usp_SalesPersonInATerritory
@TID int
AS
SELECT s.TerritoryID,
    CAST(c.LastName AS nvarchar(17)) 'LastName',
    CAST(c.Phone AS nvarchar(19)) 'Phone'
FROM Sales.SalesPerson S JOIN HumanResources.Employee e
ON s.SalesPersonID = e.EmployeeID
JOIN Person.Contact c
ON c.ContactID = e.ContactID
WHERE s.TerritoryID = @TID
GO

--Run the stored proc with two different
--parameter values
EXEC usp_SalesPersonInATerritory 1
GO
EXEC usp_SalesPersonInATerritory 2
GO

--Failing to input a parameter can cause a failure
--EXEC usp_SalesPersonInATerritory
--GO

--Drop stored proc
DROP PROCEDURE usp_SalesPersonInATerritory
GO

--Drop prior instance of stored proc
IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_SalesPersonInATerritory')
    DROP PROCEDURE usp_SalesPersonInATerritory
GO

--Create a stored proc with an input parameter and
--a non-null default value
CREATE PROCEDURE usp_SalesPersonInATerritory
@TID int = 2
AS
SELECT s.TerritoryID, c.LastName, c.Phone
FROM Sales.SalesPerson S JOIN HumanResources.Employee e
ON s.SalesPersonID = e.EmployeeID
JOIN Person.Contact c
ON c.ContactID = e.ContactID
WHERE s.TerritoryID = @TID
GO

--Run the stored proc with two different
--parameter values
EXEC usp_SalesPersonInATerritory 1
GO

--Failing to input a parameter can causeS
--usp_SalesPersonInATerritory to use defaul
--parameter value
EXEC usp_SalesPersonInATerritory
GO

--Drop stored proc
DROP PROCEDURE usp_SalesPersonInATerritory
GO

--For display in book
--Drop prior instance of stored proc
IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_SalesPersonInATerritory')
    DROP PROCEDURE usp_SalesPersonInATerritory
GO

--Create a stored proc with an input parameter and
--a non-null default value
CREATE PROCEDURE usp_SalesPersonInATerritory
@TID int = 3
AS
SELECT s.TerritoryID,
    CAST(c.LastName AS nvarchar(17)) 'LastName',
    CAST(c.Phone AS nvarchar(19)) 'Phone'
FROM Sales.SalesPerson S JOIN HumanResources.Employee e
ON s.SalesPersonID = e.EmployeeID
JOIN Person.Contact c
ON c.ContactID = e.ContactID
WHERE s.TerritoryID = @TID
GO

--Run the stored proc with two different
--parameter values
EXEC usp_SalesPersonInATerritory 1
GO

--Failing to input a parameter can causeS
--usp_SalesPersonInATerritory to use defaul
--parameter value
EXEC usp_SalesPersonInATerritory
GO

--Drop stored proc
DROP PROCEDURE usp_SalesPersonInATerritory
GO


--Drop prior instance of stored proc
IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_SalesPersonInATerritoryOrNot')
    DROP PROCEDURE usp_SalesPersonInATerritoryOrNot
GO

--Create a stored proc with an input parameter,
--default value assignment, and IF statement
CREATE PROCEDURE usp_SalesPersonInATerritoryOrNot
@TID int = NULL
AS
IF @TID IS NOT NULL
    SELECT s.TerritoryID, c.LastName, c.Phone
    FROM Sales.SalesPerson S JOIN HumanResources.Employee e
    ON s.SalesPersonID = e.EmployeeID
    JOIN Person.Contact c
    ON c.ContactID = e.ContactID
    WHERE s.TerritoryID = @TID
ELSE
    SELECT s.TerritoryID, c.LastName, c.Phone
    FROM Sales.SalesPerson S JOIN HumanResources.Employee e
    ON s.SalesPersonID = e.EmployeeID
    JOIN Person.Contact c
    ON c.ContactID = e.ContactID
    WHERE s.TerritoryID IS NULL
GO

--Run the stored proc with three different
--parameter values, including NULL
EXEC usp_SalesPersonInATerritoryOrNot 1
GO
EXEC usp_SalesPersonInATerritoryOrNot NULL
GO
EXEC usp_SalesPersonInATerritoryOrNot
GO

--Drop stored proc
DROP PROCEDURE usp_SalesPersonInATerritoryOrNot
GO

--For display in book
--Drop prior instance of stored proc
IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_SalesPersonInATerritoryOrNot')
    DROP PROCEDURE usp_SalesPersonInATerritoryOrNot
GO

--Create a stored proc with an input parameter,
--default value assignment, and IF statement
CREATE PROCEDURE usp_SalesPersonInATerritoryOrNot
@TID int = NULL
AS
IF @TID IS NOT NULL
    SELECT s.TerritoryID,
        CAST(c.LastName AS nvarchar(17)) 'LastName',
        CAST(c.Phone AS nvarchar(19)) 'Phone'
    FROM Sales.SalesPerson S JOIN HumanResources.Employee e
    ON s.SalesPersonID = e.EmployeeID
    JOIN Person.Contact c
    ON c.ContactID = e.ContactID
    WHERE s.TerritoryID = @TID
ELSE
    SELECT s.TerritoryID,
        CAST(c.LastName AS nvarchar(17)) 'LastName',
        CAST(c.Phone AS nvarchar(19)) 'Phone'
    FROM Sales.SalesPerson S JOIN HumanResources.Employee e
    ON s.SalesPersonID = e.EmployeeID
    JOIN Person.Contact c
    ON c.ContactID = e.ContactID
    WHERE s.TerritoryID IS NULL
GO

--Run the stored proc with three different
--parameter values, including NULL
EXEC usp_SalesPersonInATerritoryOrNot 1
GO
EXEC usp_SalesPersonInATerritoryOrNot NULL
GO
EXEC usp_SalesPersonInATerritoryOrNot
GO

--Drop stored proc
DROP PROCEDURE usp_SalesPersonInATerritoryOrNot
GO


--Create function to determine if a
--number (@n) is odd
IF EXISTS(
    SELECT * FROM sys.objects
    WHERE type = 'FN' AND schema_id = 1
    AND name = 'ufnIsOdd')
    DROP FUNCTION dbo.ufnIsOdd
GO

CREATE FUNCTION dbo.ufnIsOdd (@n int = 5)
RETURNS bit
AS
BEGIN
    RETURN (@n % 2)
END
GO

--Use ufnIsOdd function
DECLARE @numb int

--Input a null value returns null instead of
--using default parameter
SELECT @numb 'Number', dbo.ufnIsOdd (@numb) 'Is_odd = 1'

--To tap default parameter value, you must
--explicitly reference default value with the
--default keyword
SELECT @numb 'Number', dbo.ufnIsOdd (DEFAULT) 'Is_odd = 1'

SET @numb = 6
SELECT @numb 'Number', dbo.ufnIsOdd (@numb) 'Is_odd = 1'

--Drop ufnIsOdd function
DROP FUNCTION dbo.ufnIsOdd
GO


--Same taks performed with a stored procedure
IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_NumberIsOdd')
    DROP PROCEDURE usp_NumberIsOdd
GO

CREATE PROCEDURE usp_NumberIsOdd
@n int = 5
AS
SELECT @n 'Number', @n % 2 'Is_odd = 1'
GO

DECLARE @numb int

EXEC usp_NumberIsOdd @numb
EXEC usp_NumberIsOdd
SET @numb = 6
EXEC usp_NumberIsOdd @numb
GO

DROP PROCEDURE usp_NumberIsOdd
GO

