USE [master]
GO
/****** Object:  Database [EntranceExaminations]    Script Date: 27.01.2025 23:49:23 ******/
CREATE DATABASE [EntranceExaminations]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EntranceExaminations', FILENAME = N'I:\SQLServer\MSSQL16.MSSQLSERVER\MSSQL\DATA\EntranceExaminations.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EntranceExaminations_log', FILENAME = N'I:\SQLServer\MSSQL16.MSSQLSERVER\MSSQL\DATA\EntranceExaminations_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EntranceExaminations] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EntranceExaminations].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EntranceExaminations] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EntranceExaminations] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EntranceExaminations] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EntranceExaminations] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EntranceExaminations] SET ARITHABORT OFF 
GO
ALTER DATABASE [EntranceExaminations] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EntranceExaminations] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EntranceExaminations] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EntranceExaminations] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EntranceExaminations] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EntranceExaminations] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EntranceExaminations] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EntranceExaminations] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EntranceExaminations] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EntranceExaminations] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EntranceExaminations] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EntranceExaminations] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EntranceExaminations] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EntranceExaminations] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EntranceExaminations] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EntranceExaminations] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EntranceExaminations] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EntranceExaminations] SET RECOVERY FULL 
GO
ALTER DATABASE [EntranceExaminations] SET  MULTI_USER 
GO
ALTER DATABASE [EntranceExaminations] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EntranceExaminations] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EntranceExaminations] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EntranceExaminations] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EntranceExaminations] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EntranceExaminations] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EntranceExaminations', N'ON'
GO
ALTER DATABASE [EntranceExaminations] SET QUERY_STORE = ON
GO
ALTER DATABASE [EntranceExaminations] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EntranceExaminations]
GO
/****** Object:  Table [dbo].[Абитуриенты]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Абитуриенты](
	[Код абитуриента] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [varchar](100) NOT NULL,
	[Год рождения] [int] NULL,
	[Номер телефона] [varchar](20) NULL,
	[Код типа] [int] NULL,
	[Код льготы] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Код абитуриента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Апелляции]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Апелляции](
	[Номер апелляции] [int] IDENTITY(1,1) NOT NULL,
	[Дата] [datetime] NOT NULL,
	[Код абитуриента] [int] NULL,
	[Код испытания] [int] NULL,
	[Код статуса] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер апелляции] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Аудитории]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Аудитории](
	[Код аудитории] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
	[Код типа] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Код аудитории] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Документы]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Документы](
	[Код документа] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код документа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заявление на апелляцию]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявление на апелляцию](
	[Номер заявления] [int] IDENTITY(1,1) NOT NULL,
	[Дата] [datetime] NOT NULL,
	[Причина апелляции] [text] NULL,
	[Код абитуриента] [int] NULL,
	[Код испытания] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер заявления] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заявление на обучение]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявление на обучение](
	[Номер заявления] [int] IDENTITY(1,1) NOT NULL,
	[Дата] [datetime] NOT NULL,
	[Код формы] [int] NULL,
	[Код абитуриента] [int] NULL,
	[Код специальности] [int] NULL,
	[Код статуса] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер заявления] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Звание]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Звание](
	[Код звания] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код звания] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Испытания]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Испытания](
	[Код испытания] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
	[Код типа] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Код испытания] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Льготы]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Льготы](
	[Код льготы] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код льготы] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ответственные за испытания]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ответственные за испытания](
	[Код ответственного] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [varchar](100) NOT NULL,
	[Код звания] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Код ответственного] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Расписание испытаний]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Расписание испытаний](
	[Номер испытания] [int] IDENTITY(1,1) NOT NULL,
	[Дата] [datetime] NOT NULL,
	[Код аудитории] [int] NULL,
	[Код испытания] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер испытания] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Расписка о документах]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Расписка о документах](
	[Номер расписки] [int] IDENTITY(1,1) NOT NULL,
	[Дата] [datetime] NOT NULL,
	[Код документа] [int] NULL,
	[Код абитуриента] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер расписки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Результаты испытаний]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Результаты испытаний](
	[Номер испытания] [int] IDENTITY(1,1) NOT NULL,
	[Дата] [datetime] NOT NULL,
	[Код ответственного] [int] NULL,
	[Код испытания] [int] NULL,
	[Код абитуриента] [int] NULL,
	[Оценка] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер испытания] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Специальности]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Специальности](
	[Код специальности] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
	[Код факультета] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Код специальности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Справка о выдаче документов]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Справка о выдаче документов](
	[Номер справки] [int] IDENTITY(1,1) NOT NULL,
	[Дата] [datetime] NOT NULL,
	[Код абитуриента] [int] NULL,
	[Номер расписки] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер справки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Справка о зачислении]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Справка о зачислении](
	[Номер справки] [int] IDENTITY(1,1) NOT NULL,
	[Дата] [datetime] NOT NULL,
	[Код абитуриента] [int] NULL,
	[Код специальности] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер справки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Справка о нарушении]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Справка о нарушении](
	[Номер справки] [int] IDENTITY(1,1) NOT NULL,
	[Дата] [datetime] NOT NULL,
	[Нарушение] [text] NULL,
	[Код абитуриента] [int] NULL,
	[Код испытания] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер справки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Статус апелляции]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Статус апелляции](
	[Код статуса] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код статуса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Статусы заявлений]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Статусы заявлений](
	[Код статуса] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код статуса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тип абитуриента]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тип абитуриента](
	[Код типа] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код типа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тип аудитории]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тип аудитории](
	[Код типа] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код типа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тип испытаний]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тип испытаний](
	[Код типа] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код типа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Уведомление об испытаниях]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Уведомление об испытаниях](
	[Номер уведомления] [int] IDENTITY(1,1) NOT NULL,
	[Дата] [datetime] NOT NULL,
	[Код абитуриента] [int] NULL,
	[Номер испытания] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер уведомления] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Факультеты]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Факультеты](
	[Код факультета] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код факультета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Форма обучения]    Script Date: 27.01.2025 23:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Форма обучения](
	[Код формы] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код формы] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Абитуриенты]  WITH CHECK ADD FOREIGN KEY([Код льготы])
REFERENCES [dbo].[Льготы] ([Код льготы])
GO
ALTER TABLE [dbo].[Абитуриенты]  WITH CHECK ADD FOREIGN KEY([Код типа])
REFERENCES [dbo].[Тип абитуриента] ([Код типа])
GO
ALTER TABLE [dbo].[Апелляции]  WITH CHECK ADD FOREIGN KEY([Код абитуриента])
REFERENCES [dbo].[Абитуриенты] ([Код абитуриента])
GO
ALTER TABLE [dbo].[Апелляции]  WITH CHECK ADD FOREIGN KEY([Код испытания])
REFERENCES [dbo].[Испытания] ([Код испытания])
GO
ALTER TABLE [dbo].[Апелляции]  WITH CHECK ADD FOREIGN KEY([Код статуса])
REFERENCES [dbo].[Статус апелляции] ([Код статуса])
GO
ALTER TABLE [dbo].[Аудитории]  WITH CHECK ADD FOREIGN KEY([Код типа])
REFERENCES [dbo].[Тип аудитории] ([Код типа])
GO
ALTER TABLE [dbo].[Заявление на апелляцию]  WITH CHECK ADD FOREIGN KEY([Код абитуриента])
REFERENCES [dbo].[Абитуриенты] ([Код абитуриента])
GO
ALTER TABLE [dbo].[Заявление на апелляцию]  WITH CHECK ADD FOREIGN KEY([Код испытания])
REFERENCES [dbo].[Испытания] ([Код испытания])
GO
ALTER TABLE [dbo].[Заявление на обучение]  WITH CHECK ADD FOREIGN KEY([Код абитуриента])
REFERENCES [dbo].[Абитуриенты] ([Код абитуриента])
GO
ALTER TABLE [dbo].[Заявление на обучение]  WITH CHECK ADD FOREIGN KEY([Код специальности])
REFERENCES [dbo].[Специальности] ([Код специальности])
GO
ALTER TABLE [dbo].[Заявление на обучение]  WITH CHECK ADD FOREIGN KEY([Код статуса])
REFERENCES [dbo].[Статусы заявлений] ([Код статуса])
GO
ALTER TABLE [dbo].[Заявление на обучение]  WITH CHECK ADD FOREIGN KEY([Код формы])
REFERENCES [dbo].[Форма обучения] ([Код формы])
GO
ALTER TABLE [dbo].[Испытания]  WITH CHECK ADD FOREIGN KEY([Код типа])
REFERENCES [dbo].[Тип испытаний] ([Код типа])
GO
ALTER TABLE [dbo].[Ответственные за испытания]  WITH CHECK ADD FOREIGN KEY([Код звания])
REFERENCES [dbo].[Звание] ([Код звания])
GO
ALTER TABLE [dbo].[Расписание испытаний]  WITH CHECK ADD FOREIGN KEY([Код аудитории])
REFERENCES [dbo].[Аудитории] ([Код аудитории])
GO
ALTER TABLE [dbo].[Расписание испытаний]  WITH CHECK ADD FOREIGN KEY([Код испытания])
REFERENCES [dbo].[Испытания] ([Код испытания])
GO
ALTER TABLE [dbo].[Расписка о документах]  WITH CHECK ADD FOREIGN KEY([Код абитуриента])
REFERENCES [dbo].[Абитуриенты] ([Код абитуриента])
GO
ALTER TABLE [dbo].[Расписка о документах]  WITH CHECK ADD FOREIGN KEY([Код документа])
REFERENCES [dbo].[Документы] ([Код документа])
GO
ALTER TABLE [dbo].[Результаты испытаний]  WITH CHECK ADD FOREIGN KEY([Код абитуриента])
REFERENCES [dbo].[Абитуриенты] ([Код абитуриента])
GO
ALTER TABLE [dbo].[Результаты испытаний]  WITH CHECK ADD FOREIGN KEY([Код испытания])
REFERENCES [dbo].[Испытания] ([Код испытания])
GO
ALTER TABLE [dbo].[Результаты испытаний]  WITH CHECK ADD FOREIGN KEY([Код ответственного])
REFERENCES [dbo].[Ответственные за испытания] ([Код ответственного])
GO
ALTER TABLE [dbo].[Специальности]  WITH CHECK ADD FOREIGN KEY([Код факультета])
REFERENCES [dbo].[Факультеты] ([Код факультета])
GO
ALTER TABLE [dbo].[Справка о выдаче документов]  WITH CHECK ADD FOREIGN KEY([Код абитуриента])
REFERENCES [dbo].[Абитуриенты] ([Код абитуриента])
GO
ALTER TABLE [dbo].[Справка о выдаче документов]  WITH CHECK ADD FOREIGN KEY([Номер расписки])
REFERENCES [dbo].[Расписка о документах] ([Номер расписки])
GO
ALTER TABLE [dbo].[Справка о зачислении]  WITH CHECK ADD FOREIGN KEY([Код абитуриента])
REFERENCES [dbo].[Абитуриенты] ([Код абитуриента])
GO
ALTER TABLE [dbo].[Справка о зачислении]  WITH CHECK ADD FOREIGN KEY([Код специальности])
REFERENCES [dbo].[Специальности] ([Код специальности])
GO
ALTER TABLE [dbo].[Справка о нарушении]  WITH CHECK ADD FOREIGN KEY([Код абитуриента])
REFERENCES [dbo].[Абитуриенты] ([Код абитуриента])
GO
ALTER TABLE [dbo].[Справка о нарушении]  WITH CHECK ADD FOREIGN KEY([Код испытания])
REFERENCES [dbo].[Испытания] ([Код испытания])
GO
ALTER TABLE [dbo].[Уведомление об испытаниях]  WITH CHECK ADD FOREIGN KEY([Код абитуриента])
REFERENCES [dbo].[Абитуриенты] ([Код абитуриента])
GO
ALTER TABLE [dbo].[Уведомление об испытаниях]  WITH CHECK ADD FOREIGN KEY([Номер испытания])
REFERENCES [dbo].[Расписание испытаний] ([Номер испытания])
GO
ALTER TABLE [dbo].[Абитуриенты]  WITH CHECK ADD CHECK  (([Год рождения]>=(1900) AND [Год рождения]<=datepart(year,getdate())))
GO
ALTER TABLE [dbo].[Результаты испытаний]  WITH CHECK ADD CHECK  (([Оценка]>=(0) AND [Оценка]<=(100)))
GO
USE [master]
GO
ALTER DATABASE [EntranceExaminations] SET  READ_WRITE 
GO
