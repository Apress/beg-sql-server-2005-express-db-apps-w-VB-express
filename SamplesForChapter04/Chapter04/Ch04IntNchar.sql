--Designate any database available to you
USE ProSSEAppsCh04

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'T')
    DROP TABLE T

CREATE TABLE T (
    c1 int,
    c2 nchar(24),
    c3 nchar(4000)

)
