--Designate any database available to you;
--You can create ProSSEAppsCh04 with a 
--statement such as: CREATE DATABASE ProSSEAPPSCh04
USE ProSSEAppsCh04

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'T')
    DROP TABLE T

CREATE TABLE T (
    c1 int,
    c2 char(49),
    c3 char(8000)

)
