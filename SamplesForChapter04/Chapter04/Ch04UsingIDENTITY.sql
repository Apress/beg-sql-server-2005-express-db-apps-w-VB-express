USE ProSSEAppsCh04
GO

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'T')
    DROP TABLE T
GO

CREATE TABLE T (
    int1 int IDENTITY PRIMARY KEY,
    bit1 bit NOT NULL DEFAULT 0
)
GO

--IDENTITY property grows column value from
--a seed value by an increment value from a
--default of IDENTITY(seed, increment)
SET NOCOUNT ON
INSERT T (bit1) VALUES (1)
INSERT T (bit1) VALUES (0)
INSERT T DEFAULT VALUES
INSERT T (int1, bit1) VALUES (4,1)
GO

SELECT * FROM T
