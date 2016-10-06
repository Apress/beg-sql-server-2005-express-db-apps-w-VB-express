USE ProSSEAppsCh04
GO

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'T')
    DROP TABLE T
GO

CREATE TABLE T (
    int1 int PRIMARY KEY,
    bit1 bit NOT NULL DEFAULT 0
)
GO

--Row inserts fail for missing primary key
--and duplicate primary key values
SET NOCOUNT ON
INSERT T (int1, bit1) VALUES (1, 1)
INSERT T (int1, bit1) VALUES (2, 0)
INSERT T (int1) VALUES (3)
INSERT T (bit1) VALUES (1)
INSERT T (int1, bit1) VALUES (3,1)
GO

SELECT * FROM T

