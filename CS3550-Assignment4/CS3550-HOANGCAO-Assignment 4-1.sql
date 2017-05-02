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
use WideWorldImporters;
DECLARE
@i INT,
@a INT,
@count INT
SET @i = 1
WHILE (@i <= 100000)
BEGIN
  SET @count = 0
  SET @a = 1
  WHILE (@a <= @i)
  BEGIN
    IF (@i % @a = 0)
    SET @count = @count + 1
    SET @a = @a + 1
  END

  IF (@count = 2)
  PRINT @i
  SET @i = @i + case when @i < 3 then 1 else 2 end
END
GO



/* 
Question #2 - 10 points - Using much of the work done in question #1, create a function that
	accepts a number and returns a bit indicating if the passed in number was prime.
	1 for yes, 0 for no.  Call your fuction dbo.firstinitialwholelastname_isPrime (dbo.rreed_isPrime)

*/
IF OBJECT_ID('dbo.Hcao_isPrime') IS NOT NULL
DROP FUNCTION dbo.Hcao_isPrime;
GO

CREATE FUNCTION dbo.Hcao_isPrime
(
    @number INT
)
RETURNS INT
AS
BEGIN
DECLARE
@TRUE BIT = 1,
@FALSE BIT = 0,
@a INT,
@count INT

WHILE (@number <= 500)
BEGIN
  SET @count = 0
  SET @a = 1
  WHILE (@a <= @number)
  BEGIN
    IF (@number % @a = 0)
    SET @count = @count + 1
    SET @a = @a + 1
  END
  IF (@count > 2)
  RETURN @FALSE
  IF (@count = 2)
  RETURN @TRUE
  SET @number = @number + case when @number < 3 then 1 else 2 end
END
RETURN 0
END
GO

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
IF OBJECT_ID('dbo.Hcao_CalculateDiscount') IS NOT NULL
DROP FUNCTION dbo.Hcao_CalculateDiscount;
GO

CREATE FUNCTION dbo.Hcao_CalculateDiscount
(
    @quantity INT, @unit_price DECIMAL, @tax_rate DECIMAL
)
RETURNS INT
AS
BEGIN
DECLARE
@TotalValue DECIMAL
SET @TotalValue = (@quantity * @unit_price) * 1 +@tax_rate

IF (@quantity > 100)
SET @TotalValue = @TotalValue - @TotalValue * 8 / 100
RETURN @TotalValue

IF (@quantity > 250)
SET @TotalValue = @TotalValue - @TotalValue * 12 / 100
RETURN @TotalValue

RETURN 0
END
GO

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
*/
SELECT A.CustomerID, A.CustomerName,E.PersonID AS [CustomerContact.PersonID],SUBSTRING(E.FullName, 1, CHARINDEX(' ', fullname) - 1) AS [CustomerContact.Firstname],SUBSTRING(E.FullName,CHARINDEX(' ', E.FullName) + 1,
LEN(E.FullName) - CHARINDEX(' ', E.FullName)) AS [CustomerContact.Lastname],E.EmailAddress AS[CustomerContact.Email] ,A.DeliveryAddressLine2 AS [CustomerContact.Address1],A.DeliveryAddressLine1 AS [CustomerContact.Address2],C.CityName AS [CustomerContact.City],
D.StateProvinceName AS [CustomerContact.State],A.PostalPostalCode AS [CustomerContact.Zip] ,B.CustomerCategoryName AS CustomerType, A.WebsiteURL AS Website
FROM Sales.Customers A
INNER JOIN Sales.CustomerCategories B ON A.CustomerCategoryID = B.CustomerCategoryID
INNER JOIN Application.Cities C ON A.DeliveryCityID = C.CityID
INNER JOIN Application.StateProvinces D ON C.StateProvinceID = D.StateProvinceID
INNER JOIN Application.People E ON A.PrimaryContactPersonID = E.PersonID
WHERE A.CustomerID = 200
FOR JSON PATH
GO


