USE master
GO

--Login as Windows adaministrator and re-create
--sqllogin1 and cab233a\winlogin1
IF EXISTS(SELECT * FROM sys.syslogins
    WHERE name = N'sqllogin1')
    DROP LOGIN sqllogin1
GO

CREATE LOGIN sqllogin1
    WITH PASSWORD = 'pass_sqllogin1'
GO

--Switch execution context to sqllogin1 login
--and try to add a new login named sqllogin2
EXECUTE AS login = 'sqllogin1'
GO

IF EXISTS(SELECT * FROM sys.syslogins
    WHERE name = N'sqllogin2')
    DROP LOGIN sqllogin2
GO

CREATE LOGIN sqllogin2
    WITH PASSWORD = 'pass_sqllogin2'
GO

--Return to Windows administrator execution context
REVERT
GO

--Explorer fixed server roles overall and drill
--down on permissions for securityadmin role
EXEC sp_helpsrvrole
EXEC sp_srvrolepermission 'securityadmin'

--Add sqllogin1 to the securityadmin fixed server role
EXEC sp_addsrvrolemember 'sqllogin1', 'securityadmin'
GO

--Now add the new login from sqllogin1
EXECUTE AS login = 'sqllogin1'
GO

IF EXISTS(SELECT * FROM sys.syslogins
    WHERE name = N'sqllogin2')
    DROP LOGIN sqllogin2
GO

--List logins and properties before adding a new one
SELECT name, isntgroup, isntuser, securityadmin, sysadmin
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

--For display in book
SELECT CAST(name AS nvarchar(31)) 'name',
    CAST(isntgroup AS nvarchar(9)) 'isntgroup',
    CAST(isntuser AS nvarchar(8)) 'isntuser',
    CAST(securityadmin AS nvarchar(9)) 'securityadmin',
    CAST(sysadmin AS nvarchar(8)) 'sysadmin'
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

CREATE LOGIN sqllogin2
    WITH PASSWORD = 'pass_sqllogin2'
GO

--List logins and properties before adding a new one
SELECT name, isntgroup, isntuser, securityadmin, sysadmin
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

--For display in book
SELECT CAST(name AS nvarchar(31)) 'name',
    CAST(isntgroup AS nvarchar(9)) 'isntgroup',
    CAST(isntuser AS nvarchar(8)) 'isntuser',
    CAST(securityadmin AS nvarchar(9)) 'securityadmin',
    CAST(sysadmin AS nvarchar(8)) 'sysadmin'
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

--Return to Windows administrator execution context
REVERT
GO

--Explorer fixed server roles overall and drill
--down on permissions for securityadmin role
EXEC sp_helpsrvrole
EXEC sp_srvrolepermission 'dbcreator'

--Try to create NewDB1 from sqllogin1 login before adding sqllogin1 to dbcreator
EXECUTE AS login = 'sqllogin1'
GO

USE master
GO

IF EXISTS(SELECT name FROM sys.databases
    WHERE name = N'NewDB1')
    DROP DATABASE NewDB1
GO

CREATE DATABASE NewDB1
GO

REVERT
GO


--Add sqllogin1 to the securityadmin fixed server role
EXEC sp_addsrvrolemember 'sqllogin1', 'dbcreator'
GO

--Now create NewDB1 from sqllogin1 login
EXECUTE AS login = 'sqllogin1'
GO

USE master
GO

IF EXISTS(SELECT name FROM sys.databases
    WHERE name = N'NewDB1')
    DROP DATABASE NewDB1
GO

SELECT COUNT(*) 'NewDB1 is there = 1'
    FROM sys.databases
    WHERE name = N'NewDB1'
GO

CREATE DATABASE NewDB1
GO

SELECT COUNT(*) 'NewDB1 is there = 1'
    FROM sys.databases
    WHERE name = N'NewDB1'
GO

REVERT
GO

DROP DATABASE NewDB1


EXEC sp_dropsrvrolemember 'sqllogin1', 'dbcreator'
GO

EXEC sp_dropsrvrolemember 'sqllogin1', 'securityadmin'
GO


