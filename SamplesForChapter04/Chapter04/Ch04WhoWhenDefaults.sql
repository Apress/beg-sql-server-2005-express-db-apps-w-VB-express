USE ProSSEAppsCh04
GO

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'T')
    DROP TABLE T
GO

CREATE TABLE T (
    int1 int,
    bit1 bit NOT NULL DEFAULT 0,
    rvr1 timestamp,
    usr1 nvarchar(128) DEFAULT USER,
    createtime datetime DEFAULT CURRENT_TIMESTAMP
)
GO

SET NOCOUNT ON
INSERT T (int1) VALUES (1)
WAITFOR DELAY '00:00:01'
INSERT T (int1, bit1) VALUES (2, 0)
WAITFOR DELAY '00:00:01'
INSERT T (int1, bit1) VALUES (3, 1)
GO

SELECT int1, bit1, usr1, 
    CONVERT(int, rvr1) 'Timestamp as int', 
    createtime 
FROM T
GO

UPDATE T
set bit1 = 1
WHERE int1 = 2
GO

SELECT int1, bit1, usr1, 
    CONVERT(int, rvr1) 'Timestamp as int', 
    createtime 
FROM T
GO
