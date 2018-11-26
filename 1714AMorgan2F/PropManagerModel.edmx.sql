
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/12/2018 20:57:05
-- Generated from EDMX file: C:\Users\Amanda\Documents\1714AMorgan\1714AMorgan2F\PropManagerModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [PropertyManager1714];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [LastName] nvarchar(50)  NOT NULL,
    [Phone] nvarchar(50)  NOT NULL,
    [Email] nvarchar(50)  NOT NULL,
    [Apartment_ApartmentID] int  NOT NULL,
    [Apartment_BuildingID] nvarchar(max)  NOT NULL,
    [Apartment_TenantID] nvarchar(max)  NOT NULL,
    [Apartment_AdminID] nvarchar(max)  NOT NULL,
    [Apartment1_ApartmentID] int  NOT NULL,
    [Apartment1_BuildingID] nvarchar(max)  NOT NULL,
    [Apartment1_TenantID] nvarchar(max)  NOT NULL,
    [Apartment1_AdminID] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Apartments'
CREATE TABLE [dbo].[Apartments] (
    [ApartmentID] int IDENTITY(1,1) NOT NULL,
    [BuildingID] nvarchar(max)  NOT NULL,
    [ApartmentNum] nvarchar(max)  NOT NULL,
    [SquareFeet] nvarchar(5)  NOT NULL,
    [Bathrooms] nvarchar(max)  NOT NULL,
    [Rent] decimal(18,0)  NOT NULL,
    [TenantID] nvarchar(max)  NOT NULL,
    [AdminID] nvarchar(max)  NOT NULL,
    [Building_BuildingID] int  NOT NULL
);
GO

-- Creating table 'Invoices'
CREATE TABLE [dbo].[Invoices] (
    [InvoiceID] int IDENTITY(1,1) NOT NULL,
    [ApartmentID] nvarchar(max)  NOT NULL,
    [InvoiceDate] datetime  NOT NULL,
    [DueDate] datetime  NOT NULL,
    [Apartment_ApartmentID] int  NOT NULL,
    [Apartment_BuildingID] nvarchar(max)  NOT NULL,
    [Apartment_TenantID] nvarchar(max)  NOT NULL,
    [Apartment_AdminID] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'LineItems'
CREATE TABLE [dbo].[LineItems] (
    [LineItemID] int IDENTITY(1,1) NOT NULL,
    [InvoiceID] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Amount] decimal(18,0)  NOT NULL,
    [Invoice_InvoiceID] int  NOT NULL,
    [Invoice_ApartmentID] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Receipts'
CREATE TABLE [dbo].[Receipts] (
    [ReceiptID] int IDENTITY(1,1) NOT NULL,
    [InvoiceID] nvarchar(max)  NOT NULL,
    [ReceiptDate] datetime  NOT NULL,
    [Amount] decimal(18,0)  NOT NULL,
    [Invoice_InvoiceID] int  NOT NULL,
    [Invoice_ApartmentID] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Buildings'
CREATE TABLE [dbo].[Buildings] (
    [BuildingID] int IDENTITY(1,1) NOT NULL,
    [BuildingName] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL,
    [ZipCode] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ApartmentID], [BuildingID], [TenantID], [AdminID] in table 'Apartments'
ALTER TABLE [dbo].[Apartments]
ADD CONSTRAINT [PK_Apartments]
    PRIMARY KEY CLUSTERED ([ApartmentID], [BuildingID], [TenantID], [AdminID] ASC);
GO

-- Creating primary key on [InvoiceID], [ApartmentID] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [PK_Invoices]
    PRIMARY KEY CLUSTERED ([InvoiceID], [ApartmentID] ASC);
GO

-- Creating primary key on [LineItemID], [InvoiceID] in table 'LineItems'
ALTER TABLE [dbo].[LineItems]
ADD CONSTRAINT [PK_LineItems]
    PRIMARY KEY CLUSTERED ([LineItemID], [InvoiceID] ASC);
GO

-- Creating primary key on [ReceiptID], [InvoiceID] in table 'Receipts'
ALTER TABLE [dbo].[Receipts]
ADD CONSTRAINT [PK_Receipts]
    PRIMARY KEY CLUSTERED ([ReceiptID], [InvoiceID] ASC);
GO

-- Creating primary key on [BuildingID] in table 'Buildings'
ALTER TABLE [dbo].[Buildings]
ADD CONSTRAINT [PK_Buildings]
    PRIMARY KEY CLUSTERED ([BuildingID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Building_BuildingID] in table 'Apartments'
ALTER TABLE [dbo].[Apartments]
ADD CONSTRAINT [FK_BuildingApartment]
    FOREIGN KEY ([Building_BuildingID])
    REFERENCES [dbo].[Buildings]
        ([BuildingID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BuildingApartment'
CREATE INDEX [IX_FK_BuildingApartment]
ON [dbo].[Apartments]
    ([Building_BuildingID]);
GO

-- Creating foreign key on [Apartment_ApartmentID], [Apartment_BuildingID], [Apartment_TenantID], [Apartment_AdminID] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [FK_ApartmentPerson]
    FOREIGN KEY ([Apartment_ApartmentID], [Apartment_BuildingID], [Apartment_TenantID], [Apartment_AdminID])
    REFERENCES [dbo].[Apartments]
        ([ApartmentID], [BuildingID], [TenantID], [AdminID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ApartmentPerson'
CREATE INDEX [IX_FK_ApartmentPerson]
ON [dbo].[People]
    ([Apartment_ApartmentID], [Apartment_BuildingID], [Apartment_TenantID], [Apartment_AdminID]);
GO

-- Creating foreign key on [Apartment1_ApartmentID], [Apartment1_BuildingID], [Apartment1_TenantID], [Apartment1_AdminID] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [FK_ApartmentPerson1]
    FOREIGN KEY ([Apartment1_ApartmentID], [Apartment1_BuildingID], [Apartment1_TenantID], [Apartment1_AdminID])
    REFERENCES [dbo].[Apartments]
        ([ApartmentID], [BuildingID], [TenantID], [AdminID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ApartmentPerson1'
CREATE INDEX [IX_FK_ApartmentPerson1]
ON [dbo].[People]
    ([Apartment1_ApartmentID], [Apartment1_BuildingID], [Apartment1_TenantID], [Apartment1_AdminID]);
GO

-- Creating foreign key on [Apartment_ApartmentID], [Apartment_BuildingID], [Apartment_TenantID], [Apartment_AdminID] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [FK_ApartmentInvoice]
    FOREIGN KEY ([Apartment_ApartmentID], [Apartment_BuildingID], [Apartment_TenantID], [Apartment_AdminID])
    REFERENCES [dbo].[Apartments]
        ([ApartmentID], [BuildingID], [TenantID], [AdminID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ApartmentInvoice'
CREATE INDEX [IX_FK_ApartmentInvoice]
ON [dbo].[Invoices]
    ([Apartment_ApartmentID], [Apartment_BuildingID], [Apartment_TenantID], [Apartment_AdminID]);
GO

-- Creating foreign key on [Invoice_InvoiceID], [Invoice_ApartmentID] in table 'Receipts'
ALTER TABLE [dbo].[Receipts]
ADD CONSTRAINT [FK_InvoiceReceipt]
    FOREIGN KEY ([Invoice_InvoiceID], [Invoice_ApartmentID])
    REFERENCES [dbo].[Invoices]
        ([InvoiceID], [ApartmentID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InvoiceReceipt'
CREATE INDEX [IX_FK_InvoiceReceipt]
ON [dbo].[Receipts]
    ([Invoice_InvoiceID], [Invoice_ApartmentID]);
GO

-- Creating foreign key on [Invoice_InvoiceID], [Invoice_ApartmentID] in table 'LineItems'
ALTER TABLE [dbo].[LineItems]
ADD CONSTRAINT [FK_InvoiceLineItem]
    FOREIGN KEY ([Invoice_InvoiceID], [Invoice_ApartmentID])
    REFERENCES [dbo].[Invoices]
        ([InvoiceID], [ApartmentID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InvoiceLineItem'
CREATE INDEX [IX_FK_InvoiceLineItem]
ON [dbo].[LineItems]
    ([Invoice_InvoiceID], [Invoice_ApartmentID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------