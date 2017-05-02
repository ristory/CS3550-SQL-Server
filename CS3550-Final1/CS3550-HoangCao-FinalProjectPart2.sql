USE WideWorldImporters;
SELECT A.PersonID,SUBSTRING(A.FullName, 1, CHARINDEX(' ', fullname) - 1) AS FirstName,
SUBSTRING(A.FullName,CHARINDEX(' ', A.FullName) + 1,
LEN(A.FullName) - CHARINDEX(' ', A.FullName)) AS LastName,
a.PreferredName as Alias,A.EmailAddress,A.PhoneNumber,'Team Member' as Title,
'Plains' as PrimaryTerritory, '4/19/2008' as HireDate
FROM Application.People A
WHERE A.IsSalesperson = '1'


SELECT A.PersonID,SUBSTRING(A.FullName, 1, CHARINDEX(' ', fullname) - 1) AS FirstName,
SUBSTRING(A.FullName,CHARINDEX(' ', A.FullName) + 1,
LEN(A.FullName) - CHARINDEX(' ', A.FullName)) AS LastName,
a.PreferredName as Alias,A.EmailAddress as Email,A.PhoneNumber as Phone,'Team Member' as [CurrentJob.Title],
'Plains' as [CurrentJob.Territory], '4/19/2008' as [CurrentJob.HireDate]
FROM Application.People A
WHERE A.IsSalesperson = '1'
FOR JSON PATH