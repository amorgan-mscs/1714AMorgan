
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/25/2018 17:29:05
-- Generated from EDMX file: C:\Users\Amanda\Documents\1714AMorgan\1714 Amorgan 2H\CandleModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CandleStore];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[People]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People];
GO
IF OBJECT_ID(N'[dbo].[Locations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Locations];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[Receipts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Receipts];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [PersonID] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Location_BuildingID] int  NOT NULL
);
GO

-- Creating table 'Locations'
CREATE TABLE [dbo].[Locations] (
    [BuildingID] int IDENTITY(1,1) NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL,
    [Zip] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [ProductsID] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Amount] nvarchar(max)  NOT NULL,
    [Location_BuildingID] int  NOT NULL,
    [Receipt_ReceiptID] int  NOT NULL
);
GO

-- Creating table 'Receipts'
CREATE TABLE [dbo].[Receipts] (
    [ReceiptID] int IDENTITY(1,1) NOT NULL,
    [ReceiptDate] datetime  NOT NULL,
    [Amount] nvarchar(max)  NOT NULL,
    [Employee_PersonID] int  NOT NULL,
    [Customer_PersonID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [PersonID] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([PersonID] ASC);
GO

-- Creating primary key on [BuildingID] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [PK_Locations]
    PRIMARY KEY CLUSTERED ([BuildingID] ASC);
GO

-- Creating primary key on [ProductsID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([ProductsID] ASC);
GO

-- Creating primary key on [ReceiptID] in table 'Receipts'
ALTER TABLE [dbo].[Receipts]
ADD CONSTRAINT [PK_Receipts]
    PRIMARY KEY CLUSTERED ([ReceiptID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Location_BuildingID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_LocationProducts]
    FOREIGN KEY ([Location_BuildingID])
    REFERENCES [dbo].[Locations]
        ([BuildingID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LocationProducts'
CREATE INDEX [IX_FK_LocationProducts]
ON [dbo].[Products]
    ([Location_BuildingID]);
GO

-- Creating foreign key on [Receipt_ReceiptID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_ReceiptProducts]
    FOREIGN KEY ([Receipt_ReceiptID])
    REFERENCES [dbo].[Receipts]
        ([ReceiptID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReceiptProducts'
CREATE INDEX [IX_FK_ReceiptProducts]
ON [dbo].[Products]
    ([Receipt_ReceiptID]);
GO

-- Creating foreign key on [Location_BuildingID] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [FK_LocationPerson]
    FOREIGN KEY ([Location_BuildingID])
    REFERENCES [dbo].[Locations]
        ([BuildingID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LocationPerson'
CREATE INDEX [IX_FK_LocationPerson]
ON [dbo].[People]
    ([Location_BuildingID]);
GO

-- Creating foreign key on [Employee_PersonID] in table 'Receipts'
ALTER TABLE [dbo].[Receipts]
ADD CONSTRAINT [FK_PersonReceipt]
    FOREIGN KEY ([Employee_PersonID])
    REFERENCES [dbo].[People]
        ([PersonID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonReceipt'
CREATE INDEX [IX_FK_PersonReceipt]
ON [dbo].[Receipts]
    ([Employee_PersonID]);
GO

-- Creating foreign key on [Customer_PersonID] in table 'Receipts'
ALTER TABLE [dbo].[Receipts]
ADD CONSTRAINT [FK_PersonReceipt1]
    FOREIGN KEY ([Customer_PersonID])
    REFERENCES [dbo].[People]
        ([PersonID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonReceipt1'
CREATE INDEX [IX_FK_PersonReceipt1]
ON [dbo].[Receipts]
    ([Customer_PersonID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------