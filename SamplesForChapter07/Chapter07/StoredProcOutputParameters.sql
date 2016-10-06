USE AdventureWorks
GO

--Create view with SubTotal values from
--Sales.SalesOrderHeader table and row numbers
IF EXISTS(SELECT *
    FROM sys.views v JOIN sys.schemas s
    ON V.schema_id = s.schema_id
    WHERE v.name = 'vSTRow_Numbers' AND
    s.name = 'dbo')
    DROP VIEW dbo.vSTRow_Numbers
GO

CREATE VIEW dbo.vSTRow_Numbers
AS
SELECT SubTotal, Row_Number() OVER (ORDER BY SubTotal) rn
FROM Sales.SalesOrderHeader
GO

--Create a view that returns the minimum and maximum
--Subtotal values as output parameters
IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_MinMaxSubTotal')
    DROP PROCEDURE usp_MinMaxSubTotal
GO

--Create a stored proc with an input parameter
CREATE PROCEDURE usp_MinMaxSubTotal
@minSubTotal money OUTPUT,
@maxSubTotal money OUTPUT
AS
SET @minSubTotal =
    (SELECT TOP 1 SubTotal
        FROM dbo.vSTRow_Numbers ORDER BY rn)
SET @maxSubTotal =
    (SELECT TOP 1 SubTotal
        FROM dbo.vSTRow_Numbers ORDER BY rn DESC)
GO

--Invoke usp_MinMaxSubTotal to retrieve maximum and
--minimum SubTotal values
DECLARE @lclmin money, @lclmax money
EXEC usp_MinMaxSubTotal @minSubTotal = @lclmin OUTPUT,
    @maxSubTotal = @lclmax OUTPUT

SELECT @lclmin 'Min. SubTotal', @lclmax 'Max. SubTotal'
GO

--Create FN user-defined function to determin
--if a number is odd or even
IF EXISTS(
    SELECT * FROM sys.objects
    WHERE type = 'FN' AND schema_id = 1
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


IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_MedianSubTotal')
    DROP PROCEDURE usp_MedianSubTotal
GO

--Create a stored proc with an input parameter
CREATE PROCEDURE usp_MedianSubTotal
@MedianVal money OUTPUT
AS

DECLARE @rnval int
DECLARE @midup money, @middown money

--Compute near middle row
SET @rnval = ((SELECT COUNT(*) FROM dbo.vSTRow_Numbers)/2)

IF dbo.ufnIsOdd
    ((SELECT COUNT(*)
        FROM dbo.vSTRow_Numbers)) = 1
    --get mediam for odd count
    SET @MedianVal = (SELECT SubTotal
    FROM dbo.vSTRow_Numbers
    WHERE rn = @rnval + 1)
ELSE
BEGIN
    --compute mediam for even count
    SET @midup =
        (SELECT SubTotal
            FROM dbo.vSTRow_Numbers
            WHERE rn = @rnval)
    SET @middown =
        (SELECT SubTotal
            FROM dbo.vSTRow_Numbers
            WHERE rn = (SELECT @rnval + 1))
    SET @MedianVal =
        (SELECT (@midup + @middown)/2)
END
GO

--Invoke usp_MedianSubTotal to retrieve median SubTotal value
DECLARE @MedValue money

EXEC usp_MedianSubTotal @MedianVal = @MedValue OUTPUT

SELECT @MedValue 'Median value'
GO


DROP PROCEDURE usp_MinMaxSubTotal
DROP PROCEDURE usp_MedianSubTotal
DROP FUNCTION dbo.ufnIsOdd
DROP VIEW dbo.vSTRow_Numbers
