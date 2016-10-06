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
        PRIMARY KEY(ClassID, StudentID)
)
GO

INSERT ClassGrades VALUES(1,1,'A')
INSERT ClassGrades VALUES(1,2,'B-')
INSERT ClassGrades (ClassID, GradeLetter)
    VALUES(1,'C-')
GO

SELECT * FROM ClassGrades
