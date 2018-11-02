--Amanda Morgan ex2E--

--2E.1)	Building name and location - BuildingName, Address, City+State+Zip - Winona, MN
SELECT        BuildingName, Address, City + N', ' + State + N'  ' + ZipCode AS [City State Zip]
FROM            Building
WHERE        (City = N'Winona')
--2E.2)	Apartment estimated rent - BuildingName, ApartmentNum, SquareFeet * 0.9 plus 100.00 per bathroom - Red Wing, MN
SELECT        Building.BuildingName, Apartment.ApartmentNum, Apartment.SquareFeet * 0.9 + Apartment.Bathrooms + 100 AS [Estimated Rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingID = Apartment.BuildingID
WHERE        (Building.City = N'red wing')
--2E.3)	Estimated vs actual rent - BuildingName, ApartmentNum, Rent, EstimatedRent, Rent - EstimatedRent - Red Wing, MN
SELECT        Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent, Apartment.SquareFeet * 0.9 + Apartment.Bathrooms + 100 AS [Estimated Rent], Apartment.Rent - (Apartment.SquareFeet * 0.9 + Apartment.Bathrooms + 100) 
                         AS Expr1
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingID = Apartment.BuildingID
WHERE        (Building.City = N'Red Wing')
-- 2E.4) Invoice total - BuildingId, ApartmentNum, Tenant FirstName+LastName, InvoiceDate, total LineItem.Amount
SELECT        Building.BuildingID, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Total Invoice]
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID INNER JOIN
                         Building ON Apartment.BuildingID = Building.BuildingID INNER JOIN
                         Invoice ON Apartment.ApartmentID = Invoice.ApartmentID INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID
GROUP BY Building.BuildingID, Apartment.ApartmentNum, Invoice.InvoiceDate, Person.FirstName + N' ' + Person.LastName
--2E.5)	Invoice total and receipt - BuildingId, ApartmentNum, Tenant FirstName+LastName, InvoiceDate, total LineItem.Amount, Receipt.Amount
SELECT        Building.BuildingID, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Amount], SUM(Receipt.Amount) AS [Receipt Amount]
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID AND Apartment.AdminID = Person.PersonID INNER JOIN
                         Building ON Apartment.BuildingID = Building.BuildingID INNER JOIN
                         Invoice ON Apartment.ApartmentID = Invoice.ApartmentID INNER JOIN
                         Receipt ON Invoice.InvoiceID = Receipt.InvoiceID INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID
GROUP BY Building.BuildingID, Apartment.ApartmentNum, Invoice.InvoiceDate, Person.FirstName + N' ' + Person.LastName
--2E.6)	Invoice total vs received - BuildingId, ApartmentNum, Tenant FirstName+LastName, InvoiceDate, total LineItem.Amount, Receipt.Amount, total LineItem.Amount - Receipt.Amount - Received less than total Invoice.Amount
SELECT        Building.BuildingID, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Amount], SUM(LineItem.Amount) AS Received, 
                         LineItem.Amount - Receipt.Amount AS Difference
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID AND Apartment.AdminID = Person.PersonID INNER JOIN
                         Building ON Apartment.BuildingID = Building.BuildingID INNER JOIN
                         Invoice ON Apartment.ApartmentID = Invoice.ApartmentID INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID INNER JOIN
                         Receipt ON Invoice.InvoiceID = Receipt.InvoiceID
GROUP BY Building.BuildingID, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate, LineItem.Amount - Receipt.Amount
HAVING        (SUM(LineItem.Amount) > 0)
--2E.7)	Late payments - BuildingId, ApartmentNum, tenant FirstName+LastName, days late - days late > 0
SELECT        Building.BuildingID, Apartment.ApartmentNum, Person.FirstName + N', ' + Person.LastName AS Tenant, Invoice.DueDate, Receipt.ReceiptDate, 'DATEDIFF(DAY, ReceiptDate - DueDate)' AS [Days Late]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingID = Apartment.BuildingID INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID INNER JOIN
                         Invoice ON Apartment.ApartmentID = Invoice.ApartmentID INNER JOIN
                         Receipt ON Invoice.InvoiceID = Receipt.InvoiceID
WHERE        ('DATEDIFF(DAY, ReceiptDate - DueDate)' > '0')
--2E.8)	Next InvoiceDate - PersonId, tenant FirstName + LastName, most recent InvoiceDate, most recent InvoiceDate + 1 month
SELECT        Person.PersonID, Person.FirstName + Person.LastName AS Name, Invoice.InvoiceDate AS [Recent Invoice], DATEADD(month, 1, Invoice.InvoiceDate) AS [Next Invoice]
FROM            Invoice INNER JOIN
                         Apartment ON Invoice.ApartmentID = Apartment.ApartmentID INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID