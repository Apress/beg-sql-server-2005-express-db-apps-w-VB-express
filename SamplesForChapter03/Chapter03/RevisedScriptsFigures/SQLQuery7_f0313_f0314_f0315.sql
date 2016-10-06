--Create Database_2
CREATE DATABASE Database_2
ON PRIMARY
(NAME = Database_2_dat,
    FILENAME = 'c:\prosseapps\chapter03\database_2dat.mdf',
    SIZE = 2MB,
    MAXSIZE = 20,
    FILEGROWTH = 10%)
LOG ON
(NAME = Database_2_log,
    FILENAME = 'c:\prosseapps\chapter03\database_2log.ldf',
    SIZE = 4MB,
    MAXSIZE = 10MB,
    FILEGROWTH = 20%)
GO

--Show database's autoclose setting; copy one database
--file; then erase copy
SELECT name, database_id, is_auto_close_on 
FROM sys.databases WHERE name = 'Database_2'
DECLARE @str1 nvarchar(90)
SET @str1 = 'copy c:\prosseapps\chapter03\database_2dat.mdf ' + 
    'c:\prosseapps\chapter03\database_2dat.bak'
EXEC master..xp_cmdshell @str1
SET @str1 = 'erase ' + 
    'c:\prosseapps\chapter03\database_2dat.bak'
EXEC master..xp_cmdshell @str1
GO


--Detach database; then attach
EXEC sp_detach_db @dbname = N'Database_2'
GO
--Show database is gone, but its files remain
SELECT name
FROM sys.databases WHERE name = 'Database_2'
DECLARE @str1 nvarchar(90)
SET @str1 = 'dir ' + 
    'c:\prosseapps\chapter03\database_2*.*'
EXEC master..xp_cmdshell @str1
GO

--Create a new Database_2 by attaching files
CREATE DATABASE Database_2
ON PRIMARY (FILENAME = 'c:\prosseapps\chapter03\Database_2dat.mdf')
LOG ON (FILENAME = 'c:\prosseapps\chapter03\Database_2log.ldf')
FOR ATTACH
GO

--Show database's autoclose setting
SELECT name, database_id, is_auto_close_on 
FROM sys.databases WHERE name = 'Database_2'
GO

--With a database created via FOR ATTACH clause copy does not work
DECLARE @str1 nvarchar(90)
SET @str1 = 'copy c:\prosseapps\chapter03\database_2dat.mdf ' + 
    'c:\prosseapps\chapter03\database_2dat.bak'
EXEC master..xp_cmdshell @str1
GO

--Clean up
DROP DATABASE Database_2