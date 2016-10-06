USE master
GO

--Display server-based principals, excluding those
--for internal use
SELECT name, principal_id, type_desc 
FROM sys.server_principals
WHERE LEFT(name, 4) <> '##MS'

--FOR display in book
SELECT CAST(name AS nvarchar(31)) 'name', 
    principal_id, CAST(type_desc AS nvarchar(24)) 'type_desc'
FROM sys.server_principals
WHERE LEFT(name, 4) <> '##MS'


EXEC sp_helpsrvrole
EXEC sp_helpsrvrolemember 'sysadmin'
EXEC sp_srvrolepermission 'bulkadmin'

--Crate a database named NewDB
USE master
GO

IF EXISTS(SELECT name FROM sys.databases
    WHERE name = N'NewDB')
    DROP DATABASE NewDB
GO

CREATE DATABASE NewDB
GO

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

EXEC sp_helpdbfixedrole
EXEC sp_helprolemember 'db_owner'
EXEC sp_dbfixedrolepermission



