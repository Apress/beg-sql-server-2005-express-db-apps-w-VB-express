
--Not necessary the first time that you run the sample
--DROP VIEW dbo.vEmployeeDeptID
--GO

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
