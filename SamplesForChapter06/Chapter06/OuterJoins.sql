USE AdventureWorks
GO

--Count of Null SubcategoryID values in Product table
--Count of Non-null SubcategoryID values in Product table
SELECT Count(*) 'Null SubcategoryID values in Product'
FROM Production.Product
WHERE ProductSubcategoryID IS NULL

SELECT Count(*) 'Non-null SubcategoryID values in Product'
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL

--Join all rows from Product table to matching rows in the 
--ProductSubcategory table based on ProductSubcategoryID
SELECT TOP 5 ProductID, p.Name 'Product name', sc.Name 'Subcategory name'
FROM Production.ProductSubcategory sc RIGHT JOIN Production.Product p
ON sc.ProductSubcategoryID = p.ProductSubcategoryID
ORDER BY ProductID

--Join matching rows from Product table to all rows in the 
--ProductSubcategory table based on ProductSubcategoryID
SELECT TOP 5 ProductID, p.Name 'Product name', sc.Name 'Subcategory name'
FROM Production.ProductSubcategory sc LEFT JOIN Production.Product p
ON sc.ProductSubcategoryID = p.ProductSubcategoryID
ORDER BY ProductID

--Count rows with null values for sc.Name in righ join of
--ProductSubcategory and ProductCategory tables based on their
--ProductSubcategoryID column values
SELECT COUNT(ProductID)
FROM Production.ProductSubcategory sc RIGHT JOIN Production.Product p
ON sc.ProductSubcategoryID = p.ProductSubcategoryID
WHERE sc.Name IS NULL

--Join all rows from Product table to rows in the 
--ProductSubcategory table based on ProductSubcategoryID;
--Sort in descending order based on ProductID
SELECT TOP 5 ProductID, p.Name 'Product name', sc.Name 'Subcategory name'
FROM Production.ProductSubcategory sc RIGHT JOIN Production.Product p
ON sc.ProductSubcategoryID = p.ProductSubcategoryID
ORDER BY ProductID DESC

--Count rows with non-null values for sc.Name in left join of
--ProductSubcategory and Product tables based on their
--ProductSubcategoryID column values
SELECT COUNT(p.ProductID) 'Product rows with non-null ProductSubcategoryID'
FROM Production.ProductSubcategory sc LEFT JOIN Production.Product p
ON sc.ProductSubcategoryID = p.ProductSubcategoryID

--Count of products per ProductSubcategory
SELECT sc.ProductSubcategoryID, COUNT(p.ProductID) 'Count of products'
FROM Production.ProductSubcategory sc LEFT JOIN Production.Product p
ON sc.ProductSubcategoryID = p.ProductSubcategoryID
GROUP BY sc.ProductSubcategoryID
ORDER BY sc.ProductSubcategoryID



