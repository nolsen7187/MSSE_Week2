
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 09/11/2013 14:05:28
-- Generated from EDMX file: C:\Users\nolsen\Source\Repos\MSSE_Week2\FFR\FFR\FFR.edmx
-- --------------------------------------------------


--CREATE DB FFR IF IT HAS NOT BEEN CREATED

IF OBJECT_ID(N'FFR', N'U') IS NULL CREATE DATABASE FFR;

SET QUOTED_IDENTIFIER OFF;
GO
USE [FFR];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_SalesHeader_Customer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesHeader] DROP CONSTRAINT [FK_SalesHeader_Customer];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Customer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customer];
GO
IF OBJECT_ID(N'[dbo].[Employee]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employee];
GO
IF OBJECT_ID(N'[dbo].[Item]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Item];
GO
IF OBJECT_ID(N'[dbo].[SalesHeader]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesHeader];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustomerId] int  NOT NULL,
    [FirstName] varchar(50)  NULL,
    [LastName] varchar(50)  NULL,
    [Address] varchar(200)  NULL,
    [City] varchar(50)  NULL,
    [State] varchar(2)  NULL,
    [Zip] varchar(10)  NULL,
    [Suite] varchar(20)  NULL,
    [Phone] varchar(20)  NULL,
    [Email] varchar(100)  NULL
);
GO

-- Creating table 'SalesHeaders'
CREATE TABLE [dbo].[SalesHeaders] (
    [SalesId] int  NOT NULL,
    [CustomerId] int  NULL,
    [OrderSalesBalance] decimal(10,0)  NULL,
    [OrderTaxAmount] decimal(10,0)  NULL,
    [OrderTotal] decimal(10,0)  NULL,
    [SalesStatus] varchar(30)  NULL
);
GO

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [EmployeeId] int  NOT NULL,
    [EmployeeFirstName] varchar(50)  NULL,
    [EmployeeLastName] varchar(50)  NULL,
    [EmployeePhone] varchar(20)  NULL,
    [Employeetype] varchar(10)  NULL
);
GO

-- Creating table 'Items'
CREATE TABLE [dbo].[Items] (
    [ItemId] int  NOT NULL,
    [ItemName] varchar(50)  NULL,
    [QuantityAvailable] int  NULL,
    [ItemCost] decimal(18,0)  NULL,
    [Price] decimal(18,0)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CustomerId] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustomerId] ASC);
GO

-- Creating primary key on [SalesId] in table 'SalesHeaders'
ALTER TABLE [dbo].[SalesHeaders]
ADD CONSTRAINT [PK_SalesHeaders]
    PRIMARY KEY CLUSTERED ([SalesId] ASC);
GO

-- Creating primary key on [EmployeeId] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([EmployeeId] ASC);
GO

-- Creating primary key on [ItemId] in table 'Items'
ALTER TABLE [dbo].[Items]
ADD CONSTRAINT [PK_Items]
    PRIMARY KEY CLUSTERED ([ItemId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerId] in table 'SalesHeaders'
ALTER TABLE [dbo].[SalesHeaders]
ADD CONSTRAINT [FK_SalesHeader_Customer]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customers]
        ([CustomerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesHeader_Customer'
CREATE INDEX [IX_FK_SalesHeader_Customer]
ON [dbo].[SalesHeaders]
    ([CustomerId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------