
IF OBJECT_ID('dbo.ProductsRaw') IS NOT NULL
DROP TABLE dbo.ProductsRaw;
GO

IF OBJECT_ID('dbo.HCAOProductTable') IS NOT NULL
DROP TABLE dbo.HCAOProductTable;
GO

IF OBJECT_ID('dbo.HCAOProductTypeTable') IS NOT NULL
DROP TABLE dbo.HCAOProductTypeTable;
GO

IF OBJECT_ID('dbo.HCAOID') IS NOT NULL
DROP TABLE dbo.HCAOID;
GO

IF OBJECT_ID('dbo.HCAONewTypeProcedure') IS NOT NULL
DROP PROCEDURE dbo.HCAONewTypeProcedure;
GO

IF OBJECT_ID('dbo.HCAOView') IS NOT NULL
DROP VIEW dbo.HCAOView;
GO

CREATE TABLE dbo.ProductsRaw
(
	ProductType varchar(255) NOT NULL,
	Name varchar(255) NOT NULL,
	Cost float NOT NULL,
	Brand varchar (255) NOT NULL,
	Model varchar (255) NOT NULL
)
GO
INSERT dbo.ProductsRaw (ProductType, Name, Cost, Brand, Model) VALUES ('Solid State Drive ','Samsung Pro 960 M.2 - 1 TB',749.99,'Samsung','MZ-V6P1T0BW')
INSERT dbo.ProductsRaw (ProductType, Name, Cost, Brand, Model) VALUES ('Solid State Drive ','Samsung Evo 850 - 500 GB',182.6,'Samsung','MZ-75E500B/AM')
INSERT dbo.ProductsRaw (ProductType, Name, Cost, Brand, Model) VALUES ('Solid State Drive ','SanDisk M.2 - 512 GB',147.99,'SanDisk','SD8SN8U-512G-1122')
INSERT dbo.ProductsRaw (ProductType, Name, Cost, Brand, Model) VALUES ('CPU','Intel Core i7-6700K',339.99,'Intel','BX80662I76700K')
INSERT dbo.ProductsRaw (ProductType, Name, Cost, Brand, Model) VALUES ('CPU','AMD FX-8350 Black Edition - 8 Core',149.99,'AMD','FD8350FRHKBOX')
INSERT dbo.ProductsRaw (ProductType, Name, Cost, Brand, Model) VALUES ('Keyboard','Microsoft Natural Ergonomic Keyboard 4000',34.99,'Microsoft','B2M-00012')
GO
SELECT * FROM dbo.ProductsRaw

/*
Assignment #3

Run the above script to create a table of "raw" data.  Design a series of tables
	to put the data into third normal form.  Generate the SQL statements to create these tables.
	
	*Note* for my sanity, please add your first initial and full last name to the start of each of
	your table names (RReedProductTypes as an example)
	
	Using the techniques from a few classes ago, use the raw table to populate the values into the 
	tables you've created.  
	
	Next, create a stored procedure to add a new product type.  This stored procedure should accept
	all required values for your Product Type table.
	
	Last, create a view called <FirstInitialLastName>AllProducts that returns the product type, product
	name, product cost, brand, and model (it should match the raw table exactly)
	
	Turn in your create table scripts, your insert scripts, and the scripts for your stored procedure and
	view.
	
*/


CREATE TABLE dbo.HCAOProductTable
(
	Product_Id int IDENTITY(10,1) NOT NULL,
	ProductType varchar(255) NOT NULL,
	ProductName varchar(255) NOT NULL,
	ProductCost	float NOT NULL,
	PRIMARY KEY (Product_Id)
)
INSERT INTO HCAOProductTable (ProductType,ProductName,ProductCost)
SELECT ProductType,Name,Cost FROM ProductsRaw A

SELECT * FROM HCAOProductTable
GO

CREATE TABLE dbo.HCAOProductTypeTable
(
	ProductName varchar(255) NOT NULL,
	ProductBrand varchar(255) NOT NULL,
	ProductModel varchar(255) NOT NULL
	PRIMARY KEY (ProductName)
)
INSERT INTO HCAOProductTypeTable (ProductName ,ProductBrand,ProductModel)
SELECT Name,Brand,Model FROM ProductsRaw A

SELECT * FROM HCAOProductTypeTable
GO


CREATE PROCEDURE HCAONewTypeProcedure
@NewName NVARCHAR(50),
@NewBrand NVARCHAR(50),
@NewModel NVARCHAR(50) = "RZ01-01900100-R3U1 " 
AS
INSERT INTO HCAOProductTypeTable(ProductName,ProductBrand,ProductModel)
VALUES(@NewName,@NewBrand,@NewModel)
GO
EXECUTE HCAONewTypeProcedure @NewName = "Razer™ Abyssus V2",@NewBrand = "Razer",@NewModel = "RZ01-01900100-R3U1 "
GO

SELECT * FROM HCAOProductTypeTable
GO

CREATE VIEW HCAOView
AS SELECT ProductType, Name, Cost, Brand, Model
FROM ProductsRaw
GO
SELECT * FROM HCAOView