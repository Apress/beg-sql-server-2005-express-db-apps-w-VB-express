USE AdventureWorks
GO

--Datetime values are numbers that you can
--display as characters
SELECT TOP 1 SalesOrderID,  OrderDate,
    OrderDate + 9 'OrderDate + 9',
    OrderDate + .5 'OrderDate + .5'
FROM Sales.SalesOrderHeader

--Computed values with the CONVERT function for a
--datetime-to-varchar representation of a date
SELECT TOP 1 SalesOrderID, OrderDate,
    CONVERT(varchar,OrderDate,100) 'Mmm dd yyyy hh:mmdp',
    CONVERT(varchar,OrderDate,101) 'mm/dd/yyyy',
    CONVERT(varchar,OrderDate,103) 'dd/mm/yyyy'
FROM Sales.SalesOrderHeader


--Computed values with the CONVERT function for a
--datetime-to-varchar representation of a time
--or date and time
SELECT TOP 1 GETDATE() 'Default',
    CONVERT(varchar,GETDATE(),108) 'hh:mm:ss',
    CONVERT(varchar,GETDATE(),114) 'hh:mm:ss:mmm',
    CONVERT(varchar,GETDATE(),113) 'dd Mmm yyyy hh:mm:ss:mmm'

--Tdoay, one month from now, and days between
--via DATEDIFF function
DECLARE @thisdate datetime, @nextmonth datetime
SET @thisdate = GETDATE()
SET @nextmonth = DATEADD(m, 1, GETDATE())
SELECT CONVERT(varchar, @thisdate, 101) 'Today',
    CONVERT(varchar, @nextmonth, 101) 'One month from today',
    DATEDIFF(d, @thisdate, @nextmonth) 'Days between'



