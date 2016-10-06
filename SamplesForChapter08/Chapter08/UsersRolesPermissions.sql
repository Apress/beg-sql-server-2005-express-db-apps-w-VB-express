USE AdventureWorks
GO

--Create proc
IF EXISTs(SELECT *
    FROM sys.objects
    WHERE type = 'P' AND name = 'ProcHello')
    DROP PROCEDURE ProcHello
GO

CREATE PROC ProcHello
AS
Print 'Hello from ProcHello.'
GO

--Create roles
CREATE ROLE ReadCats
CREATE ROLE ReadCatsSubCats
CREATE ROLE SayHello

GRANT SELECT ON Production.ProductCategory
    TO ReadCats, ReadCatsSubCats, SayHello
GRANT SELECT ON Production.ProductSubcategory
    TO ReadCatsSubCats, SayHello
GRANT EXEC ON dbo.ProcHello TO SayHello


--Create logins and users named sqllogin3, sqllogin4, sqllogin5
IF EXISTS(SELECT * FROM sys.syslogins
    WHERE name = N'sqllogin3')
    DROP LOGIN sqllogin3
GO

CREATE LOGIN sqllogin3
    WITH PASSWORD = 'pass_sqllogin3'
GO

IF EXISTS(SELECT * FROM sys.sysusers
    WHERE name = 'sqllogin3')
    DROP USER sqllogin3
GO

CREATE USER sqllogin3 FOR LOGIN sqllogin3
    WITH DEFAULT_SCHEMA = dbo
GO

IF EXISTS(SELECT * FROM sys.syslogins
    WHERE name = N'sqllogin4')
    DROP LOGIN sqllogin4
GO

CREATE LOGIN sqllogin4
    WITH PASSWORD = 'pass_sqllogin4'
GO

IF EXISTS(SELECT * FROM sys.sysusers
    WHERE name = 'sqllogin4')
    DROP USER sqllogin4
GO

CREATE USER sqllogin4 FOR LOGIN sqllogin4
    WITH DEFAULT_SCHEMA = dbo
GO

IF EXISTS(SELECT * FROM sys.syslogins
    WHERE name = N'sqllogin5')
    DROP LOGIN sqllogin5
GO

CREATE LOGIN sqllogin5
    WITH PASSWORD = 'pass_sqllogin5'
GO

IF EXISTS(SELECT * FROM sys.sysusers
    WHERE name = 'sqllogin5')
    DROP USER sqllogin5
GO

CREATE USER sqllogin5 FOR LOGIN sqllogin5
    WITH DEFAULT_SCHEMA = dbo
GO

--Assign users to roles
EXEC sp_addrolemember 'ReadCats', 'sqllogin3'
EXEC sp_addrolemember 'ReadCatsSubCats', 'sqllogin4'
EXEC sp_addrolemember 'SayHello', 'sqllogin5'

EXECUTE AS login = 'sqllogin3'
SELECT ProductCategoryID, Name FROM Production.ProductCategory
GO
SELECT COUNT(*) '# of Subcategories'
FROM Production.ProductSubcategory
GO
EXEC ProcHello
GO

REVERT
GO

EXECUTE AS login = 'sqllogin4'
SELECT ProductCategoryID, Name FROM Production.ProductCategory
SELECT COUNT(*) '# of Subcategories'
FROM Production.ProductSubcategory
GO
EXEC ProcHello
GO

REVERT
GO


EXECUTE AS login = 'sqllogin5'
SELECT ProductCategoryID, Name FROM Production.ProductCategory
SELECT COUNT(*) '# of Subcategories'
FROM Production.ProductSubcategory
GO
EXEC ProcHello
GO

REVERT
GO

--Clean up
EXEC sp_droprolemember 'ReadCats', 'sqllogin3'
EXEC sp_droprolemember 'ReadCatsSubCats', 'sqllogin4'
EXEC sp_droprolemember 'SayHello', 'sqllogin5'

DROP ROLE ReadCats
DROP ROLE ReadCatsSubCats
DROP ROLE SayHello

DROP USER sqllogin3
DROP USER sqllogin4
DROP USER sqllogin5

DROP LOGIN sqllogin3
DROP LOGIN sqllogin4
DROP LOGIN sqllogin5

DROP PROCEDURE ProcHello
