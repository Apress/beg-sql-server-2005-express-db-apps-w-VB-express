USE NewDB3
GO

--Add certificates for Rick and Virginia Dobson
IF EXISTS(SELECT * FROM sys.certificates
    WHERE name = 'HisCert')
    DROP CERTIFICATE HisCert
GO

CREATE CERTIFICATE HisCert
   ENCRYPTION BY PASSWORD = 'his secret'
   WITH SUBJECT = 'Rick Dobson',
   EXPIRY_DATE = '12/31/2007'
GO

IF EXISTS(SELECT * FROM sys.certificates
    WHERE name = 'HerCert')
    DROP CERTIFICATE HerCert
GO

CREATE CERTIFICATE HerCert
   ENCRYPTION BY PASSWORD = 'her secret'
   WITH SUBJECT = 'Virginia Dobson',
   EXPIRY_DATE = '12/31/2007'
GO

--Create a stored procedure to insert a row
-- and sign it
IF EXISTS(SELECT *
    FROM sys.objects
    WHERE type = 'P' AND name = 'SignandInsert')
    DROP PROCEDURE SignandInsert
GO

CREATE PROCEDURE SignandInsert
	@myinput nvarchar(256),
	@CertName nvarchar(128),
	@CertSecret nvarchar(128)
AS
INSERT SignedData VALUES(@CertName,
    @myinput, SignByCert( Cert_Id( @CertName),
	@myinput, @CertSecret))
GO

--Enter a signed row and verify the signature for HisCert certificate
DECLARE @myinput nvarchar(256)
SET @myinput =
	N'This is my story'
EXEC SignandInsert
	@myinput, 'HisCert', 'his secret'
GO

SELECT rowid, CONVERT(nvarchar(10), certname) 'certname',
    CONVERT(nvarchar(20), mytext) 'mytext',
    VerifySignedByCert(Cert_Id('HisCert'),
    mytext, mysignature ) as IsSignatureValid
FROM SignedData
WHERE certname = 'HisCert'
GO


--Enter a signed row and verify the signature for HerCert certificate
DECLARE @myinput nvarchar(256)
SET @myinput =
	N'This is my song'
EXEC SignandInsert
	@myinput, 'HerCert', 'her secret'
GO

SELECT rowid, CONVERT(nvarchar(10), certname) 'certname',
    CONVERT(nvarchar(20), mytext) 'mytext',
    VerifySignedByCert(Cert_Id('HerCert'),
    mytext, mysignature ) as IsSignatureValid
FROM SignedData
WHERE certname = 'HerCert'
GO


--Update the row, sign it, and confirm that
--the new signature is valid
DECLARE @myinput nvarchar(256), @CertSecret nvarchar(128)
SET @CertSecret = 'his secret'
SET @myinput =
	N'All the day long'
UPDATE SignedData
SET mytext = @myinput,
mysignature = SignByCert( Cert_Id( 'HisCert'), @myinput, @CertSecret)
WHERE rowid = 2
GO

SELECT rowid, CONVERT(nvarchar(10), certname) 'certname',
    CONVERT(nvarchar(20), mytext) 'mytext',
    VerifySignedByCert(Cert_Id('HerCert'),
    mytext, mysignature ) as IsSignatureValid
FROM SignedData
WHERE certname = 'HerCert'
GO

SELECT rowid, CONVERT(nvarchar(10), certname) 'certname',
    CONVERT(nvarchar(20), mytext) 'mytext',
    VerifySignedByCert(Cert_Id('HisCert'),
    mytext, mysignature ) as IsSignatureValid
FROM SignedData
WHERE rowid = 2
GO




--Update the row, do not sign it, and confirm that
--the original signature is no longer valid
DECLARE @myinput nvarchar(256), @CertSecret nvarchar(128)
SET @CertSecret = 'his secret'
SET @myinput =
	N'Update not signed'
UPDATE SignedData
SET mytext = @myinput
WHERE rowid = 2
GO

SELECT rowid, CONVERT(nvarchar(10), certname) 'certname',
    CONVERT(nvarchar(20), mytext) 'mytext',
    VerifySignedByCert(Cert_Id('HisCert'),
    mytext, mysignature ) as IsSignatureValid
FROM SignedData
WHERE rowid = 2
GO



