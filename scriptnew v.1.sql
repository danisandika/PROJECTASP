USE [master]
GO
/****** Object:  Database [PRG4_APOTEK]    Script Date: 26/11/2019 9:20:00 am ******/
CREATE DATABASE [PRG4_APOTEK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRG4_APOTEK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PRG4_APOTEK.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRG4_APOTEK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PRG4_APOTEK_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PRG4_APOTEK] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRG4_APOTEK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRG4_APOTEK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRG4_APOTEK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRG4_APOTEK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRG4_APOTEK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRG4_APOTEK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRG4_APOTEK] SET  MULTI_USER 
GO
ALTER DATABASE [PRG4_APOTEK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRG4_APOTEK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRG4_APOTEK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRG4_APOTEK] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRG4_APOTEK] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRG4_APOTEK] SET QUERY_STORE = OFF
GO
USE [PRG4_APOTEK]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 26/11/2019 9:20:00 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[IDBooking] [varchar](50) NOT NULL,
	[dateBooking] [datetime] NULL,
	[IDCustomer] [int] NOT NULL,
	[statusBooking] [int] NOT NULL,
	[IDTransaksi] [varchar](50) NULL,
	[MetodePembayaran] [varchar](10) NULL,
	[FotoTransfer] [varchar](max) NULL,
	[Deskripsi] [varchar](max) NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[IDBooking] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detailPembelian]    Script Date: 26/11/2019 9:20:00 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detailPembelian](
	[IDPembelian] [varchar](50) NOT NULL,
	[IDObat] [int] NOT NULL,
	[jumlah] [int] NULL,
	[subTotal] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPembelian] ASC,
	[IDObat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detailTransaksi]    Script Date: 26/11/2019 9:20:00 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detailTransaksi](
	[IDTransaksi] [varchar](50) NOT NULL,
	[IDObat] [int] NOT NULL,
	[Jumlah] [int] NULL,
	[subTotal] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTransaksi] ASC,
	[IDObat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info]    Script Date: 26/11/2019 9:20:00 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info](
	[IDInfo] [int] IDENTITY(1,1) NOT NULL,
	[judul] [varchar](100) NOT NULL,
	[kategori] [varchar](100) NOT NULL,
	[konten] [text] NOT NULL,
	[waktupost] [datetime] NOT NULL,
	[createBy] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Info] PRIMARY KEY CLUSTERED 
(
	[IDInfo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JenisObat]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JenisObat](
	[IDJenis] [int] IDENTITY(1,1) NOT NULL,
	[namaJenis] [varchar](50) NULL,
	[statusJenis] [int] NULL,
	[Deskripsi] [varchar](max) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_JenisObat] PRIMARY KEY CLUSTERED 
(
	[IDJenis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lokasi_Penyimpanan]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lokasi_Penyimpanan](
	[IDLokasi] [int] IDENTITY(1,1) NOT NULL,
	[Nama_Lokasi] [varchar](50) NULL,
	[tempatLokasi] [varchar](50) NULL,
	[Deskripsi] [varchar](max) NULL,
	[Status] [int] NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Lokasi_Penyimpanan] PRIMARY KEY CLUSTERED 
(
	[IDLokasi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Management_Uang]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Management_Uang](
	[IDManagement] [int] IDENTITY(1,1) NOT NULL,
	[tanggalTransaksi] [datetime] NOT NULL,
	[Debit] [money] NULL,
	[Kredit] [money] NULL,
	[Total] [money] NULL,
	[Deskripsi] [varchar](max) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Management_Uang] PRIMARY KEY CLUSTERED 
(
	[IDManagement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Obat]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Obat](
	[IDObat] [int] IDENTITY(1,1) NOT NULL,
	[namaObat] [varchar](50) NOT NULL,
	[IDJenis] [int] NOT NULL,
	[status] [int] NULL,
	[JumlahObat] [int] NULL,
	[Keterangan] [varchar](max) NULL,
	[IDLokasi] [int] NULL,
	[Satuan] [varchar](50) NULL,
	[Harga] [money] NULL,
	[Expired] [date] NULL,
	[Foto] [varchar](50) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Obat] PRIMARY KEY CLUSTERED 
(
	[IDObat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pembelian]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pembelian](
	[IDPembelian] [varchar](50) NOT NULL,
	[Tanggal] [datetime] NULL,
	[totalBayar] [money] NULL,
	[IDSupplier] [int] NOT NULL,
	[IDKaryawan] [int] NULL,
 CONSTRAINT [PK_Pembelian] PRIMARY KEY CLUSTERED 
(
	[IDPembelian] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[IDRole] [int] IDENTITY(1,1) NOT NULL,
	[Deskripsi] [varchar](50) NOT NULL,
	[status] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[IDRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[IDSupplier] [int] IDENTITY(1,1) NOT NULL,
	[NamaSupplier] [varchar](50) NOT NULL,
	[AlamatSupplier] [varchar](100) NULL,
	[EmailSupplier] [varchar](30) NULL,
	[noTelp] [varchar](15) NULL,
	[Status] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[IDSupplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaksi]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaksi](
	[IDTransaksi] [varchar](50) NOT NULL,
	[IDKaryawan] [int] NOT NULL,
	[Tanggal] [datetime] NULL,
	[FotoResep] [varchar](max) NULL,
	[totalBayar] [int] NULL,
 CONSTRAINT [PK_Transaksi] PRIMARY KEY CLUSTERED 
(
	[IDTransaksi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IDUser] [int] NOT NULL,
	[Nama] [varchar](50) NOT NULL,
	[Alamat] [varchar](100) NULL,
	[NoTelp] [varchar](15) NULL,
	[TglLahir] [date] NULL,
	[Email] [varchar](50) NULL,
	[status] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[IDRole] [int] NOT NULL,
	[JenisKelamin] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[JenisObat] ON 

INSERT [dbo].[JenisObat] ([IDJenis], [namaJenis], [statusJenis], [Deskripsi], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'Terlarang', 0, N'Obat', 1, CAST(N'2019-11-17' AS Date), 1, CAST(N'2019-11-17' AS Date))
INSERT [dbo].[JenisObat] ([IDJenis], [namaJenis], [statusJenis], [Deskripsi], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Obat Obatan', 1, N'Adalah Suatu Obat yang bagus', 1, CAST(N'2019-11-17' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[JenisObat] OFF
SET IDENTITY_INSERT [dbo].[Lokasi_Penyimpanan] ON 

INSERT [dbo].[Lokasi_Penyimpanan] ([IDLokasi], [Nama_Lokasi], [tempatLokasi], [Deskripsi], [Status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'A1', N'Rak A1 bagian Obat Terlarang', N'Cool', 1, 1, CAST(N'2019-11-20T15:19:37.757' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Lokasi_Penyimpanan] OFF
SET IDENTITY_INSERT [dbo].[Obat] ON 

INSERT [dbo].[Obat] ([IDObat], [namaObat], [IDJenis], [status], [JumlahObat], [Keterangan], [IDLokasi], [Satuan], [Harga], [Expired], [Foto], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'Paramex', 2, 1, NULL, N'Obat Pusing', 1, N'Obat', 17000.0000, CAST(N'2019-11-01' AS Date), N'~/Administrator/upload/bts.png', 1, CAST(N'2019-11-25T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Obat] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([IDRole], [Deskripsi], [status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'Administrator', 1, 1, CAST(N'2019-11-20T08:23:35.757' AS DateTime), NULL, NULL)
INSERT [dbo].[Role] ([IDRole], [Deskripsi], [status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Karyawan', 0, 1, CAST(N'2019-11-20T08:25:22.000' AS DateTime), 1, CAST(N'2019-11-20T08:30:27.987' AS DateTime))
INSERT [dbo].[Role] ([IDRole], [Deskripsi], [status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'Manager', 1, 1, CAST(N'2019-11-20T08:25:35.350' AS DateTime), 1, CAST(N'2019-11-20T08:30:15.830' AS DateTime))
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([IDSupplier], [NamaSupplier], [AlamatSupplier], [EmailSupplier], [noTelp], [Status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'PT.PETROKIMIA', N'Surabaya', N'petro@gmail.com', N'0810920312', 1, 1, CAST(N'2019-11-18T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-18T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Supplier] OFF
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Transaksi] FOREIGN KEY([IDTransaksi])
REFERENCES [dbo].[Transaksi] ([IDTransaksi])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Transaksi]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_User] FOREIGN KEY([IDCustomer])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_User]
GO
ALTER TABLE [dbo].[detailPembelian]  WITH CHECK ADD  CONSTRAINT [FK_detailPembelian_Obat] FOREIGN KEY([IDObat])
REFERENCES [dbo].[Obat] ([IDObat])
GO
ALTER TABLE [dbo].[detailPembelian] CHECK CONSTRAINT [FK_detailPembelian_Obat]
GO
ALTER TABLE [dbo].[detailPembelian]  WITH CHECK ADD  CONSTRAINT [FK_detailPembelian_Pembelian] FOREIGN KEY([IDPembelian])
REFERENCES [dbo].[Pembelian] ([IDPembelian])
GO
ALTER TABLE [dbo].[detailPembelian] CHECK CONSTRAINT [FK_detailPembelian_Pembelian]
GO
ALTER TABLE [dbo].[detailTransaksi]  WITH CHECK ADD  CONSTRAINT [FK_detailTransaksi_Obat] FOREIGN KEY([IDObat])
REFERENCES [dbo].[Obat] ([IDObat])
GO
ALTER TABLE [dbo].[detailTransaksi] CHECK CONSTRAINT [FK_detailTransaksi_Obat]
GO
ALTER TABLE [dbo].[detailTransaksi]  WITH CHECK ADD  CONSTRAINT [FK_detailTransaksi_Transaksi] FOREIGN KEY([IDTransaksi])
REFERENCES [dbo].[Transaksi] ([IDTransaksi])
GO
ALTER TABLE [dbo].[detailTransaksi] CHECK CONSTRAINT [FK_detailTransaksi_Transaksi]
GO
ALTER TABLE [dbo].[Info]  WITH CHECK ADD  CONSTRAINT [FK_Info_User] FOREIGN KEY([createBy])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[Info] CHECK CONSTRAINT [FK_Info_User]
GO
ALTER TABLE [dbo].[Obat]  WITH CHECK ADD  CONSTRAINT [FK_Obat_JenisObat] FOREIGN KEY([IDJenis])
REFERENCES [dbo].[JenisObat] ([IDJenis])
GO
ALTER TABLE [dbo].[Obat] CHECK CONSTRAINT [FK_Obat_JenisObat]
GO
ALTER TABLE [dbo].[Obat]  WITH CHECK ADD  CONSTRAINT [FK_Obat_Lokasi_Penyimpanan] FOREIGN KEY([IDLokasi])
REFERENCES [dbo].[Lokasi_Penyimpanan] ([IDLokasi])
GO
ALTER TABLE [dbo].[Obat] CHECK CONSTRAINT [FK_Obat_Lokasi_Penyimpanan]
GO
ALTER TABLE [dbo].[Pembelian]  WITH CHECK ADD  CONSTRAINT [FK_Pembelian_Supplier] FOREIGN KEY([IDSupplier])
REFERENCES [dbo].[Supplier] ([IDSupplier])
GO
ALTER TABLE [dbo].[Pembelian] CHECK CONSTRAINT [FK_Pembelian_Supplier]
GO
ALTER TABLE [dbo].[Pembelian]  WITH CHECK ADD  CONSTRAINT [FK_Pembelian_User] FOREIGN KEY([IDKaryawan])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[Pembelian] CHECK CONSTRAINT [FK_Pembelian_User]
GO
ALTER TABLE [dbo].[Transaksi]  WITH CHECK ADD  CONSTRAINT [FK_Transaksi_User] FOREIGN KEY([IDKaryawan])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[Transaksi] CHECK CONSTRAINT [FK_Transaksi_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([IDRole])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteJenis]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteJenis]
@idJenis int
as
update JenisObat set statusJenis=0 where IDJenis=@idJenis
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteObat]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteObat]
@IDObat int
as
update Obat set status=0 where IDObat=@IDObat
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRole]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_DeleteRole]
	@IDRole int,
	@ModifiedBy int,
	@ModifiedDate datetime
	
AS
BEGIN
	UPDATE Role
	set
	[Status]=0 ,
	ModifiedBy=@ModifiedBy,
	ModifiedDate = @ModifiedDate 
	WHERE IDRole = @IDRole
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HapusLokasi]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_HapusLokasi]
	@IDLokasi int
	
AS
BEGIN
	UPDATE Lokasi_Penyimpanan
	set
	[Status]=0 
	WHERE IDLokasi = @IDLokasi
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HapusSupplier]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HapusSupplier]
	@IDSupplier int,
	@ModifiedBy int
	
AS
BEGIN
	UPDATE Supplier
	set
	[Status]=0 ,
	ModifiedBy=@ModifiedBy 
	WHERE IDSupplier = @IDSupplier
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InputObat]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_InputObat]
    @namaObat varchar(50),
    @IDJenis int,
	@Keterangan varchar (max),
	@IDLokasi int,
	@Satuan varchar(50),
	@Harga money,
	@Expired date,
	@Foto varchar(max),
	@CreateBy int,
	@CreateDate date
	
AS
BEGIN
	INSERT INTO Obat
	(
    namaObat ,
    IDJenis,
	status,
	Keterangan,
	IDLokasi,
	Satuan,
	Harga,
	Expired,
	Foto,
	CreateBy,
	CreateDate
	)
	VALUES
	(
    @namaObat ,
    @IDJenis,
	1,
	@Keterangan,
	@IDLokasi,
	@Satuan,
	@Harga,
	@Expired,
	@Foto,
	@CreateBy,
	@CreateDate
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InputSupplier]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_InputSupplier]
    @NamaSupplier varchar(50),
    @AlamatSupplier varchar(100),
	@Email varchar(30),
	@NoHp varchar (15),
	@Status int,
	@CreateBy int,
	@CreateDate date,
	@ModifiedBy int,
	@ModifiedDate date
	
AS
BEGIN
	INSERT INTO Supplier
	(
    NamaSupplier ,
    AlamatSupplier,
	EmailSupplier ,
	noTelp ,
	Status ,
	CreateBy ,
	CreateDate ,
	ModifiedBy ,
	ModifiedDate 
	)
	VALUES
	(
	@NamaSupplier ,
    @AlamatSupplier ,
	@Email,
	@NoHp,
	@Status ,
	@CreateBy ,
	@CreateDate ,
	@ModifiedBy ,
	@ModifiedDate
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertJenis]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InsertJenis]
@namajenis varchar(50),
@deskripsi varchar(max),
@CreateBy int,
@CreateDate datetime
as
insert into JenisObat (namajenis,statusJenis,deskripsi,CreateBy,CreateDate) values (@namajenis,1,@deskripsi,@CreateBy,@CreateDate)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertLokasi]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InsertLokasi]
@Nama_Lokasi varchar(50),
@tempatLokasi varchar(50),
@Deskripsi varchar(max),
@CreateBy int,
@CreateDate datetime
as
insert into Lokasi_Penyimpanan(Nama_Lokasi,tempatLokasi,Deskripsi,[status],CreateBy,CreateDate) values (@Nama_Lokasi,@tempatLokasi,@deskripsi,1,@CreateBy,@CreateDate)

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertRole]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERT ROLE
create proc [dbo].[sp_InsertRole]
@deskripsi varchar(50),
@CreateBy int,
@CreateDate datetime
as
insert into Role (deskripsi,status,CreateBy,CreateDate) values (@deskripsi,1,@CreateBy,@CreateDate)
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchSupplier]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_SearchSupplier]
	@NamaSupplier nvarchar (50)
AS
BEGIN
		SELECT s.IDSupplier,s.NamaSupplier, s.AlamatSupplier, s.EmailSupplier, s.noTelp, case when Status=1 then
	 'Aktif' when status=0 then 'Tidak Aktif' end AS 'Status', s.CreateBy, s.CreateDate, s.ModifiedBy, s.ModifiedDate FROM Supplier s
	WHERE NamaSupplier LIKE '%'+@NamaSupplier+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectJenis]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectJenis]
@namajenis varchar(50),
@deskripsi varchar(max)
as
select * from JenisObat where (namaJenis like '%'+@namajenis+'%' or deskripsi like '%'+@deskripsi+'%') and statusJenis = 1
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectLokasi]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_SelectLokasi]
@Nama_Lokasi varchar(max)
as
select * from Lokasi_Penyimpanan where status = 1
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectObat]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_SelectObat]
@namaObat varchar(max)
as
select * from Obat where (namaObat like '%'+@namaObat+'%') and Status = 1
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectRole]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--USE STORED PROCEDURE ASP PROJECT

create proc [dbo].[sp_SelectRole]
@deskripsi varchar(50)
as
select * from dbo.Role where (deskripsi like '%'+@deskripsi+'%') and status = 1
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateJenis]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UpdateJenis]
@idJenis int,
@namajenis varchar(50),
@deskripsi varchar(max),
@ModifiedBy int,
@ModifiedDate datetime
as
update JenisObat set 
	namajenis = @namajenis,
	deskripsi=@deskripsi,
	ModifiedBy = @ModifiedBy,
	ModifiedDate = @ModifiedDate
	where IDJenis = @idJenis
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateLokasi]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_UpdateLokasi]
	@IDLokasi int,
    @Nama_Lokasi varchar(50),
    @tempatLokasi varchar(100),
	@Deskripsi varchar(max),
	@ModifiedBy int,
	@ModifiedDate date
	
AS
BEGIN
	UPDATE Lokasi_Penyimpanan
	set
    Nama_Lokasi=@Nama_Lokasi,
	tempatLokasi=@tempatLokasi,
	Deskripsi=@Deskripsi ,
	ModifiedBy=@ModifiedBy ,
	ModifiedDate =@ModifiedDate
	WHERE IDLokasi = @IDLokasi
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateRole]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--UPDATE ROLE
create proc [dbo].[sp_UpdateRole]
@idRole int,
@deskripsi varchar(50),
@ModifiedBy int,
@ModifiedDate datetime
as
update role set 
	deskripsi=@deskripsi,
	ModifiedBy = @ModifiedBy,
	ModifiedDate = @ModifiedDate
	where IDRole = @idRole
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateSupplier]    Script Date: 26/11/2019 9:20:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_UpdateSupplier]
	@IDSupplier int,
    @NamaSupplier varchar(50),
    @AlamatSupplier varchar(100),
	@Email varchar(30),
	@NoHp varchar (15),
	@Status int,
	@ModifiedBy int,
	@ModifiedDate date
	
AS
BEGIN
	UPDATE Supplier
	set
    NamaSupplier=@NamaSupplier ,
    AlamatSupplier=@AlamatSupplier,
	EmailSupplier=@Email,
	noTelp=@NoHp ,
	Status=@Status ,
	ModifiedBy=@ModifiedBy ,
	ModifiedDate =@ModifiedDate
	WHERE IDSupplier = @IDSupplier
END
GO
USE [master]
GO
ALTER DATABASE [PRG4_APOTEK] SET  READ_WRITE 
GO
