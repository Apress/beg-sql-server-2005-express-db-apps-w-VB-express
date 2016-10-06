USE master
GO

--Create NewDB2 database
IF EXISTS(SELECT * FROM sys.databases
    WHERE name = 'NewDB2')
    DROP DATABASE NewDB2
GO

CREATE DATABASE NewDB2
GO

--Switch to NewDB database context
USE NewDB2
GO

--Display schema ID and name along with owner principal ID and name
SELECT s.schema_id, s.name 'Schema name', s.principal_id,
    dp.name 'Principal name'
FROM sys.schemas s RIGHT JOIN sys.database_principals dp
ON s.principal_id = dp.principal_id
WHERE dp.is_fixed_role = 0 AND dp.name <> 'public'

--For display in book
SELECT s.schema_id, CAST(s.name AS nvarchar(18)) 'Schema name', s.principal_id, CAST(dp.name AS nvarchar(20)) 'Principal name'
FROM sys.schemas s RIGHT JOIN sys.database_principals dp
ON s.principal_id = dp.principal_id
WHERE dp.is_fixed_role = 0 AND dp.name <> 'public'



--Create sqllogin3 login and user with
--user having default schema of sqllogin3
IF EXISTS(SELECT * FROM sys.syslogins
    WHERE name = N'sqllogin3')
    DROP LOGIN sqllogin3
GO

CREATE LOGIN sqllogin3
    WITH PASSWORD = 'pass_sqllogin3'
GO

--Drop sqllogin3 schema before trying to drop
--sqllogin3 user
IF EXISTS(SELECT * FROM sys.schemas
    WHERE name = 'sqllogin3')
    DROP SCHEMA sqllogin3
GO

IF EXISTS(SELECT * FROM sys.sysusers
    WHERE name = 'sqllogin3')
    DROP USER sqllogin3
GO

CREATE USER sqllogin3 FOR LOGIN sqllogin3
    WITH DEFAULT_SCHEMA = sqllogin3
GO

--Create schema specified in CREATE USER statement
--for the sqllogin3 user
CREATE SCHEMA sqllogin3 AUTHORIZATION sqllogin3
GO

--Display schema ID and name along with owner principal ID and name
SELECT s.schema_id, s.name 'Schema name',
    s.principal_id, dp.name 'Principal name'
FROM sys.schemas s RIGHT JOIN sys.database_principals dp
ON s.principal_id = dp.principal_id
WHERE dp.is_fixed_role = 0 AND dp.name <> 'public'

--For display in book
SELECT s.schema_id, CAST(s.name AS nvarchar(18)) 'Schema name', s.principal_id, CAST(dp.name AS nvarchar(20)) 'Principal name'
FROM sys.schemas s RIGHT JOIN sys.database_principals dp
ON s.principal_id = dp.principal_id
WHERE dp.is_fixed_role = 0 AND dp.name <> 'public'

--Create sqllogin4 login and user with
--no default schema spec for the user;
--assign login as owner of sqllogin3 schema
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

ALTER AUTHORIZATION ON SCHEMA::sqllogin3 TO sqllogin4
GO


--Display schema ID and name along with owner principal ID and name
SELECT s.schema_id, s.name 'Schema name', s.principal_id, dp.name 'Principal name'
FROM sys.schemas s RIGHT JOIN sys.database_principals dp
ON s.principal_id = dp.principal_id
WHERE dp.is_fixed_role = 0 AND dp.name <> 'public'

--For display in book
SELECT s.schema_id, CAST(s.name AS nvarchar(18)) 'Schema name', s.principal_id, CAST(dp.name AS nvarchar(20)) 'Principal name'
FROM sys.schemas s RIGHT JOIN sys.database_principals dp
ON s.principal_id = dp.principal_id
WHERE dp.is_fixed_role = 0 AND dp.name <> 'public'

--Create role, add users to it, and make the role the owner
--of the sqllogin3 schema
--SELECT * FROM sys.sysusers

--Clear sqllogin3SchemaOwner members and ownership before dropping
IF EXISTS(SELECT * FROM sys.database_principals
    WHERE name = 'sqllogin3SchemaOwner'
    AND type_desc = 'DATABASE_ROLE')
BEGIN
    EXEC sp_droprolemember 'sqllogin3SchemaOwner', 'sqllogin3'
    EXEC sp_droprolemember 'sqllogin3SchemaOwner', 'sqllogin4'
    ALTER AUTHORIZATION ON SCHEMA::sqllogin3 TO dbo
    DROP ROLE sqllogin3SchemaOwner
END
GO

--Create role, add users to it, and make the role the owner
--of the sqllogin3 schema
CREATE ROLE sqllogin3SchemaOwner
EXEC sp_addrolemember 'sqllogin3SchemaOwner', 'sqllogin3'
EXEC sp_addrolemember 'sqllogin3SchemaOwner', 'sqllogin4'
ALTER AUTHORIZATION ON SCHEMA::sqllogin3 TO sqllogin3SchemaOwner
GO


--Display schema ID and name along with owner principal ID and name
SELECT s.schema_id, s.name 'Schema name', s.principal_id, dp.name 'Principal name'
FROM sys.schemas s RIGHT JOIN sys.database_principals dp
ON s.principal_id = dp.principal_id
WHERE dp.is_fixed_role = 0 AND dp.name <> 'public'

--For display in book
SELECT s.schema_id, CAST(s.name AS nvarchar(18)) 'Schema name', s.principal_id, CAST(dp.name AS nvarchar(20)) 'Principal name'
FROM sys.schemas s RIGHT JOIN sys.database_principals dp
ON s.principal_id = dp.principal_id
WHERE dp.is_fixed_role = 0 AND dp.name <> 'public'




