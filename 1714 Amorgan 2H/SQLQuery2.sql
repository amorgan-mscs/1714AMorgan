SELECT        People.FirstName AS Employee, Locations.Address, Products.Description, Receipts.Amount
FROM            Locations INNER JOIN
                         People ON Locations.BuildingID = People.Location_BuildingID INNER JOIN
                         Products ON Locations.BuildingID = Products.Location_BuildingID INNER JOIN
                         Receipts ON People.PersonID = Receipts.Customer_PersonID AND Products.Receipt_ReceiptID = Receipts.ReceiptID
SELECT        People.FirstName AS Customer, Locations.Address, Products.Description, Receipts.Amount
FROM            Locations INNER JOIN
                         People ON Locations.BuildingID = People.Location_BuildingID INNER JOIN
                         Products ON Locations.BuildingID = Products.Location_BuildingID INNER JOIN
                         Receipts ON People.PersonID = Receipts.Customer_PersonID AND Products.Receipt_ReceiptID = Receipts.ReceiptID
SELECT        Locations.Address, Locations.City, Products.Description, Products.Amount
FROM            Locations INNER JOIN
                         Products ON Locations.BuildingID = Products.Location_BuildingID