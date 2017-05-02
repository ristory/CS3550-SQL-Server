use AdventureWorks2008R2;
GO

/*5. What product category has sold the most products?*/

SELECT DISTINCT G.Name AS Category, F.Name AS Product, H.ProductID AS ProductID
FROM Production.Product AS F
   FULL JOIN Production.ProductSubcategory AS G ON G.ProductSubcategoryID = F.ProductSubcategoryID
   FULL JOIN Production.TransactionHistory AS H ON H.ProductID = F.ProductID
   FULL JOIN Production.ProductCategory AS K ON K.ProductCategoryID = G.ProductCategoryID
   WHERE H.ProductID =  (SELECT A.ProductID
FROM Production.TransactionHistory AS A
WHERE A.Quantity = (SELECT MAX(A.Quantity)
FROM Production.TransactionHistory AS A))


/*13. List the product and product description of the most expensive product(s).*/

SELECT F.ProductID AS PRODUCTID,F.Name AS PRODUCT, G.Name AS PRODUCTMODEL, K.Description AS DESCRIPTION
FROM Production.Product AS F
   FULL JOIN Production.ProductModel AS G ON G.ProductModelID = F.ProductModelID
   FULL JOIN Production.ProductModelProductDescriptionCulture AS H ON H.ProductModelID = F.ProductModelID
   FULL JOIN Production.ProductDescription AS K ON K.ProductDescriptionID = H.ProductDescriptionID
   WHERE F.ProductID IN (SELECT X.ProductID
FROM Production.ProductListPriceHistory AS X
WHERE X.ListPrice = (SELECT MAX(X.ListPrice)
FROM Production.ProductListPriceHistory AS X))
ORDER BY F.ProductID 


GO
