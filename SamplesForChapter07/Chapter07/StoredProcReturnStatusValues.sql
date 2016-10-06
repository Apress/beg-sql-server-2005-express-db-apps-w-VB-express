USE AdventureWorks
GO

IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_SalesPersonReport')
    DROP PROCEDURE usp_SalesPersonReport
GO

CREATE PROC usp_SalesPersonReport
@BestSalesPerson nvarchar(150) OUTPUT
AS

SET @BestSalesPerson = (SELECT REPLACE(FirstName + ' ' +
    ISNULL(MiddleName, '') + ' ' + LastName, '  ', ' ')
    FROM Sales.VSalesPerson
    WHERE SalesYTD =
    (SELECT MAX(SalesYTD) FROM Sales.VSalesPerson))

SELECT SalesPersonID, FirstName, MiddleName,
    LastName, SalesYTD
FROM Sales.VSalesPerson

IF (SELECT SalesYTD
    FROM Sales.VSalesPerson
    WHERE SalesYTD = (SELECT MAX(SalesYTD)
    FROM Sales.VSalesPerson)) >
    (SELECT SalesLastYear
    FROM Sales.VSalesPerson
    WHERE SalesYTD =
    (SELECT MAX(SalesYTD)
    FROM Sales.VSalesPerson))
    RETURN 1
ELSE
    RETURN 0
GO

DECLARE @BestName nvarchar(150), @rsval int

EXEC @rsval = usp_SalesPersonReport
    @BestSalesPerson = @BestName OUTPUT

IF @rsval = 1
    SELECT @BestName  'Best sales person is:',
        'Yes' 'Exceeded last year:'
ELSE
    SELECT @BestName  'Best sales person is:',
        'No' 'Exceeded last year:'

--For display in book
IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_SalesPersonReport')
    DROP PROCEDURE usp_SalesPersonReport
GO

CREATE PROC usp_SalesPersonReport
@BestSalesPerson nvarchar(150) OUTPUT
AS

SET @BestSalesPerson = (SELECT REPLACE(FirstName + ' ' +
    ISNULL(MiddleName, '') + ' ' + LastName, '  ', ' ')
    FROM Sales.VSalesPerson
    WHERE SalesYTD =
    (SELECT MAX(SalesYTD) FROM Sales.VSalesPerson))

SELECT SalesPersonID, CAST(FirstName AS nvarchar(9)) 'FirstName', 
    CAST(MiddleName AS nvarchar(10)) 'MiddleName',
    CAST(LastName AS nvarchar(17)) 'LastName', SalesYTD
FROM Sales.VSalesPerson

IF (SELECT SalesYTD
    FROM Sales.VSalesPerson
    WHERE SalesYTD = (SELECT MAX(SalesYTD)
    FROM Sales.VSalesPerson)) >
    (SELECT SalesLastYear
    FROM Sales.VSalesPerson
    WHERE SalesYTD =
    (SELECT MAX(SalesYTD)
    FROM Sales.VSalesPerson))
    RETURN 1
ELSE
    RETURN 0
GO

DECLARE @BestName nvarchar(150), @rsval int

EXEC @rsval = usp_SalesPersonReport
    @BestSalesPerson = @BestName OUTPUT

IF @rsval = 1
    SELECT CAST(@BestName AS nvarchar(21))  'Best sales person is:',
        'Yes' 'Exceeded last year:'
ELSE
    SELECT CAST(@BestName AS nvarchar(21))  'Best sales person is:',
        'No' 'Exceeded last year:'


DROP PROCEDURE usp_SalesPersonReport
