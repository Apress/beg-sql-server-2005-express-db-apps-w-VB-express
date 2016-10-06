USE AdventureWorks
GO

--TOP keyword can get a fixed number of rows from the top
--of a result set
SELECT TOP 5 ProductSubcategoryID, ProductCategoryID, 
    Name 'Subcategory name'
FROM Production.ProductSubcategory

--TOP keyword can take an argument to specify 
--how many rows to return; for example, 6 in this case
DECLARE @n int
SET @n = 6
SELECT TOP (@n) ProductSubcategoryID, ProductCategoryID, 
    Name 'Subcategory name'
FROM Production.ProductSubcategory


--TOP keyword can also get a fixed percent of rows to return
SELECT TOP 20 PERCENT ProductSubcategoryID, ProductCategoryID, Name 'Subcategory name'
FROM Production.ProductSubcategory

--TOP keyword also takes a argument for PERCENT;
--the number of row for a percent rounds up to the next integer
--if percent does not precisely return an integer
--11 percent of 37 is 4.07, and it returns 5 rows
--10 and 9 percent of 37 are 3.70 and 3.33; both return 4 rows
--8 percent of 37 is 2.96, and it returns 3 rows
DECLARE @n int
SET @n = 11
SELECT TOP (@n) PERCENT ProductSubcategoryID, ProductCategoryID, 
    Name 'Subcategory name'
FROM Production.ProductSubcategory
SET @n = 10
SELECT TOP (@n) PERCENT ProductSubcategoryID, ProductCategoryID, 
    Name 'Subcategory name'
FROM Production.ProductSubcategory
SET @n = 9
SELECT TOP (@n) PERCENT ProductSubcategoryID, ProductCategoryID, 
    Name 'Subcategory name'
FROM Production.ProductSubcategory
SET @n = 8
SELECT TOP (@n) PERCENT ProductSubcategoryID, ProductCategoryID, 
    Name 'Subcategory name'
FROM Production.ProductSubcategory

