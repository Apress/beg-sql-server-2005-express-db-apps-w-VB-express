USE ProSSEAppsCh07
GO

--Create a new view after dropping previously
--existing version of view
IF EXISTS(SELECT *
    FROM sys.views
    WHERE name = 'StudentGrades' AND
    schema_id = 1)
    DROP VIEW dbo.StudentGrades
GO

CREATE VIEW dbo.StudentGrades
AS
SELECT s.StudentID, s.FirstName, s.LastName, s.Fullname,
    c.ClassID, c.ClassTitle, cg.Gradeletter
FROM Classes c JOIN ClassGrades cg
ON c.ClassID = cg.ClassID
JOIN Students S
ON s.StudentID = cg.StudentID
GO


--Create a trigger for inserting new students and classes
IF EXISTS(SELECT *
    FROM sys.objects o JOIN sys.schemas s
    ON o.schema_id = s.schema_id
    WHERE type = 'TR' AND
    s.name = 'dbo' AND
    o.name = 'trInsertClassStudentGrades')
    DROP TRIGGER trInsertClassStudentGrades
GO

CREATE TRIGGER trInsertClassStudentGrades
ON StudentGrades
INSTEAD OF INSERT
AS

DECLARE @ClassID int, @StudentID int 
DECLARE @ClassIDIn bit, @StudentIDIn bit
DECLARE @ClassTitle nvarchar(50), @FirstName nvarchar(30), 
    @LastName nvarchar(50)

--Assign @ClassID and @StudentID
SET @ClassID = (SELECT ClassID FROM inserted)
SET @StudentID = (SELECT StudentID FROM inserted)

--Is ClassID in Classes
IF EXISTS(SELECT * FROM Classes WHERE ClassID = @ClassID)
    SET @ClassIDIn = 1
ELSE
    SET @ClassIDIn = 0

--Is StudentID in Students
IF EXISTS(SELECT * FROM Students WHERE StudentID = @StudentID)
    SET @StudentIDIn = 1
ELSE
    SET @StudentIDIn = 0

--Insert Class info if @ClassID is valid
if @ClassIDIn = 0 and @ClassID IS NOT NULL
BEGIN
    SET @ClassTitle = (SELECT ClassTitle FROM inserted)
    INSERT dbo.StudentGrades (ClassID, ClassTitle)
        VALUES (@ClassID, @ClassTitle)
END
ELSE 
    IF @ClassIDIn = 1
        RAISERROR ('ClassID already assigned.',10,1)    

--Insert Student info if @StudentID is valid
IF @StudentIDIn = 0 AND @StudentID IS NOT NULL
BEGIN
    SET @FirstName = (SELECT FirstName FROM inserted)
    SET @LastName = (SELECT LastName FROM inserted)
    INSERT dbo.StudentGrades (StudentID, FirstName, LastName)
        VALUES (@StudentID, @FirstName, @LastName)
END
ELSE 
    IF @StudentIDIn = 1
        RAISERROR ('StudentID already assigned.',10,1)    
GO

--Code to test trInsertClassStudentGrades
SELECT * FROM Students
SELECT StudentID, CAST(FirstName AS nvarchar(9)) 'FirstName',
    CAST(LastName AS nvarchar(9)) 'LastName',
    CAST(FullName AS nvarchar(19)) 'FullName'
FROM Students

INSERT dbo.StudentGrades (StudentID, FirstName, LastName) 
    VALUES (3,'Virginia', 'Dobson')


SELECT * FROM Students
SELECT StudentID, CAST(FirstName AS nvarchar(9)) 'FirstName',
    CAST(LastName AS nvarchar(9)) 'LastName',
    CAST(FullName AS nvarchar(19)) 'FullName'
FROM Students

INSERT dbo.StudentGrades (StudentID, FirstName, LastName) 
    VALUES (3,'Mary', 'Dobson')

SELECT * FROM Classes

INSERT dbo.StudentGrades (ClassID, ClassTitle)
    VALUES (2, 'Learning Visual Basic Express for DBAs')
GO

SELECT * FROM Classes

DELETE FROM Classes WHERE ClassID = 2
DELETE FROM Students WHERE StudentID = 3
    
DROP TRIGGER trInsertClassStudentGrades




