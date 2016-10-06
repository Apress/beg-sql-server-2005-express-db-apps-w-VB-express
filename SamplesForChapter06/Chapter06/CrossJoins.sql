USE AdventureWorks
GO

--Turn off messages for rows affected
SET NOCOUNT ON

--Create CJTable
IF EXISTS(SELECT name FROM sys.tables WHERE name = 'CJTable')
    DROP TABLE CJTable
CREATE TABLE CJTable(
myint int
)

--Insert two rows to CJTable
DECLARE @int1 int
SET @int1 = 2
INSERT CJTable VALUES(@int1)
SET @int1 = 4
INSERT CJTable VALUES(@int1)

--Count rows in joined result set
SELECT COUNT(SalesPersonID) 'Count of joined rows after adding 2 rows'
FROM Sales.SalesPerson CROSS JOIN dbo.CJTable

--Cross Join SalesPerson with CJTable and count rows
--in joined result set
SELECT TOP 5 SalesPersonID, SalesQuota, MAX(myint) 'MAX(myint)',
    MIN(myint) 'MIN(myint)'
FROM Sales.SalesPerson CROSS JOIN dbo.CJTable
GROUP BY SalesPersonID, SalesQuota
ORDER BY SalesPersonID



--Insert another row in CJTable
SET @int1 = 8
INSERT CJTable VALUES(@int1)

--Count rows in joined result set
SELECT COUNT(SalesPersonID) 'Count of joined rows after adding 3 rows'
FROM Sales.SalesPerson CROSS JOIN dbo.CJTable

--Cross Join SalesPerson with CJTable and count rows
--in joined result set
SELECT TOP 5 SalesPersonID, SalesQuota, MAX(myint) 'MAX(myint)',
    MIN(myint) 'MIN(myint)'
FROM Sales.SalesPerson CROSS JOIN dbo.CJTable
GROUP BY SalesPersonID, SalesQuota
ORDER BY SalesPersonID

--Cleanup by dropping CJTable and restoring display of messages
--about rows affected
DROP TABLE CJTable
SET NOCOUNT OFF
