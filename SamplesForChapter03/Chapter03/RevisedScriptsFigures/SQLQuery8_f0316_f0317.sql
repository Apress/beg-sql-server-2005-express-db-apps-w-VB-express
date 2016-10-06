--Copy original Northwind files for
--NWCopy database
DECLARE @str1 nvarchar(128)
SET @str1 = 'copy "c:\Program Files\Microsoft SQL Server\' +
    'MSSQL.1\MSSQL\DATA\northwnd.mdf" ' +
    'c:\prosseapps\chapter03'
EXEC master..xp_cmdshell @str1
SET @str1 = 'copy "c:\Program Files\Microsoft SQL Server\' +
    'MSSQL.1\MSSQL\DATA\northwnd.ldf" ' +
    'c:\prosseapps\chapter03'
EXEC master..xp_cmdshell @str1

--Create NWCopy from copied Northwind files
CREATE DATABASE NWCopy
ON PRIMARY (FILENAME = 'c:\prosseapps\chapter03\northwnd.mdf')
LOG ON (FILENAME = 'c:\prosseapps\chapter03\northwnd.ldf')
FOR ATTACH
GO

--Verify NWCopy database by checking its files
--and performing a SELECT statement from Shippers
EXEC sp_helpdb NWCopy
SELECT * FROM NWCopy..Shippers

--Show recovery model property settings for databases
SELECT name, recovery_model, recovery_model_desc
FROM sys.databases

--Change recovery model for NWCopy TO full
ALTER DATABASE NWCopy
SET RECOVERY full
GO

--Verify change
SELECT name, recovery_model, recovery_model_desc
FROM sys.databases
WHERE name = 'NWCopy'

--Change recovery model for NWCopy TO simple
ALTER DATABASE NWCopy
SET RECOVERY simple
GO

--Verify change
SELECT name, recovery_model, recovery_model_desc
FROM sys.databases
WHERE name = 'NWCopy'
GO

--Full data backup and restore sample
USE master
EXEC sp_addumpdevice 'disk', NWCopyBK_1,
    'c:\prosseapps\chapter03\NWCopyBK_1.bak'
BACKUP DATABASE NWCopy TO NWCopyBK_1
GO

SELECT * FROM NWCopy..Shippers
GO
WAITFOR DELAY '00:00:01'
GO
xp_cmdshell 'erase c:\prosseapps\chapter03\northwnd.mdf'
GO

RESTORE DATABASE NWCopy FROM NWCopyBK_1
GO
SELECT * FROM NWCopy..Shippers
GO

--Differential backup and restore code samples
BACKUP DATABASE NWCopy
TO NWCopyBK_1
WITH INIT
GO

INSERT INTO NWCopy..Shippers
    (CompanyName, Phone)
    VALUES ('CAB, Inc.', '(123) 456-7890')
GO

BACKUP DATABASE NWCopy
TO NWCopyBK_1
WITH DIFFERENTIAL
GO

INSERT INTO NWCopy..Shippers
    (CompanyName, Phone)
    VALUES ('CAB Does It', '(456) -789-0123')
GO

BACKUP DATABASE NWCopy
TO NWCopyBK_1
WITH DIFFERENTIAL
GO


RESTORE DATABASE NWCopy 
FROM NWCopyBK_1 
WITH NORECOVERY
GO

RESTORE DATABASE NWCopy
FROM NWCopyBK_1
WITH FILE = 2, RECOVERY
GO

SELECT * FROM NWCopy..Shippers
GO


RESTORE DATABASE NWCopy 
FROM NWCopyBK_1 
WITH NORECOVERY
GO

RESTORE DATABASE NWCopy
FROM NWCopyBK_1
WITH FILE = 3, RECOVERY
GO

SELECT * FROM NWCopy..Shippers
GO

xp_cmdshell 'erase c:\prosseapps\chapter03\northwnd.mdf'
GO

RESTORE DATABASE NWCopy
FROM NWCopyBK_1 
WITH NORECOVERY
GO

RESTORE DATABASE NWCopy
FROM NWCopyBK_1
WITH FILE = 2, RECOVERY
GO

SELECT * FROM NWCopy..Shippers
GO

--Clean up
DROP DATABASE NWCopy
GO
EXEC sp_dropdevice @logicalname = 'NWCopyBK_1'
GO
xp_cmdshell 'erase c:\prosseapps\chapter03\NWCopyBK_1.bak'
GO


