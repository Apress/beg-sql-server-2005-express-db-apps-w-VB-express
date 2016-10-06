USE Adventureworks
GO

--Select contacts with a specific last name
SELECT FirstName, LastName, EmailAddress, Phone
FROM Person.Contact
WHERE LastName = 'Blanco'

--Select contacts whose last name starts with
--b using LIKE operator and wildcard
SELECT FirstName, LastName, EmailAddress, Phone
FROM Person.Contact
WHERE LastName LIKE 'b%'

--Select contacts whose last name starts with
--a specific letter using LIKE operator and wildcard
DECLARE @alpha nchar(1)
SET @alpha = 'b'
SELECT FirstName, LastName, EmailAddress, Phone
FROM Person.Contact
WHERE LastName LIKE @alpha + '%'

--Select contacts whose last name starts and
--ends with specific letters using LIKE
--operator and wildcards
DECLARE @alpha nchar(1), @endalpha nchar(1)
SET @alpha = 'c'
SET @endalpha = 'o'
SELECT FirstName, LastName, EmailAddress, Phone
FROM Person.Contact
WHERE LastName LIKE @alpha + '%' + @endalpha

--Select contacts whose last name contains a string
--of characters using LIKE operator and wildcard
DECLARE @alpha nvarchar(10)
SET @alpha = 'bell'
SELECT FirstName, LastName, EmailAddress, Phone, @alpha
FROM Person.Contact
WHERE LastName LIKE '%' + @alpha + '%'

--Select contacts with specific LastName and
--whose Phone contains a specific country code
DECLARE @alpha1  nvarchar(30), @alpha2 nvarchar(10)
SET @alpha1 = 'Blanco'
SET @alpha2 = '%(11)%'
SELECT FirstName, LastName, EmailAddress, Phone
FROM Person.Contact
WHERE LastName = @alpha1 AND
    Phone LIKE @alpha2

