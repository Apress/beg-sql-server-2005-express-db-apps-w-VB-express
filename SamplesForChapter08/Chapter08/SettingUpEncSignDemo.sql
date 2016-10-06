--Create database and table for encryption signing samples

USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE name = 'NewDB3')
    DROP DATABASE NewDB3
GO

CREATE DATABASE NewDB3
GO

USE NewDB3
GO

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'ForEncDemo')
    DROP TABLE ForEncDemo
GO

CREATE TABLE ForEncDemo (
    rowid int IDENTITY(1,1) PRIMARY KEY,
    name nvarChar(20),
    id_data_orig Nvarchar(11),
    id_data_enc varbinary(70)
)
GO


IF EXISTS(SELECT * FROM sys.tables WHERE name = 'SignedData')
    DROP TABLE SignedData
GO

CREATE TABLE SignedData (
    rowid int IDENTITY(1,1) PRIMARY KEY,
    certname nvarChar(128) NOT NULL,
    mytext nvarchar(256),
    mysignature varbinary(1024)
)
GO








