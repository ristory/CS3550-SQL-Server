
/* Hoang Cao CS3550
Question #1 - 10 points 
*/

USE WideWorldImporters;
GO

IF OBJECT_ID('HCAO_APPLICATIONPEOPLE') IS NOT NULL
DROP VIEW HCAO_APPLICATIONPEOPLE;
GO
CREATE VIEW HCAO_APPLICATIONPEOPLE AS SELECT A.PersonID,CONCAT(substring(A.FullName, charindex(' ',A.FullName),len(A.FullName)-charindex(' ',A.FullName)+1),', ', substring(A.FullName, 1,charindex(' ',A.FullName))  ) AS FullName,REPLACE(substring(A.LogonName, 1,charindex('@',A.LogonName)),'@','') AS NetworkAccount,REPLACE(REPLACE(REPLACE(REPLACE(A.PhoneNumber,')',''),'(',''),'-',''),' ','')AS PhoneNumber,A.EmailAddress
FROM Application.People A
GO

SELECT * FROM HCAO_APPLICATIONPEOPLE   

/* 
Question #2 - 10 points
*/
SELECT SUM((A.UnitPrice * A.Quantity) + A.TaxAmount) AS TotalSales,E.SalesTerritory
FROM Sales.InvoiceLines A
INNER JOIN Sales.Invoices B ON A.InvoiceID = B.InvoiceID
INNER JOIN Sales.Customers C ON B.CustomerID = C.CustomerID
INNER JOIN Application.Cities D ON C.DeliveryCityID = D.CityID
INNER JOIN Application.StateProvinces E ON D.StateProvinceID = E.StateProvinceID

WHERE DATEPART(YYYY,A.LastEditedWhen) = '2013'
GROUP BY E.SalesTerritory
ORDER BY TotalSales DESC


/*
Question #3 - 10 points
*/

SELECT ISNULL(SUM(CASE WHEN DATEPART(YYYY,A.LastEditedWhen) = '2013' THEN ((A.UnitPrice * A.Quantity) + A.TaxAmount)END),0) AS TotalSales, E.StateProvinceName
FROM Sales.InvoiceLines A
INNER JOIN Sales.Invoices B ON A.InvoiceID = B.InvoiceID
INNER JOIN Sales.Customers C ON B.CustomerID = C.CustomerID
RIGHT OUTER JOIN Application.Cities D ON C.DeliveryCityID = D.CityID
RIGHT OUTER JOIN Application.StateProvinces E ON D.StateProvinceID = E.StateProvinceID
WHERE  E.CountryID = '230' 
GROUP BY E.StateProvinceName 
ORDER BY TotalSales DESC

/*
*Question #4           
*/

SELECT B.StockItemID, B.StockItemName,
SUM(CASE WHEN DATEPART(YYYY,A.LastEditedWhen) = '2013' THEN (A.UnitPrice * A.Quantity) + A.TaxAmount END) AS '2013Sales',
SUM(CASE WHEN DATEPART(YYYY,A.LastEditedWhen) = '2014' THEN (A.UnitPrice * A.Quantity) + A.TaxAmount END) AS '2014Sales',
SUM(CASE WHEN DATEPART(YYYY,A.LastEditedWhen) = '2015' THEN (A.UnitPrice * A.Quantity) + A.TaxAmount END) AS '2015Sales',
SUM(CASE WHEN DATEPART(YYYY,A.LastEditedWhen) = '2016' THEN (A.UnitPrice * A.Quantity) + A.TaxAmount END) AS '2016Sales'
FROM Sales.InvoiceLines A
INNER JOIN Warehouse.StockItems B ON A.StockItemID = B.StockItemID
GROUP BY B.StockItemID, B.StockItemName
ORDER BY SUM((A.UnitPrice * A.Quantity) + A.TaxAmount) DESC


/*
 Question #5 
*/
DECLARE @DATE DATETIME = GETDATE()
SELECT 
REPLACE(CONVERT(VARCHAR,DATEADD(DAY, 28, @DATE),111),'/','-') AS '28DaysLater',
REPLACE(CONVERT(VARCHAR,DATEADD(YEAR, 1, @DATE),111),'/','-') AS OneYearAway,
DATEDIFF(DAY, GETDATE(), dateadd(YEAR,DATEDIFF(YEAR,-1,GETDATE()),-7)) AS DaysTillChristmas2017,
DATENAME(DW,GETDATE()) AS NameOfDay,
REPLACE(CONVERT(VARCHAR,(DATEADD(MONTH,DATEDIFF(MONTH,-1,GETDATE()),0)),111),'/','-') AS FirstDayOfFollowingMonth,
REPLACE(CONVERT(VARCHAR,DATEADD(MONTH,DATEDIFF(MONTH,-1,GETDATE()),-1),111),'/','-') AS LastDayOfCurrentMonth

GO