USE AdventureWorks
GO

--Use column value from a table pointed at by a foreign key
WITH ProductItemPrices AS
(
SELECT ProductID, AVG(LineTotal) 'AvgPrice'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
)

SELECT p.Name, pp.AvgPrice
FROM ProductItemPrices pp
JOIN
Production.Product p
ON 
pp.ProductID = p.ProductID
ORDER BY p.Name

SELECT * FROM ProductItemPrices
GO

--Display rows from SalesOrderDetail table with a LineTotal
--value greater than the average for all Linetotal values with
--the same ProductID value
WITH ProductItemPrices AS
(
SELECT ProductID, AVG(LineTotal) 'AvgPrice'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
)

SELECT TOP 29 sd.SalesOrderID, sd.ProductID, sd.LineTotal, pp.AvgPrice
FROM Sales.SalesOrderDetail sd
JOIN
ProductItemPrices pp
ON pp.ProductID = sd.ProductID
WHERE sd.LineTotal > pp.AvgPrice
ORDER BY sd.SalesOrderID, sd.ProductID


--Return EmployeeID along with first and last name of employees 
--not reporting to any other employee
SELECT e.EmployeeID, c.FirstName, c.LastName
FROM HumanResources.Employee e
JOIN Person.Contact c
ON e.ContactID = c.ContactID
where ManagerID IS NULL

--Specify top level EmployeeID for direct reports
DECLARE @TopEmp as int
SET @TopEmp = 109;

--Names and departments for direct reports to
--EmployeeID = @TopEmp; calculate employee name
WITH Empcte(empid, empname, mgrid, dName, lvl)
AS
(

  -- Anchor row
    SELECT e.EmployeeID,
    REPLACE(c.FirstName + ' ' + ISNULL(c.MiddleName, '') +
    ' ' + c.LastName, '  ', ' ') 'Employee name',
        e.ManagerID, dn.Name, 0
    FROM Person.Contact c
    JOIN HumanResources.Employee e
    ON e.ContactID = c.ContactID
    JOIN HumanResources.EmployeeDepartmentHistory d
    ON d.EmployeeID = e.EmployeeID
    JOIN HumanResources.Department dn
    ON dn.DepartmentID = d.DepartmentID
    WHERE e.EmployeeID = @TopEmp
    UNION ALL

  -- Recursive rows

    SELECT e.EmployeeID,
    REPLACE(c.FirstName + ' ' + ISNULL(c.MiddleName, '') +
        ' ' + c.LastName, '  ', ' ') 'Employee name',
        e.ManagerID, dn.Name, a.lvl+1
    FROM (Person.Contact c
    JOIN HumanResources.Employee e
    ON e.ContactID = c.ContactID
    JOIN HumanResources.EmployeeDepartmentHistory d
    ON d.EmployeeID = e.EmployeeID
    JOIN HumanResources.Department dn
    ON dn.DepartmentID = d.DepartmentID)
    JOIN Empcte a
    ON e.ManagerID = a.empid)

--Order and display result set from CTE
SELECT *
FROM Empcte
WHERE lvl <= 1
ORDER BY lvl, mgrid, empid

--Alternate statement using MAXRECURSION;
--must position immediately after Empcte to work

SELECT *
FROM Empcte
OPTION (MAXRECURSION 1)


--For display in book
DECLARE @TopEmp as int
SET @TopEmp = 109;

--Names and departments for direct reports to
--EmployeeID = @TopEmp; calculate employee name
WITH Empcte(empid, empname, mgrid, dName, lvl)
AS
(

  -- Anchor row
    SELECT e.EmployeeID,
    CAST(REPLACE(c.FirstName + ' ' + ISNULL(c.MiddleName, '') + 
    ' ' + c.LastName, '  ', ' ') AS nvarchar(20)) 'Employee name', 
    e.ManagerID, 
    CAST(dn.Name AS nvarchar(20)), 0
    FROM Person.Contact c
    JOIN HumanResources.Employee e
    ON e.ContactID = c.ContactID
    JOIN HumanResources.EmployeeDepartmentHistory d
    ON d.EmployeeID = e.EmployeeID
    JOIN HumanResources.Department dn
    ON dn.DepartmentID = d.DepartmentID
    WHERE e.EmployeeID = @TopEmp
    UNION ALL

  -- Recursive rows

    SELECT e.EmployeeID,
    CAST(REPLACE(c.FirstName + ' ' + ISNULL(c.MiddleName, '') + 
    ' ' + c.LastName, '  ', ' ') AS nvarchar(20)) 'Employee name', 
    e.ManagerID, 
    CAST(dn.Name AS nvarchar(20)), a.lvl+1
    FROM (Person.Contact c
    JOIN HumanResources.Employee e
    ON e.ContactID = c.ContactID
    JOIN HumanResources.EmployeeDepartmentHistory d
    ON d.EmployeeID = e.EmployeeID
    JOIN HumanResources.Department dn
    ON dn.DepartmentID = d.DepartmentID) 
    JOIN Empcte a
    ON e.ManagerID = a.empid)

--Order and display result set from CTE
SELECT *
FROM Empcte
WHERE lvl <= 1
ORDER BY lvl, mgrid, empid

--Alternate statement using MAXRECURSION;
--must position immediately after Empcte to work
SELECT *
FROM Empcte
OPTION (MAXRECURSION 1)


--Specify top level EmployeeID for direct reports; decode
--mgrid column value from CTE
DECLARE @TopEmp as int
SET @TopEmp = 12;

--Names and departments for direct reports to
--EmployeeID = @TopEmp; calculate employee name
WITH Empcte(empid, empname, mgrid, dName, lvl)
AS
(

  -- Anchor row
    SELECT e.EmployeeID,
    REPLACE(c.FirstName + ' ' + ISNULL(c.MiddleName, '') +
    ' ' + c.LastName, '  ', ' ') 'Employee name',
        e.ManagerID, dn.Name, 0
    FROM Person.Contact c
    JOIN HumanResources.Employee e
    ON e.ContactID = c.ContactID
    JOIN HumanResources.EmployeeDepartmentHistory d
    ON d.EmployeeID = e.EmployeeID
    JOIN HumanResources.Department dn
    ON dn.DepartmentID = d.DepartmentID
    WHERE e.EmployeeID = @TopEmp
    UNION ALL

  -- Recursive rows

    SELECT e.EmployeeID,
    REPLACE(c.FirstName + ' ' + ISNULL(c.MiddleName, '') +
        ' ' + c.LastName, '  ', ' ') 'Employee name',
        e.ManagerID, dn.Name, a.lvl+1
    FROM (Person.Contact c
    JOIN HumanResources.Employee e
    ON e.ContactID = c.ContactID
    JOIN HumanResources.EmployeeDepartmentHistory d
    ON d.EmployeeID = e.EmployeeID
    JOIN HumanResources.Department dn
    ON dn.DepartmentID = d.DepartmentID)
    JOIN Empcte a
    ON e.ManagerID = a.empid)

--Calculate employee name corresponding to mgrid
SELECT empid, empname, mgrid, 
    REPLACE(c.FirstName + ' ' + ISNULL(c.MiddleName, '') + ' ' 
    + c.LastName, '  ', ' ') 
    'Manager''s name', dName, lvl
FROM Empcte ecte
JOIN HumanResources.Employee e
ON ecte.mgrid = e.EmployeeID
JOIN Person.Contact c
ON c.ContactID = e.ContactID
ORDER BY lvl, mgrid, dname, empid


--For book display
--Specify top level EmployeeID for direct reports; decode
--mgrid column value from CTE
DECLARE @TopEmp as int
SET @TopEmp = 12;

--Names and departments for direct reports to
--EmployeeID = @TopEmp; calculate employee name
WITH Empcte(empid, empname, mgrid, dName, lvl)
AS
(

  -- Anchor row
    SELECT e.EmployeeID,
    CAST(REPLACE(c.FirstName + ' ' + ISNULL(c.MiddleName, '') + 
    ' ' + c.LastName, '  ', ' ') AS nvarchar(20)) 'Employee name', 
    e.ManagerID, 
    CAST(dn.Name AS nvarchar(20)), 0
    FROM Person.Contact c
    JOIN HumanResources.Employee e
    ON e.ContactID = c.ContactID
    JOIN HumanResources.EmployeeDepartmentHistory d
    ON d.EmployeeID = e.EmployeeID
    JOIN HumanResources.Department dn
    ON dn.DepartmentID = d.DepartmentID
    WHERE e.EmployeeID = @TopEmp
    UNION ALL

  -- Recursive rows

    SELECT e.EmployeeID,
    CAST(REPLACE(c.FirstName + ' ' + ISNULL(c.MiddleName, '') + 
    ' ' + c.LastName, '  ', ' ') AS nvarchar(20)) 'Employee name', 
    e.ManagerID, 
    CAST(dn.Name AS nvarchar(20)), a.lvl+1
    FROM (Person.Contact c
    JOIN HumanResources.Employee e
    ON e.ContactID = c.ContactID
    JOIN HumanResources.EmployeeDepartmentHistory d
    ON d.EmployeeID = e.EmployeeID
    JOIN HumanResources.Department dn
    ON dn.DepartmentID = d.DepartmentID) 
    JOIN Empcte a
    ON e.ManagerID = a.empid)

--Calculate employee name corresponding to mgrid
SELECT empid, empname, mgrid, 
    CAST(REPLACE(c.FirstName + ' ' + ISNULL(c.MiddleName, '') + ' ' 
    + c.LastName, '  ', ' ') AS nvarchar(18))
    'Manager''s name', dName, lvl
FROM Empcte ecte
JOIN HumanResources.Employee e
ON ecte.mgrid = e.EmployeeID
JOIN Person.Contact c
ON c.ContactID = e.ContactID
ORDER BY lvl, mgrid, empid


