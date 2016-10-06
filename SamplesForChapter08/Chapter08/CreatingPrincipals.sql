USE master
GO

--Display non-internal server-based principals before adding new login
SELECT name, principal_id, type_desc
FROM sys.server_principals
WHERE LEFT(name, 4) <> '##MS'
GO

--FOR display in book
SELECT CAST(name AS nvarchar(31)) 'name',
    principal_id, CAST(type_desc AS nvarchar(24)) 'type_desc'
FROM sys.server_principals
WHERE LEFT(name, 4) <> '##MS'
GO

--Create sqllogin1 with password of pass_sqllogin1
IF EXISTS(SELECT * FROM sys.syslogins
    WHERE name = N'sqllogin1')
    DROP LOGIN sqllogin1
GO

CREATE LOGIN sqllogin1
    WITH PASSWORD = 'pass_sqllogin1'
GO

--Display non-internal server-based principals after adding new login
SELECT name, principal_id, type_desc
FROM sys.server_principals
WHERE LEFT(name, 4) <> '##MS'
GO

--FOR display in book
SELECT CAST(name AS nvarchar(31)) 'name',
    principal_id, CAST(type_desc AS nvarchar(24)) 'type_desc'
FROM sys.server_principals
WHERE LEFT(name, 4) <> '##MS'
GO

EXECUTE AS login = 'sqllogin1'
GO

SELECT name, principal_id, type_desc
FROM sys.server_principals
WHERE LEFT(name, 4) <> '##MS' AND 
	type_desc<> 'SERVER_ROLE'
GO

--Display non-internal logins after adding new login
SELECT name, hasaccess, isntname, isntgroup, isntuser, sysadmin
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

EXECUTE AS login = 'sqllogin1'
GO

--Display non-internal logins after adding new login
SELECT name, hasaccess, isntname, isntgroup, isntuser, sysadmin
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

--Revert to previous execution context
REVERT
GO


--Display non-internal logins before adding new Windows login
SELECT name, hasaccess, isntname, isntgroup, isntuser, sysadmin
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

--For display in book
SELECT CAST(name AS nvarchar(31)) 'name',
    CAST(hasaccess AS nvarchar(9)) 'hasaccess',
    CAST(isntname AS nvarchar(8)) 'isntname',
    CAST(isntgroup AS nvarchar(9)) 'isntgroup',
    CAST(isntuser AS nvarchar(8)) 'isntuser',
    CAST(sysadmin AS nvarchar(8)) 'sysadmin'
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

--Create SQL Server Express winlogin1 login
--from winlogin1 Windows login
IF EXISTS(SELECT * FROM sys.syslogins
    WHERE name = N'cab233a\winlogin1')
    DROP LOGIN [cab233a\winlogin1]
GO

CREATE LOGIN [cab233a\winlogin1] FROM WINDOWS
GO

--Display non-internal logins after adding new Windows login
SELECT name, hasaccess, isntname, isntgroup, isntuser, sysadmin
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

--For display in book
SELECT CAST(name AS nvarchar(17)) 'name',
    CAST(hasaccess AS nvarchar(9)) 'hasaccess',
    CAST(isntname AS nvarchar(8)) 'isntname',
    CAST(isntgroup AS nvarchar(9)) 'isntgroup',
    CAST(isntuser AS nvarchar(8)) 'isntuser',
    CAST(sysadmin AS nvarchar(8)) 'sysadmin'
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

--Run in winlogin1 login context
EXECUTE AS login = 'cab233a\winlogin1'
GO

--Display non-internal logins after adding new Windows login
SELECT name, hasaccess, isntname, isntgroup, isntuser, sysadmin
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

--For display in book
SELECT CAST(name AS nvarchar(17)) 'name',
    CAST(hasaccess AS nvarchar(9)) 'hasaccess',
    CAST(isntname AS nvarchar(8)) 'isntname',
    CAST(isntgroup AS nvarchar(9)) 'isntgroup',
    CAST(isntuser AS nvarchar(8)) 'isntuser',
    CAST(sysadmin AS nvarchar(8)) 'sysadmin'
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

--Restore Windows admin account
REVERT
GO

EXECUTE AS login = 'sqllogin1'
GO

--Display non-internal logins after adding new Windows login
SELECT name, hasaccess, isntname, isntgroup, isntuser, sysadmin
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

--For display in book
SELECT CAST(name AS nvarchar(17)) 'name',
    CAST(hasaccess AS nvarchar(9)) 'hasaccess',
    CAST(isntname AS nvarchar(8)) 'isntname',
    CAST(isntgroup AS nvarchar(9)) 'isntgroup',
    CAST(isntuser AS nvarchar(8)) 'isntuser',
    CAST(sysadmin AS nvarchar(8)) 'sysadmin'
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

--Restore Windows admin account
REVERT
GO


--Execute AS does not properly simulate account when
--there is no BUILTIN\Users account
--Run in winlogin2 login context
EXECUTE AS login = 'cab233a\winlogin2'
GO

--Display non-internal logins after adding new Windows login
SELECT name, hasaccess, isntname, isntgroup, isntuser, sysadmin
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

--For display in book
SELECT CAST(name AS nvarchar(17)) 'name',
    CAST(hasaccess AS nvarchar(9)) 'hasaccess',
    CAST(isntname AS nvarchar(8)) 'isntname',
    CAST(isntgroup AS nvarchar(9)) 'isntgroup',
    CAST(isntuser AS nvarchar(8)) 'isntuser',
    CAST(sysadmin AS nvarchar(8)) 'sysadmin'
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

REVERT
GO


--Run in winlogin3 login context; winlogin3 does not exist
EXECUTE AS login = 'cab233a\winlogin3'
GO

--Result set is for Windows administrator
SELECT name, hasaccess, isntname, isntgroup, isntuser, sysadmin
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

--For display in book
SELECT CAST(name AS nvarchar(31)) 'name',
    CAST(hasaccess AS nvarchar(9)) 'hasaccess',
    CAST(isntname AS nvarchar(8)) 'isntname',
    CAST(isntgroup AS nvarchar(9)) 'isntgroup',
    CAST(isntuser AS nvarchar(8)) 'isntuser',
    CAST(sysadmin AS nvarchar(8)) 'sysadmin'
FROM sys.syslogins
WHERE LEFT(name, 4) <> '##MS'
GO

REVERT
GO

--Switch the database context to NewDB (see ExploringPrincipals.sql)
USE NewDB
GO

--Dislay database-based principals
SELECT name, principal_id, type_desc,
    default_schema_name, is_fixed_role
FROM sys.database_principals

--For display in book
SELECT CAST(name AS nvarchar(18)) 'name', principal_id, CAST(type_desc AS nvarchar(13)) 'type_desc',
    CAST(default_schema_name AS nvarchar(19)) 'default_schema_name', is_fixed_role
FROM sys.database_principals

--Create a user for sqllogin1 in the guest schema
IF EXISTS(SELECT * FROM sys.sysusers WHERE name = 'sqllogin1')
    DROP USER sqllogin1
GO

CREATE USER sqllogin1 FOR LOGIN sqllogin1 WITH DEFAULT_SCHEMA = guest
GO

--Dislay database-based principals
SELECT name, principal_id, type_desc,
    default_schema_name, is_fixed_role
FROM sys.database_principals

--For display in book
SELECT CAST(name AS nvarchar(18)) 'name', principal_id, CAST(type_desc AS nvarchar(13)) 'type_desc',
    CAST(default_schema_name AS nvarchar(19)) 'default_schema_name', is_fixed_role
FROM sys.database_principals
GO

--Create a user for sqllogin1 in the default schema (dbo)
IF EXISTS(SELECT * FROM sys.sysusers WHERE name = 'sqllogin1')
    DROP USER sqllogin1
GO

CREATE USER sqllogin1 FOR LOGIN sqllogin1
GO

--Dislay database-based principals
SELECT name, principal_id, type_desc,
    default_schema_name, is_fixed_role
FROM sys.database_principals
WHERE name = 'sqllogin1'
GO

--For display in book
SELECT CAST(name AS nvarchar(18)) 'name', principal_id, CAST(type_desc AS nvarchar(13)) 'type_desc',
    CAST(default_schema_name AS nvarchar(19)) 'default_schema_name', is_fixed_role
FROM sys.database_principals
WHERE name = 'sqllogin1'
GO

IF EXISTS(SELECT * FROM sys.sysusers WHERE name = 'cab233a\winlogin1')
    DROP USER [cab233a\winlogin1]
GO

CREATE USER [cab233a\winlogin1] FOR LOGIN [cab233a\winlogin1]
GO

--Dislay database-based principals
SELECT name, principal_id, type_desc,
    default_schema_name, is_fixed_role
FROM sys.database_principals
WHERE type_desc <> 'DATABASE_ROLE'
GO

SELECT CAST(name AS nvarchar(18)) 'name', principal_id, CAST(type_desc AS nvarchar(13)) 'type_desc',
    CAST(default_schema_name AS nvarchar(19)) 'default_schema_name', is_fixed_role
FROM sys.database_principals
WHERE type_desc <> 'DATABASE_ROLE'
GO

