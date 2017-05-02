/* 
Grading criteria - points will be primarily assigned based on getting
	the correct results.  You can lose a point or two for poor formatting.
	If you use a completely off the wall approach to solving the problem that
	could result in problems if the filters were changed, you may also lose
	a point or two (for example manually adding rows with a union that you 
	can't figure out how to get to show up with your query).

	In every case you're asked to create an object on the server, name it with
		your first initial and full last name at the beginning (RReed_SalesPeople)
*/

/* Question #1 - 10 points 

Create a view that returns all the sales people from the Application.People 
	table.  The follow rules apply to this list -
	- Include the PersonID
	- Fix the full name field to be last name then a comma and a space then the first name.
		Assume that the current name only has a first and last name separated by a space
	- Do not show @wideworldimporters on the network account (only the part before it).
	- Remove all the parenthesis, dashes, and spaces from the phone number

Kayla Woodcock's record would look as follows when selected from your view:

PersonID	FullName			NetworkAccount	PhoneNumber	EmailAddress
2			Woodcock, Kayla		kaylaw			4155550102	kaylaw@wideworldimporters.com

*/


/* 
Question #2 - 10 points

Write a query to return sales totals for each sales territory for the year
	or 2013.  

Return two columns - the Sales Territory name and the total sales.  Total 
	sales is calculated by multiplying the unit price by quantity, then adding
	in the tax amount for each line of the invoice.  Sort the list from largest 
	to smallest total sales.

Sales Territory can be found on the StateProvince table.  Use the DeliveryCityID
	on the Customer table to join into Cities.

You will get 9 rows.  The first row should be "Southeast" with a total sales of 11,946,896.04


*/

/*
Question #3 - 10 points

Utilizing much of the query from Question #2, provide a sales total for
	each state in the United States (countryID = 230).  If a state doesn't
	have any sales, make sure zero (0) appears.

If done correctly, you will get 53 records.  The last four records will have
	zero values and will include Rhode Island and Delaware.  Texas will be
	your first record with a total of 3,842,886.52.

Two hints - you have to pay attention to the logical processing order of the 
	query.  Also remember that you can have filter criteria included in the 
	join between two tables (TableA a LEFT JOIN TableB b ON a.id = b.id and A.value > 100)

*/

/* Question #4 - 10 points 

	Write a query that brings back all the stock items (in warehouse.StockItems).  Provide
		a column that totals sales for each for 2013, 2014, 2015, and 2016.  Include the 
		StockItemName and StockItemID.  Sort the list from largest overall sales to
		the smallest.

	You should get 227 records and 6 columns.  The first 2 row looks like the following:

StockItemID       StockItemName                                       2013Sales            2014Sales            2015Sales                2016Sales
215               Air cushion machine (Blue)                          3612087.90          3688522.65          3815185.95                1657542.15
173               32 mm Anti static bubble wrap (Blue) 50m            1977885.00          2167462.50          2332890.00                863362.50
*/



/* Question #5 

Declare a variable of type date and set it to some value of your choice.
Write a query that has a column for each of the following:
	- the date 28 days from now
	- the date 1 year from now
	- how many days between the day and Christmas 2017
	- the name of the day your date falls on (Wednesday for example),
	- The first day of the following month
	- The last day of the current month

Below are results for 3/1/2017 and 2/29/2016

28DaysLater	OneYearAway	DaysTillChristmas2017	NameOfDay	FirstDayOfFollowingMonth	LastDayOfCurrentMonth
2017-03-29	2018-03-01	299						Wednesday	2017-04-01					2017-03-31
2016-03-28	2017-02-28	665						Monday		2016-03-01					2016-02-29
*/
