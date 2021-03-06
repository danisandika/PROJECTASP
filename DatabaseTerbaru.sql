USE [PRG4_APOTEK]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 30/12/2019 03:33:50 ******/
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
/****** Object:  Table [dbo].[detailPembelian]    Script Date: 30/12/2019 03:33:52 ******/
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
/****** Object:  Table [dbo].[detailTransaksi]    Script Date: 30/12/2019 03:33:52 ******/
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
/****** Object:  Table [dbo].[Dokter]    Script Date: 30/12/2019 03:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dokter](
	[ID_Dokter] [int] IDENTITY(1,1) NOT NULL,
	[NIP] [varchar](50) NOT NULL,
	[nama] [varchar](50) NOT NULL,
	[jenis_kelamin] [int] NULL,
	[alamat] [varchar](100) NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[foto] [varchar](max) NULL,
	[ID_SP] [int] NOT NULL,
	[status] [int] NULL,
	[ID_Jadwal] [int] NOT NULL,
	[createBy] [int] NULL,
	[createDate] [datetime] NULL,
	[modifiedBy] [int] NULL,
	[modifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Dokter_1] PRIMARY KEY CLUSTERED 
(
	[ID_Dokter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[info]    Script Date: 30/12/2019 03:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[info](
	[IDInfo] [int] IDENTITY(1,1) NOT NULL,
	[Judul] [varchar](max) NULL,
	[Kategori] [varchar](50) NULL,
	[Konten] [varchar](max) NULL,
	[waktuPost] [datetime] NULL,
	[createBy] [int] NULL,
	[createDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[status] [int] NULL,
	[foto] [varchar](50) NULL,
 CONSTRAINT [PK_info] PRIMARY KEY CLUSTERED 
(
	[IDInfo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jadwal_Dokter]    Script Date: 30/12/2019 03:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jadwal_Dokter](
	[ID_Jadwal] [int] IDENTITY(1,1) NOT NULL,
	[jam_Kerja] [datetime] NULL,
	[hari_Kerja] [date] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_jadwal_Dokter] PRIMARY KEY CLUSTERED 
(
	[ID_Jadwal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jenis_dokter]    Script Date: 30/12/2019 03:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jenis_dokter](
	[ID_SP] [int] IDENTITY(1,1) NOT NULL,
	[nama_jenis] [varchar](50) NOT NULL,
	[status] [int] NULL,
	[createBy] [int] NULL,
	[createDate] [datetime] NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedBy] [int] NULL,
	[deskripsi] [varchar](max) NULL,
 CONSTRAINT [PK_jenis_dokter] PRIMARY KEY CLUSTERED 
(
	[ID_SP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JenisObat]    Script Date: 30/12/2019 03:33:54 ******/
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
/****** Object:  Table [dbo].[Lokasi_Penyimpanan]    Script Date: 30/12/2019 03:33:54 ******/
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
/****** Object:  Table [dbo].[Management_Uang]    Script Date: 30/12/2019 03:33:54 ******/
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
/****** Object:  Table [dbo].[Obat]    Script Date: 30/12/2019 03:33:55 ******/
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
/****** Object:  Table [dbo].[Pembelian]    Script Date: 30/12/2019 03:33:55 ******/
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
	[status] [int] NULL,
 CONSTRAINT [PK_Pembelian] PRIMARY KEY CLUSTERED 
(
	[IDPembelian] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 30/12/2019 03:33:55 ******/
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
/****** Object:  Table [dbo].[Supplier]    Script Date: 30/12/2019 03:33:56 ******/
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
/****** Object:  Table [dbo].[Transaksi]    Script Date: 30/12/2019 03:33:56 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 30/12/2019 03:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IDUser] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[detailPembelian] ([IDPembelian], [IDObat], [jumlah], [subTotal]) VALUES (N'01', 17, 10, 1000.0000)
INSERT [dbo].[detailPembelian] ([IDPembelian], [IDObat], [jumlah], [subTotal]) VALUES (N'01', 18, 100, 1000.0000)
SET IDENTITY_INSERT [dbo].[Dokter] ON 

INSERT [dbo].[Dokter] ([ID_Dokter], [NIP], [nama], [jenis_kelamin], [alamat], [username], [password], [email], [foto], [ID_SP], [status], [ID_Jadwal], [createBy], [createDate], [modifiedBy], [modifiedDate]) VALUES (1, N'232142', N'Dinda rizki', 1, N'jambi', N'dinda_Rizki', N'rizki123', N'rizki@gmail.com', N'Dokter/39705cfe-dfc5-4ba2-8b9a-f4d23d71da1d.png', 1, 1, 1, 1, CAST(N'2000-02-12T00:00:00.000' AS DateTime), 1, CAST(N'2019-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Dokter] ([ID_Dokter], [NIP], [nama], [jenis_kelamin], [alamat], [username], [password], [email], [foto], [ID_SP], [status], [ID_Jadwal], [createBy], [createDate], [modifiedBy], [modifiedDate]) VALUES (2, N'10012', N'hiajia', 1, N'jakarta', N'dinda', N'MUSTIKA2019', N'sumber@gmail.com', N'Dokter/0c21c6c4-34f2-4438-9aea-e0bc0f46559e.png', 1, 1, 1, 1, CAST(N'2019-12-10T00:00:00.000' AS DateTime), 1, CAST(N'2019-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Dokter] ([ID_Dokter], [NIP], [nama], [jenis_kelamin], [alamat], [username], [password], [email], [foto], [ID_SP], [status], [ID_Jadwal], [createBy], [createDate], [modifiedBy], [modifiedDate]) VALUES (3, N'213123', N'Mutiara A', 1, N'Jambi', N'Mutiara', N'MUSTIKA2019', N'sumber@gmail.com', N'Dokter/2c6862e0-88b4-4cb6-816a-a594c76268d3.png', 1, 0, 1, 1, CAST(N'2019-12-10T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Dokter] OFF
SET IDENTITY_INSERT [dbo].[info] ON 

INSERT [dbo].[info] ([IDInfo], [Judul], [Kategori], [Konten], [waktuPost], [createBy], [createDate], [ModifiedBy], [ModifiedDate], [status], [foto]) VALUES (1, N'Tips Menjaga Kesehatan Ibu Pasca Melahirkan sang b', N'Ibu dan Anak', N'
Apa saja sih perawatan yang perlu dilakukan setelah melahirkan?

Istirahat
Fase persalinan adalah proses yang panjang. Itu sebabnya, setelah proses persalinan selesai, ibu perlu beristirahat untuk menghindari kelelahan yang berlebihan. Ibu bisa mencuri waktu untuk beristirahat saat Si Kecil tidur. Dekatkan posisi tempat tidur Si Kecil dengan kasur ibu agar memudahkan proses menyusui. Jangan lupa juga untuk berbagi tugas dengan suami agar ibu tidak kewalahan dalam mengurus rumah tangga dan Si Kecil.

Jaga Asupan Makan
Hal penting yang perlu dijaga setelah melahirkan adalah asupan makan. Sebab setelah melahirkan, ibu membutuhkan nutrisi yang tepat untuk menunjang proses menyusui dan mendukung tumbuh kembang bayi. Berikut adalah rekomendasi asupan makanan bagi ibu menyusui sesuai Angka Kecukupan Gizi (AKG) 2013:
Protein = 76-77 gram per hari.
Karbohidrat = 65 gram per hari (6 bulan pertama menyusui).
Lemak tak jenuh = 71-86 gram per hari (6 bulan pertama menyusui) dan 73-88 gram per hari (6 bulan kedua menyusui). Kebutuhan ini akan menurun sesuai usia ibu.
Zat besi = 32 mmg per hari (6 bulan pertama menyusui) dan 34 mg (6 bulan kedua menyusui).
Kalium = 1200-1300 mg per hari (kebutuhannya menurun sesuai usia).
Vitamin C = 100 mg per hari.
Vitamin E = 19 mg per hari.
Kalium = 500 mg per hari.
Perawatan Miss V
Setelah melahirkan, Miss V akan mengalami luka dan butuh waktu untuk pulih. Oleh karena itu, ibu perlu memberikan perawatan khusus untuk Miss V setelah melahirkan. Apa saja?
Jaga Miss V agar tetap bersih dan kering.
Gunakan pembalut untuk mengatasi pendarahan setelah persalinan.
Basuh Miss V dari depan ke belakang untuk mencegah infeksi setelah melahirkan.
Larutkan losion antiseptik dalam air dan basuh pada Miss V atau tuangkan di atas jahitan untuk mencegah infeksi setelah melahirkan.
Jika ibu merasakan sakit yang tak biasa, seperti Miss V bengkak dan ada cairan berbau, ibu perlu segera bicara pada dokter. Sebab bisa jadi, ini adalah tanda terjadinya infeksi.

Olahraga
Jika dilakukan secara rutin, olahraga bisa membantu mempercepat pemulihan bentuk tubuh setelah melahirkan. Ibu bisa melakukannya secara bertahap, mulai dari jalan santai selama 20-30 menit setiap hari. Setelah ibu merasa cukup siap, ibu bisa mulai untuk melakukan olahraga yang lebih berat seperti latihan otot dasar panggul dan perut. Tentunya, kemampuan olahraga bergantung pada kondisi dan kesanggupan ibu. Selama ibu merasa mampu, ibu boleh-boleh saja berolahraga. Tapi jika ibu ragu, ibu bisa bicara dulu ke dokter sebelum berolahraga.

Mengontrol Kondisi Emosi
Setelah melahirkan, ibu mungkin saja mengalami perubahan emosional. Itu sebabnya, beberapa ibu mengalami baby blues, yaitu kondisi gangguan suasana hati setelah melahirkan yang dapat memengaruhi kemampuan ibu dalam merawat bayi dan mengganggu waktu tidur. Kondisi ini tentu tidak boleh diabaikan. Ibu harus segera bicara pada dokter apabila setelah melahirkan ibu mengalami perasaan sedih berkepanjangan atau lebih dari 2 minggu.

Mengonsumsi Obat Herbal
Bisa juga dengan mengonsumsi obat herbal, dapat membantu menjaga kesehatan ibu sehabis bersalin. Namun, jangan sembarang untuk membeli obat tersebut. Minum Akar Sari Jamu Habis Bersalin Lengkap 40 Hari. Paket Pil herbal alami yang sangat bermanfaat bagi wanita yang habis bersalin. Satu paket berisi 10 pcs yang terdiri dari Jamu Beras Kencur, Jamu Parem Beranak 1, Jamu Parem Beranak 2 Jamu Galian, Tapel Asem, Pilis, Parem Bobok, Tapel Wangi, Cleaner Pembersih Wanita, dan Bedak Dingin. Akar sari jamu habis bersalin dibuat dari bahan-bahan herbal pilihan dan berkualitas. Produk ini sudah terdaftar DEP KES RI sehingga aman dan kualitas terjamin. Konsumsi dan gunakan secara rutin, kemudian rasakan khasiatnya.', CAST(N'2019-12-07T00:00:00.000' AS DateTime), 1, CAST(N'2019-12-02T00:00:00.000' AS DateTime), NULL, NULL, 0, N'Info/dabab9ec-fa23-4eae-a7f1-147cbdce61ae.jpg')
INSERT [dbo].[info] ([IDInfo], [Judul], [Kategori], [Konten], [waktuPost], [createBy], [createDate], [ModifiedBy], [ModifiedDate], [status], [foto]) VALUES (2, N'a', N'Ibu dan Anak', N's', CAST(N'2019-01-08T00:00:00.000' AS DateTime), 1, CAST(N'2019-12-08T00:00:00.000' AS DateTime), NULL, NULL, 1, N'Info/ace8d1be-bcc6-45c8-ad4b-c197bfcaa30f.png')
SET IDENTITY_INSERT [dbo].[info] OFF
SET IDENTITY_INSERT [dbo].[jadwal_Dokter] ON 

INSERT [dbo].[jadwal_Dokter] ([ID_Jadwal], [jam_Kerja], [hari_Kerja], [status]) VALUES (1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), CAST(N'2000-12-22' AS Date), 1)
SET IDENTITY_INSERT [dbo].[jadwal_Dokter] OFF
SET IDENTITY_INSERT [dbo].[jenis_dokter] ON 

INSERT [dbo].[jenis_dokter] ([ID_SP], [nama_jenis], [status], [createBy], [createDate], [modifiedDate], [modifiedBy], [deskripsi]) VALUES (1, N'Umum', 0, 1, CAST(N'2000-12-12T00:00:00.000' AS DateTime), CAST(N'2019-12-11T14:08:25.603' AS DateTime), 1, N' memeriksa masalah-masalah kesehatan pasien secara umum untuk segala usia')
INSERT [dbo].[jenis_dokter] ([ID_SP], [nama_jenis], [status], [createBy], [createDate], [modifiedDate], [modifiedBy], [deskripsi]) VALUES (2, N'Spesialis Obstetri & Ginekologi', 1, 1, CAST(N'2019-12-11T12:49:42.250' AS DateTime), CAST(N'2019-11-11T00:00:00.000' AS DateTime), 1, N'Kebidanan dan Kandungan')
SET IDENTITY_INSERT [dbo].[jenis_dokter] OFF
SET IDENTITY_INSERT [dbo].[JenisObat] ON 

INSERT [dbo].[JenisObat] ([IDJenis], [namaJenis], [statusJenis], [Deskripsi], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'Terlarang', 0, N'Obat', 1, CAST(N'2019-11-17' AS Date), 1, CAST(N'2019-11-17' AS Date))
INSERT [dbo].[JenisObat] ([IDJenis], [namaJenis], [statusJenis], [Deskripsi], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Obat keras', 1, N'Yang termasuk kelompok ini terutam adalah antibiotika dan obat-obat berisi hormon (obat anti diabetes, obat untuk penyakit gangguan jantung, obat anti-penyakit kanker, obat untuk penyakit pembesaran kelenjar tiroid, obat penyakit gangguan pertumbuhan, dan sebagainya).', 1, CAST(N'2019-11-17' AS Date), 1, CAST(N'2019-11-28' AS Date))
INSERT [dbo].[JenisObat] ([IDJenis], [namaJenis], [statusJenis], [Deskripsi], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'Obat bebas terbatas', 1, N'obat berjenis obat bebas terbatas. Peredaran obat jenis ini tidak seperti obat bebas (OTC). Obat ini hanya bisa anda beli di Apotik dan atau toko-toko obat resmi yang berijin.', 1, CAST(N'2019-11-25' AS Date), 1, CAST(N'2019-11-28' AS Date))
INSERT [dbo].[JenisObat] ([IDJenis], [namaJenis], [statusJenis], [Deskripsi], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'Obat Bebas (OTC)', 1, N' Over The Counter, kelompok obat ini bisa anda dapatkan tanpa harus menggunakan resep dokter terlebih dahulu. Obat ini identik dengan ragamnya yang mudah didapat di warung-warung kecil.', 1, CAST(N'2019-11-28' AS Date), 1, CAST(N'2019-11-28' AS Date))
INSERT [dbo].[JenisObat] ([IDJenis], [namaJenis], [statusJenis], [Deskripsi], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'Obat Bebas', 1, N'Bebas dijual dipasaran dan dapat dibeli tanpa resep dokter', 1, CAST(N'2019-11-28' AS Date), NULL, NULL)
INSERT [dbo].[JenisObat] ([IDJenis], [namaJenis], [statusJenis], [Deskripsi], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'Obat Bebas Terbatas', 1, N'obat yang dapat dijual beli secara bebas tanpa resep dokter, namun penggunaannya harus memerhatikan informasi yang menyertai didalam kemasan obat', 1, CAST(N'2019-11-28' AS Date), NULL, NULL)
INSERT [dbo].[JenisObat] ([IDJenis], [namaJenis], [statusJenis], [Deskripsi], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'Obat Bukan Golongan Narkotik', 1, N'Obat yang berkhasiat untuk mempengaruhi susunan syaraf pusat', 1, CAST(N'2019-11-28' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[JenisObat] OFF
SET IDENTITY_INSERT [dbo].[Lokasi_Penyimpanan] ON 

INSERT [dbo].[Lokasi_Penyimpanan] ([IDLokasi], [Nama_Lokasi], [tempatLokasi], [Deskripsi], [Status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'GD2', N'Lokasi 2 sebelah kanan', N'khusus obat keras', 1, 1, CAST(N'2019-11-20T11:48:11.943' AS DateTime), 1, CAST(N'2019-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Lokasi_Penyimpanan] ([IDLokasi], [Nama_Lokasi], [tempatLokasi], [Deskripsi], [Status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'GD1', N'Lokasi 1 sektor kanan', N'Rak Biru Sektor A', 1, 1, CAST(N'2019-11-25T13:17:14.600' AS DateTime), 1, CAST(N'2019-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Lokasi_Penyimpanan] ([IDLokasi], [Nama_Lokasi], [tempatLokasi], [Deskripsi], [Status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'gderssa', N'ahhs', N'ajsjh', 0, 1, CAST(N'2019-11-25T13:17:35.970' AS DateTime), 1, CAST(N'2019-11-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Lokasi_Penyimpanan] ([IDLokasi], [Nama_Lokasi], [tempatLokasi], [Deskripsi], [Status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'GD3', N'Lokasi 3 Bagian Tengah', N'Khusus Obat tradisional', 1, 1, CAST(N'2019-12-10T08:06:21.320' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Lokasi_Penyimpanan] OFF
SET IDENTITY_INSERT [dbo].[Management_Uang] ON 

INSERT [dbo].[Management_Uang] ([IDManagement], [tanggalTransaksi], [Debit], [Kredit], [Total], [Deskripsi], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (1, CAST(N'2019-11-25T00:00:00.000' AS DateTime), 3000000.0000, 1200000.0000, 280000.0000, N'desk', 1, CAST(N'2019-11-25T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Management_Uang] OFF
SET IDENTITY_INSERT [dbo].[Obat] ON 

INSERT [dbo].[Obat] ([IDObat], [namaObat], [IDJenis], [status], [JumlahObat], [Keterangan], [IDLokasi], [Satuan], [Harga], [Expired], [Foto], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (17, N'Paracetamol', 2, 1, 100, N'Demam', 1, N'Butir', 3000.0000, CAST(N'2019-12-11' AS Date), N'obat_obat/cd4868f6-cc6d-4523-9fe1-317d5b18aa6e.png', 1, CAST(N'2019-11-20T00:00:00.000' AS DateTime), 1, CAST(N'2019-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Obat] ([IDObat], [namaObat], [IDJenis], [status], [JumlahObat], [Keterangan], [IDLokasi], [Satuan], [Harga], [Expired], [Foto], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (18, N'Dikomixin', 2, 1, 1001, N'Batuk berdahak', 1, N'Butir', 40000.0000, CAST(N'2019-02-28' AS Date), N'obat_obat/2135023a-39cc-42c6-b221-dc28a31f6237.png', 1, CAST(N'2019-11-20T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Obat] ([IDObat], [namaObat], [IDJenis], [status], [JumlahObat], [Keterangan], [IDLokasi], [Satuan], [Harga], [Expired], [Foto], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (19, N'Alergen', 2, 1, 12, N'Menghilangkan segala jenis gej', 1, N'Butir', 20000000.0000, CAST(N'2019-12-10' AS Date), N'obat_obat/63f3be79-c5b5-486f-8ee8-9f7b611417b4.jpg', 1, CAST(N'2019-11-28T00:00:00.000' AS DateTime), 1, CAST(N'2019-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Obat] ([IDObat], [namaObat], [IDJenis], [status], [JumlahObat], [Keterangan], [IDLokasi], [Satuan], [Harga], [Expired], [Foto], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (20, N'apa', 2, 0, 12, N'apa', 1, N'Butir', 1000.0000, CAST(N'2019-09-30' AS Date), N'obat_obat/9286c396-282d-46e1-abd8-ce7d2e9eff25.png', 1, CAST(N'2019-11-29T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Obat] ([IDObat], [namaObat], [IDJenis], [status], [JumlahObat], [Keterangan], [IDLokasi], [Satuan], [Harga], [Expired], [Foto], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (22, N'Antalgin', 5, 1, 100, N'obat', 1, N'Butir', 1000.0000, CAST(N'2019-12-16' AS Date), N'obat_obat/291c9718-a78b-49aa-b506-8ad05af3c3c9.png', 1, CAST(N'2019-12-13T00:00:00.000' AS DateTime), 1, CAST(N'2019-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Obat] ([IDObat], [namaObat], [IDJenis], [status], [JumlahObat], [Keterangan], [IDLokasi], [Satuan], [Harga], [Expired], [Foto], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (24, N'Bodrex', 2, 1, 100, N'Demam', 1, N'Butir', 1000.0000, CAST(N'2020-12-22' AS Date), NULL, 1, CAST(N'2019-12-13T00:00:00.000' AS DateTime), 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Obat] OFF
INSERT [dbo].[Pembelian] ([IDPembelian], [Tanggal], [totalBayar], [IDSupplier], [IDKaryawan], [status]) VALUES (N'01', CAST(N'2001-01-12T00:00:00.000' AS DateTime), 1000.0000, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([IDRole], [Deskripsi], [status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'Admin', 1, 1, CAST(N'2019-11-28T23:41:12.717' AS DateTime), NULL, NULL)
INSERT [dbo].[Role] ([IDRole], [Deskripsi], [status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Kasir', 1, 1, CAST(N'2019-11-28T23:41:20.067' AS DateTime), NULL, NULL)
INSERT [dbo].[Role] ([IDRole], [Deskripsi], [status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'Customer', 1, 1, CAST(N'2019-11-29T12:53:21.830' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([IDSupplier], [NamaSupplier], [AlamatSupplier], [EmailSupplier], [noTelp], [Status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'PT.PETROKIMIA', N'Surabaya', N'petro@gmail.com', N'0810920312', 0, 1, CAST(N'2019-11-18T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Supplier] ([IDSupplier], [NamaSupplier], [AlamatSupplier], [EmailSupplier], [noTelp], [Status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'PT SUMBER KARYA', N'CIKARANG', N'sumber@gmail.com', N'08398232342', 1, 1, CAST(N'2019-12-08T00:00:00.000' AS DateTime), 1, CAST(N'2019-12-08T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([IDUser], [Nama], [Alamat], [NoTelp], [TglLahir], [Email], [status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate], [username], [password], [IDRole]) VALUES (1, N'Rizki Asriningtyas', N'Jambi', N'08237566721', CAST(N'2019-04-10' AS Date), N'Rizki@gmail.com', 1, 1, CAST(N'2019-11-29T00:00:00.000' AS DateTime), 1, CAST(N'2019-12-10T00:00:00.000' AS DateTime), N'rizkiA', N'rizki', 1)
INSERT [dbo].[User] ([IDUser], [Nama], [Alamat], [NoTelp], [TglLahir], [Email], [status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate], [username], [password], [IDRole]) VALUES (2, N'Danis Andika', N'Ja', N'087856678907', CAST(N'2019-12-14' AS Date), N'd@gmail.com', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 4, CAST(N'2019-12-10T00:00:00.000' AS DateTime), N'DanisAndika', N'Danis', 3)
INSERT [dbo].[User] ([IDUser], [Nama], [Alamat], [NoTelp], [TglLahir], [Email], [status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate], [username], [password], [IDRole]) VALUES (4, N'Sheila Ayu', N'Cikarang', N'082191221321', CAST(N'2019-03-08' AS Date), N'as@gmail.com', 1, 1, CAST(N'2019-12-08T00:00:00.000' AS DateTime), NULL, NULL, N'Sheila', N'Sheila', 1)
INSERT [dbo].[User] ([IDUser], [Nama], [Alamat], [NoTelp], [TglLahir], [Email], [status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate], [username], [password], [IDRole]) VALUES (5, N'Rika Arum', N'Boyolali', N'05673829908', CAST(N'2019-12-11' AS Date), N'rika@gmail.com', 1, 1, CAST(N'2019-12-08T00:00:00.000' AS DateTime), NULL, NULL, N'Rika', N'Rika', 2)
INSERT [dbo].[User] ([IDUser], [Nama], [Alamat], [NoTelp], [TglLahir], [Email], [status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate], [username], [password], [IDRole]) VALUES (6, N'Lita Eka Wulansari', N'Temanggung', N'08768686675', CAST(N'2019-02-08' AS Date), N'lita@gmail.com', 1, 1, CAST(N'2019-12-08T00:00:00.000' AS DateTime), NULL, NULL, N'lita', N'lita', 2)
INSERT [dbo].[User] ([IDUser], [Nama], [Alamat], [NoTelp], [TglLahir], [Email], [status], [CreateBy], [CreateDate], [ModifiedBy], [ModifiedDate], [username], [password], [IDRole]) VALUES (8, N'Diyyane', N'Jawa Barat', N'087856678907', CAST(N'2019-12-13' AS Date), N'Dayyen@gmail.com', 0, 1, CAST(N'2019-12-10T00:00:00.000' AS DateTime), NULL, NULL, N'halo', N'MUSTIKA2019', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
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
ALTER TABLE [dbo].[Dokter]  WITH CHECK ADD  CONSTRAINT [FK_Dokter_jadwal_Dokter1] FOREIGN KEY([ID_Jadwal])
REFERENCES [dbo].[jadwal_Dokter] ([ID_Jadwal])
GO
ALTER TABLE [dbo].[Dokter] CHECK CONSTRAINT [FK_Dokter_jadwal_Dokter1]
GO
ALTER TABLE [dbo].[Dokter]  WITH CHECK ADD  CONSTRAINT [FK_Dokter_jenis_dokter1] FOREIGN KEY([ID_SP])
REFERENCES [dbo].[jenis_dokter] ([ID_SP])
GO
ALTER TABLE [dbo].[Dokter] CHECK CONSTRAINT [FK_Dokter_jenis_dokter1]
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
/****** Object:  StoredProcedure [dbo].[DdlJenis]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DdlJenis]
as
begin
select IDJenis,namaJenis from JenisObat where statusJenis =1
end
GO
/****** Object:  StoredProcedure [dbo].[sp_cekObat]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_cekObat]
@IDObat varchar(50)
as
select
namaObat from obat
where IDObat = @IDObat
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteDokter]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DeleteDokter]
@IDDokter int,
@status int
as
begin	

	if @status =1
	begin
	update Dokter set status=0 where ID_Dokter=@IDDokter
	end
else
	begin
	update Dokter set status=1 where ID_Dokter=@IDDokter
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteInfo]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DeleteInfo]
@IDInfo int,
@status int
as
begin	

	if @status =1
	begin
	update info set status=0 where IDInfo=@IDInfo
	end
else
	begin
	update info set status=1 where IDInfo=@IDInfo
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteJenis]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DeleteJenis]
@idJenis int,
@status int
as
begin	

	if @status =1
	begin
	update JenisObat set statusJenis=0 where IDJenis=@idJenis
	end
else
	begin
	update JenisObat set statusJenis=1 where IDJenis=@idJenis
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletejenisDokter]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DeletejenisDokter]
@ID_SP int,
@status int
as
begin	

	if @status =1
	begin
	update jenis_dokter set status=0 where ID_SP=@ID_SP
	end
else
	begin
	update jenis_dokter set status=1 where ID_SP=@ID_SP
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteObat]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DeleteObat]
@IDObat int,
@status int
as
begin	

	if @status =1
	begin
	update Obat set status=0 where IDObat=@IDObat
	end
else
	begin
	update Obat set status=1 where IDObat=@IDObat
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRole]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--DELETE ROLE
CREATE PROCEDURE [dbo].[sp_DeleteRole]
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteUser]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DeleteUser]
@IDUser int,
@status int
as
begin	

	if @status =1
	begin
	update [User] set status=0 where IDUser=@IDUser
	end
else
	begin
	update [User] set status=1 where IDUser=@IDUser
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_HapusLokasi]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HapusLokasi]
	@IDLokasi int
	
AS
BEGIN
	UPDATE Lokasi_Penyimpanan
	set
	[Status]=0 
	WHERE IDLokasi = @IDLokasi
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HapusSupplier]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HapusSupplier]
	@IDSupplier int,
	@status int
as
begin	
	if @status =1
	begin
	update Supplier set status=0 where IDSupplier=@IDSupplier
	end
else
	begin
	update Supplier set status=1 where IDSupplier=@IDSupplier
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InputDetailTransaksiPembelian]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[sp_InputDetailTransaksiPembelian]
	
	@IDPembelian varchar(20),
	@IDObat int,
	@jumlah int,
	@subTotal money

AS
BEGIN 

	INSERT INTO [dbo].detailPembelian
           (IDPembelian
           ,IDObat
           ,jumlah
           ,subTotal)
    values (
	@IDPembelian,
	@IDObat,
	@jumlah,
	@subTotal
	)

	Update Obat set
	JumlahObat = JumlahObat+@Jumlah
	where IDObat = @IDObat
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InputDokter]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InputDokter]
	@NIP int,
	@nama varchar(50),
	@jenis_Kelamin int,
	@alamat  varchar(100),
	@username  varchar(50),
	@password  varchar(50),
	@email  varchar(50),
	@foto  varchar(max),
	@ID_SP int,
	@status int,
	@ID_Jadwal int,
	@CreateBy int,
	@CreateDate date

AS
BEGIN
	INSERT INTO Dokter(
	[NIP] ,
	[nama],
	[jenis_kelamin],
	[alamat],
	[username],
	[password],
	[email],
	[foto] ,
	[ID_SP] ,
	[status],
	[ID_Jadwal],
	CreateBy,
	CreateDate
	)
	VALUES
	(
  	@NIP ,
	@nama,
	@jenis_Kelamin ,
	@alamat,
	@username ,
	@password,
	@email,
	@foto,
	@ID_SP ,
	1,
	@ID_Jadwal,
	@CreateBy,
	@CreateDate
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InputInfo]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InputInfo]
    @Judul varchar(50),
    @Kategori varchar(50),
	@Konten varchar (max),
	@waktuPost datetime,
	@CreateBy int,
	@CreateDate date,
	@status int,
	@foto varchar(max)	
AS
BEGIN
	INSERT INTO [info]
	(
	Judul,
    Kategori,
	Konten ,
	waktuPost ,
	CreateBy ,
	CreateDate ,
	[status],
	foto 
	)
	VALUES
	(
    @Judul,
    @Kategori,
	@Konten ,
	@waktuPost ,
	@CreateBy ,
	@CreateDate ,
	@status ,
	@foto 
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InputJenisDokter]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InputJenisDokter]
	@nama_jenis varchar(50),
	@status int,
	@CreateBy int,
	@CreateDate date

AS
BEGIN
	INSERT INTO jenis_dokter(
	nama_jenis,
	[status],
	CreateBy,
	CreateDate
	)
	VALUES
	(
	@nama_jenis,
	1,
	@CreateBy,
	@CreateDate
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InputObat]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InputObat]
    @namaObat varchar(50),
    @IDJenis int,
	@Keterangan varchar (max),
	@IDLokasi int,
	@JumlahObat int,
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
	JumlahObat,
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
	@JumlahObat,
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
/****** Object:  StoredProcedure [dbo].[sp_inputPembelian]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_inputPembelian]
@IDPembelian varchar(50),
@tanggal datetime,
@totalBayar money,
@IDSupplier int,
@IDKaryawan int
 as
 begin
 insert into dbo.Pembelian
 (
 IDPembelian,
 tanggal,
 totalBayar,
 IDSupplier,
 IDKaryawan,
 [status]
 )
 values(
 @IDPembelian,
 @tanggal,
 @totalBayar,
 @IDSupplier,
 @IDKaryawan ,
 1)
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_InputSupplier]    Script Date: 30/12/2019 03:33:58 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_InputUser]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InputUser]
    @Nama varchar(50),
    @Alamat varchar(100),
	@NoTelp varchar (15),
	@TglLahir date,
	@Email varchar(50),
	@status int,
	@Username varchar(50),
	@Password varchar(50),
	@CreateBy int,
	@CreateDate date,
	@IDRole int
	
AS
BEGIN
	INSERT INTO [User] (
    Nama,
    Alamat,
	NoTelp,
	TglLahir,
	Email,
	status,
	Username,
	Password,
	CreateBy,
	CreateDate,
	IDRole
	)
	VALUES
	(
    @Nama,
    @Alamat,
	@NoTelp,
	@TglLahir,
	@Email,
	1,
	@Username,
	@Password,
	@CreateBy,
	@CreateDate,
	@IDRole
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertJenis]    Script Date: 30/12/2019 03:33:58 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_InsertJenisDOkter]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsertJenisDOkter]
@namajenis varchar(50),
@deskripsi varchar(max),
@CreateBy int,
@CreateDate datetime
as
insert into jenis_dokter (nama_jenis,status,deskripsi,CreateBy,CreateDate) values (@namajenis,1,@deskripsi,@CreateBy,@CreateDate)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertLokasi]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsertLokasi]
@Nama_Lokasi varchar(50),
@tempatLokasi varchar(50),
@Deskripsi varchar(max),
@CreateBy int,
@CreateDate datetime
as
insert into Lokasi_Penyimpanan(Nama_Lokasi,tempatLokasi,Deskripsi,[status],CreateBy,CreateDate) values (@Nama_Lokasi,@tempatLokasi,@deskripsi,1,@CreateBy,@CreateDate)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertRole]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsertRole]
@deskripsi varchar(50),
@CreateBy int,
@CreateDate datetime
as
insert into Role (deskripsi,status,CreateBy,CreateDate) values (@deskripsi,1,@CreateBy,@CreateDate)
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchLokasi]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SearchLokasi]
	@NamaLokasi nvarchar (50),
	@Deskripsi nvarchar(max)
AS
BEGIN
		SELECT l.IDLokasi,l.Nama_Lokasi,l.Deskripsi,case when Status=1 then
	 'Aktif' when status=0 then 'Tidak Aktif' end AS 'Status', l.tempatLokasi FROM Lokasi_Penyimpanan l
	WHERE Nama_Lokasi LIKE '%'+@NamaLokasi+'%' or Deskripsi LIKE '%'+@Deskripsi+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchManagement]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_SearchManagement]
	@tanggalTransaksi nvarchar (50),
	@Debit nvarchar(max)
AS
BEGIN
		SELECT l.tanggalTransaksi,l.Debit,l.Kredit FROM Management_Uang l
	WHERE tanggalTransaksi LIKE '%'+@tanggalTransaksi+'%' or Debit LIKE '%'+@Debit+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchSupplier]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SearchSupplier]
	@NamaSupplier nvarchar (50)
AS
BEGIN
		SELECT s.IDSupplier,s.NamaSupplier, s.AlamatSupplier, s.EmailSupplier, s.noTelp, s.Status,
		 u.Nama, s.CreateDate, u.Nama, s.ModifiedDate FROM Supplier s, [User] u where (s.NamaSupplier like '%'+@NamaSupplier+'%') and s.CreateBy=u.IDUser
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectDokter]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectDokter]
@nama varchar(50)
as
select * from dokter u, jenis_dokter jn, jadwal_Dokter  jd
where  (u.Nama like '%'+@nama+'%') and u.ID_Jadwal=jd.ID_Jadwal and u.ID_SP= jn.ID_SP
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectDokterAktif]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectDokterAktif]
@nama varchar(50)
as
select * from dokter u, jenis_dokter jn, jadwal_Dokter  jd
where  (u.Nama like '%'+@nama+'%') and u.ID_Jadwal=jd.ID_Jadwal and u.ID_SP= jn.ID_SP and u.status=1
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectDokterNA]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectDokterNA]
@nama varchar(50)
as
select * from dokter u, jenis_dokter jn, jadwal_Dokter  jd
where  (u.Nama like '%'+@nama+'%') and u.ID_Jadwal=jd.ID_Jadwal and u.ID_SP= jn.ID_SP and u.status=0
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectInfo]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectInfo]
@Judul varchar(50)
as
select IDinfo,Judul,Kategori,konten,waktuPost,createBy,createDate,ModifiedBy,ModifiedDate,
status,foto from info where (Judul like '%'+@Judul+'%')
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectInfoAktif]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectInfoAktif]
@Judul varchar(50)
as
select IDinfo,Judul,Kategori,left(Konten,100),waktuPost,createBy,createDate,ModifiedBy,ModifiedDate,
status,foto from info where Status = 1 and (Judul like '%'+@Judul+'%')
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectInfoAll]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectInfoAll]
@Judul varchar(50)
as
select IDinfo,Judul,Kategori,left(Konten,100),waktuPost,createBy,createDate,ModifiedBy,ModifiedDate,
status,foto from info where (Judul like '%'+@Judul+'%')
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectInfoNA]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectInfoNA]
@Judul varchar(50)
as
select * from info where Status =  0 and (Judul like '%'+@Judul+'%')
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectJDOkAktif]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectJDOkAktif]
@nama varchar(50)
as
select * from jenis_dokter u
where  (u.nama_jenis like '%'+@nama+'%') and u.status=1
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectJDOkALL]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectJDOkALL]
@nama varchar(50)
as
select * from jenis_dokter u
where  (u.nama_jenis like '%'+@nama+'%') 
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectJDOkNA]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectJDOkNA]
@nama varchar(50)
as
select * from jenis_dokter u
where  (u.nama_jenis like '%'+@nama+'%') and u.status=0
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectJenis]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectJenis]
@namajenis varchar(50),
@deskripsi varchar(max)
as
select j.IDJenis, j.namaJenis, j.Deskripsi,j.statusJenis,u.Nama,
 j.CreateDate,u.Nama,j.ModifiedDate from JenisObat j, [User] u
where (namaJenis like '%'+@namajenis+'%' or deskripsi like '%'+@deskripsi+'%') 
and j.CreateBy = u.IDUser and j.ModifiedBy = u.IDUser
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectJenisAktif]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectJenisAktif]
@namajenis varchar(50),
@deskripsi varchar(max)
as
select j.IDJenis, j.namaJenis, j.Deskripsi,j.statusJenis,u.Nama,
 j.CreateDate,u.Nama,j.ModifiedDate from JenisObat j, [User] u
where (namaJenis like '%'+@namajenis+'%' or deskripsi like '%'+@deskripsi+'%') 
and j.CreateBy = u.IDUser
and statusJenis=1
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectJenisAktifDokter]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectJenisAktifDokter]
@namajenis varchar(50),
@deskripsi varchar(max)
as
select j.ID_SP,j.nama_jenis,j.status,j.deskripsi,u.Nama, j.CreateDate,u.Nama,j.ModifiedDate from jenis_dokter j, [User] u
where (nama_jenis like '%'+@namajenis+'%' or deskripsi like '%'+@deskripsi+'%') 
and j.CreateBy = u.IDUser 
and j.status = 1
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectJenisALL]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectJenisALL]
@namajenis varchar(50),
@deskripsi varchar(max)
as
select * from JenisObat  where (namaJenis like '%'+@namajenis+'%' or deskripsi like '%'+@deskripsi+'%')
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectJenisDokter]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectJenisDokter]
@namajenis varchar(50),
@deskripsi varchar(max)
as
select j.ID_SP,j.nama_jenis, j.deskripsi,j.[status],u.Nama,
 j.CreateDate,j.ModifiedDate from jenis_dokter j, [User] u
where (j.nama_jenis like '%'+@namajenis+'%' or j.deskripsi like '%'+@deskripsi+'%') 
and j.CreateBy = u.IDUser 
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectJenisNA]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectJenisNA]
@namajenis varchar(50),
@deskripsi varchar(max)
as
select j.IDJenis, j.namaJenis, j.Deskripsi,j.statusJenis,u.Nama,
 j.CreateDate,u.Nama,j.ModifiedDate from JenisObat j, [User] u
where (namaJenis like '%'+@namajenis+'%' or deskripsi like '%'+@deskripsi+'%') 
and j.CreateBy = u.IDUser 
and statusJenis=0
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectJenisNADokter]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectJenisNADokter]
@namajenis varchar(50),
@deskripsi varchar(max)
as
select j.ID_SP,j.nama_jenis, j.deskripsi,j.[status],u.Nama,
 j.CreateDate,j.ModifiedDate from jenis_dokter j, [User] u
where (j.nama_jenis like '%'+@namajenis+'%' or j.deskripsi like '%'+@deskripsi+'%') 
and j.CreateBy = u.IDUser 
and j.[status]=0
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectLokasi]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectLokasi]
@Nama_Lokasi varchar(max)
as
select * from Lokasi_Penyimpanan where (Nama_Lokasi like '%'+@Nama_Lokasi+'%') and Status = 1
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectLokasiAktif]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectLokasiAktif]
@Nama_Lokasi varchar(max)
as
select * from Lokasi_Penyimpanan where Status = 1 and (Nama_Lokasi like '%'+@Nama_Lokasi+'%')
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectLokasiAll]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectLokasiAll]
@Nama_Lokasi varchar(max)
as
select * from Lokasi_Penyimpanan where (Nama_Lokasi like '%'+@Nama_Lokasi+'%')
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectLokasiNA]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectLokasiNA]
@Nama_Lokasi varchar(max)
as
select * from Lokasi_Penyimpanan where Status = 0 and (Nama_Lokasi like '%'+@Nama_Lokasi+'%')
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectObat]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectObat]
@namaObat varchar(max)
as
select o.IDObat, o.namaObat, j.namaJenis, o.JumlahObat,o.Keterangan,p.Nama_Lokasi,o.Satuan,o.Harga,o.Expired,
 o.Foto, u.Nama, o.CreateDate, o.ModifiedDate,u.Nama,o.status from Obat o, Lokasi_Penyimpanan p, JenisObat j,[User] u
where (o.namaObat like '%'+@namaObat+'%') and o.IDJenis= j.IDJenis and o.IDLokasi= p.IDLokasi and o.CreateBy = u.IDUser and o.ModifiedBy = u.IDUser
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectObatAktif]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectObatAktif]
@namaObat varchar(max)
as
select o.IDObat, o.namaObat, j.namaJenis, o.JumlahObat,o.Keterangan,p.Nama_Lokasi,o.Satuan,o.Harga,o.Expired,
 o.Foto,u.Nama, o.CreateDate, u.Nama,o.ModifiedDate,o.status from Obat o, Lokasi_Penyimpanan p, JenisObat j, [User] u
where (o.namaObat like '%'+@namaObat+'%') and o.status = 1 and o.IDJenis= j.IDJenis and o.IDLokasi= p.IDLokasi and o.CreateBy = u.IDUser 
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectObatAll]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectObatAll]
@Nama varchar(50),
@jenis varchar (50)
as
select o.IDObat, o.namaObat, j.namaJenis, o.JumlahObat,o.Keterangan,p.Nama_Lokasi,o.Satuan,o.Harga,o.Expired, o.Foto,
u.Nama, o.CreateDate, u.Nama,o.ModifiedDate,o.status from Obat o, Lokasi_Penyimpanan p, JenisObat j, [User] u
where o.IDJenis= j.IDJenis and o.IDLokasi= p.IDLokasi and (namaObat like '%'+@Nama+'%') or namaJenis like  '%'+@jenis+'%' 
and o.CreateBy = u.IDUser 
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectObatNA]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectObatNA]
@namaObat varchar(max)
as
select o.IDObat, o.namaObat, j.namaJenis, o.JumlahObat,o.Keterangan,p.Nama_Lokasi,o.Satuan,o.Harga,
o.Expired, o.Foto, u.Nama, o.CreateDate, u.Nama,o.ModifiedDate,o.status from Obat o, Lokasi_Penyimpanan p, JenisObat j, [User] u
where (o.namaObat like '%'+@namaObat+'%') and o.status = 0 and o.IDJenis= j.IDJenis and o.IDLokasi= p.IDLokasi and o.CreateBy = u.IDUser 
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectObatterjual]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectObatterjual]
as
select o.IDObat, o.namaObat, j.namaJenis, o.JumlahObat,o.Keterangan,p.Nama_Lokasi,o.Satuan,o.Harga,o.Expired,
 o.Foto,u.Nama, o.CreateDate, u.Nama,o.ModifiedDate,o.status from Obat o, Lokasi_Penyimpanan p, JenisObat j, [User] u
where o.status = 1 and o.IDJenis= j.IDJenis and o.IDLokasi= p.IDLokasi and o.CreateBy = u.IDUser 
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectRole]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectRole]
@deskripsi varchar(50)
as
select * from dbo.Role where (deskripsi like '%'+@deskripsi+'%') 
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectRoleAktif]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectRoleAktif]
@Nama varchar(50)
as
select * from dbo.Role where status = 1  and(Deskripsi like '%'+@Nama+'%') 
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectRoleAll]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectRoleAll]
@Nama varchar(50)
as
select * from dbo.Role where (Deskripsi like '%'+@Nama+'%') 
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectRoleNA]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectRoleNA]
@Nama varchar(50)
as
select * from dbo.Role where status = 0 and(Deskripsi like '%'+@Nama+'%') 
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectSupplierAktif]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectSupplierAktif]
@Nama varchar(50)
AS
BEGIN
		SELECT s.IDSupplier,s.NamaSupplier, s.AlamatSupplier, s.EmailSupplier, s.noTelp, s.Status,
		 u.Nama, s.CreateDate, u.Nama, s.ModifiedDate FROM Supplier s, [User] u where (s.NamaSupplier like '%'+@Nama+'%') and s.CreateBy=u.IDUser and s.Status=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectSupplierAll]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectSupplierAll]
@Nama varchar(50)
AS
BEGIN
		SELECT s.IDSupplier,s.NamaSupplier, s.AlamatSupplier, s.EmailSupplier, s.noTelp, s.Status,
		 u.Nama, s.CreateDate, u.Nama, s.ModifiedDate FROM Supplier s, [User] u where (s.NamaSupplier like '%'+@Nama+'%') and s.CreateBy=u.IDUser
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectSupplierNA]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectSupplierNA]
@Nama varchar(50)
AS
BEGIN
		SELECT s.IDSupplier,s.NamaSupplier, s.AlamatSupplier, s.EmailSupplier, s.noTelp, s.Status,
		 u.Nama, s.CreateDate, u.Nama, s.ModifiedDate FROM Supplier s, [User] u where (s.NamaSupplier like '%'+@Nama+'%') and s.CreateBy=u.IDUser and s.Status=0
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectUser]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectUser]
@Nama varchar(50)
as
select u.IDUser,u.Nama, u.Alamat, u.NoTelp,u.TglLahir, u.Email, u.username, u.password,u.status,u.Nama,u.CreateDate,
u.Nama,u.ModifiedDate, r.Deskripsi from [User] u, Role r
where (u.Nama like '%'+@Nama+'%') and u.IDRole=r.IDRole
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectUserAktif]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectUserAktif]
@Nama varchar(50)
as
select u.IDUser,u.Nama, u.Alamat, u.NoTelp,u.TglLahir, u.Email, u.username, u.password,u.status,u.CreateBy,u.CreateDate,u.ModifiedBy,u.ModifiedDate, r.Deskripsi from [User] u, Role r
where u.status = 1 and (u.Nama like '%'+@Nama+'%') and u.IDRole=r.IDRole
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectUserAll]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectUserAll]
@Nama varchar(50)
as
select u.IDUser,u.Nama, u.Alamat, u.NoTelp,u.TglLahir, u.Email, u.username, u.password,u.status,u.CreateBy,u.CreateDate,
u.ModifiedBy,u.ModifiedDate, r.Deskripsi from [User] u, Role r
where (u.Nama like '%'+@Nama+'%') and u.IDRole=r.IDRole
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectUserMember]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectUserMember]
@Nama varchar(50)
as
select u.IDUser,u.Nama, u.Alamat, u.NoTelp,u.TglLahir, u.Email, u.username, u.password,r.Deskripsi from [User] u, Role r where (Nama like '%'+@Nama+'%') and u.status = 1 and u.IDRole=r.IDRole
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectUserNA]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SelectUserNA]
@Nama varchar(50)
as
select u.IDUser,u.Nama, u.Alamat, u.NoTelp,u.TglLahir, u.Email, u.username,
 u.password,u.status,u.CreateBy,u.CreateDate,u.ModifiedBy,u.ModifiedDate, r.Deskripsi from [User] u, Role r
where u.status = 0 and (u.Nama like '%'+@Nama+'%') and u.IDRole=r.IDRole 
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateBuna]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateBuna]
	@IDObat int,
    @namaObat varchar(50),
	@IDJenis int,
	@IDLokasi int,
    @JumlahObat int,
	@Keterangan varchar(30),
	@Satuan varchar (15),
	@Status int,
	@Harga money,
	@Expired date,
	@Foto varchar (max),
	@ModifiedBy int,
	@ModifiedDate date
	
AS
BEGIN
	UPDATE Obat
	set
    namaObat = @namaObat,
	IDJenis =@IDJenis ,
	IDLokasi =@IDLokasi ,
    JumlahObat= @JumlahObat ,
	Keterangan =@Keterangan ,
	Satuan =@Satuan,
	Status=@Status ,
	Harga =@Harga ,
	Expired = @Expired ,
	Foto = @Foto,
	ModifiedBy=@ModifiedBy ,
	ModifiedDate =@ModifiedDate
	WHERE IDObat = @IDObat
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateDokter]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateDokter]
	@ID_Dokter int,
    @NIP int,
	@nama varchar(50),
	@jenis_Kelamin int,
	@alamat  varchar(100),
	@username  varchar(50),
	@password  varchar(50),
	@email  varchar(50),
	@foto  varchar(max),
	@ID_SP int,
	@status int,
	@ID_Jadwal int,
	@modifiedBy int,
	@modifiedDate date

	
AS
IF @foto ='NULL'
BEGIN
	UPDATE Dokter
	set
   	NIP=@NIP  ,
	nama =@nama,
	jenis_Kelamin=@jenis_Kelamin ,
	alamat=@alamat,
	username=@username  ,
	password=@password,
	email=@email,
	ID_SP=@ID_SP,
	status=1,
	ID_Jadwal=@ID_Jadwal,
	modifiedBy=@modifiedBy,
	modifiedDate=@modifiedDate
	where ID_Dokter = @ID_Dokter
END
ELSE 
BEGIN
	UPDATE Dokter
	set
	NIP=@NIP  ,
	nama =@nama,
	jenis_Kelamin=@jenis_Kelamin ,
	alamat=@alamat,
	username=@username  ,
	password=@password,
	email=@email,
	foto =@foto,
	ID_SP=@ID_SP,
	status=1,
	ID_Jadwal=@ID_Jadwal,
	modifiedBy=@modifiedBy,
	modifiedDate=@modifiedDate
	where ID_Dokter = @ID_Dokter
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateInfo]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateInfo]
	@IDInfo int,
    @Judul varchar(50),
    @Kategori varchar(50),
	@Konten varchar (max),
	@waktuPost datetime,
	@CreateBy int,
	@CreateDate date,
	@status int,
	@foto varchar(max)	
	
AS
BEGIN
	UPDATE info
	set
    Judul=@Judul,
    kategori=@Kategori,
	konten=@Konten ,
	waktuPost=@waktuPost ,
	createBy=@CreateBy ,
	createDate=@CreateDate ,
	status=@status ,
	foto=@foto 
	WHERE IDInfo = @IDInfo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateJenis]    Script Date: 30/12/2019 03:33:58 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateJenisDokter]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_UpdateJenisDokter]
@idJenis int,
@namajenis varchar(50),
@deskripsi varchar(max),
@ModifiedBy int,
@ModifiedDate datetime
as
update jenis_dokter set 
	nama_jenis = @namajenis,
	deskripsi=@deskripsi,
	ModifiedBy = @ModifiedBy,
	ModifiedDate = @ModifiedDate
	where ID_SP = @idJenis
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateLokasi]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateLokasi]
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateObat]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateObat]
	@IDObat int,
    @namaObat varchar(50),
	@IDJenis int,
	@IDLokasi int,
    @JumlahObat int,
	@Keterangan varchar(30),
	@Satuan varchar (15),
	@Status int,
	@Harga money,
	@Expired date,
	@Foto varchar (max),
	@ModifiedBy int,
	@ModifiedDate date
	
AS
IF @Foto ='NULL'
BEGIN
	UPDATE Obat
	set
    namaObat = @namaObat,
	IDJenis =@IDJenis ,
	IDLokasi =@IDLokasi ,
    JumlahObat= @JumlahObat ,
	Keterangan =@Keterangan ,
	Satuan =@Satuan,
	Status=@Status ,
	Harga =@Harga ,
	Expired = @Expired ,
	ModifiedBy=@ModifiedBy ,
	ModifiedDate =@ModifiedDate
	WHERE IDObat = @IDObat
END
ELSE
BEGIN
	UPDATE Obat
	set
    namaObat = @namaObat,
	IDJenis =@IDJenis ,
	IDLokasi =@IDLokasi ,
    JumlahObat= @JumlahObat ,
	Keterangan =@Keterangan ,
	Satuan =@Satuan,
	Status=@Status ,
	Harga =@Harga ,
	Foto= @Foto,
	Expired = @Expired ,
	ModifiedBy=@ModifiedBy ,
	ModifiedDate =@ModifiedDate
	WHERE IDObat = @IDObat
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateRole]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--UPDATE ROLE
CREATE proc [dbo].[sp_UpdateRole]
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateSupplier]    Script Date: 30/12/2019 03:33:58 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateUser]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_UpdateUser]
	@IDUser int,
	@Nama varchar(50),
    @Alamat varchar(100),
	@NoTelp varchar (15),
	@TglLahir date,
	@Email varchar(50),
	@status int,
	@Username varchar(50),
	@Password varchar(50),
	@ModifiedBy int,
	@ModifiedDate date
	
AS
BEGIN
	UPDATE [User]
	set
    Nama = @Nama,
	Alamat =@Alamat ,
	NoTelp =@NoTelp ,
    TglLahir= @TglLahir ,
	Email =@Email,
	Status=@status ,
	username =@Username ,
	password=@Password ,
	ModifiedBy=@ModifiedBy ,
	ModifiedDate =@ModifiedDate
	WHERE IDUser = @IDUser
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdatExpiredObat]    Script Date: 30/12/2019 03:33:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdatExpiredObat]
	@status int,
    @JumlahObat int,
	@ModifiedBy int,
	@ModifiedDate date
AS
BEGIN
	UPDATE Obat 
	set
	[Status]=@Status ,
    jumlahObat =@JumlahObat,
	ModifiedBy=@ModifiedBy ,
	ModifiedDate =@ModifiedDate
end
GO
