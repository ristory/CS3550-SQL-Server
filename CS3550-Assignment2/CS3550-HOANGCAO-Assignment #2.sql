use WideWorldImporters;
GO
/* Question #1 - 5 points*/

SELECT A.PersonID, A.FullName, A.EmailAddress from Application.People A
Inner Join Sales.Orders B on A.PersonID = B.SalespersonPersonID
Where month(B.OrderDate) = '01' and year(B.OrderDate) = '2013'
Group by A.PersonID, A.FullName, a.EmailAddress
Order by A.FullName;


/* Question #2 - 10 points*/

SELECT A.PersonID, A.FullName, A.EmailAddress, sum(C.UnitPrice * C.Quantity) as TotalSales from Application.People A
Inner Join Sales.Orders B on A.PersonID = B.SalespersonPersonID
Inner Join Sales.OrderLines C on B.OrderID = C.OrderID
Where month(B.OrderDate) = '01' and year(B.OrderDate) = '2013'
Group by A.PersonID, A.FullName, a.EmailAddress
Order by TotalSales DESC;

/* Question #3 - 5 points*/
SELECT count(distinct B.StockItemID) as SoldProducts from Sales.Orders A
Inner Join Sales.OrderLines B on A.OrderID = B.OrderID
Where year(A.OrderDate) = '2016';


/* Question #4 - 15 points */
SELECT A.PersonID, A.FullName, A.EmailAddress, SUM (CASE WHEN MONTH(B.OrderDate) = '1' THEN (C.UnitPrice * C.Quantity) ELSE 0 end) as January_2013 , SUM (CASE WHEN MONTH(B.OrderDate) = '2' THEN (C.UnitPrice * C.Quantity) ELSE 0 end) as Febuary_2013,SUM (CASE WHEN MONTH(B.OrderDate) = '3' THEN (C.UnitPrice * C.Quantity) ELSE 0 end) as March_2013,   SUM(CASE WHEN MONTH(B.OrderDate) = '1' or MONTH(B.OrderDate) = '2' or MONTH(B.OrderDate) = '3' THEN (C.UnitPrice * C.Quantity) ELSE 0 end) as totalSales  from Application.People A
Inner Join Sales.Orders B on A.PersonID = B.SalespersonPersonID
Inner Join Sales.OrderLines C on B.OrderID = C.OrderID
Where  year(B.OrderDate) = '2013'
Group by A.PersonID, A.FullName, a.EmailAddress
Order by January_2013 DESC;



go

