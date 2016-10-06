USE ProSSEAppsCh04

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'T')
    BEGIN
        PRINT 'T already.'
        DROP TABLE T_old
        EXEC sp_rename 'T', 'T_old'
    END
ELSE PRINT 'No T already.'

CREATE TABLE T (
    c1 bigint,
    c2 nvarchar(max)
)


INSERT T
SELECT * FROM T_old

SELECT c1, RIGHT(C2,2) 'Right 2 of c2' FROM T

