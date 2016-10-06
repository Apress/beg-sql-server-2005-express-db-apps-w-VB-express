--Use login for Windows administrator or sa login to connect
--to SQL Server Express and set AdventureWorks database as
--the database context
USE AdventureWorks
GO

--You can also select from tables
SELECT * FROM Production.ProductCategory
GO

--Running from sqllogin1 causes an error because 
--does not have access permission for database
EXECUTE AS login = 'sqllogin1'
GO

--Optional statement that is not strictly necessary
REVERT
GO

--Enable guest account before and after cheching status of users
SELECT name, hasdbaccess, isntuser, issqluser
FROM sys.sysusers
WHERE issqlrole = 0 

--For display in book
SELECT CAST(name AS nvarchar(18)) 'name', hasdbaccess, isntuser, issqluser
FROM sys.sysusers
WHERE issqlrole = 0

EXEC sp_adduser 'guest'

SELECT name, hasdbaccess, isntuser, issqluser
FROM sys.sysusers
WHERE issqlrole = 0

--For display in book
SELECT CAST(name AS nvarchar(18)) 'name', hasdbaccess, isntuser, issqluser
FROM sys.sysusers
WHERE issqlrole = 0


--You can now connect
EXECUTE AS login = 'sqllogin1'
GO

--but you cannot select
SELECT * FROM Production.ProductCategory
GO

REVERT
GO

--Disable guest user
EXEC sp_dropuser 'guest'

SELECT name, hasdbaccess, isntuser, issqluser
FROM sys.sysusers
WHERE issqlrole = 0

--For display in book
SELECT CAST(name AS nvarchar(18)) 'name', hasdbaccess, isntuser, issqluser
FROM sys.sysusers
WHERE issqlrole = 0


--Create user from in AdventureWorks based on sqllogin1
SELECT name, hasdbaccess, isntuser, issqluser
FROM sys.sysusers
WHERE issqlrole = 0

--For display in book
SELECT CAST(name AS nvarchar(18)) 'name', hasdbaccess, isntuser, issqluser
FROM sys.sysusers
WHERE issqlrole = 0

IF EXISTS(SELECT * FROM sys.sysusers 
    WHERE name = 'sqllogin1')
    DROP USER sqllogin1
GO

CREATE USER sqllogin1 FOR LOGIN sqllogin1
    WITH DEFAULT_SCHEMA = dbo
GO

SELECT name, hasdbaccess, isntuser, issqluser
FROM sys.sysusers
WHERE issqlrole = 0

--For display in book
SELECT CAST(name AS nvarchar(18)) 'name', hasdbaccess, isntuser, issqluser
FROM sys.sysusers
WHERE issqlrole = 0


--Explore fixed database roles
EXEC sp_helpdbfixedrole
EXEC sp_dbfixedrolepermission 'db_datareader'
EXEC sp_dbfixedrolepermission 'db_datawriter'

--Now that sqllogin1 has access to the AdventureWorks
--database, we can give it SELECT permission
EXEC sp_addrolemember 'db_datareader', 'sqllogin1'

--You can connect from sqllogin1 to the AdventureWorks database
EXECUTE AS login = 'sqllogin1'
GO

--You can also select from tables
SELECT * FROM Production.ProductCategory
GO

REVERT
GO

--Create a fresh copy of the TrackPersons table in the
--NewDB1 database from the sqllogin1 execution context;
--insert a row and display the inserted row with a 
--SELECT statement
EXECUTE AS login = 'sqllogin1'
GO

USE NewDB1
GO

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'TrackPersons')
    DROP TABLE TrackPersons
GO

CREATE TABLE TrackPersons (
tpid int Primary Key,
name nvarchar (30)
)
GO

INSERT TrackPersons VALUES (1, 'Rick Dobson')
GO

SELECT * FROM TrackPersons
GO

USE AdventureWorks
GO

REVERT
GO


--Add a fresh copy of hte cab233a\winlogin1 login;
--revise the computer name from cab233a for your 
--computing environment
USE master
GO

IF EXISTS(SELECT * FROM sys.syslogins
    WHERE name = N'cab233a\winlogin1')
    DROP LOGIN [cab233a\winlogin1]
GO

CREATE LOGIN [cab233a\winlogin1] FROM WINDOWS
GO

USE NewDB1
GO

IF EXISTS(SELECT * FROM sys.sysusers 
    WHERE name = 'cab233a\winlogin1')
    DROP USER [cab233a\winlogin1]
GO

CREATE USER [cab233a\winlogin1] FOR LOGIN [cab233a\winlogin1]
    WITH DEFAULT_SCHEMA = dbo
GO

--List users in NewDB1
SELECT name, hasdbaccess, isntuser, issqluser
FROM sys.sysusers
WHERE issqlrole = 0

--For display in book
SELECT CAST(name AS nvarchar(18)) 'name', hasdbaccess, isntuser, issqluser
FROM sys.sysusers
WHERE issqlrole = 0


--Assign cab233a\winlogin1 user to db_datareader and db_datawriter roles
EXEC sp_addrolemember 'db_datareader', 'cab233a\winlogin1'
EXEC sp_addrolemember 'db_datawriter', 'cab233a\winlogin1'


EXECUTE AS login = 'cab233a\winlogin1'
GO

SELECT * FROM TrackPersons
GO

INSERT TrackPersons VALUES(2, 'Virginia Dobson')
GO

SELECT * FROM TrackPersons
GO

REVERT
GO

--Clean up
USE AdventureWorks
GO

DROP USER sqllogin1



