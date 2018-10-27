-- AMorgan Ex2D
--2D.1) Buildings, apartments, administrators - BuildingId, BuildingName, City, ApartmentNum, FirstName, LastName - City, BuildingName, ApartmentNum, LastName, FirstName
SELECT        Building.BuildingID, Building.BuildingName, Building.City, Apartment.ApartmentNum, Person.FirstName, Person.LastName
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingID = Apartment.BuildingID INNER JOIN
                         Person ON Apartment.AdminID = Person.PersonID
ORDER BY Building.City, Building.BuildingName, Apartment.ApartmentNum, Person.LastName, Person.FirstName
-- 2D.2	Tenants, buildings, apartments - PersonId, LastName, FirstName, City, BuildingId, BuildingName, ApartmentNum - LastName, FirstName, BuildingId, ApartmentNum
SELECT        Person.PersonID, Person.LastName, Person.FirstName, Building.City, Building.BuildingID, Building.BuildingName, Apartment.ApartmentNum
FROM            Person INNER JOIN
                         Apartment ON Person.PersonID = Apartment.TenantID INNER JOIN
                         Building ON Apartment.BuildingID = Building.BuildingID
ORDER BY Person.LastName, Person.FirstName, Building.BuildingID, Apartment.ApartmentNum
-- 2D.3) Apartment, tenant, invoice, line items - ApartmentNum, LastName, FirstName, InvoiceId, InvoiceDate, Description, Amount - BuildingId = 1 - ApartmentNum, LastName, FirstName, InvoiceDate
SELECT        Apartment.ApartmentNum, Person.LastName, Person.FirstName, LineItem.InvoiceID, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Person INNER JOIN
                         Apartment ON Person.PersonID = Apartment.TenantID INNER JOIN
                         Invoice ON Apartment.ApartmentID = Invoice.ApartmentID INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID
WHERE        (Apartment.BuildingID = 1)
ORDER BY Apartment.ApartmentNum, Person.LastName, Person.FirstName, Invoice.InvoiceDate
-- 2D.4) Apartment, tenant, invoice total - BuildingId, ApartmentId, LastName, FirstName, InvoiceId, InvoiceDate, Invoice Total	
SELECT        Apartment.BuildingID, Apartment.ApartmentID, Person.LastName, Person.FirstName, LineItem.InvoiceID, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total]
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID INNER JOIN
                         Invoice ON Apartment.ApartmentID = Invoice.ApartmentID INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID
GROUP BY Apartment.BuildingID, Apartment.ApartmentID, Person.LastName, Person.FirstName, Invoice.InvoiceDate, LineItem.InvoiceID
-- 2D.5	Invoice, tenant, receipt - InvoiceId, InvoiceDate, BuildingId, ApartmentNum, LastName, FirstName, ReceiptDate, Receipt.Amount - InvoiceDate, ReceiptDate
SELECT        Receipt.InvoiceID, Invoice.InvoiceDate, Apartment.BuildingID, Apartment.ApartmentNum, Person.LastName, Person.FirstName, Receipt.ReceiptDate, Receipt.Amount
FROM            Invoice INNER JOIN
                         Receipt ON Invoice.InvoiceID = Receipt.InvoiceID INNER JOIN
                         Apartment ON Invoice.ApartmentID = Apartment.ApartmentID INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID
ORDER BY Invoice.InvoiceDate, Receipt.ReceiptDate
-- 2D.6) Invoice, tenant, apartment, billed, received - InvoiceId, InvoiceDate, LastName, BuildingId, ApartmentNum, total billed, recieved
SELECT        Invoice.InvoiceID, Invoice.InvoiceDate, Person.LastName AS Tenant, Apartment.BuildingID, Apartment.ApartmentNum, SUM(LineItem.Amount) AS Billed, Receipt.Amount AS Recieved
FROM            Invoice INNER JOIN
                         Apartment ON Invoice.ApartmentID = Apartment.ApartmentID INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID INNER JOIN
                         Receipt ON Invoice.InvoiceID = Receipt.InvoiceID INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID
GROUP BY Invoice.InvoiceID, Invoice.InvoiceDate, Person.LastName, Apartment.BuildingID, Apartment.ApartmentNum, Receipt.Amount
-- 2D.7) Administrator, invoice, total billed, received - PersonId, admin LastName, InvoiceId, InvoiceDate, total billed, received
SELECT        Person.PersonID, Person.LastName AS Admin, Receipt.InvoiceID, Invoice.InvoiceDate, SUM(LineItem.Amount) AS Billed, Receipt.Amount AS Received
FROM            LineItem INNER JOIN
                         Invoice ON LineItem.InvoiceID = Invoice.InvoiceID INNER JOIN
                         Receipt ON Invoice.InvoiceID = Receipt.InvoiceID INNER JOIN
                         Apartment ON Invoice.ApartmentID = Apartment.ApartmentID INNER JOIN
                         Person ON Apartment.AdminID = Person.PersonID
GROUP BY Person.PersonID, Person.LastName, Receipt.InvoiceID, Invoice.InvoiceDate, Receipt.Amount