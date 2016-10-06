USE AdventureWorks
GO

--Create function to count the number of customers
IF EXISTS(
    SELECT * FROM sys.objects
    WHERE type = 'FN' AND schema_id = SCHEMA_ID('dbo')
    AND name = 'ufnCntCustomers')
    DROP FUNCTION dbo.ufnCntCustomers
GO


CREATE FUNCTION dbo.ufnCntCustomers()
RETURNS int
AS
BEGIN
    RETURN (SELECT COUNT(*) FROM Sales.Customer)
END
GO

--Invoke the function to count customers
SELECT dbo.ufnCntCustomers() '# of Customers'
GO

--Drop ufnIsOdd function
DROP FUNCTION dbo.ufnCntCustomers
GO

--Create function to determine if a
--number (@n) is odd
IF EXISTS(
    SELECT * FROM sys.objects
    WHERE type = 'FN' AND schema_id = SCHEMA_ID('dbo')
    AND name = 'ufnIsOdd')
    DROP FUNCTION dbo.ufnIsOdd
GO

CREATE FUNCTION dbo.ufnIsOdd (@n int)
RETURNS bit
AS
BEGIN
    RETURN (@n % 2)
END
GO

--Use ufnIsOdd function
DECLARE @numb int
SELECT @numb 'Number', dbo.ufnIsOdd (@numb) 'Is_odd = 1'
SET @numb = 6
SELECT @numb 'Number', dbo.ufnIsOdd (@numb) 'Is_odd = 1'
SET @numb = 7
SELECT @numb 'Number', dbo.ufnIsOdd (@numb) 'Is_odd = 1'

--Use ufnIsOdd for computed column
SELECT TOP 5 SalesPersonID, FirstName, LastName,
    dbo.ufnIsOdd(SalesPersonID) 'ID_odd = 1'
FROM Sales.vSalesPerson

--For display in book
SELECT TOP 5 SalesPersonID, CAST(FirstName AS nvarchar(9)) 'FirstName',
    CAST(LastName AS nvarchar(8)) 'LastName',
    dbo.ufnIsOdd(SalesPersonID) 'ID_odd = 1'
FROM Sales.vSalesPerson

--Drop ufnIsOdd function
DROP FUNCTION dbo.ufnIsOdd
GO

