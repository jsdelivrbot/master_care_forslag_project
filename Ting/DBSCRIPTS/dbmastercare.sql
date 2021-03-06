USE [master]
GO
/****** Object:  Database [dbmastercare]    Script Date: 16-09-2018 17:25:16 ******/
CREATE DATABASE [dbmastercare]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbmastercare', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\dbmastercare.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbmastercare_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\dbmastercare_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbmastercare] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbmastercare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbmastercare] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbmastercare] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbmastercare] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbmastercare] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbmastercare] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbmastercare] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbmastercare] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbmastercare] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbmastercare] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbmastercare] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbmastercare] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbmastercare] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbmastercare] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbmastercare] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbmastercare] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbmastercare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbmastercare] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbmastercare] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbmastercare] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbmastercare] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbmastercare] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbmastercare] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbmastercare] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbmastercare] SET  MULTI_USER 
GO
ALTER DATABASE [dbmastercare] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbmastercare] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbmastercare] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbmastercare] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbmastercare] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbmastercare] SET QUERY_STORE = OFF
GO
USE [dbmastercare]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [dbmastercare]
GO
/****** Object:  Table [dbo].[tbl_Brugervejledning]    Script Date: 16-09-2018 17:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Brugervejledning](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BrugervejledningsNavn] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tbl_Brugervejledning] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_FK_Produkt_Underkategori]    Script Date: 16-09-2018 17:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FK_Produkt_Underkategori](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_ProduktID] [int] NOT NULL,
	[FK_UnderkategoriID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Produkt_Underkategori] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_FK_Produkt_Variation]    Script Date: 16-09-2018 17:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FK_Produkt_Variation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_ProduktID] [int] NOT NULL,
	[FK_VariationID] [int] NULL,
	[VariationInfo] [nvarchar](max) NULL,
	[VariationVarenummer] [nvarchar](50) NULL,
	[VariationHMInummer] [int] NULL,
	[VariationImg] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_FK_Produkt-Variation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_FK_Variation_Underkategori]    Script Date: 16-09-2018 17:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FK_Variation_Underkategori](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_VariationID] [int] NULL,
	[FK_UnderkategoriID] [int] NULL,
 CONSTRAINT [PK_tbl_Variation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Kategori]    Script Date: 16-09-2018 17:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Kategori](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriNavn] [nvarchar](50) NOT NULL,
	[KategoriImg] [nvarchar](250) NULL,
	[KategoriIkon] [nvarchar](250) NULL,
	[KategoriUrl] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_Kategori] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_KontaktInfo]    Script Date: 16-09-2018 17:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_KontaktInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaNavn] [nvarchar](50) NOT NULL,
	[VejNavn] [nvarchar](50) NOT NULL,
	[Postnummer] [int] NOT NULL,
	[Bynavn] [nvarchar](50) NOT NULL,
	[CVR] [int] NOT NULL,
	[Telefonnummer] [nvarchar](50) NOT NULL,
	[InfoMail] [nvarchar](100) NOT NULL,
	[Åbningstider] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tbl_KontaktInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Menu]    Script Date: 16-09-2018 17:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuNavn] [nvarchar](100) NOT NULL,
	[MenuUrl] [nvarchar](100) NULL,
	[VisKategori] [bit] NULL,
 CONSTRAINT [PK_tbl_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Nyheder]    Script Date: 16-09-2018 17:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Nyheder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NyhedsNavn] [nvarchar](100) NOT NULL,
	[NyhedsTekst] [nvarchar](max) NOT NULL,
	[NyhedsImg] [nvarchar](150) NOT NULL,
	[NyhedsDato] [datetime] NOT NULL,
	[NyhedsUrl] [nvarchar](300) NULL,
 CONSTRAINT [PK_tbl_Nyheder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Produkt]    Script Date: 16-09-2018 17:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Produkt](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProduktNavn] [nvarchar](200) NOT NULL,
	[ProduktTekst] [nvarchar](max) NOT NULL,
	[ProduktVideo] [nvarchar](max) NOT NULL,
	[ProduktUrl] [nvarchar](250) NULL,
	[ProduktImg] [nvarchar](250) NULL,
	[ProduktVejledning] [nvarchar](250) NULL,
	[FK_VejledningID] [int] NOT NULL,
	[FK_KategoriID] [int] NULL,
	[VariationAntal] [int] NULL,
 CONSTRAINT [PK_tbl_Produkt] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Sprog]    Script Date: 16-09-2018 17:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Sprog](
	[ID] [int] NOT NULL,
	[Sprog] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Sprog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SubMenu]    Script Date: 16-09-2018 17:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SubMenu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubMenuNavn] [nvarchar](100) NOT NULL,
	[SubMenuUrl] [nvarchar](100) NULL,
	[FK_MenuID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_SubMenu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Tekst]    Script Date: 16-09-2018 17:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Tekst](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Tekst] [nvarchar](max) NOT NULL,
	[Overskrift] [nchar](250) NULL,
	[Billeder] [nvarchar](250) NULL,
	[FK_TekstAlias] [int] NULL,
 CONSTRAINT [PK_tbl_Tekst] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TekstAlias]    Script Date: 16-09-2018 17:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TekstAlias](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TekstAlias] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_TekstAlias] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UnderKategori]    Script Date: 16-09-2018 17:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UnderKategori](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UnderKategoriNavn] [nvarchar](200) NOT NULL,
	[UnderKategoriTekst] [nvarchar](300) NOT NULL,
	[UnderKategoriVideo] [nvarchar](100) NULL,
	[UnderKategoriUrl] [nvarchar](400) NULL,
	[FK_KategoriID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_UnderKategori] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Variation]    Script Date: 16-09-2018 17:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Variation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VariationNavn] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_tbl_Variation_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_FK_Produkt_Underkategori] ON 

INSERT [dbo].[tbl_FK_Produkt_Underkategori] ([ID], [FK_ProduktID], [FK_UnderkategoriID]) VALUES (1, 1, 5)
INSERT [dbo].[tbl_FK_Produkt_Underkategori] ([ID], [FK_ProduktID], [FK_UnderkategoriID]) VALUES (2, 1, 10)
INSERT [dbo].[tbl_FK_Produkt_Underkategori] ([ID], [FK_ProduktID], [FK_UnderkategoriID]) VALUES (3, 2, 5)
INSERT [dbo].[tbl_FK_Produkt_Underkategori] ([ID], [FK_ProduktID], [FK_UnderkategoriID]) VALUES (4, 2, 6)
INSERT [dbo].[tbl_FK_Produkt_Underkategori] ([ID], [FK_ProduktID], [FK_UnderkategoriID]) VALUES (5, 2, 10)
INSERT [dbo].[tbl_FK_Produkt_Underkategori] ([ID], [FK_ProduktID], [FK_UnderkategoriID]) VALUES (6, 2, 11)
INSERT [dbo].[tbl_FK_Produkt_Underkategori] ([ID], [FK_ProduktID], [FK_UnderkategoriID]) VALUES (8, 2, 12)
INSERT [dbo].[tbl_FK_Produkt_Underkategori] ([ID], [FK_ProduktID], [FK_UnderkategoriID]) VALUES (9, 3, 5)
INSERT [dbo].[tbl_FK_Produkt_Underkategori] ([ID], [FK_ProduktID], [FK_UnderkategoriID]) VALUES (10, 3, 6)
INSERT [dbo].[tbl_FK_Produkt_Underkategori] ([ID], [FK_ProduktID], [FK_UnderkategoriID]) VALUES (11, 3, 10)
INSERT [dbo].[tbl_FK_Produkt_Underkategori] ([ID], [FK_ProduktID], [FK_UnderkategoriID]) VALUES (12, 3, 11)
INSERT [dbo].[tbl_FK_Produkt_Underkategori] ([ID], [FK_ProduktID], [FK_UnderkategoriID]) VALUES (13, 3, 12)
INSERT [dbo].[tbl_FK_Produkt_Underkategori] ([ID], [FK_ProduktID], [FK_UnderkategoriID]) VALUES (14, 4, 1)
SET IDENTITY_INSERT [dbo].[tbl_FK_Produkt_Underkategori] OFF
SET IDENTITY_INSERT [dbo].[tbl_FK_Produkt_Variation] ON 

INSERT [dbo].[tbl_FK_Produkt_Variation] ([ID], [FK_ProduktID], [FK_VariationID], [VariationInfo], [VariationVarenummer], [VariationHMInummer], [VariationImg]) VALUES (1, 1, 4, N'', N'002-1955', 81108, N'002-1955.jpg')
INSERT [dbo].[tbl_FK_Produkt_Variation] ([ID], [FK_ProduktID], [FK_VariationID], [VariationInfo], [VariationVarenummer], [VariationHMInummer], [VariationImg]) VALUES (2, 1, 5, N'', N'002-1957', 81110, N'002-1957.jpg')
INSERT [dbo].[tbl_FK_Produkt_Variation] ([ID], [FK_ProduktID], [FK_VariationID], [VariationInfo], [VariationVarenummer], [VariationHMInummer], [VariationImg]) VALUES (3, 1, 6, N'', N'002-1958', 100634, N'002-1958.jpg')
INSERT [dbo].[tbl_FK_Produkt_Variation] ([ID], [FK_ProduktID], [FK_VariationID], [VariationInfo], [VariationVarenummer], [VariationHMInummer], [VariationImg]) VALUES (4, 1, 7, N'', N'002-1953', 80351, N'002-1953.jpg')
INSERT [dbo].[tbl_FK_Produkt_Variation] ([ID], [FK_ProduktID], [FK_VariationID], [VariationInfo], [VariationVarenummer], [VariationHMInummer], [VariationImg]) VALUES (5, 1, 8, N'', N'002-1954', 81111, N'002-1954.jpg')
INSERT [dbo].[tbl_FK_Produkt_Variation] ([ID], [FK_ProduktID], [FK_VariationID], [VariationInfo], [VariationVarenummer], [VariationHMInummer], [VariationImg]) VALUES (6, 1, 9, N'', N'002-1956', 81109, N'002-1956.jpg')
INSERT [dbo].[tbl_FK_Produkt_Variation] ([ID], [FK_ProduktID], [FK_VariationID], [VariationInfo], [VariationVarenummer], [VariationHMInummer], [VariationImg]) VALUES (7, 1, 10, N'', N'002-1952', 80337, N'002-1952.jpg')
INSERT [dbo].[tbl_FK_Produkt_Variation] ([ID], [FK_ProduktID], [FK_VariationID], [VariationInfo], [VariationVarenummer], [VariationHMInummer], [VariationImg]) VALUES (8, 2, 1, N'Master Turner Medium - Soft
Til brugere med behov for nedsat friktion under skulder, ryg og hofteparti.
Vendelagnet placeres ovenpå et madrascover.
Tynd, kølig og behagelig overflade.
Håndtag: 10 stk.
Brugervægt: max 180 kg
L:140 x W:150 cm
Vask: max 85 °C
Se video Master Turner - Medium', N'001-1722', 53091, N'002-1722.jpg')
INSERT [dbo].[tbl_FK_Produkt_Variation] ([ID], [FK_ProduktID], [FK_VariationID], [VariationInfo], [VariationVarenummer], [VariationHMInummer], [VariationImg]) VALUES (9, 2, 2, N'Master Turner Medium - Elastic 
Til brugere med behov for nedsat friktion under skulder, ryg og hofteparti.
Vendelagnet placeres ovenpå et madrascover.
Tynd, elastisk overflade med god åndbarhed
Håndtag: 10 stk.
Brugervægt: max 180 kg
L:140 x W:145 cm
Vask: max 85 °C
Se video Master Turner - Medium ', N'001-1927', 37805, N'002-1927.jpg')
INSERT [dbo].[tbl_FK_Produkt_Variation] ([ID], [FK_ProduktID], [FK_VariationID], [VariationInfo], [VariationVarenummer], [VariationHMInummer], [VariationImg]) VALUES (10, 2, 3, N'Master Turner Medium - Frotté
Til brugere med behov for nedsat friktion under skulder, ryg og hofteparti.
Vendelagnet placeres ovenpå et madrascover.
Lun frotté overflade.
Håndtag: 10 stk.
Brugervægt: max 180 kg
L:140 x W:150 cm
Vask: max 85 °C
Se video Master Turner - Medium', N'001-1922', 33249, N'002-1922.jpg')
INSERT [dbo].[tbl_FK_Produkt_Variation] ([ID], [FK_ProduktID], [FK_VariationID], [VariationInfo], [VariationVarenummer], [VariationHMInummer], [VariationImg]) VALUES (11, 3, 1, N'Master Turner Large
 - Soft Til brugere, med behov for nedsat friktion under hele kroppen.
Vendelagnet placeres ovenpå et madrascover.
Tynd, kølig og behagelig overflade.
Håndtag: 10 stk.
Brugervægt: max 200 kg
L:215 x W:150 cm
Vask: max 85 °C ', N'001-1732', 49368, N'002-1732.jpg')
INSERT [dbo].[tbl_FK_Produkt_Variation] ([ID], [FK_ProduktID], [FK_VariationID], [VariationInfo], [VariationVarenummer], [VariationHMInummer], [VariationImg]) VALUES (12, 4, 3, N'asdasdas', N'asasd', 123123, N'1123')
SET IDENTITY_INSERT [dbo].[tbl_FK_Produkt_Variation] OFF
SET IDENTITY_INSERT [dbo].[tbl_FK_Variation_Underkategori] ON 

INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (1, 1, 5)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (2, 1, 10)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (3, 2, 5)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (4, 2, 10)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (5, 3, 5)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (6, 3, 10)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (7, 4, 5)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (8, 4, 10)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (9, 5, 5)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (10, 5, 10)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (11, 6, 5)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (12, 6, 10)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (13, 7, 5)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (14, 7, 10)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (15, 8, 5)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (16, 8, 6)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (17, 8, 10)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (18, 8, 11)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (19, 8, 12)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (21, 11, 5)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (22, 11, 6)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (23, 11, 10)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (24, 11, 11)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (25, 11, 12)
INSERT [dbo].[tbl_FK_Variation_Underkategori] ([ID], [FK_VariationID], [FK_UnderkategoriID]) VALUES (26, 12, 1)
SET IDENTITY_INSERT [dbo].[tbl_FK_Variation_Underkategori] OFF
SET IDENTITY_INSERT [dbo].[tbl_Kategori] ON 

INSERT [dbo].[tbl_Kategori] ([ID], [KategoriNavn], [KategoriImg], [KategoriIkon], [KategoriUrl]) VALUES (1, N'Active Care', N'activecare-2.jpg', N'piktogram_active_care-300x300.png', N'active-care')
INSERT [dbo].[tbl_Kategori] ([ID], [KategoriNavn], [KategoriImg], [KategoriIkon], [KategoriUrl]) VALUES (2, N'Bed Care', N'bedcare-1.jpg', N'piktogram_bed_care-300x300.png', N'bed-care')
INSERT [dbo].[tbl_Kategori] ([ID], [KategoriNavn], [KategoriImg], [KategoriIkon], [KategoriUrl]) VALUES (3, N'Chair Care', N'chaircare-2.jpg', N'piktogram_chair_care-300x300.png', N'chair-care')
INSERT [dbo].[tbl_Kategori] ([ID], [KategoriNavn], [KategoriImg], [KategoriIkon], [KategoriUrl]) VALUES (4, N'Comfort Care', N'comfortcare-1.jpg', N'piktogram_comfort_care-300x300.png', N'comfort-care')
INSERT [dbo].[tbl_Kategori] ([ID], [KategoriNavn], [KategoriImg], [KategoriIkon], [KategoriUrl]) VALUES (5, N'Transfer Care', N'transfercare-1.jpg', N'piktogram_transfer_care-300x300.png', N'transfer-care')
INSERT [dbo].[tbl_Kategori] ([ID], [KategoriNavn], [KategoriImg], [KategoriIkon], [KategoriUrl]) VALUES (6, N'Tilbehør', N'tilbehør-2.jpg', N'tilbehør_ikon-1-300x300.png', N'tilbehoer')
SET IDENTITY_INSERT [dbo].[tbl_Kategori] OFF
SET IDENTITY_INSERT [dbo].[tbl_KontaktInfo] ON 

INSERT [dbo].[tbl_KontaktInfo] ([ID], [FirmaNavn], [VejNavn], [Postnummer], [Bynavn], [CVR], [Telefonnummer], [InfoMail], [Åbningstider]) VALUES (1, N'master care A/S', N'Sofienlystvej 3', 8340, N'Malling', 36941022, N'+45 86 93 85 85', N'info@master-care.dk', N'Mandag-torsdag: 08.00-16.00<br>Fredag: 08.00-13.00')
SET IDENTITY_INSERT [dbo].[tbl_KontaktInfo] OFF
SET IDENTITY_INSERT [dbo].[tbl_Menu] ON 

INSERT [dbo].[tbl_Menu] ([ID], [MenuNavn], [MenuUrl], [VisKategori]) VALUES (1, N'Forside', N'/', 0)
INSERT [dbo].[tbl_Menu] ([ID], [MenuNavn], [MenuUrl], [VisKategori]) VALUES (2, N'Human Handling Bank', N'/human-handling-bank', 1)
INSERT [dbo].[tbl_Menu] ([ID], [MenuNavn], [MenuUrl], [VisKategori]) VALUES (3, N'Master Academy', N'/master-academy', 0)
INSERT [dbo].[tbl_Menu] ([ID], [MenuNavn], [MenuUrl], [VisKategori]) VALUES (4, N'Nyheder', N'/nyheder', 0)
INSERT [dbo].[tbl_Menu] ([ID], [MenuNavn], [MenuUrl], [VisKategori]) VALUES (5, N'Om master care', N'/om-master-care', 0)
INSERT [dbo].[tbl_Menu] ([ID], [MenuNavn], [MenuUrl], [VisKategori]) VALUES (6, N'Kontakt', N'/kontakt', 0)
SET IDENTITY_INSERT [dbo].[tbl_Menu] OFF
SET IDENTITY_INSERT [dbo].[tbl_Nyheder] ON 

INSERT [dbo].[tbl_Nyheder] ([ID], [NyhedsNavn], [NyhedsTekst], [NyhedsImg], [NyhedsDato], [NyhedsUrl]) VALUES (1, N'Konkurrence Vinder', N'Stort tillykke til Rikke fra Ringsted
Det var med stor fornøjelse at master care kunne overrække og overraske med denne MTB i højt solskin.
Rikke er nemlig vinder af master care konkurrencen på Health & Rehab i Bella Centeret 2018.
Vi i master care ønsker dig en masse gode ture fremover – Husk cykelhjelmen', N'billede-af-Rikke-2.jpg', CAST(N'2018-05-17T00:00:00.000' AS DateTime), N'konkurrence-vinder')
INSERT [dbo].[tbl_Nyheder] ([ID], [NyhedsNavn], [NyhedsTekst], [NyhedsImg], [NyhedsDato], [NyhedsUrl]) VALUES (5, N'Vores Nye Hjemmeside', N'master care A/S har fået ny hjemmeside.

I den kommende tid vil der løbende komme nogle forbedringer, men vi håber, du har forståelse for, at der kan være nogle tekniske udfordringer.

Hvis du er i tvivl om selv den mindste lille detalje, så er vi altid klar på at hjælpe.

Ring til os på 86 93 85 85', N'nyhed_blank-495x400.png', CAST(N'2018-05-15T00:00:00.000' AS DateTime), N'vores-nye-hjemmeside')
INSERT [dbo].[tbl_Nyheder] ([ID], [NyhedsNavn], [NyhedsTekst], [NyhedsImg], [NyhedsDato], [NyhedsUrl]) VALUES (6, N'Bella Center 2018', N'master care finder du på stand nr. C4-060.

Hver time – med start kl. 11:00 – afholder vi forflytningsshow, hvor du kan se, hvordan vores produkter letter din hverdag og minimerer din risiko for arbejdsskader.

Vel mødt.', N'nyhed_blank-495x400.png', CAST(N'2018-05-04T00:00:00.000' AS DateTime), N'bella-center-2018')
INSERT [dbo].[tbl_Nyheder] ([ID], [NyhedsNavn], [NyhedsTekst], [NyhedsImg], [NyhedsDato], [NyhedsUrl]) VALUES (7, N'master care A/S på fagligt træf 2017', N'En præsentationsvideo fra BAR om Fagligt Træf', N'nyhed_blank-495x400.png', CAST(N'2017-10-31T00:00:00.000' AS DateTime), N'master-care-a-s-paa-fagligt-traef-2017')
SET IDENTITY_INSERT [dbo].[tbl_Nyheder] OFF
SET IDENTITY_INSERT [dbo].[tbl_Produkt] ON 

INSERT [dbo].[tbl_Produkt] ([ID], [ProduktNavn], [ProduktTekst], [ProduktVideo], [ProduktUrl], [ProduktImg], [ProduktVejledning], [FK_VejledningID], [FK_KategoriID], [VariationAntal]) VALUES (1, N'Quick ON', N'Quick ON er et faconsyet stræk glidelagen. Lagnet har en glat midterdel, der dækker fra øvre ryg til ned midt på benene. Kanten på Quick ON er hele vejen rundt forsynet med elastik og monteres derfor nemt om madrassens kanter. Fås både til almindelige skummadrasser og til Box-madrasser.', N'asdasd', N'quick-on', N'002-1952.jpg', NULL, 1, 2, 7)
INSERT [dbo].[tbl_Produkt] ([ID], [ProduktNavn], [ProduktTekst], [ProduktVideo], [ProduktUrl], [ProduktImg], [ProduktVejledning], [FK_VejledningID], [FK_KategoriID], [VariationAntal]) VALUES (2, N'Master Turner - Medium', N'Master Turner er et vendelagen til brugere med behov for nedsat friktion under kroppen for at fremme mobilisering, vending, forflytning ind og ud af seng samt forebygge shear. Hvis bruger ikke selv kan vende sig, kan systemet tilkobles en hvilken som helst gulv- eller loftlift, så personalets arbejdsbelastning nedsættes og forflytningerne gøres mere behagelig og skånsom for bruger.', N'asdasd', N'master-turner-medium', N'002-1722.jpg', NULL, 1, 2, 3)
INSERT [dbo].[tbl_Produkt] ([ID], [ProduktNavn], [ProduktTekst], [ProduktVideo], [ProduktUrl], [ProduktImg], [ProduktVejledning], [FK_VejledningID], [FK_KategoriID], [VariationAntal]) VALUES (3, N'Master Turner - Large', N'Master Turner er et vendelagen til brugere, med behov for nedsat friktion under kroppen for at fremme mobilisering, vending, forflytning ind og ud af seng samt forebygge shear. Hvis bruger ikke selv kan vende sig, kan systemet tilkobles en hvilken som helst gulv- eller loftlift, så personalets arbejdsbelastning nedsættes betydeligt og forflytningerne gøres mere behagelige og skånsomme for bruger.', N'asdasd', N'master-turner-large', N'002-1732.jpg', NULL, 1, 2, 1)
INSERT [dbo].[tbl_Produkt] ([ID], [ProduktNavn], [ProduktTekst], [ProduktVideo], [ProduktUrl], [ProduktImg], [ProduktVejledning], [FK_VejledningID], [FK_KategoriID], [VariationAntal]) VALUES (4, N'Dummy', N'asdasdasd', N'asdasd', N'dummy', N'dummy', NULL, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[tbl_Produkt] OFF
SET IDENTITY_INSERT [dbo].[tbl_SubMenu] ON 

INSERT [dbo].[tbl_SubMenu] ([ID], [SubMenuNavn], [SubMenuUrl], [FK_MenuID]) VALUES (7, N'Kundeservice', N'/om-master-care/kundeservice', 5)
INSERT [dbo].[tbl_SubMenu] ([ID], [SubMenuNavn], [SubMenuUrl], [FK_MenuID]) VALUES (8, N'Handels- og forretningsbetingelser', N'/om-master-care/handels-og-forretningsbetingelser', 5)
INSERT [dbo].[tbl_SubMenu] ([ID], [SubMenuNavn], [SubMenuUrl], [FK_MenuID]) VALUES (9, N'Medarbejdere', N'/kontakt/medarbejdere', 6)
SET IDENTITY_INSERT [dbo].[tbl_SubMenu] OFF
SET IDENTITY_INSERT [dbo].[tbl_Tekst] ON 

INSERT [dbo].[tbl_Tekst] ([ID], [Tekst], [Overskrift], [Billeder], [FK_TekstAlias]) VALUES (1, N'For at du, som sundhedsprofessionel får det bedste ud af vore hjælpemidler, er det vigtigt, at du får den rigtige forflytnings- og arbejdsteknik helt ind ”under huden”.

Ved at du får forbedret dine forflytningskompetencer, minimerer du din egen risiko for at få en arbejdsskade – hvilket din arbejdsgiver helt sikkert vil se meget positivt på – også ud fra en økonomisk synsvinkel – men du øger samtidig borgerens livskvalitet.

Master Academy tilbyder support i flere niveauer.

Master Care Phone Support

Er du:

– i tvivl om eller har du spørgsmål til hvilke af vore produkter, som opfylder din borgers behov i en given situation eller

– har du spørgsmål til dine muligheder med vore produkter, skal du kontakte os på telefon 8693 8585.

Master Care Video Support

Med Video Support kan du få konsulentbistand til en given forflytningsproblematik, som evt. ikke kan løses pr. telefon. Her kan du vise vor forflytningsspecialist hvilken problematik du står overfor og få kyndig vejledning i at løse opgaven.

Det eneste, du har behov for, er en skypeforbindelse via smartphone eller tablet.

Kontakt os på telefon 8693 8585 for at aftale tidspunkt og opkobling.

Fordelen ved vor online videorådgivning er, at du begrænser dit tidsforbrug i forhold til opgaven og samtidig gør det nemt at præcisere en løsning.

Online videorådgivning er gratis hos os.', NULL, NULL, 1)
INSERT [dbo].[tbl_Tekst] ([ID], [Tekst], [Overskrift], [Billeder], [FK_TekstAlias]) VALUES (2, N'Master Care Mail Support

Har du et konkret spørgsmål, kan du med fordel kontakte os på info@master-care.dk og du vil modtage svar inden for 48 timer.

Master Care Academy

Vore kurser afvikles som udgangspunkt ude hos dig, så teori omsættes til praksis i de fysiske rammer, du arbejder i til dagligt.

Det er muligt for dig at sammensætte kurset efter dine konkrete behov. Der tages udgangspunkt i konkrete borgercases og forflytningsproblematikker.

Har du ønsker om specifik eller kombinationsviden bl.a. om Master Turner, påklædning med glidestof, håndtering af tunge ben, demens eller bariatri, så kan vi også det.

For at du får optimalt udbytte af undervisningen, stiller du senge og loft-/ eller mobillift til rådighed. Vi medbringer alle produkter. Antallet af deltagere skal/bør være 4 kursister pr. seng/-lift.

Varighed ca. 4 timer.

Pris. 3.500 DKK + moms ved 12 kursister pr. kursus.

Master Care In House Academy

Har du ikke mulighed for at stille lokaler til rådighed, arrangerer vi undervisningen i vore lokaler i Malling.

Vort kursuslokale inkl. instruktør kan benyttes efter nærmere aftale.

Ring 8693 8585 og hør mere om dine muligheder.', NULL, NULL, 1)
INSERT [dbo].[tbl_Tekst] ([ID], [Tekst], [Overskrift], [Billeder], [FK_TekstAlias]) VALUES (3, N'Via faglighed og tæt kundedialog skaber vi innovative hjælpemidler med fokus på brugernes værdighed og dit arbejdsmiljø.

I master care nøjes vi ikke med at følge udviklingen – vi skaber den.

Vi er Danmarks førende udvikler og producent af forflytnings- og aktiveringshjælpemidler og har igennem mange år specialiseret os i forflytning; et område, som vi i dag er eksperter i.

Vi har egen produktion og kan derfor udvikle specialløsninger til dig.

Tre værdier er centrale for os:

1. Vi er innovative – og holder øje med både brugernes og plejepersonalets behov, så vi konstant kan udvikle både eksisterende og nye produkter, der gør det muligt at skabe optimale løsninger for alle parter.
2. Vi er ansvarlige – og føler ansvar for brugernes livskvalitet, plejepersonalets arbejdsmiljø, loyalitet mod samarbejdspartnere og arbejdsmiljøet blandt egne ansatte i master care.
3. Vi er servicemindede – og vi tilstæber at yde den bedste service baseret på høj faglighed og empati overfor både brugere og hjælpere.', N'Master Care                                                                                                                                                                                                                                               ', N'glide-vendesystemer-495x400.jpg', 2)
INSERT [dbo].[tbl_Tekst] ([ID], [Tekst], [Overskrift], [Billeder], [FK_TekstAlias]) VALUES (4, N'Vision

Vi vil fortsat være førende i Danmark indenfor udvikling af forflytningsprodukter, så vi er med til at præge udviklingen af forflytningsløsninger til gavn for dig.

Vi vil gøre vores bedste for at fortsætte som din foretrukne samarbejdspartner.

Mission

Via faglighed og tæt dialog med dig, vil vi være et skridt foran udviklingen og skabe innovative hjælpemidler, der har fokus på brugernes værdighed og dit arbejdsmiljø.', N'Mission & vision                                                                                                                                                                                                                                          ', N'vidarmikkeludvikling-298x300.jpg', 2)
INSERT [dbo].[tbl_Tekst] ([ID], [Tekst], [Overskrift], [Billeder], [FK_TekstAlias]) VALUES (5, N'I dag er master care førende i Skandinavien, når det gælder manuelle forflytnings- og aktiveringshjælpemidler.

master care A/S er en 100% danskejet virksomhed med produktion i DK og EU.

Dette forhold gør os i stand til løbende at føre tilsyn med vores strenge produktkontrol og derved levere vore produkter i højeste kvalitet.

Vi er fleksible og omstillingsparate og på forkant med udviklingen.

Vi har også muligheden for i tæt samarbejde med dig, at lave specialløsninger, som opfylder helt specifikke brugerkrav.

Vore kunder findes i alle segmenter, hvor det handler om forflytningsløsninger til både bruger og hjælpere.', N'Egenproduktion                                                                                                                                                                                                                                            ', N'egenproduktion.jpg', 2)
INSERT [dbo].[tbl_Tekst] ([ID], [Tekst], [Overskrift], [Billeder], [FK_TekstAlias]) VALUES (6, N'master care er i konstant vækst, derfor er du altid velkommen til at sende os en uopfordret ansøgning.

Du kan kort beskrive hvem du er, hvilken uddannelse og baggrund du har, hvad du brænder for arbejdsmæssigt og hvorfor du skal tages i betragtning til vores team næste gang, vi får en ledig plads.
Vi ønsker professionelle medarbejdere med arbejdsmæssige værdier, der matcher master care´s, således du kan bidrage med god energi og passe ind i vores team med den rette ånd.

Send en ansøgning til kim@master-care.dk, så hører du fra os.

Ledige stillinger
I øjeblikket har vi ingen ledige stillinger.', N'Jobs                                                                                                                                                                                                                                                      ', N'Vidar-Aage-Florian-288x300-1.jpg', 2)
SET IDENTITY_INSERT [dbo].[tbl_Tekst] OFF
SET IDENTITY_INSERT [dbo].[tbl_TekstAlias] ON 

INSERT [dbo].[tbl_TekstAlias] ([ID], [TekstAlias]) VALUES (1, N'masteracademy')
INSERT [dbo].[tbl_TekstAlias] ([ID], [TekstAlias]) VALUES (2, N'ommastercare')
SET IDENTITY_INSERT [dbo].[tbl_TekstAlias] OFF
SET IDENTITY_INSERT [dbo].[tbl_UnderKategori] ON 

INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (1, N'Dreje ind og ud af et bilsæde', N'Hjælpemidler, som virker forebyggende på nedslidning i forbindelse med hyppige ind- og udstigninger af bilen. Samtidig nedsættes belastningen ved ind- og udstigning, så ryggener kan reduceres.', NULL, N'dreje-ind-og-ud-af-et-bilsaede', 1)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (2, N'Mobilisering af bruger i kørestol', N'Hjælpemidler, som gør det lettere at mobilisere brugere i kørestol.', NULL, N'mobilisering-af-bruger-i-koerestol', 1)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (3, N'Rejse sætte sig fra toilet stol', N'Hjælpemidler, som gør det lettere at rejse og sætte sig på toilet.', NULL, N'rejse-saette-sig-fra-toilet-stol', 1)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (4, N'Støtte ved gang', N'Hjælpemidler, som gør det lettere at støtte brugere under gang. Benyttes af sundhedsprofessionelle i træning, pleje og akutte situationer.', NULL, N'stoette-ved-gang', 1)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (5, N'Dreje ind og ud af seng', N'Hjælpemidler som gør det lettere for brugere med let nedsat funktionsniveau at komme ind og ud af sengen.', NULL, N'dreje-ind-og-ud-af-seng', 2)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (6, N'Dreje ind og ud af seng svært nedsat funktionsniveau', N'Hjælpemidler som gør det muligt for brugere med svært nedsat funktionsniveau at komme ud at sidde på sengekant og retur.', NULL, N'dreje-ind-og-ud-af-seng-svaert-nedsat-funktionsniveau', 2)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (7, N'Flytte tunge ben ind og ud af sengen', N'Hjælpemidler som gør det lettere for hjælpere at håndtere tunge ben.', NULL, N'flytte-tunge-ben-ind-og-ud-af-sengen', 2)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (8, N'Forflytning på behandlingsleje', N'Hjælpemidler som gør forflytning på behandlingsleje skånsomt for bruger og hjælper.', NULL, N'forflytning-paa-behandlingsleje', 2)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (9, N'Forflytning til, fra og på badeleje', N'Hjælpemidler som gør håndtering i forbindelse med badesituationen lettere for bruger og hjælper.', NULL, N'forflytning-til-fra-og-paa-badeleje', 2)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (10, N'Forflytte og vende i seng let nedsat funktionsniveau', N'Hjælpemidler som gør det lettere for personer med let nedsat funktionsniveau at forflytte eller vende sig helt eller delvist selv.', NULL, N'forflytte-og-vende-i-seng-let-nedsat-funktionsniveau', 2)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (11, N'Forflytte og vende i seng svært nedsat funktionsniveau', N'Hjælpemidler som gør forflytninger i sengen lette for hjælper og skånsomme for brugere med svært nedsat funktionsniveau.', NULL, N'forflytte-og-vende-i-seng-svaert-nedsat-funktionsniveau', 2)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (12, N'Placering af løftesejl liggende', N'Hjælpemidler som gør det let at anlægge sejl på sengeliggende brugere og afhjælper shear-problematikker forbundet med liftning..', NULL, N'placering-af-loeftesejl-liggende', 2)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (13, N'Placering af røntgenkassette', N'Hjælpemidler som gør placering af røntgen-kasetter under tunge, passive og ofte smerteplagede brugere lettere for medarbejderne.', NULL, N'placering-af-roentgenkassette', 2)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (14, N'Støtte til at rejse sig op i seng', N'Hjælpemidler som støtter brugeren i at komme op at sidde i sengen og at rejse sig op.', NULL, N'stoette-til-at-rejse-sig-op-i-seng', 2)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (15, N'Vendelagen med planløft og liftfunktion', N'Vendelagen som udover nem håndtering i vendinger i seng, muliggør liftning og planløft..', NULL, N'vendelagen-med-planloeft-og-liftfunktion', 2)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (16, N'Inkontinens', N'Hjælpemidler som imødekommer inkontinensproblematikker i forbindelse med forflytning og lejring.', NULL, N'inkontinens', 2)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (17, N'Luftventilerende liggeunderlag', N'Hjælpemiddel som imødekommer behov for øget ventilation under brugeren.', NULL, N'luftventilerende-liggeunderlag', 2)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (18, N'Placering af sejl siddende', N'Her finder du en oversigt over de hjælpemidler som kan gøre det lettere for hjælper og bruger at få placeret løftesejl mens brugeren sidder i f.eks. kørestol.', NULL, N'placering-af-sejl-siddende', 3)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (19, N'Positionere bruger i stol', N'Hej med dig kim', NULL, N'positionere-bruger-i-stol', 3)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (20, N'Aflaste og støtte under arme siddende bruger', N'Aflastende puder som fordeler vægten jævnt under armene. Høj grad af komfort.', NULL, N'aflaste-og-stoette-under-arme-siddende-bruger', 4)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (21, N'Aflastning af hæle liggende bruger', N'Aflastende puder som fordeler vægten af benene jævnt og aflaster hælene. Høj grad af komfort.', NULL, N'aflastning-af-haele-liggende-bruger', 4)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (22, N'Aflastning og støtte af nakke liggende bruger', N'Aflastende puder som former sig efter nakken. Høj grad af komfort.', NULL, N'aflastning-og-stoette-af-nakke-liggende-bruger', 4)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (23, N'Aflastning under knæ liggende bruger', N'Kiler og puder som med høj komfort fordeler vægten og giver god aflastning under knæ.', NULL, N'aflastning-under-knae-liggende-bruger', 4)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (24, N'Stabilisere og støtte bruger foran, bag og liggende i sideleje', N'Kiler som skånsomt stabiliserer brugeren i forflytning til sideleje og efterfølgende lejring.', NULL, N'stabilisere-og-stoette-bruger-foran-bag-og-liggende-i-sideleje', 4)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (25, N'Stabilisere og støtte mellem ben siddende bruger', N'Puder som skånsomt nedsætter belastning mellem ben ved at fordele trykket. Høj komfort.', NULL, N'stabilisere-og-stoette-mellem-ben-siddende-bruger', 4)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (26, N'Stabilisere siddende bruger', N'Puder og kiler som støtter og stabiliserer brugere i siddende position.', NULL, N'stabilisere-siddende-bruger', 4)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (27, N'Støtte og aflastning under fødder liggende bruger', N'Puder og kiler som kan placeres i fodenden for at give en stabil placering i sengen. Særligt gode til at hindre nedad-glidning i plejeseng.', NULL, N'stoette-og-aflastning-under-foedder-liggende-bruger', 4)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (28, N'Støtte og stabilisere i side liggende bruger', N'Kiler og puder som effektivt giver tydelig afgrænsning, stabilitet og støtte for brugere i rygliggende stilling.', NULL, N'stoette-og-stabilisere-i-side-liggende-bruger', 4)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (29, N'Støtte og stabilisere mellem ben fikseret vending i sideleje', N'Puder som effektivt kan aflaste mellem ben. Perfekt når fikseret vending foretages.', NULL, N'stoette-og-stabilisere-mellem-ben-fikseret-vending-i-sideleje', 4)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (30, N'Støtte bruger i spisesituation', N'Produkter som skånsomt støtter brugere i en optimal placering i spisesituationen.', NULL, N'stoette-bruger-i-spisesituation', 4)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (31, N'Understøtte og stabilisere under ben i sideleje liggende bruger', N'Puder i flere variationer som effektivt støtter ben i sideleje. Effektivt mod smerter i ryggen og gør hygiejneopgaver lettere for hjælperen.', NULL, N'understoette-og-stabilisere-under-ben-i-sideleje-liggende-bruger', 4)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (32, N'Dreje stående', N'Produkter som gør det lettere at lave forflytninger hvor bruger ikke kan flytte benene, men godt kan stå, f.eks. at forflytte brugeren stående.', NULL, N'dreje-staaende', 5)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (33, N'Forflytning fra gulv til seng/båre', N'Produkter som gør det lettere og mere behageligt at forflytte brugere fra gulv til båre eller seng.', NULL, N'forflytning-fra-gulv-til-seng-baare', 5)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (34, N'Overflytning mellem siddeflader op til 20 cm', N'Lette og fleksible produkter til overflytninger mellem siddeflader.', NULL, N'overflytning-mellem-siddeflader-op-til-20-cm', 5)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (35, N'Overflytning mellem siddeflader op til 40 cm', N'Kraftige og stabile produkter der muliggør overflytninger mellem siddeflader op til 40 cm.', NULL, N'overflytning-mellem-siddeflader-op-til-40-cm', 5)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (36, N'Overflytning mellem to liggelejer bruger kan selv flytte ben', N'Produkter som egner sig til liggende overflytninger, men hvor brugere kan hjælpe til med benene.', NULL, N'overflytning-mellem-to-liggelejer-bruger-kan-selv-flytte-ben', 5)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (37, N'Overflytning mellem to liggelejer bruger passiv
', N'Produkter til liggende overflytning af brugere som ikke kan hjælpe til under overflytning.', NULL, N'overflytning-mellem-to-liggelejer-bruger-passiv', 5)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (38, N'Forflytte til og fra behandlingsleje/ct-scanner', N'Produkter til forflytning langs eller på tværs af behandlings/- og CT leje.', NULL, N'forflytte-til-og-fra-behandlingsleje-ct-scanner', 5)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (39, N'Master turner tilbehør', N'Her finder du tilbehør til Master Turner serien der gør forflytningerne endnu nemmere.', NULL, N'master-turner-tilbehoer', 6)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (40, N'Madrascover ilf/ilf-elastic tilbehør', N'Tilbehør til madrascover ILF og ILF elastic. Gør det let at tilpasse madrascovers til forskellige breddestørrelser på madrasser.', NULL, N'madrascover-ilf-ilf-elastic-tilbehoer', 6)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (41, N'One way master tilbehør', N'Tilbehør til One Way Master – Åben. Gør det muligt at bruge benet til at trække bruger tilbage i stolen i stedet for armen.', NULL, N'one-way-master-tilbehoer', 6)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (42, N'Master glide flexi tilbehør', N'Tilbehør til Master Glide Flexi. Gør det endnu lettere at overflytte mellem afstande.', NULL, N'master-glide-flexi-tilbehoer', 6)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (43, N'Master board tilbehør', N'Gør det lettere at overholde høje hygiejnekrav og bevare gode forflytningsbetingelser med Master Board.', NULL, N'master-board-tilbehoer', 6)
INSERT [dbo].[tbl_UnderKategori] ([ID], [UnderKategoriNavn], [UnderKategoriTekst], [UnderKategoriVideo], [UnderKategoriUrl], [FK_KategoriID]) VALUES (44, N'Rollboard vision tilbehør', N'Gør det lettere at overholde høje hygiejnekrav og bevare gode forflytningsbetingelser med Roll Board Vision.', NULL, N'rollboard-vision-tilbehoer', 6)
SET IDENTITY_INSERT [dbo].[tbl_UnderKategori] OFF
SET IDENTITY_INSERT [dbo].[tbl_Variation] ON 

INSERT [dbo].[tbl_Variation] ([ID], [VariationNavn]) VALUES (1, N'Soft')
INSERT [dbo].[tbl_Variation] ([ID], [VariationNavn]) VALUES (2, N'Elastic')
INSERT [dbo].[tbl_Variation] ([ID], [VariationNavn]) VALUES (3, N'Frotté')
INSERT [dbo].[tbl_Variation] ([ID], [VariationNavn]) VALUES (4, N'Box Stretch - 120')
INSERT [dbo].[tbl_Variation] ([ID], [VariationNavn]) VALUES (5, N'Box Stretch - 150')
INSERT [dbo].[tbl_Variation] ([ID], [VariationNavn]) VALUES (6, N'Box Stretch - 160 (Venstre)')
INSERT [dbo].[tbl_Variation] ([ID], [VariationNavn]) VALUES (7, N'Box Stretch - 80')
INSERT [dbo].[tbl_Variation] ([ID], [VariationNavn]) VALUES (8, N'Stretch - 120')
INSERT [dbo].[tbl_Variation] ([ID], [VariationNavn]) VALUES (9, N'Stretch - 150')
INSERT [dbo].[tbl_Variation] ([ID], [VariationNavn]) VALUES (10, N'Stretch - 80')
SET IDENTITY_INSERT [dbo].[tbl_Variation] OFF
USE [master]
GO
ALTER DATABASE [dbmastercare] SET  READ_WRITE 
GO
