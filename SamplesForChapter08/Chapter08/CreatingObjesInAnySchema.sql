USE NewDB2
GO

--Drop any prior versions of TrackPersons table in
--dbo (schema_id = 1) and sqllogin3 (schema_id =5) schemas
IF EXISTS(SELECT * FROM sys.tables
    WHERE name = 'TrackPersons' AND schema_id = 1)
    DROP TABLE dbo.TrackPersons
IF EXISTS(SELECT * FROM sys.tables
    WHERE name = 'TrackPersons' AND schema_id = 5)
    DROP TABLE sqllogin3.TrackPersons
GO

--Add sqllogin3 to db_ddladmin fixed databaes role
EXEC sp_addrolemember 'db_ddladmin', 'sqllogin4'
GO

--Execute as database user for sqllogin3 login
EXECUTE AS login = 'sqllogin4'

--Specify dbo or sqllogin3 for schema name
DECLARE @sname nvarchar(18)
SET @sname = 'sqllogin3'

IF EXISTS(SELECT *
    FROM sys.tables t
    JOIN sys.schemas s
    ON t.schema_id = s.schema_id
    WHERE t.name = 'TrackPersons' AND s.name = @sname
    AND @sname = 'dbo')
BEGIN
    DROP TABLE dbo.TrackPersons
    print 'Dropped TrackPersons table in dbo schema'
END
ELSE IF EXISTS(SELECT *
    FROM sys.tables t
    JOIN sys.schemas s
    ON t.schema_id = s.schema_id
    WHERE t.name = 'TrackPersons' AND s.name = @sname
    AND @sname = 'sqllogin3')
BEGIN
    DROP TABLE sqllogin3.TrackPersons
    print 'Dropped TrackPersons table in sqllogin3 schema'
END
ELSE IF (@sname <> 'dbo' AND @sname <> 'sqllogin3')
    PRINT 'Specify schema name of dbo or sqllogin3.'

IF @sname = 'dbo'
BEGIN
    CREATE TABLE dbo.TrackPersons (
    tpid int Primary Key,
    name nvarchar (30)
    )
    Print 'Created TrackPersons table in dbo schema.'
END
ELSE IF @sname = 'sqllogin3'
BEGIN
    CREATE TABLE sqllogin3.TrackPersons (
    tpid int Primary Key,
    name nvarchar (30)
    )
    Print 'Created TrackPersons table in sqllogin3 schema.'
END
ELSE print 'Did not create table.'

REVERT
GO





