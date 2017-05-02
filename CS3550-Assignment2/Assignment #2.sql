/*
Question #1 - 5 points

Create a list of sales reps who sold products in January 2013.  A salesrep
	should only show up in the list one time, regardless of how many orders they had
	in the this timeframe.  Include their personID, full name, and email address.  Sort
	the list by the name.  You will need the Sales.Orders table and the Application.People
	table.

Your final list should be 10 people.  First one is Amy Trefl, personID = 7, 
	email address = 'amyt@wideworldimporters.com'

*/


/*
Question #2 - 10 points

Depending on how you accomplished the previous query, you should be able to use 
	much of it to answer this.  Add a column that totals the sales for each sales person
	for the month of January 2013.  Sort the final list from most sales to least sales.

You'll need an additional table - Sales.OrderLines.  The value for any given product
	is calculated by multiplying the unit price by the quantity sold.

The top seller is Hudson Onslow at a total of 488,238.95

*/


/*
Question #3 - 5 points

Write a query that figures out how many unique products were sold 
	in 2016.  You will use the Sales.Orders and Sales.OrderLines tables
	to figure this out.

The answer is 227.  The same query run against 2015 should return 219


*/

/* 

Question #4 - 15 points

You can leverage much of the work you did in the second query on this.

Write a query that shows each sales persons total for the month of January,
	February, and March for the year 2013.  You should have a column for each
	month and only one row for each salesperson.  
Also, add a column that provides the total for all three months

Order it by the largest overall total to the smallest overall total.

Hudson Onslow is the first record.  January 2013 = 488238.95, February = 307648.05,
	March = 467183.70, and the total is 1263070.70.  You should return 10 rows only.
*/

