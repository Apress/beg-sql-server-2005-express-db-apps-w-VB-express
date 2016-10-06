USE ProSSEAppsCh07
GO

--Create a new view after dropping previously\
--existing version of view
IF EXISTS(SELECT *
    FROM sys.views
    WHERE name = 'StudentGrades' AND 
    schema_id = SCHEMA_ID('dbo'))
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


--SELECT from view before adding a new class
SELECT DISTINCT ClassID, ClassTitle
FROM dbo.StudentGrades
ORDER BY ClassID
GO

--INSERT new class through view
INSERT dbo.StudentGrades (ClassID, ClassTitle)
    VALUES (2, 'Learning Visual Basic Express for DBAs')
GO

--SELECT from view after adding a new class
SELECT DISTINCT ClassID, ClassTitle
FROM dbo.StudentGrades
ORDER BY ClassID
GO

--Verify new row is there by querying the Classes table
SELECT ClassID, ClassTitle
FROM Classes
GO

--Attempt to insert generates an error because modification
--affects multiple base tables
INSERT dbo.StudentGrades (ClassID, StudentID, Gradeletter)
    VALUES(2, 1, 'B')
INSERT dbo.StudentGrades (ClassID, StudentID, Gradeletter)
    VALUES(2, 2, 'A')
GO

--Remedy by inserting directly into a base table
INSERT ClassGrades (ClassID, StudentID, Gradeletter)
    VALUES(2, 1, 'B')
INSERT ClassGrades (ClassID, StudentID, Gradeletter)
    VALUES(2, 2, 'A')
GO

--SELECT from view after adding a new class
SELECT DISTINCT ClassID, ClassTitle
FROM dbo.StudentGrades
ORDER BY ClassID
GO

--SELECT from view before updating LastName
SELECT StudentID, FullName, ClassTitle, GradeLetter
FROM dbo.StudentGrades
ORDER BY StudentID, ClassID

--Update LastName of student
UPDATE dbo.StudentGrades
SET LastName = 'DBA-Minister'
WHERE StudentID = 2
GO


--SELECT from view after updating last name
SELECT  StudentID, FullName, ClassTitle, GradeLetter
FROM dbo.StudentGrades
ORDER BY StudentID, ClassID



--SELECT from view before updating LastName
SELECT StudentID, 
    CAST(FullName AS nvarchar(19)) 'FullName', 
    CAST(ClassTitle AS nvarchar(38)) 'ClassTitle', 
    GradeLetter
FROM dbo.StudentGrades
ORDER BY StudentID, ClassID

--Update LastName of student
UPDATE dbo.StudentGrades
SET LastName = 'DBA-Minister'
WHERE StudentID = 2
GO


--SELECT from view after updating last name
SELECT  StudentID, 
    CAST(FullName AS nvarchar(19)) 'FullName', 
    CAST(ClassTitle AS nvarchar(38)) 'ClassTitle', 
    GradeLetter
FROM dbo.StudentGrades
ORDER BY StudentID, ClassID






