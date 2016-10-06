USE AdventureWorks
GO

--Create fresh copies of sqllogin2 login and user
--in AdventureWorks database
IF EXISTS(SELECT * FROM sys.syslogins
    WHERE name = N'sqllogin2')
    DROP LOGIN sqllogin2
GO

CREATE LOGIN sqllogin2
    WITH PASSWORD = 'pass_sqllogin2'
GO

IF EXISTS(SELECT * FROM sys.sysusers
    WHERE name = 'sqllogin2')
    DROP USER sqllogin2
GO

CREATE USER sqllogin2 FOR LOGIN sqllogin2
    WITH DEFAULT_SCHEMA = dbo
GO

--Demo that login grants access, but not SELECT permission
EXECUTE AS login = 'sqllogin2'
SELECT ProductCategoryID, Name FROM Production.ProductCategory
GO

REVERT
GO

--Grant SELECT permission for a single table
GRANT SELECT ON Production.ProductCategory TO sqllogin2
GO

--Demo that you can read one table but not another for sqllogin2 user
EXECUTE AS login = 'sqllogin2'
SELECT ProductCategoryID, Name FROM Production.ProductCategory
GO
SELECT COUNT(*)
FROM Production.ProductSubcategory
GO

REVERT
GO

--Show members of db_datareader role
EXEC sp_helprolemember 'db_datareader'

--Demo htat you can read from more than one table with membership
--in the db_datareader role
EXECUTE AS login = 'sqllogin1'
SELECT ProductCategoryID, Name FROM Production.ProductCategory
GO
SELECT COUNT(*)
FROM Production.ProductSubcategory
GO

REVERT
GO

--Clean up
REVOKE SELECT ON Production.ProductCategory TO sqllogin2
DROP USER sqllogin2
GO

