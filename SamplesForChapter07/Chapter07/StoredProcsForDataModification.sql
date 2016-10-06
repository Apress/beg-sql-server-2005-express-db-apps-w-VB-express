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

IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_AddClass')
    DROP PROCEDURE usp_AddClass
GO

CREATE PROC usp_AddClass
@ClassIDval int,
@ClassTitleval varchar(50)
AS
INSERT dbo.StudentGrades (ClassID, ClassTitle)
    VALUES (@ClassIDval, @ClassTitleval)
GO

--SELECT from the underlying table before adding a new class
SELECT ClassID, ClassTitle
FROM Classes
GO

--INSERT new class through view
EXEC usp_AddClass 2, 'Learning Visual Basic Express for DBAs'
GO

--Verify new row is there by querying the Classes table
SELECT ClassID, ClassTitle
FROM Classes
GO

--SELECT from view after adding a new class
SELECT DISTINCT ClassID, ClassTitle
FROM dbo.StudentGrades
ORDER BY ClassID
GO


IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_AddClassGrades')
    DROP PROCEDURE usp_AddClassGrades
GO

CREATE PROC usp_AddClassGrades
@ClassIDval int,
@StudentIDval int,
@Gradeletterval varchar(2)
AS
INSERT ClassGrades (ClassID, StudentID, Gradeletter)
    VALUES(@ClassIDval, @StudentIDval, @Gradeletterval)
GO

EXEC usp_AddClassGrades 2, 1, 'B'
EXEC usp_AddClassGrades 2, 2, 'A'
GO

--SELECT from view after adding a new class
SELECT FirstName, LastName, ClassID, Gradeletter
FROM dbo.StudentGrades
ORDER BY ClassID
GO

--For display in book
SELECT CAST(FirstName AS nvarchar(9)) 'FirstName', 
    CAST(LastName AS nvarchar(12)) 'LastName', ClassID, Gradeletter
FROM dbo.StudentGrades
ORDER BY ClassID
GO


IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_UpdateLastName')
    DROP PROCEDURE usp_UpdateLastName
GO

CREATE PROC usp_UpdateLastName
@StudentIDval int,
@NewLastNameval nvarchar(50)
AS
UPDATE dbo.StudentGrades
SET LastName = @NewLastNameval
WHERE StudentID = @StudentIDval
GO

EXEC usp_UpdateLastName 2,'DBA-Minister'
GO

--SELECT from view after changing last name
SELECT FirstName, LastName, ClassID, Gradeletter
FROM dbo.StudentGrades
ORDER BY ClassID
GO

--For display in book
SELECT CAST(FirstName AS nvarchar(9)) 'FirstName', 
    CAST(LastName AS nvarchar(12)) 'LastName', ClassID, Gradeletter
FROM dbo.StudentGrades
ORDER BY ClassID
GO


IF EXISTS(SELECT * FROM sys.objects
    WHERE type = 'P' AND
    name = 'usp_DeleteGradesClasses')
    DROP PROCEDURE usp_DeleteGradesClasses
GO

CREATE PROC usp_DeleteGradesClasses
@ClassIDval int
AS
DELETE FROM ClassGrades
    WHERE ClassID = @ClassIDval
DELETE FROM Classes
    WHERE ClassID = @ClassIDval
GO

EXEC usp_DeleteGradesClasses 2
GO

--SELECT from view after changing last name
SELECT FirstName, LastName, ClassID, Gradeletter
FROM dbo.StudentGrades
ORDER BY ClassID
GO

--For display in book
SELECT CAST(FirstName AS nvarchar(9)) 'FirstName', 
    CAST(LastName AS nvarchar(12)) 'LastName', ClassID, Gradeletter
FROM dbo.StudentGrades
ORDER BY ClassID
GO

--Inserting with the Bulk Insert statement
USE ProSSEAppsCh07
GO

IF EXISTS(SELECT * FROM sys.objects 
    WHERE type = 'p' AND 
    name = 'usp_BULKINSERT')
    DROP PROC usp_BULKINSERT
GO

CREATE PROC usp_BULKINSERT
AS
BULK INSERT Classes FROM "c:\NewClasses.txt"
GO

EXEC usp_BULKINSERT
GO

SELECT * FROM Classes
GO

DELETE FROM Classes WHERE ClassID = 2 OR ClassID = 3
