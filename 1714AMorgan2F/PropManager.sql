-- Apartments
SET IDENTITY_INSERT [dbo].[Apartments] ON 
GO
INSERT [dbo].[Apartments] ([BuildingID], [ApartmentID], [SquareFeet], [Bathrooms], [Rent], [TenantID], [AdminID]) VALUES (1, 1, N'101', N'400', N'1', N'550', N'1', N'5')
GO
INSERT [dbo].[Apartments] ([BuildingID], [ApartmentID], [SquareFeet], [Bathrooms], [Rent], [TenantID], [AdminID]) VALUES (2, 1, N'102', N'550', N'1', N'1', N'700', N'2', N'5')
GO
INSERT [dbo].[Apartments] ([BuildingID], [ApartmentID], [SquareFeet], [Bathrooms], [Rent], [TenantID], [AdminID]) VALUES (3, 1, N'103', N'600', N'1', N'750', N'3', N'5')
GO
INSERT [dbo].[Apartments] ([BuildingID], [ApartmentID], [SquareFeet], [Bathrooms], [Rent], [TenantID], [AdminID]) VALUES (4, 1, N'104', N'1000', N'2', N'1200', N'4', N'5')
GO
INSERT [dbo].[Apartments] ([BuildingID], [ApartmentID], [SquareFeet], [Bathrooms], [Rent], [TenantID], [AdminID]) VALUES (5, 2, N'101', N'600', N'1', N'700', N'5', N'5')
GO
SET IDENTITY_INSERT [dbo].[Apartments] OFF
GO
-- Buildings
SET IDENTITY_INSERT [dbo].[Buildings] ON 
GO
INSERT [dbo].[Buildings] ([BuildingID], [BuildingName], [Address], [City], [State], [ZipCode]) VALUES (1, N'Southeast Apartments', N'308 Pioneer Rd', N'Red Wing', N'MN', N'55066')
GO
INSERT [dbo].[Buildings] ([BuildingID], [BuildingName], [Address], [City], [State], [ZipCode]) VALUES (2, N'Southwest Apartments', N'1250 Homer Rd', N'Winona', N'MN', N'55987')
GO
INSERT [dbo].[Buildings] ([BuildingID], [BuildingName], [Address], [City], [State], [ZipCode]) VALUES (3, N'Northeast Apartments', N'5678 Penn Ave', N'Richfield', N'MN', N'55423')
GO
INSERT [dbo].[Buildings] ([BuildingID], [BuildingName], [Address], [City], [State], [ZipCode]) VALUES (4, N'Northeast Apartments', N'4578 Goldenrod Ln', N'Edina', N'MN', N'55343')
GO
INSERT [dbo].[Buildings] ([BuildingID], [BuildingName], [Address], [City], [State], [ZipCode]) VALUES (5, N'Eastwest', N'5633 Bike Lane', N'Bloomington', N'MN', N'55420')
GO
SET IDENTITY_INSERT [dbo].[Buildings] OFF
GO
-- People
SET IDENTITY_INSERT [dbo].[People] ON 
GO
INSERT [dbo].[People] ([PersonID], [FirstName], [LastName], [Phone], [Email]) VALUES (1, N'Josh', N'Miller', N'752-456-1234', N'joshmiller@gmail.com')
GO
INSERT [dbo].[People] ([PersonID], [FirstName], [LastName], [Phone], [Email]) VALUES (2, N'Sarah', N'Johnson', N'456-897-4563', N'sarahjohnson@gmail.com')
GO
INSERT [dbo].[People] ([PersonID], [FirstName], [LastName], [Phone], [Email]) VALUES (3, N'Ashley', N'Smith', N'564-134-4678', N'ashleysmith@gmail.com')
GO
INSERT [dbo].[People] ([PersonID], [FirstName], [LastName], [Phone], [Email]) VALUES (4, N'Grace', N'Washinton', N'123-564-8756', N'gracewashington@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[People] OFF
GO
-- Invoice
SET IDENTITY_INSERT [dbo].[Invoices] ON 
GO
INSERT [dbo].[Invoices] ([InvoiceID], [ApartmentID], [InvoiceDate], [DueDate]) VALUES (1001, 5, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), CAST(N'2018-10-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoices] ([InvoiceID], [ApartmentID], [InvoiceDate], [DueDate]) VALUES (1002, 6, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), CAST(N'2018-10-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoices] ([InvoiceID], [ApartmentID], [InvoiceDate], [DueDate]) VALUES (1003, 7, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), CAST(N'2018-10-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoices] ([InvoiceID], [ApartmentID], [InvoiceDate], [DueDate]) VALUES (1004, 7, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), CAST(N'2018-10-01T00:00:00' AS SmallDateTime))
GO
SET IDENTITY_INSERT [dbo].[Invoices] OFF
GO
-- Receipts
SET IDENTITY_INSERT [dbo].[Receipts] ON 
GO
INSERT [dbo].[Receipts] ([ReceiptID], [InvoiceID], [ReceiptDate], [Amount]) VALUES (1023, 1001, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), 790.0000)
GO
INSERT [dbo].[Receipts] ([ReceiptID], [InvoiceID], [ReceiptDate], [Amount]) VALUES (1024, 1002, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), 940.0000)
GO
INSERT [dbo].[Receipts] ([ReceiptID], [InvoiceID], [ReceiptDate], [Amount]) VALUES (1025, 1003, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), 970.0000)
GO
INSERT [dbo].[Receipts] ([ReceiptID], [InvoiceID], [ReceiptDate], [Amount]) VALUES (1026, 1004, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), 1490.0000)
GO
SET IDENTITY_INSERT [dbo].[Receipts] OFF
GO
-- Lineitems
SET IDENTITY_INSERT [dbo].[LineItemID] ON 
GO
INSERT [dbo].[LineItems] ([LineItemID], [InvoiceID], [Description], [Amount]) VALUES (10001, 1001, N'Rent, October 2018', 550.00)
GO
INSERT [dbo].[LineItems] ([LineItemID], [InvoiceID], [Description], [Amount]) VALUES (10002, 1001, N'Electricity', 50.00)
GO
INSERT [dbo].[LineItems] ([LineItemID], [InvoiceID], [Description], [Amount]) VALUES (10003, 1001, N'Gas', 40.00)
GO
INSERT [dbo].[LineItems] ([LineItemID], [InvoiceID], [Description], [Amount]) VALUES (10004, 1001, N'Garage', 50.00)
GO
INSERT [dbo].[LineItems] ([LineItemID], [InvoiceID], [Description], [Amount]) VALUES (10005, 1001, N'Cable/Internet', 100.00)
GO
SET IDENTITY_INSERT [dbo].[LineItemID] OFF
GO