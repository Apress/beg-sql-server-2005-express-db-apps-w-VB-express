USE NewDB1
GO

--cREATE stored proc to restore TrackPersons table values
IF EXISTs(SELECT *
    FROM sys.objects
    WHERE type = 'P' AND name = 'RestoreTrackPersons')
    DROP PROCEDURE RestoreTrackPersons
GO

CREATE PROC RestoreTrackPersons
AS

DELETE FROM TrackPersons

INSERT TrackPersons VALUES(1, 'Rick Dobosn')
INSERT TrackPersons vALUES(2, 'Virginia Dobson')
INSERT TrackPersons VALUES(3, 'Name to change')
INSERT TrackPersons VALUES(4, 'Name to delete')
GO


--List role memberships to show permissions for users
EXEC sp_helprolemember

--Restore TrackPersons table and display results
EXEC RestoreTrackPersons
SELECT * FROM TrackPersons

--Attempt to perform update and delete in
--execution context of cab233a\winlogin1
EXECUTE AS login = 'cab233a\winlogin1'

UPDATE TrackPersons
SET name = 'Name changed'
WHERE tpid = 3

DELETE FROM TrackPersons WHERE tpid = 4
GO
SELECT * FROM TrackPersons
GO

REVERT
GO

--Restore TrackPersons table and deny
--cab233a from updating in TrackPersons
EXEC RestoreTrackPersons
DENY UPDATE ON TrackPersons TO [Cab233a\winlogin1]
GO


--Attempt to perform update and delete in
--execution context of cab233a\winlogin1
EXECUTE AS login = 'cab233a\winlogin1'

UPDATE TrackPersons
SET name = 'Name changed'
WHERE tpid = 3

DELETE FROM TrackPersons WHERE tpid = 4
GO
SELECT * FROM TrackPersons
GO

REVERT
GO


--Restore TrackPersons table and
--revoke cab233a denial of updating in TrackPersons and
--deny cab233a from deleting in TrackPersons
EXEC RestoreTrackPersons
REVOKE UPDATE ON TrackPersons TO [Cab233a\winlogin1]
DENY DELETE ON TrackPersons TO [Cab233a\winlogin1]
GO



--Attempt to perform update and delete in
--execution context of cab233a\winlogin1
EXECUTE AS login = 'cab233a\winlogin1'

UPDATE TrackPersons
SET name = 'Name changed'
WHERE tpid = 3

DELETE FROM TrackPersons WHERE tpid = 4
GO
SELECT * FROM TrackPersons
GO

REVERT
GO

--REVOKE UPDATE ON TrackPersons TO [Cab233a\winlogin1]
REVOKE DELETE ON TrackPersons TO [Cab233a\winlogin1]
GO




