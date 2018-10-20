-- 2C.1) Building, State, City, count buildings, State, City
SELECT        State, City, COUNT(BuildingName) AS [Building Count]
FROM            Building
GROUP BY State, City
-- 2C.2) Building, City, count buildings, City, MN
SELECT        City AS [MN City], COUNT(BuildingID) AS [BLDG Count]
FROM            Building
GROUP BY City, State
HAVING        (State = N'mn')
-- 2C.3) Building, Apartment - BuildingId, BuildingName, average rent - BuildingId, BuildingName
SELECT        Building.BuildingID, Building.BuildingName, AVG(Apartment.Rent) AS [AVG Rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingID = Apartment.BuildingID
GROUP BY Building.BuildingID, Building.BuildingName\
-- 2C.4) Building, Apartment - City, BuildingName, total rent - City, BuildingName - MN
SELECT        Building.City, Building.BuildingName, SUM(Apartment.Rent) AS [Total Rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingID = Apartment.BuildingID
GROUP BY Building.City, Building.BuildingName, Building.State
HAVING        (Building.State = N'MN')
-- 2C.5) Building, Apartment - Cheapest rent - City
SELECT        Building.City, MIN(Apartment.Rent) AS [Min Rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingID = Apartment.BuildingID
GROUP BY Building.City
-- 2C.6) Building, Apartment - BuildingName, Smallest size, avg size, largest size - BuildingName -	Available in Winona
SELECT        Building.BuildingName, MIN(Apartment.SquareFeet) AS [Min Sq Ft], AVG(Apartment.SquareFeet) AS [AVG Sq Ft], MAX(Apartment.SquareFeet) AS [Max Sq Ft]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingID = Apartment.BuildingID
WHERE        (Apartment.TenantID IS NULL) OR
                         (Building.State = N'Winona')
GROUP BY Building.BuildingName
-- 2C.7) Invoice, LineItem - InvoiceId, cheapest price - InvoiceId - Garage during Sep 2018
SELECT        MIN(LineItem.Amount) AS [Cheapest Garage Price in September]
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID
WHERE        (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-09-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-09-30 00:00:00', 102)) AND (LineItem.Description = N'Garage')
GROUP BY Invoice.InvoiceID
-- 2C.8) Invoice, LineItem - InvoiceId, total amount billed	InvoiceId -	Sep 2018
SELECT        Invoice.InvoiceID, SUM(LineItem.Amount) AS [Total Amount Billed]
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceID = LineItem.InvoiceID
WHERE        (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-09-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-09-30 00:00:00', 102))
GROUP BY Invoice.InvoiceID