USE ProSSEApps

--Original copied T-SQL FROM vContactName
SELECT     TOP (100) PERCENT dbo.Customer.CustomerName, dbo.CustomerContact.ContactName, dbo.CustomerContact.EmailAddr
FROM         dbo.Customer INNER JOIN
                      dbo.CustomerContact ON dbo.Customer.CustomerID = dbo.CustomerContact.CustomerID
WHERE     (PATINDEX('%Church%', dbo.Customer.CustomerName) > 0)
ORDER BY dbo.CustomerContact.ContactName DESC

--Edited and re-formatted T-SQL FROM vContactName
SELECT TOP (100) PERCENT dbo.Customer.CustomerName, 
	dbo.CustomerContact.ContactName, dbo.CustomerContact.EmailAddr
FROM dbo.Customer INNER JOIN dbo.CustomerContact 
	ON dbo.Customer.CustomerID = dbo.CustomerContact.CustomerID
WHERE (PATINDEX('%Church%', dbo.Customer.CustomerName) = 0)
ORDER BY dbo.CustomerContact.ContactName DESC