Use AdventureWorks2008R2
GO

/*1. Display the name of the day, the average online order sales subtotal and average in-store order sales subtotal for each day of the week (Saturday - Sunday)
(Static Pivot Query Only)*/
SELECT * FROM 
(
SELECT SUM(C.ONLINE) AS AVERAGE,C.DAYWEEK, C.OnlineOrderFlag
FROM
(
SELECT ROUND(AVG(A.OrderQty),2) AS ONLINE,DATENAME(WEEKDAY,B.OrderDate) AS DAYWEEK,B.OnlineOrderFlag
FROM Sales.SalesOrderDetail AS A
INNER JOIN Sales.SalesOrderHeader AS B ON A.SalesOrderID = B.SalesOrderID
WHERE B.OnlineOrderFlag = 1 OR B.OnlineOrderFlag = 0
GROUP BY DATENAME(WEEKDAY,B.OrderDate),B.OnlineOrderFlag)C
GROUP BY C.DAYWEEK, C.OnlineOrderFlag)D
PIVOT
(
MAX(AVERAGE)
FOR DAYWEEK IN (MONDAY,TUESDAY,WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY)
)PIV

GO
/*2. List each product category and the number of units sold by month.
(Complete both Static and Dynamic Pivot Query)*/

SELECT * FROM
(
SELECT SUM(A.OrderQty) AS SOLD,DATENAME(MONTH,B.OrderDate) AS MONTHS, E.Name AS CATEGORYNAME
FROM Sales.SalesOrderDetail AS A
INNER JOIN Sales.SalesOrderHeader AS B ON A.SalesOrderID = B.SalesOrderID
INNER JOIN Production.Product AS C ON A.ProductID = C.ProductID
INNER JOIN Production.ProductSubcategory AS D ON D.ProductSubcategoryID = C.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS E ON D.ProductCategoryID = E.ProductCategoryID
GROUP BY DATENAME(MONTH,B.OrderDate),E.Name)F
PIVOT
(
SUM (SOLD)
FOR MONTHS IN (JANUARY,FEBRUARY,MARCH,APRIL,MAY,JUNE,JULY,AUGUST,SEPTEMBER,OCTOBER,DECEMBER))PVT;


GO
/*DYNAMIC It worked but didn't send out the resul

DECLARE @DYNAMIC NVARCHAR(MAX),@COLUMN NVARCHAR(MAX);
SET @COLUMN = N'';
SELECT @COLUMN += N', ' +QUOTENAME(MONTHS)
FROM (SELECT DATENAME(MONTH,B.OrderDate) AS MONTHS FROM Sales.SalesOrderHeader AS B)  AS MONTHH

SET @DYNAMIC = N'SELECT CATEGORY, ' + @COLUMN + N'  
FROM
(
SELECT SUM(A.OrderQty) AS SOLD,DATENAME(MONTH,B.OrderDate) AS MONTHS, E.Name AS CATEGORYNAME
FROM Sales.SalesOrderDetail AS A
INNER JOIN Sales.SalesOrderHeader AS B ON A.SalesOrderID = B.SalesOrderID
INNER JOIN Production.Product AS C ON A.ProductID = C.ProductID
INNER JOIN Production.ProductSubcategory AS D ON D.ProductSubcategoryID = C.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS E ON D.ProductCategoryID = E.ProductCategoryID
GROUP BY DATENAME(MONTH,B.OrderDate),E.Name)F
PIVOT
(
SUM (SOLD)
FOR MONTHS IN ('+ @COLUMN + N'))PVT';
PRINT @DYNAMIC;
EXEC sp_executesql @DYNAMIC; */

