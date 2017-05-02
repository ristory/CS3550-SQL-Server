/*
	Part two - Midterm

*/

CREATE TABLE Midterm
(
	MidtermKey int IDENTITY (1,1) NOT NULL,
	SomeCharacterValue varchar(255) NULL,
	SomeNumber int NULL,
	DateUpdated smalldatetime NULL
)


/* 
Question #6 - 10 points

Create a stored procedures.  It should
	accept a character string and an integer.  The stored procedure
	will use these two values to insert into the table defintion
	provided.  When executed, the stored procedure should work with
	either of the values not passed (set defaults).  Call your stored
	procedure <first Initial, full Last Name>MidtermInsert (RReedMidtermInsert). 
	
	Create three statements that execute your new stored.  Use the following values
	- string 'Zelda', integer 2017
	- string 'Link'
	- integer 2020   

*/

/*
Question #7 - 10 points

Create a stored procedure to update records in the table provided.
	The stored procedure needs to accept a key value (to identify the record
	you want to update), a character string, and an integer.  The key
	value is required, the other two are not (set defaults). 

Create two execution statements for updates using the following data
	key = 1, string = 'Zelda rules', 2017
	key = 2, integer = 2015

*/


/*
Question #8 - 15 points

	Create two triggers - one that inserts the current
		datetime value into the column DateUpdated for any 
		new records created.  The second should fire after 
		a record is updated to change the value in the DateUpdated
		column to when the change was made.  
	Name the triggers <first Initial, full Last Name>MidtermInsertTrigger and
		<first Initial, full Last Name>MidtermUpdateTrigger
*/

/*
Question #9 - 25 points

Create table(s) to support collecting data for the following scenario:
	We need to collect some key information about campgrounds in 
	national parks.  Each campground has a set number of camp spots,
	some that support accessibility needs, others that do not.  A national
	park may have multiple campgrounds (think Yellowstone).  Each national
	park has a point of contact (first name, last name, email, phone).  The
	same person can be responsible for multiple parks.  

	Provide statements to create the tables you think meet the above need.  As 
	before, preface each table name with your first initial and full last name.
*/
