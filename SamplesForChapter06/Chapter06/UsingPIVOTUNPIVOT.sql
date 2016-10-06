USE Adventureworks
GO

SELECT ShiftID, Name
FROM HumanResources.Shift

SELECT EmployeeID, ShiftID, Name
FROM HumanResources.Employee, HumanResources.Department
WHERE Employee.DepartmentID = Department.DepartmentID

--Compute the number of employees by
--department name and shift
SELECT Name, [1] AS 'Day', [2] AS 'Evening',
    [3] AS 'Night'
FROM
(SELECT e.EmployeeID, edh.ShiftID, d.Name
FROM HumanResources.Employee e 
JOIN HumanResources.EmployeeDepartmentHistory edh
ON e.EmployeeID = edh.EmployeeID
JOIN HumanResources.Department d
ON edh.DepartmentID = d.DepartmentID) st
PIVOT
(
COUNT (EmployeeID)
FOR ShiftID IN
( [1], [2], [3])
) AS spvt
ORDER BY Name

--For display in book
SELECT Name, [1] AS 'Day', [2] AS 'Evening',
    [3] AS 'Night'
FROM
(SELECT e.EmployeeID, edh.ShiftID, CAST(d.Name AS nvarchar(26)) 'Name'
FROM HumanResources.Employee e 
JOIN HumanResources.EmployeeDepartmentHistory edh
ON e.EmployeeID = edh.EmployeeID
JOIN HumanResources.Department d
ON edh.DepartmentID = d.DepartmentID) st
PIVOT
(
COUNT (EmployeeID)
FOR ShiftID IN
( [1], [2], [3])
) AS spvt
ORDER BY Name


IF EXISTS(SELECT name FROM sys.tables WHERE name = 'pvt')
DROP TABLE pvt
GO

--Create a table that saves the result of a pivot with employee
--names instead of numbers for column values
SELECT VName, [164] 'Mikael Q Sandberg', [198] 'Arvind B Rao',
    [223] 'Linda P Meisner', [231] 'Fukiko J Ogisu'
INTO pvt
FROM
(SELECT PurchaseOrderID, EmployeeID, v.Name as 'VName'
FROM Purchasing.PurchaseOrderHeader h 
JOIN Purchasing.Vendor v
ON h.VendorID = v.VendorID) p
PIVOT
(
COUNT (PurchaseOrderID)
FOR EmployeeID IN
( [164], [198], [223], [231], [233] )
) pvt
ORDER BY VName
GO

--Show an excerpt FOR VName starting with A
SELECT TOP 5 * FROM pvt
WHERE VName LIKE 'A%'
GO

--For display in book
SELECT TOP 5 CAST(VName AS NVARCHAR(22)) 'VName', 
    [Mikael Q Sandberg], [Arvind B Rao],
    [Linda P Meisner], [Fukiko J Ogisu]
FROM pvt
WHERE VName LIKE 'A%'
GO

--VendorID for Advanced Bicycles is 32
--Four PurchaseOrderID column values exist in PurchaseOrderHeader
--with VendorID values of 32 and EmployeeID values of 164
SELECT VendorID, Name FROM Purchasing.Vendor WHERE Name = 'Advanced Bicycles'
SELECT PurchaseOrderID FROM Purchasing.PurchaseOrderHeader WHERE VendorID = 32 and EmployeeID = 164

--Unpivot values
SELECT TOP 8 VName, Employee, OrdCnt
FROM 
(SELECT VName, [Mikael Q Sandberg], [Arvind B Rao], 
    [Linda P Meisner], [Fukiko J Ogisu]
FROM pvt) p
UNPIVOT
(OrdCnt FOR Employee IN ([Mikael Q Sandberg], 
[Arvind B Rao], [Linda P Meisner], [Fukiko J Ogisu])
)AS unpvt
GO

--For display in book
SELECT TOP 8 CAST(VName AS nvarchar(28)) 'VName', CAST(Employee AS nvarchar(18)) 'Employee', OrdCnt
FROM 
   (SELECT VName, [Mikael Q Sandberg], [Arvind B Rao], 
    [Linda P Meisner], [Fukiko J Ogisu]
   FROM pvt) p
   UNPIVOT
   (OrdCnt FOR Employee IN 
      ([Mikael Q Sandberg], [Arvind B Rao], 
        [Linda P Meisner], [Fukiko J Ogisu])
   )AS unpvt
GO


--Query to check unpivoted values
SELECT TOP 2 *
FROM pvt
ORDER BY VName ASC
GO

--For display in book
SELECT TOP 2 CAST(VName AS NVARCHAR(22)) 'VName', 
    [Mikael Q Sandberg], [Arvind B Rao],
    [Linda P Meisner], [Fukiko J Ogisu]
FROM pvt
ORDER BY VName ASC
GO



IF EXISTS(SELECT name FROM sys.tables WHERE name = 'pvt')
DROP TABLE pvt
GO

