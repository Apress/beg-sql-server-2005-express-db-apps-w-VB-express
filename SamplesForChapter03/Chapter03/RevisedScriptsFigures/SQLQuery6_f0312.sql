--repeat with FOR ATTACH sample with references to both
--database and log files

--Copy files
xp_cmdshell 'c:\prosseapps\chapter03\copydb_1afiles'
GO

--Attach copied files
CREATE DATABASE Database_1b
ON PRIMARY (FILENAME = 'c:\prosseapps\chapter03\Database_1a.mdf')
LOG ON (FILENAME = 'c:\prosseapps\chapter03\Database_1a_log.ldf')
FOR ATTACH
GO

--Monitor results
SELECT name, database_id FROM sys.databases
EXEC sp_helpdb @dbname = N'Database_1b'
GO

--Clean up
DROP DATABASE Database_1b
GO
xp_cmdshell 'erase "c:\program files\microsoft sql server\mssql.1\mssql\data\Database_1a*.bak"'
GO
EXEC sp_helpdb @dbname = N'Database_1a'
GO


