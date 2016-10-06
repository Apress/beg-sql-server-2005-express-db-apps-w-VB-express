--List database names and is_auto_close_on values
--on server instance
USE master
GO

SELECT name, is_auto_close_on
FROM sys.databases

--Modify and restore autoclode database-level option
--for the Northwind database
USE master
SELECT name, is_auto_close_on
FROM sys.databases
WHERE name = 'Northwind'
GO
sp_dboption 'Northwind', 'autoclose', 'FALSE'
GO
SELECT name, is_auto_close_on
FROM sys.databases
WHERE name = 'Northwind'
GO
sp_dboption 'Northwind', 'autoclose', 'True'
GO
SELECT name, is_auto_close_on
FROM sys.databases
WHERE name = 'Northwind'
GO


--List name and object_id from the  sys.tables view for
--@TBLName and matching name, column_id, and object_id
--from the sys.columns view
USE master
GO

DECLARE @DBName nvarchar(128)
DECLARE @TBLName nvarchar(128)
SET @DBName = N'Northwind'
SET @TBLName = N'Shippers'

SELECT name
FROM sys.databases
WHERE name = @DBName
USE Northwind
SELECT name, object_id
FROM sys.tables
WHERE name = @TBLName
SELECT name, column_id, object_id
FROM sys.columns
WHERE object_id IN
    (SELECT object_id
    FROM sys.tables
    WHERE name = @TBLName)

