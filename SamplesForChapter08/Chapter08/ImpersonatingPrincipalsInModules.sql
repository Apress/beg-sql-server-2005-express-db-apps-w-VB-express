USE AdventureWorks
GO

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

--Optional statement to check role memberships
EXEC sp_helprolemember

--Add sqllogin3 to db_ddladmin role
EXEC sp_addrolemember 'db_ddladmin', 'sqllogin3'

--Create a stored proc without WITH EXECUTE AS clause
EXECUTE AS login = 'sqllogin3'

IF EXISTs(SELECT *
    FROM sys.objects
    WHERE type = 'P' AND name = 'NOEXECUTEAS')
    DROP PROCEDURE NOEXECUTEAS
GO

CREATE PROC NOEXECUTEAS
@colnames varchar(100),
@tblname varchar(50)
AS

SELECT USER

EXEC ('SELECT ' + @colnames + ' FROM ' + @tblname)
GO

REVERT
GO


--Execute stored proc from sqllogin5 after granting
--EXEC permission to user
GRANT EXEC ON NOEXECUTEAS TO sqllogin5
GO

EXECUTE AS login = 'sqllogin5'
GO

EXEC NOEXECUTEAS 'ProductCategoryID, Name', 
    'Production.ProductCategory'
GO

REVERT
GO


--Create a stored proc with dynamic sql that runs
--as sqllogin4
GRANT IMPERSONATE ON USER::sqllogin4 TO sqllogin3

EXECUTE AS login = 'sqllogin3'
GO

IF EXISTs(SELECT *
    FROM sys.objects
    WHERE type = 'P' AND name = 'SPASSQLLOGIN4')
    DROP PROCEDURE SPASSQLLOGIN4
GO

CREATE PROC SPASSQLLOGIN4
@colnames varchar(100),
@tblname varchar(50)
WITH EXECUTE AS 'sqllogin4'
AS

SELECT USER

EXEC ('SELECT ' + @colnames + ' FROM ' + @tblname)
GO

REVERT
GO

GRANT SELECT ON Production.ProductCategory TO sqllogin4
GRANT EXEC ON SPASSQLLOGIN4 TO sqllogin5
GO


EXECUTE AS login = 'sqllogin5'
GO

EXEC SPASSQLLOGIN4 'ProductCategoryID, Name', 
    'Production.ProductCategory'
GO

EXEC SPASSQLLOGIN4 'EmployeeID', 'HumanResources.Employee'
GO

REVERT
GO

--Clean up
EXEC sp_droprolemember 'db_ddladmin', 'sqllogin3'



