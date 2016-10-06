USE ProSSEAppsCh04
GO

--Must drop referencing table before
--the referenced table
IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'ClassGrades')
    DROP TABLE ClassGrades
GO

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'Classes')
    DROP TABLE Classes
GO

CREATE TABLE Classes(
    ClassID int Primary Key,
    ClassTitle varchar(50)
)
GO

CREATE TABLE ClassGrades(
    ClassID int REFERENCES Classes(ClassID)
        ON UPDATE CASCADE,
    StudentID int,
    GradeLetter varchar(2),
    Constraint PK_ClassGrades
        PRIMARY KEY(ClassID, StudentID)
)
GO

--Must insert Classes before attempting
--to insert class grades
INSERT Classes VALUES(1,
    'Learning SQL Server Express')
INSERT Classes VALUES(999,
    'Biographies of Jesus Christ')
GO

INSERT ClassGrades VALUES(1, 1, 'C+')
INSERT ClassGrades VALUES(1, 2, 'A+')
INSERT ClassGrades VALUES(999, 2, 'A')
GO

--INSERT fails because ClassID 998
--does not exist in Classes
INSERT ClassGrades VALUES(998, 1, 'B')
GO

--Change of ClassTitle works
SELECT CG.StudentID, C.ClassTitle, CG.GradeLetter
FROM Classes C, ClassGrades CG
WHERE C.ClassID = CG.ClassID
GO

UPDATE Classes
SET ClassTitle = 'The Life of Jesus Christ'
WHERE ClassID = 999
GO

SELECT CG.StudentID, C.ClassTitle, CG.GradeLetter
FROM Classes C, ClassGrades CG
WHERE C.ClassID = CG.ClassID
GO

--Change to ClassID works too
SELECT * FROM Classes
GO

UPDATE Classes
SET ClassID = 998
WHERE ClassID = 999
GO

SELECT * FROM Classes
GO

SELECT CG.StudentID, C.ClassTitle, CG.GradeLetter
FROM Classes C, ClassGrades CG
WHERE C.ClassID = CG.ClassID
GO


--Update succeeds because of ON UPDATE
--setting but DELETE fails because of 
--no ON DELETE setting
UPDATE Classes 
SET ClassID = 999 
WHERE ClassID = 998
GO

DELETE 
FROM Classes 
WHERE ClassID = 999
GO

UPDATE Classes 
SET ClassID = 998 
WHERE ClassID = 999
GO

