-- Amanda Morgan
-- Exercise 2A: 2-table queries
-- PropertyManager db
--2A.1) Building, Aprartment tables. Sort by BuildingID, ApartmentNum
SELECT        Building.BuildingID, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingID = Apartment.BuildingID
ORDER BY Building.BuildingID, Apartment.ApartmentNum
-- 2A.2) Building, Apartment tables. Filter by Winona. Sort by BuildingID, Rent.
SELECT        Building.BuildingID, Building.City, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingID = Apartment.BuildingID
WHERE        (Building.City = N'Winona')
ORDER BY Building.BuildingID, Apartment.Rent DESC
-- 2A.3) Apartment, Invoice tables. Filter by BuildingID 1. Sort by ApartmentNum, InvoiceDate.
SELECT        Apartment.ApartmentID, Apartment.ApartmentNum, Invoice.InvoiceID, Invoice.InvoiceDate, Invoice.DueDate
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentID = Invoice.ApartmentID INNER JOIN
                         Building ON Apartment.BuildingID = Building.BuildingID
WHERE        (Building.BuildingID = 1)
ORDER BY Apartment.ApartmentNum, Invoice.InvoiceDate DESC
-- 2A.4) Apartment, Invoice Tables. Sort by BuildingID, ApartmentNum
SELECT        Apartment.BuildingID, Apartment.ApartmentNum, Invoice.InvoiceID, Invoice.InvoiceDate, Invoice.DueDate
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentID = Invoice.ApartmentID
ORDER BY Apartment.BuildingID, Apartment.ApartmentNum
-- 2A.5) Apartment, Person (Admin). Sort by BuildingID, ApartmentNum
SELECT        Apartment.BuildingID, Apartment.ApartmentNum, Apartment.Rent, Person.LastName AS Admin
FROM            Apartment INNER JOIN
                         Person ON Apartment.AdminID = Person.PersonID
ORDER BY Apartment.BuildingID, Apartment.ApartmentNum
-- 2A.6) Apartment, Person tables. Sort by BuildingID, TenantLastName, TenantFirstName.
SELECT        Apartment.BuildingID, Apartment.ApartmentNum, Person.FirstName AS TenantLastName, Person.LastName AS TenantFirstName
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID AND Apartment.AdminID = Person.PersonID
ORDER BY Apartment.BuildingID, TenantFirstName, TenantLastName
-- 2A.7) Invoice, LineItem tables. Sort by ApartmentID, InvoiveDate
SELECT        Invoice.ApartmentID, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID
ORDER BY Invoice.ApartmentID, Invoice.InvoiceDate DESC
-- 2A.8) Invoice, LineItem tables. Filter by Rent(any month) Garage. Sort by ApartmentID, InvoiceDate.
SELECT        Invoice.ApartmentID, LineItem.InvoiceID, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID
WHERE        (LineItem.Description = N'Rent' AND LineItem.Description = N'Garage')
ORDER BY Invoice.ApartmentID, Invoice.InvoiceDate DESC
-- 2A.9) Invoice, Receipt tables. Sort by ApartmentID, InvoiceID
SELECT        Invoice.ApartmentID, Receipt.InvoiceID, Invoice.DueDate, Receipt.ReceiptDate, Receipt.Amount
FROM            Invoice INNER JOIN
                         Receipt ON Invoice.InvoiceID = Receipt.InvoiceID
ORDER BY Invoice.ApartmentID, Receipt.InvoiceID