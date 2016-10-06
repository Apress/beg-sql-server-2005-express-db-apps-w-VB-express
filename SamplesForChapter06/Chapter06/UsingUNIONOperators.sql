USE AdventureWorks
GO

--Using ALL can force duplicates into the result set
SELECT ProductCategoryID, Name
FROM Production.ProductCategory
WHERE Name LIKE 'C%'
UNION ALL
SELECT ProductCategoryID, Name
FROM Production.ProductCategory
WHERE Name LIKE 'Cl%'

--By default, UNION removes duplicates
SELECT ProductCategoryID, Name
FROM Production.ProductCategory
WHERE Name LIKE 'C%'
UNION
SELECT ProductCategoryID, Name
FROM Production.ProductCategory
WHERE Name LIKE 'Cl%'


--You can add marker columns and sort overall
USE Northwind
GO

SELECT TOP 3 ContactName, Phone, ISNULL(Fax, '') 'Fax', 
    'Customer' 'ContactType'
FROM Customers
UNION
SELECT TOP 3 FirstName + ' ' + LastName, HomePhone, '', 
    'Employee' 'ContactType'
FROM Employees
UNION
SELECT TOP 3 CompanyName , Phone, '', 
    'Shipper' 'ContactType'
FROM Shippers
ORDER BY ContactType

--For display in book
SELECT TOP 3 CAST(ContactName AS nvarchar(16)) 'ContactName', 
    CAST(Phone AS nvarchar(14)) 'Phone', 
    CAST(ISNULL(Fax, '') AS nvarchar(14)) 'Fax', 
    CAST('Customer' AS nvarchar(8)) 'ContactType'
FROM Customers
UNION
SELECT TOP 3 CAST(FirstName + ' ' + LastName AS nvarchar(16)) 'ContactName', 
    CAST(HomePhone AS nvarchar(14)) 'Phone', 
    CAST('' AS nvarchar(14)) 'Fax', 
    CAST('Employee' AS nvarchar(8)) 'ContactType'
FROM Employees
UNION
SELECT TOP 3 CAST(CompanyName AS nvarchar(16)) 'ContactName',
    CAST(Phone AS nvarchar(14)) 'Phone', 
    CAST('' AS nvarchar(14)) 'Fax', 
    CAST('Shipper' AS nvarchar(8)) 'ContactType'
FROM Shippers
ORDER BY ContactType


--SELECT/UNION into a new table
USE AdventureWorks
GO

SELECT ProductCategoryID, Name
INTO MyCopy
FROM Production.ProductCategory
WHERE Name LIKE 'C%'
UNION ALL
SELECT ProductCategoryID, Name
FROM Production.ProductCategory
WHERE Name LIKE 'C%' OR Name LIKE 'B%'

--Display table
SELECT ProductCategoryID, Name 'Name'
FROM MyCopy

SELECT ProductCategoryID, CAST(Name AS nvarchar(11)) 'Name'
FROM MyCopy


--Clean up
DROP TABLE MyCopy
SET NOCOUNT OFF

