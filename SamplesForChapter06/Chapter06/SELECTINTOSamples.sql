USE AdventureWorks
GO

SET NOCOUNT ON

--Copy ProductCategory data to MyCopy
SELECT *
INTO MyCopy
FROM Production.ProductCategory

--Copied data are the same, but have different native sort order
SELECT ProductCategoryID, Name
FROM Production.ProductCategory

SELECT ProductCategoryID, Name
FROM MyCopy

--Data types are the same
SELECT c.name 'Column name', t.name 'Data type name', 
    c.max_length, c.precision, c.scale, 
    c.is_nullable 'nullable', c.is_identity 'identity'
FROM sys.columns c
JOIN sys.types t
ON c.user_type_id = t.user_type_id
WHERE object_id = OBJECT_ID('Production.ProductCategory')

SELECT c.name 'Column name', t.name 'Data type name', 
    c.max_length, c.precision, c.scale, 
    c.is_nullable 'nullable', c.is_identity 'identity'
FROM sys.columns c
JOIN sys.types t
ON c.user_type_id = t.user_type_id
WHERE object_id = OBJECT_ID('MyCopy')

--Indexes are not copied, or created, along with the data
SELECT name 'Type name', type_desc 'Type description', is_primary_key
FROM sys.indexes
WHERE object_id = OBJECT_ID('Production.ProductCategory')

SELECT name 'Type name', type_desc 'Type description', is_primary_key
FROM sys.indexes
WHERE object_id = OBJECT_ID('MyCopy')

--output for display in the book
SELECT ProductCategoryID, CAST(Name AS nvarchar(11)) 'Name'
FROM Production.ProductCategory

SELECT ProductCategoryID, CAST(Name AS nvarchar(11)) 'Name'
FROM MyCopy


SELECT cast(c.name AS nvarchar(18)) 'Column name', 
    CAST(t.name AS nvarchar(17)) 'Data type name', 
    c.max_length, c.precision, c.scale, 
    c.is_nullable 'nullable', c.is_identity 'identity'
FROM sys.columns c
JOIN sys.types t
ON c.user_type_id = t.user_type_id
WHERE object_id = OBJECT_ID('Production.ProductCategory')

SELECT cast(c.name AS nvarchar(18)) 'Column name', 
    CAST(t.name AS nvarchar(17)) 'Data type name', 
    c.max_length, c.precision, c.scale, 
    c.is_nullable 'nullable', c.is_identity 'identity'
FROM sys.columns c
JOIN sys.types t
ON c.user_type_id = t.user_type_id
WHERE object_id = OBJECT_ID('MyCopy')


SELECT CAST(name AS nvarchar(37)) 'Type name', 
    CAST(type_desc AS nvarchar(13)) 'Type description', is_primary_key
FROM sys.indexes
WHERE object_id = OBJECT_ID('Production.ProductCategory')

SELECT CAST(name AS nvarchar(37)) 'Type name', 
    CAST(type_desc AS nvarchar(13)) 'Type description', is_primary_key
FROM sys.indexes
WHERE object_id = OBJECT_ID('MyCopy')

--Clean up
DROP TABLE MyCopy
SET NOCOUNT OFF



SET NOCOUNT ON

--Copy some, but not all, rows
SELECT * 
INTO MyCopy
FROM Production.ProductCategory
WHERE ProductCategoryID > 2
GO

--Show copied rows
SELECT ProductCategoryID, Name
FROM MyCopy
GO

--Try to copy two more rows to the same table
SELECT * 
INTO MyCopy
FROM Production.ProductCategory
WHERE ProductCategoryID <= 2
GO

--Confirm table has not changed
SELECT ProductCategoryID, Name
FROM MyCopy
GO

--output for display in the book
SELECT ProductCategoryID, CAST(Name AS nvarchar(11)) 'Name'
FROM MyCopy
GO

--Clean up
DROP TABLE MyCopy
SET NOCOUNT OFF


