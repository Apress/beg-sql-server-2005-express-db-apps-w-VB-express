--Just specify database name
EXEC sp_helpdb model
CREATE DATABASE Database_2
EXEC sp_helpdb Database_2
DROP DATABASE Database_2

--Specify database name and primary
--database file specification
CREATE DATABASE Database_2
ON
(NAME = Database_2_dat,
    FILENAME = 'c:\prosseapps\chapter03\database_2.mdf',
    SIZE = 2MB,
    MAXSIZE = 20,
    FILEGROWTH = 10%)
EXEC sp_helpdb Database_2
DROP DATABASE Database_2

--Specify database and log file specifications
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
EXEC sp_helpdb Database_2
DROP DATABASE Database_2

