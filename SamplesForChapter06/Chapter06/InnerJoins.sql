USE AdventureWorks
GO

--List foreign key value
SELECT TOP 5 ProductSubcategoryID, ProductCategoryID, 
    Name 'Subcategory name'
FROM Production.ProductSubcategory
ORDER BY ProductSubcategoryID

--List column value from table at which a foreign key points
SELECT TOP 5 ProductSubcategoryID, 
    Production.ProductCategory.Name 'Category name', 
    Production.ProductSubcategory.Name 'Subcategory name'
FROM Production.ProductCategory, Production.ProductSubcategory
WHERE Production.ProductCategory.ProductCategoryID = 
    Production.ProductSubcategory.ProductCategoryID
ORDER BY Production.ProductSubcategory.ProductSubcategoryID

--List lookup values using table alias qualifiers
SELECT TOP 5 ProductSubcategoryID, c.Name 'Category name', 
    sc.Name 'Subcategory name'
FROM Production.ProductCategory c, Production.ProductSubcategory sc
WHERE c.ProductCategoryID = sc.ProductCategoryID
ORDER BY sc.ProductSubcategoryID

--List lookup values using JOIN in FROM clause
SELECT TOP 5 sc.ProductSubcategoryID, c.Name 'Category name', 
    sc.Name 'Subcategory name'
FROM Production.ProductCategory c 
    JOIN Production.ProductSubcategory sc
ON c.ProductCategoryID = sc.ProductCategoryID
ORDER BY sc.ProductSubcategoryID 


