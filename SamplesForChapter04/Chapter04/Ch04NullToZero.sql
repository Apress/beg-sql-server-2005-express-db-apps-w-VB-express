USE ProSSEAppsCh04
GO

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'T')
    DROP TABLE T
GO

CREATE TABLE T (
    int1 int,
    bit1 bit NOT NULL DEFAULT 0,
    varchar1 varchar(3),
    dec1 dec(5,2),
    cmp1 AS (int1 + bit1)
)
GO


SET NOCOUNT ON
INSERT T (int1, bit1) VALUES (1, 0)
INSERT T (int1, varchar1) VALUES (2, 'abc')
INSERT T (int1, dec1) VALUES (3, 5.25)
INSERT T (bit1, dec1) VALUES (1, 9.75)
GO


SELECT * FROM T
GO
