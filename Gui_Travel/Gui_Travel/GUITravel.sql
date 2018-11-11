
USE [master]
GO
/****** Object:  Database [M120]    Script Date: 16.11.2015 13:49:03 ******/
CREATE DATABASE [M120]
GO
ALTER DATABASE [M120] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [M120].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [M120] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [M120] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [M120] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [M120] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [M120] SET ARITHABORT OFF 
GO
ALTER DATABASE [M120] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [M120] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [M120] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [M120] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [M120] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [M120] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [M120] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [M120] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [M120] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [M120] SET  DISABLE_BROKER 
GO
ALTER DATABASE [M120] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [M120] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [M120] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [M120] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [M120] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [M120] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [M120] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [M120] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [M120] SET  MULTI_USER 
GO
ALTER DATABASE [M120] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [M120] SET DB_CHAINING OFF 
GO
ALTER DATABASE [M120] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [M120] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [M120] SET DELAYED_DURABILITY = DISABLED 
GO
USE [M120]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 16.11.2015 13:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hotel](
	[HotelID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Ort] [varchar](50) NOT NULL,
	[Land] [bigint] NOT NULL,
	[Sterne] [tinyint] NOT NULL,
	[Manager] [varchar](50) NOT NULL,
	[AnzahlZimmer] [smallint] NOT NULL,
	[TagesPreis] [decimal](18, 2) NOT NULL,
	[Telefon] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Web] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[HotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HotelBild]    Script Date: 16.11.2015 13:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HotelBild](
	[BildID] [bigint] IDENTITY(1,1) NOT NULL,
	[HotelID] [bigint] NOT NULL,
	[Reihenfolge] [int] NOT NULL,
	[Bild] [image] NULL,
	[Beschreibung] [varchar](100) NOT NULL,
 CONSTRAINT [PK_HotelBild] PRIMARY KEY CLUSTERED 
(
	[BildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kunde]    Script Date: 16.11.2015 13:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kunde](
	[KundeID] [bigint] IDENTITY(1,1) NOT NULL,
	[Anrede] [varchar](50) NOT NULL,
	[Vorname] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[NameZusatz] [varchar](50) NOT NULL,
	[StrasseNr] [varchar](100) NOT NULL,
	[PLZ] [smallint] NOT NULL,
	[Ort] [varchar](50) NOT NULL,
	[Telefon] [varchar](50) NOT NULL,
	[Mobile] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Web] [varchar](100) NOT NULL,
	[Geburtsdatum] [date] NOT NULL,
	[PassNr] [varchar](50) NOT NULL,
	[Nationalitaet] [bigint] NOT NULL,
	[UserFK] [bigint] NOT NULL,
 CONSTRAINT [PK_Kunde] PRIMARY KEY CLUSTERED 
(
	[KundeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object: GUIUser [dbo].[GUIUser] ********/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GUIUser](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,	
 CONSTRAINT [PK_GUIUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kunde_Reise]    Script Date: 16.11.2015 13:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kunde_Reise](
	[Kunde_Reise_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Kunde] [bigint] NOT NULL,
	[Reise] [bigint] NOT NULL,
 CONSTRAINT [PK_Kunde_Reise] PRIMARY KEY CLUSTERED 
(
	[Kunde_Reise_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Land]    Script Date: 16.11.2015 13:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Land](
	[LandID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Kurzname] [char](3) NOT NULL,
	[Flagge] [image] NULL,
 CONSTRAINT [PK_Land] PRIMARY KEY CLUSTERED 
(
	[LandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reise]    Script Date: 16.11.2015 13:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reise](
	[ReiseID] [bigint] IDENTITY(1,1) NOT NULL,
	[Land] [bigint] NOT NULL,
	[Start] [date] NOT NULL,
	[Ende] [date] NOT NULL,
	[Preis] [decimal](18, 2) NOT NULL,
	[Leitung] [bit] NOT NULL,
	[NameLeitung] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Reise] PRIMARY KEY CLUSTERED 
(
	[ReiseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reise_Hotel]    Script Date: 16.11.2015 13:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reise_Hotel](
	[Reise_Hotel_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Reise] [bigint] NOT NULL,
	[Hotel] [bigint] NOT NULL,
 CONSTRAINT [PK_Reise_Hotel] PRIMARY KEY CLUSTERED 
(
	[Reise_Hotel_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 

GO
INSERT [dbo].[Hotel] ([HotelID], [Name], [Ort], [Land], [Sterne], [Manager], [AnzahlZimmer], [TagesPreis], [Telefon], [Email], [Web]) VALUES (1, N'Hotel Alpha', N'Fribourg', 192, 3, N'Ayer', 50, CAST(150.00 AS Decimal(18, 2)), N'026 888 777 999', N'info@alpha.ch', N'www.alpha.ch')
GO
INSERT [dbo].[Hotel] ([HotelID], [Name], [Ort], [Land], [Sterne], [Manager], [AnzahlZimmer], [TagesPreis], [Telefon], [Email], [Web]) VALUES (2, N'Hotel de la Rose', N'Fribourg', 192, 3, N'Dino', 88, CAST(99.00 AS Decimal(18, 2)), N'026 351 01 01', N'info@hoteldelarose.ch', N'www.hoteldelarose.ch')
GO
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO

GO
SET IDENTITY_INSERT [dbo].[Kunde] ON 

GO
INSERT [dbo].[Kunde] ([KundeID], [Anrede], [Vorname], [Name], [NameZusatz], [StrasseNr], [PLZ], [Ort], [Telefon], [Mobile], [Email], [Web], [Geburtsdatum], [PassNr], [Nationalitaet]) VALUES (3, N'Herr', N'Anton', N'Antonielli', N'', N'', 3000, N'Bern', N'', N'', N'', N'', CAST(N'2009-01-01' AS Date), N'', 1)
GO
INSERT [dbo].[Kunde] ([KundeID], [Anrede], [Vorname], [Name], [NameZusatz], [StrasseNr], [PLZ], [Ort], [Telefon], [Mobile], [Email], [Web], [Geburtsdatum], [PassNr], [Nationalitaet]) VALUES (4, N'', N'123', N'abc', N'', N'', 0, N'', N'', N'', N'', N'', CAST(N'0001-01-01' AS Date), N'', 192)
GO
INSERT [dbo].[Kunde] ([KundeID], [Anrede], [Vorname], [Name], [NameZusatz], [StrasseNr], [PLZ], [Ort], [Telefon], [Mobile], [Email], [Web], [Geburtsdatum], [PassNr], [Nationalitaet]) VALUES (5, N'', N'vvv', N'mmm', N'', N'', 0, N'', N'', N'', N'', N'', CAST(N'0001-01-01' AS Date), N'', 192)
GO
INSERT [dbo].[Kunde] ([KundeID], [Anrede], [Vorname], [Name], [NameZusatz], [StrasseNr], [PLZ], [Ort], [Telefon], [Mobile], [Email], [Web], [Geburtsdatum], [PassNr], [Nationalitaet]) VALUES (7, N'', N'124', N'abx', N'', N'', 0, N'', N'', N'', N'', N'', CAST(N'0001-01-01' AS Date), N'', 192)
GO
INSERT [dbo].[Kunde] ([KundeID], [Anrede], [Vorname], [Name], [NameZusatz], [StrasseNr], [PLZ], [Ort], [Telefon], [Mobile], [Email], [Web], [Geburtsdatum], [PassNr], [Nationalitaet]) VALUES (8, N'', N'129', N'aby', N'', N'', 0, N'', N'', N'', N'', N'', CAST(N'0001-01-01' AS Date), N'', 192)
GO
INSERT [dbo].[Kunde] ([KundeID], [Anrede], [Vorname], [Name], [NameZusatz], [StrasseNr], [PLZ], [Ort], [Telefon], [Mobile], [Email], [Web], [Geburtsdatum], [PassNr], [Nationalitaet]) VALUES (9, N'', N'Timo', N'Willisauer', N'', N'', 0, N'', N'', N'', N'', N'', CAST(N'0001-01-01' AS Date), N'', 192)
GO
SET IDENTITY_INSERT [dbo].[Kunde] OFF
GO
SET IDENTITY_INSERT [dbo].[Land] ON 

GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (1, N'Afghanistan', N'AF ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (2, N'Ã„gypten', N'EG ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (3, N'Aland', N'AX ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (4, N'Albanien', N'AL ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (5, N'Algerien', N'DZ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (6, N'Amerikanisch-Samoa', N'AS ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (7, N'Amerikanische Jungferninseln', N'VI ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (8, N'Andorra', N'AD ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (9, N'Angola', N'AO ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (10, N'Anguilla', N'AI ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (11, N'Antarktis', N'AQ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (12, N'Antigua und Barbuda', N'AG ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (13, N'Ã„quatorialguinea', N'GQ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (14, N'Argentinien', N'AR ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (15, N'Armenien', N'AM ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (16, N'Aruba', N'AW ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (17, N'Ascension', N'AC ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (18, N'Aserbaidschan', N'AZ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (19, N'Ã„thiopien', N'ET ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (20, N'Australien', N'AU ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (21, N'Bahamas', N'BS ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (22, N'Bahrain', N'BH ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (23, N'Bangladesch', N'BD ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (24, N'Barbados', N'BB ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (25, N'Belgien', N'BE ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (26, N'Belize', N'BZ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (27, N'Benin', N'BJ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (28, N'Bermuda', N'BM ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (29, N'Bhutan', N'BT ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (30, N'Bolivien', N'BO ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (31, N'Bosnien und Herzegowina', N'BA ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (32, N'Botswana', N'BW ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (33, N'Bouvetinsel', N'BV ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (34, N'Brasilien', N'BR ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (35, N'Britische Jungferninseln', N'VG ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (36, N'Britisches Territorium im Indischen Ozean', N'IO ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (37, N'Brunei', N'BN ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (38, N'Bulgarien', N'BG ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (39, N'Burkina Faso', N'BF ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (40, N'Burundi', N'BI ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (41, N'Chile', N'CL ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (42, N'China, Volksrepublik', N'CN ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (43, N'Cookinseln', N'CK ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (44, N'Costa Rica', N'CR ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (45, N'DÃ¤nemark', N'DK ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (46, N'Deutschland', N'DE ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (47, N'Die Kronkolonie St. Helena und Nebengebiete', N'SH ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (48, N'Diego Garcia', N'DG ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (49, N'Dominica', N'DM ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (50, N'Dominikanische Republik', N'DO ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (51, N'Dschibuti', N'DJ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (52, N'Ecuador', N'EC ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (53, N'El Salvador', N'SV ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (54, N'Eritrea', N'ER ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (55, N'Estland', N'EE ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (56, N'EuropÃ¤ische Union', N'EU ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (57, N'Falklandinseln', N'FK ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (58, N'FÃ¤rÃ¶er', N'FO ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (59, N'Fidschi', N'FJ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (60, N'Finnland', N'FI ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (61, N'Frankreich', N'FR ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (62, N'FranzÃ¶sisch-Guayana', N'GF ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (63, N'FranzÃ¶sisch-Polynesien', N'PF ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (64, N'FranzÃ¶sische SÃ¼d- und Antarktisgebiete', N'TF ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (65, N'Gabun', N'GA ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (66, N'Gambia', N'GM ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (67, N'Georgien', N'GE ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (68, N'Ghana', N'GH ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (69, N'Gibraltar', N'GI ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (70, N'Grenada', N'GD ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (71, N'Griechenland', N'GR ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (72, N'GrÃ¶nland', N'GL ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (73, N'Guadeloupe', N'GP ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (74, N'Guam', N'GU ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (75, N'Guatemala', N'GT ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (76, N'Guernsey', N'GG ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (77, N'Guinea', N'GN ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (78, N'Guinea-Bissau', N'GW ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (79, N'Guyana', N'GY ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (80, N'Haiti', N'HT ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (81, N'Heard und McDonaldinseln', N'HM ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (82, N'Honduras', N'HN ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (83, N'Hongkong', N'HK ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (84, N'Indien', N'IN ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (85, N'Indonesien', N'ID ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (86, N'Irak', N'IQ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (87, N'Iran', N'IR ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (88, N'Irland', N'IE ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (89, N'Island', N'IS ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (90, N'Isle of Man', N'IM ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (91, N'Israel', N'IL ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (92, N'Italien', N'IT ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (93, N'Jamaika', N'JM ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (94, N'Japan', N'JP ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (95, N'Jemen', N'YE ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (96, N'Jersey', N'JE ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (97, N'Jordanien', N'JO ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (98, N'Kaimaninseln', N'KY ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (99, N'Kambodscha', N'KH ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (100, N'Kamerun', N'CM ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (101, N'Kanada', N'CA ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (102, N'Kanarische Inseln', N'IC ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (103, N'Kap Verde', N'CV ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (104, N'Kasachstan', N'KZ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (105, N'Katar', N'QA ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (106, N'Kenia', N'KE ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (107, N'Kirgisistan', N'KG ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (108, N'Kiribati', N'KI ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (109, N'Kokosinseln', N'CC ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (110, N'Kolumbien', N'CO ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (111, N'Komoren', N'KM ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (112, N'Kongo, Demokratische Republik', N'CD ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (113, N'Kroatien', N'HR ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (114, N'Kuba', N'CU ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (115, N'Kuwait', N'KW ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (116, N'Laos', N'LA ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (117, N'Lesotho', N'LS ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (118, N'Lettland', N'LV ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (119, N'Libanon', N'LB ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (120, N'Liberia, Republik', N'LR ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (121, N'Libyen', N'LY ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (122, N'Liechtenstein', N'LI ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (123, N'Litauen', N'LT ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (124, N'Luxemburg', N'LU ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (125, N'Macao', N'MO ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (126, N'Madagaskar', N'MG ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (127, N'Malawi', N'MW ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (128, N'Malaysia', N'MY ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (129, N'Malediven', N'MV ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (130, N'Mali, Republik', N'ML ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (131, N'Malta', N'MT ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (132, N'Marokko', N'MA ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (133, N'Marshallinseln', N'MH ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (134, N'Martinique', N'MQ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (135, N'Mauretanien', N'MR ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (136, N'Mauritius', N'MU ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (137, N'Mayotte', N'YT ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (138, N'Mazedonien', N'MK ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (139, N'Mexiko', N'MX ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (140, N'Mikronesien, FÃ¶derierte Staaten von', N'FM ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (141, N'Moldawien', N'MD ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (142, N'Monaco', N'MC ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (143, N'Mongolei', N'MN ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (144, N'Montenegro', N'ME ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (145, N'Montserrat', N'MS ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (146, N'Mosambik', N'MZ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (147, N'Myanmar', N'MM ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (148, N'Namibia', N'NA ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (149, N'Nauru', N'NR ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (150, N'Nepal', N'NP ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (151, N'Neukaledonien', N'NC ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (152, N'Neuseeland', N'NZ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (153, N'Neutrale Zone (Irak)', N'NT ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (154, N'Nicaragua', N'NI ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (155, N'Niederlande', N'NL ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (156, N'NiederlÃ¤ndische Antillen', N'AN ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (157, N'Niger', N'NE ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (158, N'Nigeria', N'NG ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (159, N'Niue', N'NU ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (160, N'Nordkorea', N'KP ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (161, N'NÃ¶rdliche Marianen', N'MP ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (162, N'Norfolkinsel', N'NF ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (163, N'Norwegen', N'NO ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (164, N'Oman', N'OM ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (165, N'Ã–sterreich', N'AT ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (166, N'Osttimor', N'TL ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (167, N'Pakistan', N'PK ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (168, N'PalÃ¤stinensische Autonomiegebiete', N'PS ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (169, N'Palau', N'PW ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (170, N'Panama', N'PA ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (171, N'Papua-Neuguinea', N'PG ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (172, N'Paraguay', N'PY ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (173, N'Peru', N'PE ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (174, N'Philippinen', N'PH ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (175, N'Pitcairninseln', N'PN ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (176, N'Polen', N'PL ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (177, N'Portugal', N'PT ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (178, N'Puerto Rico', N'PR ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (179, N'Republik CÃ´te dâ€™Ivoire', N'CI ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (180, N'Republik Kongo', N'CG ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (181, N'RÃ©union', N'RE ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (182, N'Ruanda', N'RW ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (183, N'RumÃ¤nien', N'RO ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (184, N'Russische FÃ¶deration', N'RU ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (185, N'Salomonen', N'SB ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (186, N'Sambia', N'ZM ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (187, N'Samoa', N'WS ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (188, N'San Marino', N'SM ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (189, N'SÃ£o TomÃ© und PrÃ­ncipe', N'ST ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (190, N'Saudi-Arabien', N'SA ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (191, N'Schweden', N'SE ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (192, N'Schweiz', N'CH ', 0x4749463839610B000B00F700000000000000330000660000990000CC0000FF002B00002B33002B66002B99002BCC002BFF0055000055330055660055990055CC0055FF0080000080330080660080990080CC0080FF00AA0000AA3300AA6600AA9900AACC00AAFF00D50000D53300D56600D59900D5CC00D5FF00FF0000FF3300FF6600FF9900FFCC00FFFF3300003300333300663300993300CC3300FF332B00332B33332B66332B99332BCC332BFF3355003355333355663355993355CC3355FF3380003380333380663380993380CC3380FF33AA0033AA3333AA6633AA9933AACC33AAFF33D50033D53333D56633D59933D5CC33D5FF33FF0033FF3333FF6633FF9933FFCC33FFFF6600006600336600666600996600CC6600FF662B00662B33662B66662B99662BCC662BFF6655006655336655666655996655CC6655FF6680006680336680666680996680CC6680FF66AA0066AA3366AA6666AA9966AACC66AAFF66D50066D53366D56666D59966D5CC66D5FF66FF0066FF3366FF6666FF9966FFCC66FFFF9900009900339900669900999900CC9900FF992B00992B33992B66992B99992BCC992BFF9955009955339955669955999955CC9955FF9980009980339980669980999980CC9980FF99AA0099AA3399AA6699AA9999AACC99AAFF99D50099D53399D56699D59999D5CC99D5FF99FF0099FF3399FF6699FF9999FFCC99FFFFCC0000CC0033CC0066CC0099CC00CCCC00FFCC2B00CC2B33CC2B66CC2B99CC2BCCCC2BFFCC5500CC5533CC5566CC5599CC55CCCC55FFCC8000CC8033CC8066CC8099CC80CCCC80FFCCAA00CCAA33CCAA66CCAA99CCAACCCCAAFFCCD500CCD533CCD566CCD599CCD5CCCCD5FFCCFF00CCFF33CCFF66CCFF99CCFFCCCCFFFFFF0000FF0033FF0066FF0099FF00CCFF00FFFF2B00FF2B33FF2B66FF2B99FF2BCCFF2BFFFF5500FF5533FF5566FF5599FF55CCFF55FFFF8000FF8033FF8066FF8099FF80CCFF80FFFFAA00FFAA33FFAA66FFAA99FFAACCFFAAFFFFD500FFD533FFD566FFD599FFD5CCFFD5FFFFFF00FFFF33FFFF66FFFF99FFFFCCFFFFFF00000000000000000000000021F904010000FC002C000000000B000B0000085600A5091C4850A0B973E60E9A03B7D0203870FB2282FB064EE0398A11F765A3884A9AB98C11A3EDAB28ED1CC88CE03A423C19ED9BC089D944D2CB36ED9BCA6FD932664BE5521A385B13C1D5FA86B3A3C08E48A5750C08003B)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (193, N'Senegal', N'SN ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (194, N'Serbien', N'RS ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (195, N'Serbien und Montenegro', N'CS ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (196, N'Seychellen', N'SC ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (197, N'Sierra Leone', N'SL ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (198, N'Simbabwe', N'ZW ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (199, N'Singapur', N'SG ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (200, N'Slowakei', N'SK ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (201, N'Slowenien', N'SI ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (202, N'Somalia, Demokratische Republik', N'SO ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (203, N'Sowjetunion', N'SU ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (204, N'Spanien', N'ES ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (205, N'Sri Lanka', N'LK ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (206, N'St. Kitts und Nevis', N'KN ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (207, N'St. Lucia', N'LC ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (208, N'St. Pierre und Miquelon', N'PM ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (209, N'St. Vincent und die Grenadinen', N'VC ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (210, N'SÃ¼dafrika', N'ZA ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (211, N'Sudan', N'SD ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (212, N'SÃ¼dgeorgien und die SÃ¼dlichen Sandwichinseln', N'GS ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (213, N'SÃ¼dkorea', N'KR ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (214, N'Suriname', N'SR ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (215, N'Svalbard und Jan Mayen', N'SJ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (216, N'Swasiland', N'SZ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (217, N'Syrien', N'SY ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (218, N'Tadschikistan', N'TJ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (219, N'Taiwan', N'TW ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (220, N'Tansania', N'TZ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (221, N'Thailand', N'TH ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (222, N'Togo', N'TG ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (223, N'Tokelau', N'TK ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (224, N'Tonga', N'TO ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (225, N'Trinidad und Tobago', N'TT ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (226, N'Tristan da Cunha', N'TA ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (227, N'Tschad', N'TD ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (228, N'Tschechien', N'CZ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (229, N'Tunesien', N'TN ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (230, N'TÃ¼rkei', N'TR ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (231, N'Turkmenistan', N'TM ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (232, N'Turks- und Caicosinseln', N'TC ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (233, N'Tuvalu', N'TV ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (234, N'Uganda', N'UG ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (235, N'Ukraine', N'UA ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (236, N'Ungarn', N'HU ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (237, N'Uruguay', N'UY ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (238, N'Usbekistan', N'UZ ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (239, N'Vanuatu', N'VU ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (240, N'Vatikanstadt', N'VA ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (241, N'Venezuela', N'VE ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (242, N'Vereinigte Arabische Emirate', N'AE ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (243, N'Vereinigte Staaten', N'US ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (244, N'Vereinigtes KÃ¶nigreich', N'GB ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (245, N'Vietnam', N'VN ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (246, N'Wallis und Futuna', N'WF ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (247, N'Weihnachtsinsel', N'CX ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (248, N'WeiÃŸrussland', N'BY ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (249, N'Westsahara', N'EH ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (250, N'Zentralafrikanische Republik', N'CF ', NULL)
GO
INSERT [dbo].[Land] ([LandID], [Name], [Kurzname], [Flagge]) VALUES (251, N'Zypern, Republik', N'CY ', NULL)
GO
SET IDENTITY_INSERT [dbo].[Land] OFF
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Land] FOREIGN KEY([Land])
REFERENCES [dbo].[Land] ([LandID])
GO
ALTER TABLE [dbo].[Kundes]
ADD CONSTRAINT [FK_GUIUserFK]
    FOREIGN KEY ([GUIUserFK])
    REFERENCES [dbo].[GUIUsers]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Land]
GO
ALTER TABLE [dbo].[HotelBild]  WITH CHECK ADD  CONSTRAINT [FK_HotelBild_Hotel] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([HotelID])
GO
ALTER TABLE [dbo].[HotelBild] CHECK CONSTRAINT [FK_HotelBild_Hotel]
GO
ALTER TABLE [dbo].[Kunde]  WITH CHECK ADD  CONSTRAINT [FK_Kunde_Land] FOREIGN KEY([Nationalitaet])
REFERENCES [dbo].[Land] ([LandID])
GO
ALTER TABLE [dbo].[Kunde] CHECK CONSTRAINT [FK_Kunde_Land]
GO
ALTER TABLE [dbo].[Kunde_Reise]  WITH CHECK ADD  CONSTRAINT [FK_Kunde_Reise_Kunde] FOREIGN KEY([Kunde])
REFERENCES [dbo].[Kunde] ([KundeID])
GO
ALTER TABLE [dbo].[Kunde_Reise] CHECK CONSTRAINT [FK_Kunde_Reise_Kunde]
GO
ALTER TABLE [dbo].[Kunde_Reise]  WITH CHECK ADD  CONSTRAINT [FK_Kunde_Reise_Reise] FOREIGN KEY([Reise])
REFERENCES [dbo].[Reise] ([ReiseID])
GO
ALTER TABLE [dbo].[Kunde_Reise] CHECK CONSTRAINT [FK_Kunde_Reise_Reise]
GO
ALTER TABLE [dbo].[Reise]  WITH CHECK ADD  CONSTRAINT [FK_Reise_Land] FOREIGN KEY([Land])
REFERENCES [dbo].[Land] ([LandID])
GO
ALTER TABLE [dbo].[Reise] CHECK CONSTRAINT [FK_Reise_Land]
GO
ALTER TABLE [dbo].[Reise_Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Reise_Hotel_Hotel] FOREIGN KEY([Hotel])
REFERENCES [dbo].[Hotel] ([HotelID])
GO
ALTER TABLE [dbo].[Reise_Hotel] CHECK CONSTRAINT [FK_Reise_Hotel_Hotel]
GO
ALTER TABLE [dbo].[Reise_Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Reise_Hotel_Reise] FOREIGN KEY([Reise])
REFERENCES [dbo].[Reise] ([ReiseID])
GO
ALTER TABLE [dbo].[Reise_Hotel] CHECK CONSTRAINT [FK_Reise_Hotel_Reise]
GO
USE [master]
GO
ALTER DATABASE [M120] SET  READ_WRITE 
GO
