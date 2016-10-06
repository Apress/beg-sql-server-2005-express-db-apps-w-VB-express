USE AdventureWorks
GO

--Create this view before running the following samples
CREATE VIEW dbo.vEmployeeDeptID
AS
SELECT HumanResources.Employee.EmployeeID 'EmployeeID',
	HumanResources.Employee.ManagerID 'ManagerID',
        HumanResources.EmployeeDepartmentHistory.DepartmentID
FROM HumanResources.EmployeeDepartmentHistory INNER JOIN
	HumanResources.Employee
	ON HumanResources.EmployeeDepartmentHistory.EmployeeID =
	HumanResources.Employee.EmployeeID
WHERE HumanResources.EmployeeDepartmentHistory.EndDate IS NULL

--List of Employees by department and the managers to whom they report
SELECT e2.DepartmentID, e2.ManagerID, e2.EmployeeID
FROM dbo.vEmployeeDeptID e1 JOIN dbo.vEmployeeDeptID e2
ON e1.EmployeeID = e2.ManagerID
ORDER BY e2.DepartmentID, e2.ManagerID

--List of managers for each department
SELECT DISTINCT e2.DepartmentID, e2.ManagerID
FROM dbo.vEmployeeDeptID e1 JOIN dbo.vEmployeeDeptID e2
ON e1.EmployeeID = e2.ManagerID
ORDER BY e2.DepartmentID, e2.ManagerID

--List of managers outside departments
SELECT DISTINCT e2.DepartmentID, e2.ManagerID
FROM dbo.vEmployeeDeptID e1 JOIN dbo.vEmployeeDeptID e2
ON e1.EmployeeID = e2.ManagerID AND e2.DepartmentID != e1.DepartmentID
ORDER BY e2.DepartmentID, e2.ManagerID

--List of managers within each department
SELECT DISTINCT e2.DepartmentID, e2.ManagerID
FROM dbo.vEmployeeDeptID e1 JOIN dbo.vEmployeeDeptID e2
ON e1.EmployeeID = e2.ManagerID AND e2.DepartmentID = e1.DepartmentID
ORDER BY e2.DepartmentID, e2.ManagerID

--List of direct reports to top-level manager who are from
--other departments
SELECT DISTINCT e2.DepartmentID, e2.ManagerID, e2.EmployeeID
FROM dbo.vEmployeeDeptID e1 JOIN dbo.vEmployeeDeptID e2
ON e1.EmployeeID = e2.ManagerID AND e2.DepartmentID != e1.DepartmentID
WHERE e1.ManagerID IS NULL
ORDER BY e2.DepartmentID


--list of direct reports to top-level manager who are from
--the same department
SELECT e2.DepartmentID, e2.ManagerID, e2.EmployeeID
FROM dbo.vEmployeeDeptID e1 JOIN dbo.vEmployeeDeptID e2
ON e1.EmployeeID = e2.ManagerID AND e2.DepartmentID = e1.DepartmentID
WHERE e1.ManagerID IS NULL
ORDER BY e2.DepartmentID



