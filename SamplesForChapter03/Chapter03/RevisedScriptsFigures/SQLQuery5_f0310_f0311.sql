--Copy database and log files for Database_1a from
--c:\program files\microsoft sql server\mssql.1\mssql\data\
--to c:\prosseapps\chapter03\ and make .bak files for .mdf and .ldf
--in c:\program files\microsoft sql server\mssql.1\mssql\data\
xp_cmdshell 'c:\prosseapps\chapter03\copydb_1afiles'
GO
--Look at databaes before adding a new one
--Notice paths for database and log files of
--Database_1a
SELECT name, database_id FROM sys.databases
EXEC sp_helpdb @dbname = N'Database_1a'
GO
--Create a new database (Database_1b) based on the
--copied database and log files from Database_1a,
--which was created originally as Database_1
CREATE DATABASE Database_1b
ON PRIMARY (FILENAME = 'c:\prosseapps\chapter03\Database_1a.mdf')
FOR ATTACH
GO
--See what happened after CREATE DATABASE...FOR ATTACH
SELECT name, database_id FROM sys.databases
EXEC sp_helpdb @dbname = N'Database_1b'
GO
--Drop Database_1b and delete unused log file
DROP DATABASE Database_1b
GO
xp_cmdshell 'erase c:\prosseapps\chapter03\Database_1a_log.ldf'
GO

--See what happened to Database_1a after
--dropping Database_1b
EXEC sp_helpdb @dbname = N'Database_1a'

--Now drop Database_1a and rename .bak files
DROP DATABASE Database_1a
GO
xp_cmdshell 'c:\prosseapps\chapter03\recoverdb_1afiles'
GO
--Re-create Database_1a
CREATE DATABASE Database_1a
ON (FILENAME =
'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data\Database_1a.mdf')
FOR ATTACH
GO
SELECT name, database_id FROM sys.databases
EXEC sp_helpdb @dbname = N'Database_1a'
GO

