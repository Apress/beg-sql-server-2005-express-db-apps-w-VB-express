USE NewDB3
GO

--Insert a row
DECLARE @name nvarchar(20), @in_id_data nvarchar(70)

SET @name = 'Rick Dobson'
SET @in_id_data = '111-11-1111'
INSERT ForEncDemo (name, id_data_orig) VALUES(@name, @in_id_data)
GO

--Encrypt a column value
DECLARE @pp_value nvarchar(10)

SET @pp_value = 'passphrase'

UPDATE ForEncDemo
SET id_data_enc = EncryptByPassPhrase(@pp_value, id_data_orig, 
	1, 
	CONVERT( varbinary, rowid))
WHERE rowid = 1
GO

--Decrypt an ecrypted value
DECLARE @pp_value nvarchar(10);
SET @pp_value = 'passphrase';

-- Decrypt the encrypted record.
SELECT id_data_orig, id_data_enc AS "Encrypted data", 
	CONVERT(nvarchar, DecryptByPassphrase(@pp_value, id_data_enc, 
	1,
	CONVERT(varbinary, rowid))) AS "Decrypted data" 
FROM ForEncDemo 
WHERE rowid = 1;
GO


