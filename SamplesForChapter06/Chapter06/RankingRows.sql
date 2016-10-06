USE AdventureWorks
GO

--Rows numbered and ordered by SalesYTD
SELECT FirstName + ' ' + LastName 'Name', SalesYTD, SalesQuota, 
    TerritoryGroup, 
    ROW_NUMBER() OVER(ORDER BY SalesYTD DESC) AS 'RowNumber'
FROM Sales.vSalesPerson

--Rows numbered and ordered by SalesYTD within
--TerritoryGroup partitions
SELECT FirstName + ' ' + LastName 'Name', SalesYTD, SalesQuota,  
    TerritoryGroup, 
    ROW_NUMBER() OVER(PARTITION BY TerritoryGroup 
    ORDER BY SalesYTD DESC) AS 'RowNumber'
FROM Sales.vSalesPerson

--Rows ranked and ordered by SalesQuota
--from both the RANK and DENSE_RANK functions
SELECT FirstName + ' ' + LastName 'Name', SalesYTD, SalesQuota, 
    TerritoryGroup, 
    RANK() OVER(ORDER BY SalesQuota DESC) AS 'Rank', 
    Dense_RANK() OVER(ORDER BY SalesQuota DESC ) AS 'Dense Rank'
FROM Sales.vSalesPerson

--Rows dense ranked and ordered by SalesYTD within SalesQuota
SELECT FirstName + ' ' + LastName 'Name', SalesYTD, SalesQuota, 
    TerritoryGroup, 
    Dense_RANK() OVER(ORDER BY SalesQuota DESC, 
    SalesYTD DESC) AS 'Dense Rank'
FROM Sales.vSalesPerson


--Rows partitioned by TerritoryGroup as well as dense ranked
--and ordered by SalesYTD within SalesQuota
SELECT FirstName + ' ' + LastName 'Name', SalesYTD, SalesQuota,
    TerritoryGroup, 
    Dense_RANK() OVER(PARTITION BY TerritoryGroup 
    ORDER BY SalesQuota DESC, SalesYTD DESC) AS 'Dense Rank'
FROM Sales.vSalesPerson


--Rows grouped into quintiles and ordered by SalesYTD
SELECT FirstName + ' ' + LastName 'Name', SalesYTD, SalesQuota, 
    TerritoryGroup, 
    NTILE(5) OVER(ORDER BY SalesYTD DESC) AS 'NTILE'
FROM Sales.vSalesPerson

