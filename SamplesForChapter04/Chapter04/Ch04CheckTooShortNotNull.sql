USE ProSSEAppsCh04
GO

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'T')
    DROP TABLE T
GO

CREATE TABLE T (
    int1 int IDENTITY PRIMARY KEY,
    vch1 varchar(5)
        CHECK (LEN(vch1) > 0)
        NOT NULL,
    vch2 varchar(5)
        CONSTRAINT CK_LEN_TOO_SHORT
        CHECK (LEN(vch2) > 0)
        NOT NULL
)
GO

INSERT T (vch1, vch2) VALUES('a','b')
INSERT T (vch1, vch2) VALUES('','b')
INSERT T (vch1, vch2) VALUES('a','')
INSERT T DEFAULT VALUES
GO

SELECT * FROM T

