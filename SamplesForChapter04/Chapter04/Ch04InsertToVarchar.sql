--Designate any database available to you
USE ProSSEAppsCh04

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'T')
    DROP TABLE T
GO

CREATE TABLE T (
    c1 int,
    c2 varchar(8000)
)
GO

DECLARE @v1 varchar(max)

SET @v1 = REPLICATE('A',7999) + 'B'
INSERT T VALUES (1, @v1)
SELECT RIGHT(c2,2) 'Right 2 of c2' FROM T

SET @v1 = @v1 + 'B'
INSERT T VALUES (2, @v1)
SELECT RIGHT(c2,2) 'Right 2 of c2' FROM T

