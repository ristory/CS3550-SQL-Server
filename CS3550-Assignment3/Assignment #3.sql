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
	
CREATE TABLE dbo.ProductType
(
	ProductTypeName varchar(255) NOT NULL
)

INSERT ProductType (ProductTypeName)
SELECT DISTINCT ProductType FROM ProductsRaw

SELECT * FROM ProductType