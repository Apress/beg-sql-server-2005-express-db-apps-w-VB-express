USE master
GO

--Create a database
IF EXISTS(SELECT name FROM sys.databases
    WHERE name = 'ProSSEAppsCh07')
    DROP DATABASE ProSSEAppsCh07
GO

CREATE DATABASE ProSSEAppsCh07
GO

USE ProSSEAppsCh07
GO

--Create three tables
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
    Constraint FK_Sudents_StudentID
        FOREIGN KEY(StudentID)
        REFERENCES Students(StudentID) ON UPDATE CASCADE
)
GO

--Populate three tables with data
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



