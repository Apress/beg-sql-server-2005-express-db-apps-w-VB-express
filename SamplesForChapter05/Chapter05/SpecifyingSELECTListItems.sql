USE AdventureWorks
GO

--Shows use of alias for a column name
--in the Production.ProductCategory table
SELECT ProductCategoryID, Name 'Category name'
FROM Production.ProductCategory

--Shows use of alias for a column name
--in the Production.ProductSubcategory table;
--output could be confusing without alias
SELECT ProductSubcategoryID, ProductCategoryID, 
    Name 'Subcategory name'
FROM Production.ProductSubcategory

--An example of an expression in a list
DECLARE @intvar int
SET @intvar = 1
SELECT ProductCategoryID, Name 'Category name', 
    @intvar 'Local variable'
FROM Production.ProductCategory

--An example of a aggregate function in a list
SELECT Count(*)
FROM Production.ProductSubcategory

--DISTINCT keyword removes duplicate rows from output;
--the following SELECT statement returns just 4 rows
SELECT DISTINCT ProductCategoryID
FROM Production.ProductSubcategory

