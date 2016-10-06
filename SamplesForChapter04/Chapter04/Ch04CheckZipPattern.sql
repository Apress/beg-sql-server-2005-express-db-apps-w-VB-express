USE ProSSEAppsCh04
GO

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'T')
    DROP TABLE T
GO

CREATE TABLE T (
    int1 int IDENTITY PRIMARY KEY,
    psc1 varchar(5)
        CHECK (LEN(psc1) = 5 AND
        psc1 LIKE
        '[0-9][0-9][0-9][0-9][0-9]')
        NOT NULL
)
GO

INSERT T (psc1) VALUES('40222')
INSERT T (psc1) VALUES('4022')
INSERT T (psc1) VALUES('r0222')
INSERT T DEFAULT VALUES
GO

SELECT * FROM T
GO
