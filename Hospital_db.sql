USE [master]
GO
/****** Object:  Database [Hastane]    Script Date: 13.05.2022 16:11:40 ******/
CREATE DATABASE [Hastane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hastane', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hastane.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hastane_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hastane_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hastane] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hastane].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hastane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hastane] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hastane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hastane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hastane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hastane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hastane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hastane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hastane] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hastane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hastane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hastane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hastane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hastane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hastane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hastane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hastane] SET RECOVERY FULL 
GO
ALTER DATABASE [Hastane] SET  MULTI_USER 
GO
ALTER DATABASE [Hastane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hastane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hastane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hastane] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hastane] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hastane] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hastane', N'ON'
GO
ALTER DATABASE [Hastane] SET QUERY_STORE = OFF
GO
USE [Hastane]
GO
/****** Object:  Table [dbo].[Doktorlar]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktorlar](
	[DoktorNo] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](50) NULL,
	[TCNo] [char](11) NULL,
	[UzmanlikAlani] [varchar](50) NULL,
	[Unvan] [varchar](50) NULL,
	[Telefon] [char](11) NULL,
	[Adres] [varchar](100) NULL,
	[DogumTarihi] [date] NULL,
	[PoliklinikNo] [int] NULL,
 CONSTRAINT [PK_Doktorlar] PRIMARY KEY CLUSTERED 
(
	[DoktorNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hastalar]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastalar](
	[HastaNo] [int] IDENTITY(1,1) NOT NULL,
	[HastaAdSoyad] [varchar](50) NULL,
	[HastaTCNo] [char](11) NULL,
	[HastaDogumTarihi] [date] NULL,
	[Boy] [int] NULL,
	[yas] [int] NULL,
	[OdaNo] [int] NULL,
	[Recete] [varchar](50) NULL,
	[RaporDurumu] [varchar](50) NULL,
	[RandevuTarihi] [date] NULL,
	[DoktorNo] [int] NULL,
 CONSTRAINT [PK_Hastalar] PRIMARY KEY CLUSTERED 
(
	[HastaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[KullaniciNo] [int] IDENTITY(1,1) NOT NULL,
	[Sifre] [varchar](50) NULL,
	[KullaniciAdi] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[Telefon] [char](10) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[KullaniciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odalar]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odalar](
	[OdaNo] [int] IDENTITY(1,1) NOT NULL,
	[Oda] [int] NULL,
	[poliklinikno] [int] NULL,
 CONSTRAINT [PK_Odalar] PRIMARY KEY CLUSTERED 
(
	[OdaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poliklinikler]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poliklinikler](
	[PoliklinikNo] [int] IDENTITY(1,1) NOT NULL,
	[PoliklinikAdi] [varchar](50) NULL,
	[PoliklinikUzmanSayisi] [int] NULL,
	[PoliklinikBaskani] [varchar](50) NULL,
	[PoliklinikBasHemsire] [varchar](50) NULL,
	[YatakSayisi] [int] NULL,
 CONSTRAINT [PK_Poliklinikler] PRIMARY KEY CLUSTERED 
(
	[PoliklinikNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doktorlar] ON 

INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [TCNo], [UzmanlikAlani], [Unvan], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo]) VALUES (1, N'İhsan Ak', N'12345678   ', N'Gastroentroloji Cerrahisi', N'Yardımcı doçent', N'(556) 546-5', N'istanbul', CAST(N'1985-01-01' AS Date), 1)
INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [TCNo], [UzmanlikAlani], [Unvan], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo]) VALUES (2, N'İpek  Karaman  ', N'8515545    ', N'Nöroloji', N'Doçent', N'(225) 878-7', N'Ankara', CAST(N'1982-09-10' AS Date), 2)
INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [TCNo], [UzmanlikAlani], [Unvan], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo]) VALUES (3, N'Turgay Yıldırım', N'564885321  ', N'Çocuk Kalp ve Damar Cerrahisi', N'Doçent', N'(846) 546-4', N'İzmir', CAST(N'1982-09-10' AS Date), 8)
INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [TCNo], [UzmanlikAlani], [Unvan], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo]) VALUES (4, N'Ayşe Açıkgöz', N'89431276453', N'Yoğun Bakım', N'Operatör Doktor', N'(356) 565-4', N'Ankara', CAST(N'1991-12-20' AS Date), 3)
SET IDENTITY_INSERT [dbo].[Doktorlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Hastalar] ON 

INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTCNo], [HastaDogumTarihi], [Boy], [yas], [OdaNo], [Recete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (1, N'John Dorian', N'12345678912', CAST(N'2017-02-02' AS Date), 123, 5, 3, N'r-', N'v', CAST(N'2022-04-14' AS Date), 1)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTCNo], [HastaDogumTarihi], [Boy], [yas], [OdaNo], [Recete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (2, N'Elliot Reid', N'69645678912', CAST(N'2015-02-04' AS Date), 130, 7, 6, N'r-', N'v', CAST(N'2022-04-22' AS Date), 4)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTCNo], [HastaDogumTarihi], [Boy], [yas], [OdaNo], [Recete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (3, N'Percival Cox', N'78645678912', CAST(N'2012-02-09' AS Date), 138, 10, 11, N'r-', N'v', CAST(N'2022-04-22' AS Date), 2)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTCNo], [HastaDogumTarihi], [Boy], [yas], [OdaNo], [Recete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (4, N'Bob Kelso', N'43145678912', CAST(N'1990-11-30' AS Date), 180, 32, 12, N'r-', N'v', CAST(N'2022-05-13' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Hastalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

INSERT [dbo].[Kullanicilar] ([KullaniciNo], [Sifre], [KullaniciAdi], [Mail], [Telefon]) VALUES (1, N'12345', N'nesim', N'nesim@gmail.com', N'5551112233')
INSERT [dbo].[Kullanicilar] ([KullaniciNo], [Sifre], [KullaniciAdi], [Mail], [Telefon]) VALUES (2, N'12345', N'nesim', N'nesim@gmail.com', N'5551112233')
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
GO
SET IDENTITY_INSERT [dbo].[Odalar] ON 

INSERT [dbo].[Odalar] ([OdaNo], [Oda], [poliklinikno]) VALUES (1, 121, 1)
INSERT [dbo].[Odalar] ([OdaNo], [Oda], [poliklinikno]) VALUES (2, 122, 1)
INSERT [dbo].[Odalar] ([OdaNo], [Oda], [poliklinikno]) VALUES (3, 123, 1)
INSERT [dbo].[Odalar] ([OdaNo], [Oda], [poliklinikno]) VALUES (4, 124, 1)
INSERT [dbo].[Odalar] ([OdaNo], [Oda], [poliklinikno]) VALUES (5, 512, 3)
INSERT [dbo].[Odalar] ([OdaNo], [Oda], [poliklinikno]) VALUES (6, 513, 3)
INSERT [dbo].[Odalar] ([OdaNo], [Oda], [poliklinikno]) VALUES (7, 514, 3)
INSERT [dbo].[Odalar] ([OdaNo], [Oda], [poliklinikno]) VALUES (8, 515, 3)
INSERT [dbo].[Odalar] ([OdaNo], [Oda], [poliklinikno]) VALUES (9, 212, 8)
INSERT [dbo].[Odalar] ([OdaNo], [Oda], [poliklinikno]) VALUES (10, 213, 8)
INSERT [dbo].[Odalar] ([OdaNo], [Oda], [poliklinikno]) VALUES (11, 214, 8)
INSERT [dbo].[Odalar] ([OdaNo], [Oda], [poliklinikno]) VALUES (12, 215, 8)
SET IDENTITY_INSERT [dbo].[Odalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Poliklinikler] ON 

INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [PoliklinikAdi], [PoliklinikUzmanSayisi], [PoliklinikBaskani], [PoliklinikBasHemsire], [YatakSayisi]) VALUES (1, N'Genel Cerrahi', 3, N'Ahmet Kaya', N'murat öz', 25)
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [PoliklinikAdi], [PoliklinikUzmanSayisi], [PoliklinikBaskani], [PoliklinikBasHemsire], [YatakSayisi]) VALUES (2, N'Nöroloji', 2, N'Nihad yurt', N'Abdullah yıldız', 10)
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [PoliklinikAdi], [PoliklinikUzmanSayisi], [PoliklinikBaskani], [PoliklinikBasHemsire], [YatakSayisi]) VALUES (3, N'Genel Dahiliye', 3, N'zehra demir', N'Nazlı N', 12)
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [PoliklinikAdi], [PoliklinikUzmanSayisi], [PoliklinikBaskani], [PoliklinikBasHemsire], [YatakSayisi]) VALUES (7, N'Kulak burun boğaz ', 5, N'Öznur DEMİR  ', N'Ömer GÖKKAYA', 50)
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [PoliklinikAdi], [PoliklinikUzmanSayisi], [PoliklinikBaskani], [PoliklinikBasHemsire], [YatakSayisi]) VALUES (8, N'Kalp ', 6, N'Ayşe naz  ', N'Hasan Urun', 25)
SET IDENTITY_INSERT [dbo].[Poliklinikler] OFF
GO
ALTER TABLE [dbo].[Doktorlar]  WITH CHECK ADD  CONSTRAINT [FK_Doktorlar_Poliklinikler] FOREIGN KEY([PoliklinikNo])
REFERENCES [dbo].[Poliklinikler] ([PoliklinikNo])
GO
ALTER TABLE [dbo].[Doktorlar] CHECK CONSTRAINT [FK_Doktorlar_Poliklinikler]
GO
ALTER TABLE [dbo].[Hastalar]  WITH CHECK ADD  CONSTRAINT [FK_Hastalar_Doktorlar] FOREIGN KEY([DoktorNo])
REFERENCES [dbo].[Doktorlar] ([DoktorNo])
GO
ALTER TABLE [dbo].[Hastalar] CHECK CONSTRAINT [FK_Hastalar_Doktorlar]
GO
ALTER TABLE [dbo].[Hastalar]  WITH CHECK ADD  CONSTRAINT [FK_Hastalar_Odalar] FOREIGN KEY([OdaNo])
REFERENCES [dbo].[Odalar] ([OdaNo])
GO
ALTER TABLE [dbo].[Hastalar] CHECK CONSTRAINT [FK_Hastalar_Odalar]
GO
ALTER TABLE [dbo].[Odalar]  WITH CHECK ADD  CONSTRAINT [FK_Odalar_Poliklinikler] FOREIGN KEY([poliklinikno])
REFERENCES [dbo].[Poliklinikler] ([PoliklinikNo])
GO
ALTER TABLE [dbo].[Odalar] CHECK CONSTRAINT [FK_Odalar_Poliklinikler]
GO
/****** Object:  StoredProcedure [dbo].[AddKullanici]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[AddKullanici]
@KullaniciAdi varchar(50),
@sifre varchar(50),
@Mail varchar(50),
@Telefon varchar(50)
as begin 
insert into Kullanicilar (KullaniciAdi,sifre,Mail,Telefon)
values (@KullaniciAdi,@sifre,@Mail,@Telefon)
end
GO
/****** Object:  StoredProcedure [dbo].[DoktorAdd]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DoktorAdd]
@AdSoyad varchar(50),
@TCNo char(11),
@UzmanlikAlani varchar(50),
@Unvan varchar(50),
@Telefon char(11),
@Adres varchar(100),
@DogumTarihi date,
@PoliklinikNo int
as begin 
insert into Doktorlar(AdSoyad,TCNo,UzmanlikAlani,Unvan,Telefon,Adres,DogumTarihi,PoliklinikNo)
values (@AdSoyad,@TCNo,@UzmanlikAlani,@Unvan,@Telefon,@Adres,@DogumTarihi,@PoliklinikNo)
end
GO
/****** Object:  StoredProcedure [dbo].[DoktorAdSoyadAra]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[DoktorAdSoyadAra] 
@AdSoyad int
 as begin
 select * from Doktorlar where  AdSoyad=@AdSoyad
 end 
GO
/****** Object:  StoredProcedure [dbo].[DoktorG]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[DoktorG]
 as begin
 select * from Doktorlar 
 end 
GO
/****** Object:  StoredProcedure [dbo].[DoktorGA]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[DoktorGA]
 as begin
 select * from Doktorlar order by AdSoyad asc  
 end 
GO
/****** Object:  StoredProcedure [dbo].[DoktorGZ]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[DoktorGZ]
 as begin
 select * from Doktorlar order by AdSoyad desc 
 end 
GO
/****** Object:  StoredProcedure [dbo].[DoktorNoSec]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[DoktorNoSec] 
 as begin
 select DoktorNo from Doktorlar 
 end 
GO
/****** Object:  StoredProcedure [dbo].[DoktorSil]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DoktorSil] 
@DoktorNo  int
 as begin
delete from Doktorlar where DoktorNo= @DoktorNo 
 end 
GO
/****** Object:  StoredProcedure [dbo].[DoktorTCNoAra]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  create proc [dbo].[DoktorTCNoAra] 
@TCNo int
 as begin
 select * from Doktorlar where  TCNo=@TCNo
 end 
GO
/****** Object:  StoredProcedure [dbo].[Giris]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Giris] 
@KullaniciAdi varchar(50),
@sifre varchar(50)
as begin 
select *from Kullanicilar where KullaniciAdi=@KullaniciAdi and Sifre=@sifre
end
GO
/****** Object:  StoredProcedure [dbo].[HastaAdd]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[HastaAdd]
@HastaAdSoyad varchar(50),
@HastaTCNo char(11),
@HastaDogumTarihi date,
@boy int,
@yas int,
@OdaNo int,
@Recete varchar(50),
@RaporDurumu varchar(50),
@RandevuTarihi date,
@DoktorNo int
as begin 
insert into Hastalar(HastaAdSoyad,HastaTCNo,HastaDogumTarihi,boy,yas,OdaNo,Recete,RaporDurumu,RandevuTarihi,DoktorNo)
values (@HastaAdSoyad,@HastaTCNo,@HastaDogumTarihi,@boy,@yas,@OdaNo,@Recete,@RaporDurumu,@RandevuTarihi,@DoktorNo)
end
GO
/****** Object:  StoredProcedure [dbo].[HastaAdSoyadAra]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[HastaAdSoyadAra] 
@HastaAdSoyad int
 as begin
 select * from Hastalar where  HastaAdSoyad=@HastaAdSoyad
 end 
GO
/****** Object:  StoredProcedure [dbo].[HastaNoAra]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaNoAra] 
@HastaNo int
 as begin
 select * from Hastalar where  HastaNo=@HastaNo
 end 
GO
/****** Object:  StoredProcedure [dbo].[HastaSil]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaSil] 
 @HastaTCNo int
 as begin
delete from Hastalar where HastaTCNo= @HastaTCNo
 end 
GO
/****** Object:  StoredProcedure [dbo].[HastaSill]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[HastaSill] 
 @HastaNo int
 as begin
delete from Hastalar where HastaNo= @HastaNo
 end 
GO
/****** Object:  StoredProcedure [dbo].[HastaTG]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create proc [dbo].[HastaTG] 
 as begin
 select * from Hastalar
 end 
GO
/****** Object:  StoredProcedure [dbo].[HastaTGA]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create proc [dbo].[HastaTGA] 
 as begin
 select * from Hastalar order by  HastaAdSoyad asc
 end 
GO
/****** Object:  StoredProcedure [dbo].[HastaTGZ]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  create proc [dbo].[HastaTGZ]
 as begin
 select * from Hastalar order by  HastaAdSoyad desc
 end 
GO
/****** Object:  StoredProcedure [dbo].[HastaY]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[HastaY]
@HastaNo int,
@HastaAdSoyad varchar(50),
@HastaTCNo char(11),
@HastaDogumTarihi date,
@boy int,
@yas int,
@OdaNo int,
@Recete varchar(50),
@RaporDurumu varchar(50),
@RandevuTarihi date,
@DoktorNo int
as begin 
update Hastalar set HastaAdSoyad =@HastaAdSoyad, HastaTCNo=@HastaTCNo,HastaDogumTarihi=@HastaDogumTarihi, boy=@boy ,
yas=@yas, OdaNo=@OdaNo,Recete=@Recete,RaporDurumu=@RaporDurumu,RandevuTarihi=@RandevuTarihi,DoktorNo=@DoktorNo
where HastaNo = @HastaNo
end
GO
/****** Object:  StoredProcedure [dbo].[OdaG]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[OdaG]
as begin 
select * from Odalar
end 
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikAdAra]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[PoliklinikAdAra] 
@PoliklinikAdi int
 as begin
 select * from Poliklinikler where  PoliklinikAdi=@PoliklinikAdi
 end 
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikAdd]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PoliklinikAdd]
@PoliklinikAdi varchar(50),
@PoliklinikUzmanSayisi int,
@PoliklinikBaskani varchar(50),
@PoliklinikBasHemsire varchar(50),
@YatakSayisi int
as begin 
insert into Poliklinikler(PoliklinikAdi,PoliklinikUzmanSayisi,PoliklinikBaskani,PoliklinikBasHemsire,YatakSayisi)
values (@PoliklinikAdi,@PoliklinikUzmanSayisi,@PoliklinikBaskani,@PoliklinikBasHemsire,@YatakSayisi)
end
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikG]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PoliklinikG]
 as begin
 select * from Poliklinikler
 end 
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikGA]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[PoliklinikGA]
 as begin
 select * from Poliklinikler order by PoliklinikAdi asc  
 end 
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikGZ]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[PoliklinikGZ]
 as begin
 select * from Poliklinikler order by PoliklinikAdi desc 
 end 
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikNoAra]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[PoliklinikNoAra] 
@PoliklinikNo int
 as begin
 select * from Poliklinikler where  PoliklinikNo=@PoliklinikNo
 end 
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikSil]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PoliklinikSil] 
 @PoliklinikNo int
 as begin
delete from Poliklinikler where PoliklinikNo = @PoliklinikNo
 end 
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikY]    Script Date: 13.05.2022 16:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[PoliklinikY]
@PoliklinikNo int,
@PoliklinikAdi varchar(50),
@PoliklinikUzmanSayisi int,
@PoliklinikBaskani varchar(50),
@PoliklinikBasHemsire varchar(50),
@YatakSayisi int
as begin 
update Poliklinikler set PoliklinikAdi=@PoliklinikAdi ,PoliklinikUzmanSayisi =@PoliklinikUzmanSayisi, PoliklinikBaskani=@PoliklinikBaskani,PoliklinikBasHemsire=@PoliklinikBasHemsire, YatakSayisi=@YatakSayisi 
where PoliklinikNo = @PoliklinikNo
end
 -----
GO
USE [master]
GO
ALTER DATABASE [Hastane] SET  READ_WRITE 
GO
