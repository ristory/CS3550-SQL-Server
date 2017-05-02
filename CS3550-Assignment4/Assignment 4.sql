/*
Assignment #4: T-SQL Programming
*/

/*
Question #1 - 15 points - Find all prime numbers between 1 and 100,000.  Using T-SQL, 
	code something that prints to the message window (using PRINT) any number between 1 and 100k that is 
	prime.

Use good code formatting - indentation and whitespace.  Your algorithm can be as sophisticated as you 
	want it to be (don't have to make this super efficient).  A list of prime numbers can be
	found at https://primes.utm.edu/lists/small/100000.txt
*/

/* 
Question #2 - 10 points - Using much of the work done in question #1, create a function that
	accepts a number and returns a bit indicating if the passed in number was prime.
	1 for yes, 0 for no.  Call your fuction dbo.firstinitialwholelastname_isPrime (dbo.rreed_isPrime)

*/

/*

Question #3 - 15 points - Create a function that accepts a quantity, unit price
	and tax rate.  The function should first calculate the total value of
	the information passed in - (quantity * unit price) * 1+taxrate.
	If there are more than 100 items purchased, give a discount of 8%.  If
	more than 250 item were purchased, give a 12% discount

Return the final value.  Use the Sales.OrderLines records to test
	your function.  As in previous assignments, name your function with 
	your first initial and full last name (dbo.rreed_CalculateDiscount)
*/

/*

Question #4 - 10 points - Write a query that exports a JSON string for customerID 200
	(Tailspin Toys in Tooele, UT).  The query should generate the below string exactly.
	Tables that you need to use - Sales.Customers, Sales.CustomerCategories, Application.Citites
	Application.StateProvince, and Application.People.  I'm using the delivery address
	information (including deliveryCityID to join on)
	
[
	{
		"CustomerID":200,
		"CustomerName":"Tailspin Toys (Tooele, UT)",
		"CustomerContact":
		{
			"PersonID":1399,
			"FirstName":"Fanni",
			"LastName": "Benko",
			"Email":"fanni@tailspintoys.com",
			"Address1":"691 Sonkar Avenue",
			"Address2":"Suite 264","City":
			"Tooele","State":
			"Utah",
			"Zip":"90100"
		},
		"CustomerType":"Novelty Shop",
		"Website":"http:\/\/www.tailspintoys.com\/Tooele"
	}
]