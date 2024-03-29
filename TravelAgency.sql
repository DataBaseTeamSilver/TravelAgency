USE [master]
GO
/****** Object:  Database [TravelAgency]    Script Date: 7.10.2015 г. 13:10:29 ******/
CREATE DATABASE [TravelAgency]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TravelAgency', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TravelAgency.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TravelAgency_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TravelAgency_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TravelAgency] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TravelAgency].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TravelAgency] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TravelAgency] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TravelAgency] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TravelAgency] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TravelAgency] SET ARITHABORT OFF 
GO
ALTER DATABASE [TravelAgency] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TravelAgency] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TravelAgency] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TravelAgency] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TravelAgency] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TravelAgency] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TravelAgency] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TravelAgency] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TravelAgency] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TravelAgency] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TravelAgency] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TravelAgency] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TravelAgency] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TravelAgency] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TravelAgency] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TravelAgency] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TravelAgency] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TravelAgency] SET RECOVERY FULL 
GO
ALTER DATABASE [TravelAgency] SET  MULTI_USER 
GO
ALTER DATABASE [TravelAgency] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TravelAgency] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TravelAgency] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TravelAgency] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TravelAgency] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TravelAgency', N'ON'
GO
USE [TravelAgency]
GO
/****** Object:  Table [dbo].[Destinations]    Script Date: 7.10.2015 г. 13:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destinations](
	[DestinationId] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](50) NULL,
	[Town] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Destinations] PRIMARY KEY CLUSTERED 
(
	[DestinationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Excursions]    Script Date: 7.10.2015 г. 13:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Excursions](
	[ExcursionId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DestinationId] [int] NOT NULL,
	[Clients] [int] NOT NULL,
	[PricePerClient] [money] NOT NULL,
	[GuideId] [int] NULL,
	[TransportId] [int] NULL,
	[IsFinished] [bit] NOT NULL,
 CONSTRAINT [PK_Excursions] PRIMARY KEY CLUSTERED 
(
	[ExcursionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Guides]    Script Date: 7.10.2015 г. 13:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guides](
	[GuideId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Skill] [nvarchar](50) NOT NULL,
	[GSM] [int] NULL,
	[ManagerID] [int] NULL,
 CONSTRAINT [PK_Guides] PRIMARY KEY CLUSTERED 
(
	[GuideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Spendings]    Script Date: 7.10.2015 г. 13:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spendings](
	[ExcursionId] [int] NOT NULL,
	[ForTransport] [money] NOT NULL,
	[ForHotel] [money] NOT NULL,
	[ForTaxes] [money] NOT NULL,
 CONSTRAINT [PK_Spendings] PRIMARY KEY CLUSTERED 
(
	[ExcursionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transport]    Script Date: 7.10.2015 г. 13:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transport](
	[TransportId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[MaxCapacity] [int] NOT NULL,
 CONSTRAINT [PK_Transport] PRIMARY KEY CLUSTERED 
(
	[TransportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Excursions]  WITH CHECK ADD  CONSTRAINT [FK_Excursions_Destinations] FOREIGN KEY([DestinationId])
REFERENCES [dbo].[Destinations] ([DestinationId])
GO
ALTER TABLE [dbo].[Excursions] CHECK CONSTRAINT [FK_Excursions_Destinations]
GO
ALTER TABLE [dbo].[Excursions]  WITH CHECK ADD  CONSTRAINT [FK_Excursions_Guides] FOREIGN KEY([GuideId])
REFERENCES [dbo].[Guides] ([GuideId])
GO
ALTER TABLE [dbo].[Excursions] CHECK CONSTRAINT [FK_Excursions_Guides]
GO
ALTER TABLE [dbo].[Excursions]  WITH CHECK ADD  CONSTRAINT [FK_Excursions_Spendings] FOREIGN KEY([ExcursionId])
REFERENCES [dbo].[Spendings] ([ExcursionId])
GO
ALTER TABLE [dbo].[Excursions] CHECK CONSTRAINT [FK_Excursions_Spendings]
GO
ALTER TABLE [dbo].[Excursions]  WITH CHECK ADD  CONSTRAINT [FK_Excursions_Transport] FOREIGN KEY([TransportId])
REFERENCES [dbo].[Transport] ([TransportId])
GO
ALTER TABLE [dbo].[Excursions] CHECK CONSTRAINT [FK_Excursions_Transport]
GO
ALTER TABLE [dbo].[Guides]  WITH CHECK ADD  CONSTRAINT [FK_Guides_Guides] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Guides] ([GuideId])
GO
ALTER TABLE [dbo].[Guides] CHECK CONSTRAINT [FK_Guides_Guides]
GO
USE [master]
GO
ALTER DATABASE [TravelAgency] SET  READ_WRITE 
GO
