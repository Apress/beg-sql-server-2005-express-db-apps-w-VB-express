USE AdventureWorks
GO

--Demo of the OPENROWSET function
SELECT a.*
FROM OPENROWSET('SQLNCLI','instance_name';'userid';'userid_password',
   'SELECT * 
      FROM Northwind.dbo.Shippers') AS a
GO

--utility system stored procedures for working
--with linked servers
EXEC sp_linkedservers
EXEC sp_helplinkedsrvlogin 'MyLinkedServer'

--Specify a default database context on the local computer
USE master
GO

--Drop default login for linked server and linked server
EXEC sp_droplinkedsrvlogin 'MyLinkedServer', NULL
EXEC sp_dropserver 'MyLinkedServer'
GO

--Create a new linked server to the local default
--SQL Server instance
EXEC sp_addlinkedserver   
   @server='MyLinkedServer', 
   @srvproduct= N'',
   @provider='SQLNCLI', 
   @datasrc='Cab233a'
GO

--Perform a query with four-partname for 
--the Shippers table in the Northwind database on
--the linked server
SELECT * FROM MyLinkedServer.Northwind.dbo.Shippers
GO


--Drop default login for linked server and linked server
EXEC sp_droplinkedsrvlogin 'MyLinkedServer', NULL
EXEC sp_dropserver 'MyLinkedServer'
GO

--Add linked server for a remote computer
EXEC sp_addlinkedserver   
   @server='MyLinkedServer', 
   @srvproduct= N'',
   @provider='SQLNCLI', 
   @datasrc='CCS1'
GO

--Specify a login for linked server which any 
--user on the local computer can use
EXEC sp_addlinkedsrvlogin 'MyLinkedServer', 'false', 
    NULL, 'sa', 'password'
GO

--Perform a query with four-partname for 
--the Shippers table in the Northwind database on
--the linked server
SELECT * FROM MyLinkedServer.Northwind.dbo.Shippers
GO

