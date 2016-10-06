USE ProSSEAppsCh04
GO

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'T')
    DROP TABLE T
GO

CREATE TABLE T (
    int1 int,
    bit1 bit,
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

--All columns for all rows
SELECT * FROM T
GO

--Count all rows
SELECT COUNT(*) 'Rows in T'
FROM T

--Count int1 values (implicitly non-null)
SELECT COUNT(int1) 'int1 values in T'
FROM T

--Count non-null bit1 values
SELECT COUNT(*) 'Count of non-null bit1'
FROM T
WHERE bit1 IS NOT NULL

--Count null bit1 values
SELECT COUNT(*) 'Count of null bit1'
FROM T
WHERE bit1 IS NULL

--Average of dec1 values
SELECT CAST(AVG(dec1) AS dec(5,2)) 'Avg of dec1'
FROM T
WHERE dec1 IS NOT NULL
