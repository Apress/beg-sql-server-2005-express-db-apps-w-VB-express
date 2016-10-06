USE ProSSEAppsCh04
GO

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'ClassGrades')
    DROP TABLE ClassGrades
GO


CREATE TABLE ClassGrades(
    ClassID int,
    StudentID int,
    GradeLetter varchar(2),
    Constraint PK_ClassGrades
        PRIMARY KEY(ClassID, StudentID),
    Constraint CK_GradeRange_ClassID
        CHECK (LEFT(UPPER(GradeLetter),1)
        LIKE '[A-F]' AND ClassID < 1000)
)
GO

INSERT ClassGrades VALUES(1, 1, 'C+')
INSERT ClassGrades VALUES(1, 2, 'A+')
INSERT ClassGrades VALUES(1, 3, 'V-')
INSERT ClassGrades VALUES(1001, 1, 'A')
INSERT ClassGrades VALUES(999, 2, 'A')
GO

SELECT * FROM ClassGrades
