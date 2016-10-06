USE ProSSEAppsCh04
GO

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'ClassGrades')
    DROP TABLE ClassGrades
GO

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'Students')
    DROP TABLE Students
GO

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'Classes')
    DROP TABLE Classes
GO

CREATE TABLE Students(
    StudentID int Primary Key,
    FirstName nvarchar(30),
    LastName nvarchar(50),
    FullName AS (FirstName + ' ' + LastName)
)
GO

CREATE TABLE Classes(
    ClassID int Primary Key,
    ClassTitle varchar(50)
)
GO

CREATE TABLE ClassGrades(
    ClassID int,
    StudentID int,
    GradeLetter varchar(2),
    Constraint PK_ClassGrades
        PRIMARY KEY(ClassID, StudentID),
    Constraint FK_Classes_ClassID
        FOREIGN KEY(ClassID)
        REFERENCES Classes(ClassID) ON UPDATE CASCADE,
    Constraint FK_Students_StudentID
        FOREIGN KEY(StudentID)
        REFERENCES Students(StudentID) ON UPDATE CASCADE
)
GO


--Insert classes rows
INSERT Classes VALUES(1,
    'Learning SQL Server Express')
INSERT Classes VALUES(999,
    'Biographies of Jesus Christ')
GO

--Insert Students rows
INSERT Students VALUES(1, 'Poor', 'DBA')
INSERT Students VALUES(2, 'Better', 'DBA')
GO

--Insert ClassGrades rows
INSERT ClassGrades VALUES(1, 1, 'C+')
INSERT ClassGrades VALUES(1, 2, 'A+')
INSERT ClassGrades VALUES(999, 2, 'A')
GO

--Show table values after initial population
SELECT S.FullName, C.ClassTitle, CG.GradeLetter
FROM Classes C, ClassGrades CG, Students S
WHERE C.ClassID = CG.ClassID AND
    S.StudentID = CG.StudentID
GO

--Update ClassID and ClassTitle
SELECT * FROM Classes
GO

UPDATE Classes
SET ClassID = 998,
    ClassTitle = 'The Life of Jesus Christ'
WHERE ClassID = 999
GO

SELECT * FROM Classes
GO

SELECT S.FullName, C.ClassTitle, CG.GradeLetter
FROM Classes C, ClassGrades CG, Students S
WHERE C.ClassID = CG.ClassID AND
    S.StudentID = CG.StudentID
GO

--Update LastName of student
UPDATE Students
SET LastName = 'DBA-Minister'
WHERE StudentID = 2
GO

SELECT S.FullName, C.ClassTitle, CG.GradeLetter
FROM Classes C, ClassGrades CG, Students S
WHERE C.ClassID = CG.ClassID AND
    S.StudentID = CG.StudentID
GO


