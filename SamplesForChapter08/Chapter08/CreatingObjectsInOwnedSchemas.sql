USE NewDB2
GO

--Run script in this file only just after running the
--script in the OwningSchemas.sql

--Grant CREATE TABLE permission for owned schema
GRANT CREATE TABLE TO sqllogin3
GO

--Create a table in the user's default schema, which is owned
EXECUTE AS login = 'sqllogin3'

CREATE TABLE TrackPersons (
    tpid int Primary Key,
    name nvarchar (30)
    )
GO

SELECT name, schema_id FROM sys.tables

--For display in book
SELECT CAST(name AS nvarchar(12)) 'name', schema_id FROM sys.tables

REVERT
GO



--Drop any prior versions of TrackPersons table in
--sqllogin3 (schema_id =5) schema
IF EXISTS(SELECT * FROM sys.tables
    WHERE name = 'TrackPersons' AND schema_id = 5)
    DROP TABLE sqllogin3.TrackPersons


--Drop sqllogin3 user from sqllogin3SchemaOwner role
EXEC sp_droprolemember 'sqllogin3SchemaOwner', 'sqllogin3'

--Try again to create a table in the user's default schema
EXECUTE AS login = 'sqllogin3'

CREATE TABLE TrackPersons (
    tpid int Primary Key,
    name nvarchar (30)
    )
GO

SELECT name, schema_id FROM sys.tables

--For display in book
SELECT CAST(name AS nvarchar(12)) 'name', schema_id FROM sys.tables

REVERT
GO


--Drop any prior versions of TrackPersons table in
--sqllogin3 (schema_id =5) schema
IF EXISTS(SELECT * FROM sys.tables
    WHERE name = 'TrackPersons' AND schema_id = 5)
    DROP TABLE sqllogin3.TrackPersons
GO

--Grant CREATE TABLE permission for owned schema
GRANT CREATE TABLE TO sqllogin4
GO

--Create a table in the user's owned schema
EXECUTE AS login = 'sqllogin4'

CREATE TABLE sqllogin3.TrackPersons (
    tpid int Primary Key,
    name nvarchar (30)
    )
GO

SELECT name, schema_id FROM sys.tables

--For display in book
SELECT CAST(name AS nvarchar(12)) 'name', schema_id FROM sys.tables

--Drop any prior versions of TrackPersons table in
--sqllogin3 (schema_id =5) schema
IF EXISTS(SELECT * FROM sys.tables
    WHERE name = 'TrackPersons' AND schema_id = 5)
    DROP TABLE sqllogin3.TrackPersons

REVERT
GO



--Try again to create a table in the user's default schema
EXECUTE AS login = 'sqllogin4'

CREATE TABLE TrackPersons (
    tpid int Primary Key,
    name nvarchar (30)
    )
GO

SELECT name, schema_id FROM sys.tables

--For display in book
SELECT CAST(name AS nvarchar(12)) 'name', schema_id FROM sys.tables

REVERT
GO




