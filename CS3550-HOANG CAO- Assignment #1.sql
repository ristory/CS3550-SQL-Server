use WideWorldImporters;
go
/* Query #1 - 5 points*/

SELECT A.StockItemID, B.SupplierName, A.StockItemName, A.Size, A.UnitPrice, A.RecommendedRetailPrice From Warehouse.StockItems A
Inner Join Purchasing.Suppliers B On A.SupplierID = B.SupplierID

Where B.SupplierName = 'Northwind Electric Cars'

Order by A.StockItemName;

/* Query 2 - 5 points*/



SELECT A.StockItemID, B.SupplierName, A.StockItemName, A.Size, A.UnitPrice, A.RecommendedRetailPrice, (A.RecommendedRetailPrice - A.UnitPrice) as Profit, round (((A.RecommendedRetailPrice - A.UnitPrice) /A.UnitPrice * 100),2) as MarginPercentage From Warehouse.StockItems A
Inner Join Purchasing.Suppliers B On A.SupplierID = B.SupplierID
Where ((A.RecommendedRetailPrice - A.UnitPrice) /A.UnitPrice * 100) <= 45 
Order by Profit Desc; 

/* Query 3 - 5 points*/


SELECT A.StockItemID, B.SupplierName, A.StockItemName, A.Size, A.UnitPrice, A.RecommendedRetailPrice, case when (C.ColorName is null) then 'Unknow' else C.ColorName end as ColorName From Warehouse.StockItems A
Inner Join Purchasing.Suppliers B On A.SupplierID = B.SupplierID
left Outer Join Warehouse.Colors C On C.ColorID = A.ColorID
Order by C.ColorName

/* Query 4 - 10 points*/
SELECT B.SupplierName, A.FullName as PrimaryContactName, E.FullName as AlternateContactName, DeliveryAddressLine1, B.DeliveryAddressLine2, B.DeliveryCityID, C.CityName, D.StateProvinceCode ,B.DeliveryPostalCode   From Purchasing.Suppliers B
Inner Join Application.People A On A.PersonID = B.PrimaryContactPersonID 
Inner Join Application.People E On E.PersonID = B.AlternateContactPersonID
Inner Join Application.Cities C On C.CityID = B.DeliveryCityID
Inner Join Application.StateProvinces D On D.StateProvinceID = C.StateProvinceID
Order by B.SupplierName


