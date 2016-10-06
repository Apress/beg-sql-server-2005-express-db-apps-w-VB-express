USE ProSSEAppsCh07
GO

--Conditionally drop trigger from dbo schema
IF EXISTS(SELECT *
    FROM sys.objects o JOIN sys.schemas s
    ON o.schema_id = s.schema_id
    WHERE type = 'TR' AND
    s.name = 'dbo' AND
    o.name = 'trStudentsEcho')
    DROP TRIGGER trStudentsEcho
GO

--Add trigger to echo changes
CREATE TRIGGER trStudentsEcho
ON Students
FOR UPDATE, INSERT, DELETE
AS
SELECT * FROM inserted
SELECT * FROM deleted
GO

--For display in book
IF EXISTS(SELECT *
    FROM sys.objects o JOIN sys.schemas s
    ON o.schema_id = s.schema_id
    WHERE type = 'TR' AND
    s.name = 'dbo' AND
    o.name = 'trStudentsEcho_Display')
    DROP TRIGGER trStudentsEcho_Display
GO

CREATE TRIGGER trStudentsEcho_Display
ON Students
FOR UPDATE, INSERT, DELETE
AS
SELECT StudentID, CAST(FirstName AS nvarchar(9)) 'FirstName',
    CAST(LastName AS nvarchar(9)) 'LastName',
    CAST(FullName AS nvarchar(19)) 'FullName' FROM inserted
SELECT StudentID, CAST(FirstName AS nvarchar(9)) 'FirstName',
    CAST(LastName AS nvarchar(9)) 'LastName',
    CAST(FullName AS nvarchar(19)) 'FullName' FROM deleted
GO

--INSERT, UPDATE, DELETE
SET NOCOUNT ON
SELECT 'Before INSERT'
INSERT Students (StudentID, FirstName, LastName)
    VALUES (3, 'Rick', 'Dobson')

SELECT 'Before UPDATE'
UPDATE Students
SET FirstName = 'Rickie'
WHERE StudentID = 3

SELECT 'Before DELETE'
DELETE FROM Students WHERE StudentID = 3
SET NOCOUNT OFF

--Some of these statements may fail if the triggers do not currently exist
DROP TRIGGER trStudentsEcho
DROP TRIGGER trStudentsEcho_Display


IF EXISTS(SELECT *
    FROM sys.objects o JOIN sys.schemas s
    ON o.schema_id = s.schema_id
    WHERE type = 'TR' AND
    s.name = 'dbo' AND
    o.name = 'trStudents_Insert_Rollback')
    DROP TRIGGER trStudents_Insert_Rollback
GO

--Add trigger with a rollback
CREATE TRIGGER trStudents_Insert_Rollback
ON Students
FOR INSERT
AS
ROLLBACK TRAN
PRINT 'INSERT statement rolled back.'
GO

--Disable trigger and insert, then delete the same row
DISABLE TRIGGER trStudents_Insert_Rollback ON Students
SELECT * FROM Students
INSERT Students (StudentID, FirstName, LastName)
    VALUES (3, 'Rick', 'Dobson')
SELECT * FROM Students
DELETE FROM Students WHERE StudentID = 3
GO


ENABLE TRIGGER trStudents_Insert_Rollback ON Students
SELECT * FROM Students
INSERT Students (StudentID, FirstName, LastName)
    VALUES (3, 'Rick', 'Dobson')
GO
SELECT * FROM Students
GO

--For display in book
SET NOCOUNT ON;
DISABLE TRIGGER trStudents_Insert_Rollback ON Students
SELECT StudentID, CAST(FirstName AS NVARCHAR(9)) 'FirstName',
    CAST(LastName AS NVARCHAR(9)) 'LastName',
    CAST(FullName AS NVARCHAR(18)) 'FullName'
FROM Students
INSERT Students (StudentID, FirstName, LastName)
    VALUES (3, 'Rick', 'Dobson')
SELECT StudentID, CAST(FirstName AS NVARCHAR(9)) 'FirstName',
    CAST(LastName AS NVARCHAR(9)) 'LastName',
    CAST(FullName AS NVARCHAR(18)) 'FullName'
FROM Students
DELETE FROM Students WHERE StudentID = 3
GO

ENABLE TRIGGER trStudents_Insert_Rollback ON Students
SELECT StudentID, CAST(FirstName AS NVARCHAR(9)) 'FirstName',
    CAST(LastName AS NVARCHAR(9)) 'LastName',
    CAST(FullName AS NVARCHAR(18)) 'FullName'
FROM Students
INSERT Students (StudentID, FirstName, LastName)
    VALUES (3, 'Rick', 'Dobson')
GO
SELECT StudentID, CAST(FirstName AS NVARCHAR(9)) 'FirstName',
    CAST(LastName AS NVARCHAR(9)) 'LastName',
    CAST(FullName AS NVARCHAR(18)) 'FullName'
FROM Students
GO
SET NOCOUNT ON

--Some of these statements may fail if the triggers do not currently exist
DROP TRIGGER trStudentsEcho
DROP TRIGGER trStudentsEcho_Display
DROP TRIGGER trStudents_Insert_Rollback


--Create table to archive changes to Students
IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'StudentsArchive')
    DROP TABLE StudentsArchive
GO

CREATE TABLE StudentsArchive (
AID int IDENTITY(1,1) PRIMARY KEY CLUSTERED,
type nvarchar(6) NOT NULL,
whenchanged smalldatetime NOT NULL DEFAULT Getdate(),
StudentID int,
nFirstName nvarchar(30),
nLastName nvarchar(50),
oFirstName nvarchar(30),
oLastName nvarchar(50)
)
GO

--Conditionally drop trigger from dbo schema
IF EXISTS(SELECT *
    FROM sys.objects o JOIN sys.schemas s
    ON o.schema_id = s.schema_id
    WHERE type = 'TR' AND
    s.name = 'dbo' AND
    o.name = 'trStudents_INSERT')
    DROP TRIGGER trStudents_INSERT
GO

CREATE TRIGGER trStudents_INSERT
ON Students
FOR INSERT
AS
DECLARE @StudentID int, @FirstName nvarchar(30),
    @LasName nvarchar(50)

SET @StudentID = (SELECT StudentID FROM inserted)
SET @FirstName = (SELECT FirstName FROM inserted)
SET @LasName = (SELECT LastName FROM inserted)
INSERT StudentsArchive (type, StudentID, nFirstName,
    nLastName)
    VALUES('INSERT', @StudentID, @FirstName, @LasName)
GO

IF EXISTS(SELECT *
    FROM sys.objects o JOIN sys.schemas s
    ON o.schema_id = s.schema_id
    WHERE type = 'TR' AND
    s.name = 'dbo' AND
    o.name = 'trStudents_DELETE')
    DROP TRIGGER trStudents_DELETE
GO

CREATE TRIGGER trStudents_DELETE
ON Students
FOR DELETE
AS
DECLARE @StudentID int, @FirstName nvarchar(30),
    @LasName nvarchar(50)

SET @StudentID = (SELECT StudentID FROM deleted)
SET @FirstName = (SELECT FirstName FROM deleted)
SET @LasName = (SELECT LastName FROM deleted)
INSERT StudentsArchive (type, StudentID, oFirstName,
    oLastName)
    VALUES('DELETE', @StudentID, @FirstName, @LasName)
GO


IF EXISTS(SELECT *
    FROM sys.objects o JOIN sys.schemas s
    ON o.schema_id = s.schema_id
    WHERE type = 'TR' AND
    s.name = 'dbo' AND
    o.name = 'trStudents_UPDATE')
    DROP TRIGGER trStudents_UPDATE
GO

CREATE TRIGGER trStudents_UPDATE
ON Students
INSTEAD OF UPDATE
AS

DECLARE @StudentID int, @nFirstName nvarchar(30),
    @nLastName nvarchar(50), @oFirstName nvarchar(30),
    @oldLasName nvarchar(50)

IF (SELECT StudentID FROM inserted) <>
    (SELECT StudentID FROM deleted)
    RAISERROR ('You are not allowed to change StudentID.',
    10,1)
ELSE
BEGIN

--set local variables
    SET @StudentID = (SELECT StudentID FROM inserted)
    SET @nFirstName = (SELECT FirstName FROM inserted)
    SET @nLastName = (SELECT LastName FROM inserted)
    SET @oFirstName = (SELECT FirstName FROM deleted)
    SET @oldLasName = (SELECT LastName FROM deleted)

--write to table
    UPDATE Students
    SET FirstName = @nFirstName, LastName = @nLastName
    WHERE StudentID = @StudentID

-- write to archive
    INSERT StudentsArchive (type, StudentID, nFirstName,
        nLastName, oFirstName, oLastName)
        VALUES('UPDATE', @StudentID, @nFirstName, @nLastName,
        @oFirstName, @oldLasName)
END
GO


SELECT * FROM Students

INSERT Students VALUES (3, 'Rickie', 'Hobson')
SELECT * FROM StudentsArchive

--For display in book
SELECT CAST(AID AS nvarchar(3)) 'AID', type, CONVERT(varchar(19),whenchanged) 'whenchanged', CAST(StudentID AS nvarchar(9)) 'StudentID',
    CAST(nFirstName AS nvarchar(10)) 'nFirstName',
    CAST(nLastName AS nvarchar(9)) 'nLastName',
    CAST(oFirstName AS nvarchar(10)) 'oFirstName',
    CAST(oLastName AS nvarchar(9)) 'oLastName'
FROM StudentsArchive

UPDATE Students
SET FirstName = 'Rick', LastName = 'Dobson'
WHERE StudentID = 3
SELECT * FROM StudentsArchive

--For display in book
SELECT CAST(AID AS nvarchar(3)) 'AID', type, CONVERT(varchar(19),whenchanged) 'whenchanged', CAST(StudentID AS nvarchar(9)) 'StudentID',
    CAST(nFirstName AS nvarchar(10)) 'nFirstName',
    CAST(nLastName AS nvarchar(9)) 'nLastName',
    CAST(oFirstName AS nvarchar(10)) 'oFirstName',
    CAST(oLastName AS nvarchar(9)) 'oLastName'
FROM StudentsArchive

UPDATE Students
SET StudentID = 999
WHERE StudentID = 3
SELECT * FROM StudentsArchive

--For display in book
SELECT CAST(AID AS nvarchar(3)) 'AID', type, CONVERT(varchar(19),whenchanged) 'whenchanged', CAST(StudentID AS nvarchar(9)) 'StudentID',
    CAST(nFirstName AS nvarchar(10)) 'nFirstName',
    CAST(nLastName AS nvarchar(9)) 'nLastName',
    CAST(oFirstName AS nvarchar(10)) 'oFirstName',
    CAST(oLastName AS nvarchar(9)) 'oLastName'
FROM StudentsArchive


DELETE FROM Students WHERE StudentID = 3
SELECT * FROM StudentsArchive

--For display in book
SELECT CAST(AID AS nvarchar(3)) 'AID', type, CONVERT(varchar(19),whenchanged) 'whenchanged', CAST(StudentID AS nvarchar(9)) 'StudentID',
    CAST(nFirstName AS nvarchar(10)) 'nFirstName',
    CAST(nLastName AS nvarchar(9)) 'nLastName',
    CAST(oFirstName AS nvarchar(10)) 'oFirstName',
    CAST(oLastName AS nvarchar(9)) 'oLastName'
FROM StudentsArchive


--Some of these statements may fail if the triggers do not currently exist
DROP TRIGGER trStudents_INSERT
DROP TRIGGER trStudents_DELETE
DROP TRIGGER trStudents_UPDATE


