/*
Query #1 - 5 points

The warehouse team needs to validate the list of items for 
	the company "Northwind Electric Cars".  They'd like you to write a query to
	extract a list of items including the stockItemId, name (supplier and stock), 
	size, unit price, and recommended price.  You'll need the Purchasing.Suppliers
	table and the Warehouse.StockItems table (joined on SupplierID).

	Order the final list based on the stock item name (alphabetic - a to z)

Results will include 18 rows and 6 columns.  The top row will be a 
	"RC toy sedan car with remote control (Black) 1/50 scale" item
*/


/*
Query #2 - 5 points 

The accountants want to review the profit and margin
	of each of the items that are currently carried and make sure everything
	meets the minimum threshold of 45%.  

	Return the same columns as query #1 but now include two additional columns.
	The first is the profit - simply the recommended price minus the unit price.
	The second is the margin percentage - calculated by the profit divided by the 
	unit price of the product.  Give these columns aliases so the display 
	nicely in the results.  Order the final results based on profit, largest 
	to smallest

The query returns 8 records and 8 columns.  The margin percentage for these 
	records are ~43%.  The top record will be for "Novelty chilli chocolates".
*/

/*
Question #3 - 5 points

The marketing team wants a list of all the products for all customers that 
	they can include in an email.  The query you did for question #1 
	has all the columns you need with the exception of the color 
	(which can be found in the Warehouse.Colors	table joined in on ColorID).  
	Add the ColorName column to query #1.  If the color is missing, 
	insert "Unknown".  Make sure you add aliases if needed (no 
	"(No column name)" columns)

This query will return 227 rows.  99 items will have an unknown color

*/



/*
Question #4 - 10 points

Its time for the annual trade show and you want to make sure all
	your suppliers make it to the party.  The marketing team needs
	a list of all your suppliers, their full delivery address, and 
	the name of both the primary and alternate contacts for the 
	supplier.  Order the results by supplier name

	You'll be using a number of tables - Purchasing.Suppliers, and
	the People, Cities, and StateProvinces tables in the Application 
	schema.  The columns to join things up are a bit more tricky - 
		- Suppliers to people on the PersonID and the PrimaryContactPersonID
			or AlternateContactPersonID.
		- Cities on CityID to Suppliers on DeliveryCityID
		- StateProvices on StateProvinceID (on both sides)

	Something to keep in mind...  you can join to the same table multiple times
	as long as you give them different aliases.

This query will return 13 rows and 9 columns.  An example to compare to - 

SupplierName	PrimaryContactName	AlternateContactName	DeliveryAddressLine1	DeliveryAddressLine2	DeliveryCityID	CityName	StateProvinceCode	DeliveryPostalCode
A Datum Corporation	Reio Kabin	Oliver Kivi	Suite 10	183838 Southwest Boulevard	38171	Zionsville	IN	46077

*/

