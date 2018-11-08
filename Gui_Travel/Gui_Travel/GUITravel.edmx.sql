
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/08/2018 10:03:48
-- Generated from EDMX file: C:\Users\vmadmin\source\repos\GUITravel\Gui_Travel\Gui_Travel\GUITravel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [M120];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Hotel_Land]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Hotel] DROP CONSTRAINT [FK_Hotel_Land];
GO
IF OBJECT_ID(N'[dbo].[FK_HotelBild_Hotel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HotelBild] DROP CONSTRAINT [FK_HotelBild_Hotel];
GO
IF OBJECT_ID(N'[dbo].[FK_Kunde_Land]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Kunde] DROP CONSTRAINT [FK_Kunde_Land];
GO
IF OBJECT_ID(N'[dbo].[FK_Kunde_Reise_Kunde]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Kunde_Reise] DROP CONSTRAINT [FK_Kunde_Reise_Kunde];
GO
IF OBJECT_ID(N'[dbo].[FK_Kunde_Reise_Reise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Kunde_Reise] DROP CONSTRAINT [FK_Kunde_Reise_Reise];
GO
IF OBJECT_ID(N'[dbo].[FK_Reise_Hotel_Hotel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reise_Hotel] DROP CONSTRAINT [FK_Reise_Hotel_Hotel];
GO
IF OBJECT_ID(N'[dbo].[FK_Reise_Hotel_Reise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reise_Hotel] DROP CONSTRAINT [FK_Reise_Hotel_Reise];
GO
IF OBJECT_ID(N'[dbo].[FK_Reise_Land]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reise] DROP CONSTRAINT [FK_Reise_Land];
GO
IF OBJECT_ID(N'[dbo].[FK_GUIUserFK]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Kunde] DROP CONSTRAINT [FK_GUIUserFK];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[GUIUser]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GUIUser];
GO
IF OBJECT_ID(N'[dbo].[Hotel]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Hotel];
GO
IF OBJECT_ID(N'[dbo].[HotelBild]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HotelBild];
GO
IF OBJECT_ID(N'[dbo].[Kunde]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Kunde];
GO
IF OBJECT_ID(N'[dbo].[Kunde_Reise]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Kunde_Reise];
GO
IF OBJECT_ID(N'[dbo].[Land]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Land];
GO
IF OBJECT_ID(N'[dbo].[Reise]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reise];
GO
IF OBJECT_ID(N'[dbo].[Reise_Hotel]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reise_Hotel];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Hotels'
CREATE TABLE [dbo].[Hotels] (
    [HotelID] bigint IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [Ort] varchar(50)  NOT NULL,
    [Land] bigint  NOT NULL,
    [Sterne] tinyint  NOT NULL,
    [manager] varchar(50)  NOT NULL,
    [AnzahlZimmer] smallint  NOT NULL,
    [TagesPreis] decimal(18,2)  NOT NULL,
    [Telefon] nvarchar(50)  NOT NULL,
    [email] nvarchar(100)  NOT NULL,
    [Web] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'HotelBilds'
CREATE TABLE [dbo].[HotelBilds] (
    [BildID] bigint IDENTITY(1,1) NOT NULL,
    [HotelID] bigint  NOT NULL,
    [Reihenfolge] int  NOT NULL,
    [Bild] varbinary(max)  NULL,
    [Beschreibung] varchar(100)  NOT NULL
);
GO

-- Creating table 'Kundes'
CREATE TABLE [dbo].[Kundes] (
    [KundeID] bigint IDENTITY(1,1) NOT NULL,
    [Anrede] varchar(50)  NOT NULL,
    [Vorname] varchar(50)  NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [NameZusatz] varchar(50)  NOT NULL,
    [StrasseNr] varchar(100)  NOT NULL,
    [PLZ] smallint  NOT NULL,
    [Ort] varchar(50)  NOT NULL,
    [Telefon] varchar(50)  NOT NULL,
    [Mobile] varchar(50)  NOT NULL,
    [email] varchar(100)  NOT NULL,
    [Web] varchar(100)  NOT NULL,
    [Geburtsdatum] datetime  NOT NULL,
    [PassNr] varchar(50)  NOT NULL,
    [Nationalitaet] bigint  NOT NULL,
    [Email] varchar(100)  NOT NULL,
    [GUIUserFK] int  NULL
);
GO

-- Creating table 'Kunde_Reise'
CREATE TABLE [dbo].[Kunde_Reise] (
    [Kunde_Reise_ID] bigint IDENTITY(1,1) NOT NULL,
    [Kunde] bigint  NOT NULL,
    [Reise] bigint  NOT NULL
);
GO

-- Creating table 'Lands'
CREATE TABLE [dbo].[Lands] (
    [LandID] bigint IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [Kurzname] char(3)  NOT NULL,
    [Flagge] varbinary(max)  NULL
);
GO

-- Creating table 'Reises'
CREATE TABLE [dbo].[Reises] (
    [ReiseID] bigint IDENTITY(1,1) NOT NULL,
    [Land] bigint  NOT NULL,
    [Start] datetime  NOT NULL,
    [Ende] datetime  NOT NULL,
    [Preis] decimal(18,2)  NOT NULL,
    [Leitung] bit  NOT NULL,
    [NameLeitung] varchar(50)  NOT NULL
);
GO

-- Creating table 'Reise_Hotel'
CREATE TABLE [dbo].[Reise_Hotel] (
    [Reise_Hotel_ID] bigint IDENTITY(1,1) NOT NULL,
    [Reise] bigint  NOT NULL,
    [Hotel] bigint  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'GUIUsers'
CREATE TABLE [dbo].[GUIUsers] (
    [UserID] int IDENTITY(1,1) NOT NULL,
    [username] nvarchar(256)  NOT NULL,
    [password] varchar(256)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [HotelID] in table 'Hotels'
ALTER TABLE [dbo].[Hotels]
ADD CONSTRAINT [PK_Hotels]
    PRIMARY KEY CLUSTERED ([HotelID] ASC);
GO

-- Creating primary key on [BildID] in table 'HotelBilds'
ALTER TABLE [dbo].[HotelBilds]
ADD CONSTRAINT [PK_HotelBilds]
    PRIMARY KEY CLUSTERED ([BildID] ASC);
GO

-- Creating primary key on [KundeID] in table 'Kundes'
ALTER TABLE [dbo].[Kundes]
ADD CONSTRAINT [PK_Kundes]
    PRIMARY KEY CLUSTERED ([KundeID] ASC);
GO

-- Creating primary key on [Kunde_Reise_ID] in table 'Kunde_Reise'
ALTER TABLE [dbo].[Kunde_Reise]
ADD CONSTRAINT [PK_Kunde_Reise]
    PRIMARY KEY CLUSTERED ([Kunde_Reise_ID] ASC);
GO

-- Creating primary key on [LandID] in table 'Lands'
ALTER TABLE [dbo].[Lands]
ADD CONSTRAINT [PK_Lands]
    PRIMARY KEY CLUSTERED ([LandID] ASC);
GO

-- Creating primary key on [ReiseID] in table 'Reises'
ALTER TABLE [dbo].[Reises]
ADD CONSTRAINT [PK_Reises]
    PRIMARY KEY CLUSTERED ([ReiseID] ASC);
GO

-- Creating primary key on [Reise_Hotel_ID] in table 'Reise_Hotel'
ALTER TABLE [dbo].[Reise_Hotel]
ADD CONSTRAINT [PK_Reise_Hotel]
    PRIMARY KEY CLUSTERED ([Reise_Hotel_ID] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [UserID] in table 'GUIUsers'
ALTER TABLE [dbo].[GUIUsers]
ADD CONSTRAINT [PK_GUIUsers]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Land] in table 'Hotels'
ALTER TABLE [dbo].[Hotels]
ADD CONSTRAINT [FK_Hotel_Land]
    FOREIGN KEY ([Land])
    REFERENCES [dbo].[Lands]
        ([LandID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Hotel_Land'
CREATE INDEX [IX_FK_Hotel_Land]
ON [dbo].[Hotels]
    ([Land]);
GO

-- Creating foreign key on [HotelID] in table 'HotelBilds'
ALTER TABLE [dbo].[HotelBilds]
ADD CONSTRAINT [FK_HotelBild_Hotel]
    FOREIGN KEY ([HotelID])
    REFERENCES [dbo].[Hotels]
        ([HotelID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HotelBild_Hotel'
CREATE INDEX [IX_FK_HotelBild_Hotel]
ON [dbo].[HotelBilds]
    ([HotelID]);
GO

-- Creating foreign key on [Hotel] in table 'Reise_Hotel'
ALTER TABLE [dbo].[Reise_Hotel]
ADD CONSTRAINT [FK_Reise_Hotel_Hotel]
    FOREIGN KEY ([Hotel])
    REFERENCES [dbo].[Hotels]
        ([HotelID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Reise_Hotel_Hotel'
CREATE INDEX [IX_FK_Reise_Hotel_Hotel]
ON [dbo].[Reise_Hotel]
    ([Hotel]);
GO

-- Creating foreign key on [Nationalitaet] in table 'Kundes'
ALTER TABLE [dbo].[Kundes]
ADD CONSTRAINT [FK_Kunde_Land]
    FOREIGN KEY ([Nationalitaet])
    REFERENCES [dbo].[Lands]
        ([LandID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Kunde_Land'
CREATE INDEX [IX_FK_Kunde_Land]
ON [dbo].[Kundes]
    ([Nationalitaet]);
GO

-- Creating foreign key on [Kunde] in table 'Kunde_Reise'
ALTER TABLE [dbo].[Kunde_Reise]
ADD CONSTRAINT [FK_Kunde_Reise_Kunde]
    FOREIGN KEY ([Kunde])
    REFERENCES [dbo].[Kundes]
        ([KundeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Kunde_Reise_Kunde'
CREATE INDEX [IX_FK_Kunde_Reise_Kunde]
ON [dbo].[Kunde_Reise]
    ([Kunde]);
GO

-- Creating foreign key on [Reise] in table 'Kunde_Reise'
ALTER TABLE [dbo].[Kunde_Reise]
ADD CONSTRAINT [FK_Kunde_Reise_Reise]
    FOREIGN KEY ([Reise])
    REFERENCES [dbo].[Reises]
        ([ReiseID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Kunde_Reise_Reise'
CREATE INDEX [IX_FK_Kunde_Reise_Reise]
ON [dbo].[Kunde_Reise]
    ([Reise]);
GO

-- Creating foreign key on [Land] in table 'Reises'
ALTER TABLE [dbo].[Reises]
ADD CONSTRAINT [FK_Reise_Land]
    FOREIGN KEY ([Land])
    REFERENCES [dbo].[Lands]
        ([LandID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Reise_Land'
CREATE INDEX [IX_FK_Reise_Land]
ON [dbo].[Reises]
    ([Land]);
GO

-- Creating foreign key on [Reise] in table 'Reise_Hotel'
ALTER TABLE [dbo].[Reise_Hotel]
ADD CONSTRAINT [FK_Reise_Hotel_Reise]
    FOREIGN KEY ([Reise])
    REFERENCES [dbo].[Reises]
        ([ReiseID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Reise_Hotel_Reise'
CREATE INDEX [IX_FK_Reise_Hotel_Reise]
ON [dbo].[Reise_Hotel]
    ([Reise]);
GO

-- Creating foreign key on [GUIUserFK] in table 'Kundes'
ALTER TABLE [dbo].[Kundes]
ADD CONSTRAINT [FK_GUIUserFK]
    FOREIGN KEY ([GUIUserFK])
    REFERENCES [dbo].[GUIUsers]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_GUIUserFK'
CREATE INDEX [IX_FK_GUIUserFK]
ON [dbo].[Kundes]
    ([GUIUserFK]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------