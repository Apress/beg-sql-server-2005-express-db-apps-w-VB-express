USE NewDB3
GO

DECLARE @pp_value nvarchar(128),
    @name nvarchar(2000), @in_id_data varchar(1100)

SET @pp_value = 'passphrase'

--Insert a row with an encrypted column value
SET @name = 'Rick Dobson'
SET @in_id_data = '111-11-1111'
INSERT ForEncDemo VALUES(@name, @in_id_data,
    EncryptByPassPhrase(@pp_value, @in_id_data,1,CONVERT(varbinary, @in_id_data)))

--Insert another row with an encrypted column value
SET @name = 'Virginia Dobson'
SET @in_id_data = '222-22-2222'
INSERT ForEncDemo VALUES(@name, @in_id_data,
    EncryptByPassPhrase(@pp_value, @in_id_data,1,CONVERT(varbinary,@in_id_data)))


--Display all table column values
SELECT rowid, name, id_data_orig,
    CAST(id_data_enc AS varbinary(5)) 'id_data_dec'
FROM ForEncDemo

--Display original versus decrypted column values
SELECT rowid, id_data_orig,
    CONVERT(varchar(110),
    DecryptByPassPhrase(@pp_value,id_data_enc)) 'id_data_enc Decrypted'
FROM ForEncDemo



