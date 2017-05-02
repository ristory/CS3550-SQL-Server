use AdventureWorks2008R2;
GO
/*1. List the first name, last name, gender, age, and job title of the oldest employee.*/

SELECT B.FirstName, B.LastName, A.Gender, DATEDIFF(YEAR, A.Birthdate, GETDATE()) - 1 as AGE, A.JobTitle
FROM HumanResources.Employee AS A
   INNER JOIN Person.Person AS B ON A.BusinessEntityID = B.BusinessEntityID
	WHERE A.BirthDate = (SELECT MIN(A.BirthDate)
FROM HumanResources.Employee AS A)

/*2. Display the employee male to female ratio.*/
DECLARE @MALE DECIMAL 
SET @MALE = (SELECT COUNT(A.Gender) AS MALE
 FROM HumanResources.Employee AS A
 WHERE A.Gender = 'M')

DECLARE @FEMALE DECIMAL
SET @FEMALE = (SELECT COUNT(A.Gender) AS FEMALE
 FROM HumanResources.Employee AS A
 WHERE A.Gender = 'F')

 SELECT RATIO =@MALE/@FEMALE

 /*3. What is the most ordered item for each customer?*/

 SELECT E.AccountNumber,E.Name,E.QUANTITY
 FROM(
 SELECT RANK() OVER (PARTITION BY D.AccountNumber ORDER BY D.QUANTITY DESC) AS POINT, AccountNumber,D.QUANTITY,D.Name
 FROM(
SELECT SUM(B.OrderQty) AS QUANTITY,A.Name,C.AccountNumber
 FROM Production.Product AS A
INNER JOIN Sales.SalesOrderDetail AS B ON B.ProductID = A.ProductID
INNER JOIN Sales.SalesOrderHeader AS C ON B.SalesOrderID = C.SalesOrderID
GROUP BY  A.Name, C.AccountNumber)D
)E
WHERE E.POINT =1
ORDER BY E.QUANTITY DESC

 /*4. Show the state(s) with the most online orders.*/
 
 SELECT TOP (1) SUM(D.OrderQty) AS QUALITY,A.Name
 FROM Person.StateProvince AS A
 INNER JOIN Person.Address AS B ON A.StateProvinceID = B.StateProvinceID
 INNER JOIN Sales.SalesOrderHeader AS C ON B.AddressID = C.ShipToAddressID
 INNER JOIN Sales.SalesOrderDetail AS D ON C.SalesOrderID = D.SalesOrderID
 GROUP BY A.Name
 ORDER BY QUALITY DESC

  /*5)Display the vendor ID, credit rating and address for vendors that have a credit rating higher than 3.*/

  SELECT A.VendorID, D.CreditRating, F.AddressLine1, F.City, F.StateProvinceID, F.PostalCode
  FROM Purchasing.PurchaseOrderHeader AS A
  INNER JOIN Purchasing.PurchaseOrderDetail AS B ON A.PurchaseOrderID = B.PurchaseOrderDetailID
  INNER JOIN Purchasing.ProductVendor AS C ON B.ProductID = C.ProductID
  INNER JOIN Purchasing.Vendor AS D ON C.BusinessEntityID = D.BusinessEntityID
  INNER JOIN Person.BusinessEntityAddress AS E ON E.BusinessEntityID = D.BusinessEntityID
  INNER JOIN Person.Address AS F ON E.AddressID = F.AddressID
  WHERE D.CreditRating > 3
ORDER BY A.VendorID DESC

  /* 6)Display the territory (ID, Name, CountryRegionCode, Group and Count) of the territory that has the most customers.*/
  
  SELECT TOP(1) C.TerritoryID, C.Name, C.CountryRegionCode, C.CUSTOMER
  FROM(
  SELECT A.TerritoryID, A.Name, A.CountryRegionCode, COUNT(B.CustomerID) AS CUSTOMER
  FROM Sales.SalesTerritory AS A
  INNER JOIN Sales.Customer AS B ON A.TerritoryID = B.TerritoryID
  GROUP BY A.TerritoryID, A.Name, A.CountryRegionCode)C
  ORDER BY C.CUSTOMER DESC

   /*7. List the first employee hired in each department, in alphabetical order by department?*/
   SELECT * FROM HumanResources.EmployeeDepartmentHistory

   SELECT F.FirstName, F.MiddleName, F.LastName, F.HireDate, F.Name
   FROM(
   SELECT RANK() OVER (PARTITION BY E.Name ORDER BY E.HireDate ASC) AS POINT, E.FirstName, E.MiddleName, E.LastName, E.HireDate, E.Name
   FROM(
   SELECT A.FirstName, A.MiddleName, A.LastName, B.HireDate, D.Name
   FROM Person.Person as A	
   INNER JOIN HumanResources.Employee as B ON A.BusinessEntityID = B.BusinessEntityID	
   INNER JOIN HumanResources.EmployeeDepartmentHistory AS C ON B.BusinessEntityID = C.BusinessEntityID
   INNER JOIN HumanResources.Department AS D ON C.DepartmentID = D.DepartmentID)E)F
   WHERE F.POINT = 1
   ORDER BY F.Name

   /*8)List the first and last name and current pay rate of employees who have above average YTD sales.*/

 SELECT p.FirstName, p.LastName, ph.Rate
 FROM Person.Person as p, HumanResources.Employee as e, HumanResources.EmployeePayHistory as ph
 WHERE p.BusinessEntityID = e.BusinessEntityID
 AND e.BusinessEntityID = ph.BusinessEntityID
 AND p.BusinessEntityID IN
 (SELECT sp.BusinessEntityID
 FROM Sales.SalesPerson as sp
 WHERE sp.SalesYTD>
 (SELECT AVG(sp.SalesYTD)
 FROM Sales.SalesPerson as sp))

 /*9. Identify the currency of the country with the highest number of orders.*/

 SELECT TOP (1)SUM (D.OrderQty) AS COUNT, A.Name
 FROM Sales.Currency AS A
INNER JOIN Sales.CurrencyRate AS B ON A.CurrencyCode = B.ToCurrencyCode
INNER JOIN Sales.SalesOrderHeader AS C ON B.CurrencyRateID = C.CustomerID
INNER JOIN Sales.SalesOrderDetail AS D ON C.SalesOrderID= D.SalesOrderID
GROUP BY A.Name
ORDER BY COUNT DESC

 /*10) Display the average amount of markup (standard cost vs. unit price) on bikes sold during June of 2008*/

SELECT '$' + CAST(ROUND(AVG(od.UnitPrice - p.StandardCost), 2) as varchar ) AS 'Average Bike Markup'
FROM Sales.SalesOrderHeader as oh, Sales.SalesOrderDetail as od, Production.Product as p,
Production.ProductSubcategory as ps, Production.ProductCategory as pc
WHERE oh.SalesOrderID = od.SalesOrderID
AND od.ProductID = p.ProductID
AND ps.ProductSubcategoryID = ps.ProductSubcategoryID
AND ps.ProductCategoryID = pc.ProductCategoryID
AND oh.OrderDate BETWEEN ' 2008/06/01' AND '2008/06/30 23:59:59.999'
AND pc.Name = 'Bikes'

GO