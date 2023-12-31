USE [QLShopAo]
GO
/****** Object:  Table [dbo].[AoQuan]    Script Date: 21/12/2022 12:02:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AoQuan](
	[maao] [nvarchar](50) NOT NULL,
	[tenao] [nvarchar](max) NULL,
	[soluong] [bigint] NULL,
	[gia] [bigint] NULL,
	[maloai] [nvarchar](50) NULL,
	[anh] [nvarchar](max) NULL,
 CONSTRAINT [PK_sach] PRIMARY KEY CLUSTERED 
(
	[maao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHD] [bigint] IDENTITY(1,1) NOT NULL,
	[Maao] [nvarchar](50) NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[MaHoaDon] [bigint] NOT NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Quyen] [bit] NOT NULL,
 CONSTRAINT [PK_DangNhap] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[MaHoaDon] [bigint] IDENTITY(1,1) NOT NULL,
	[makh] [bigint] NULL,
	[NgayMua] [datetime] NOT NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[makh] [bigint] NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[diachi] [nvarchar](50) NULL,
	[sodt] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[tendn] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loai]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai](
	[maloai] [nvarchar](50) NOT NULL,
	[tenloai] [nvarchar](50) NULL,
 CONSTRAINT [PK_loai] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VXacNhanChiTiet]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VXacNhanChiTiet]
AS
SELECT dbo.ChiTietHoaDon.MaChiTietHD, dbo.hoadon.MaHoaDon, dbo.KhachHang.makh, dbo.KhachHang.hoten, dbo.AoQuan.tenao, dbo.AoQuan.gia, dbo.ChiTietHoaDon.SoLuongMua, dbo.ChiTietHoaDon.SoLuongMua * dbo.AoQuan.gia AS ThanhTien, dbo.hoadon.NgayMua, 
             dbo.ChiTietHoaDon.damua, dbo.hoadon.damua AS damuaHD
FROM   dbo.AoQuan INNER JOIN
             dbo.ChiTietHoaDon ON dbo.AoQuan.maao = dbo.ChiTietHoaDon.Maao INNER JOIN
             dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
             dbo.KhachHang ON dbo.hoadon.makh = dbo.KhachHang.makh
GO
/****** Object:  View [dbo].[VXacNhanHoaDon]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VXacNhanHoaDon]
AS
SELECT MaHoaDon, damuaHD, SUM(SoLuongMua) AS tongmua, SUM(ThanhTien) AS tongtien
FROM   dbo.VXacNhanChiTiet
GROUP BY MaHoaDon, damuaHD
GO
/****** Object:  View [dbo].[abc]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[abc]
AS
SELECT     dbo.sach.tensach, dbo.loai.tenloai, dbo.ChiTietHoaDon.SoLuongMua
FROM         dbo.ChiTietHoaDon INNER JOIN
                      dbo.sach ON dbo.ChiTietHoaDon.MaSach = dbo.sach.masach INNER JOIN
                      dbo.loai ON dbo.sach.maloai = dbo.loai.maloai
GO
/****** Object:  View [dbo].[HtSach]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HtSach]
AS
SELECT     dbo.sach.maloai, dbo.loai.tenloai, dbo.sach.masach, dbo.sach.tensach, dbo.sach.tacgia, dbo.sach.gia
FROM         dbo.loai INNER JOIN
                      dbo.sach ON dbo.loai.maloai = dbo.sach.maloai
GO
/****** Object:  View [dbo].[LichSuMuaHang]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LichSuMuaHang]
AS
SELECT dbo.KhachHang.makh, dbo.hoadon.MaHoaDon, dbo.AoQuan.tenao, dbo.ChiTietHoaDon.SoLuongMua, dbo.AoQuan.gia, dbo.ChiTietHoaDon.SoLuongMua * dbo.AoQuan.gia AS ThanhTien, dbo.ChiTietHoaDon.damua, dbo.hoadon.NgayMua
FROM   dbo.AoQuan INNER JOIN
             dbo.ChiTietHoaDon ON dbo.AoQuan.maao = dbo.ChiTietHoaDon.Maao INNER JOIN
             dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
             dbo.KhachHang ON dbo.hoadon.makh = dbo.KhachHang.makh
GO
/****** Object:  View [dbo].[rrr]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[rrr]
AS
SELECT     dbo.loai.tenloai, dbo.sach.tensach, dbo.sach.gia, dbo.ChiTietHoaDon.SoLuongMua
FROM         dbo.ChiTietHoaDon INNER JOIN
                      dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
                      dbo.sach ON dbo.ChiTietHoaDon.MaSach = dbo.sach.masach INNER JOIN
                      dbo.loai ON dbo.sach.maloai = dbo.loai.maloai
GO
/****** Object:  View [dbo].[tk]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tk]
AS
SELECT     dbo.loai.tenloai, SUM(dbo.sach.soluong) AS TongSoLuong, AVG(dbo.sach.gia) AS TBCGia, COUNT(dbo.sach.tensach) AS SoSach
FROM         dbo.loai INNER JOIN
                      dbo.sach ON dbo.loai.maloai = dbo.sach.maloai
GROUP BY dbo.loai.tenloai
GO
/****** Object:  View [dbo].[Vabcd]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vabcd]
AS
SELECT     dbo.ChiTietHoaDon.MaSach, dbo.ChiTietHoaDon.SoLuongMua, dbo.hoadon.NgayMua, dbo.loai.tenloai, dbo.sach.soluong
FROM         dbo.ChiTietHoaDon INNER JOIN
                      dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
                      dbo.sach ON dbo.ChiTietHoaDon.MaSach = dbo.sach.masach INNER JOIN
                      dbo.loai ON dbo.sach.maloai = dbo.loai.maloai
GO
/****** Object:  View [dbo].[Vhoadon]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vhoadon]
AS
SELECT     dbo.sach.masach, dbo.sach.tensach, dbo.sach.gia, dbo.ChiTietHoaDon.SoLuongMua
FROM         dbo.sach INNER JOIN
                      dbo.ChiTietHoaDon ON dbo.sach.masach = dbo.ChiTietHoaDon.MaSach INNER JOIN
                      dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon
WHERE     (dbo.hoadon.damua = 0)
GO
/****** Object:  View [dbo].[Vqq]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vqq]
AS
SELECT     dbo.loai.tenloai, dbo.sach.tensach, dbo.sach.tacgia, dbo.ChiTietHoaDon.SoLuongMua
FROM         dbo.ChiTietHoaDon INNER JOIN
                      dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
                      dbo.sach ON dbo.ChiTietHoaDon.MaSach = dbo.sach.masach INNER JOIN
                      dbo.loai ON dbo.sach.maloai = dbo.loai.maloai
GO
/****** Object:  View [dbo].[VTamBay]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VTamBay]
AS
SELECT     dbo.ChiTietHoaDon.MaSach, dbo.ChiTietHoaDon.SoLuongMua, dbo.hoadon.makh, dbo.hoadon.NgayMua, dbo.KhachHang.diachi, dbo.KhachHang.hoten, 
                      dbo.sach.tensach, dbo.sach.tacgia
FROM         dbo.ChiTietHoaDon INNER JOIN
                      dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
                      dbo.KhachHang ON dbo.hoadon.makh = dbo.KhachHang.Makh INNER JOIN
                      dbo.sach ON dbo.ChiTietHoaDon.MaSach = dbo.sach.masach INNER JOIN
                      dbo.loai ON dbo.sach.maloai = dbo.loai.maloai
GO
/****** Object:  View [dbo].[Vtest]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vtest]
AS
SELECT     dbo.sach.tensach, dbo.loai.tenloai, dbo.ChiTietHoaDon.SoLuongMua, dbo.sach.gia, dbo.hoadon.NgayMua, dbo.KhachHang.hoten
FROM         dbo.ChiTietHoaDon INNER JOIN
                      dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
                      dbo.KhachHang ON dbo.hoadon.makh = dbo.KhachHang.makh INNER JOIN
                      dbo.sach ON dbo.ChiTietHoaDon.MaSach = dbo.sach.masach INNER JOIN
                      dbo.loai ON dbo.sach.maloai = dbo.loai.maloai
GO
/****** Object:  View [dbo].[VTK]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VTK]
AS
SELECT     dbo.loai.tenloai, COUNT(dbo.sach.tacgia) AS SoSach, SUM(dbo.sach.soluong) AS TongSl, AVG(dbo.sach.gia) AS TbcGia
FROM         dbo.loai INNER JOIN
                      dbo.sach ON dbo.loai.maloai = dbo.sach.maloai
GROUP BY dbo.loai.tenloai
GO
/****** Object:  View [dbo].[VTKabc]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VTKabc]
AS
SELECT     dbo.loai.tenloai, SUM(dbo.sach.soluong) AS Tongkho, SUM(dbo.ChiTietHoaDon.SoLuongMua) AS Tongmua, COUNT(dbo.KhachHang.hoten) AS SoKH
FROM         dbo.loai INNER JOIN
                      dbo.sach ON dbo.loai.maloai = dbo.sach.maloai INNER JOIN
                      dbo.ChiTietHoaDon ON dbo.sach.masach = dbo.ChiTietHoaDon.MaSach INNER JOIN
                      dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
                      dbo.KhachHang ON dbo.hoadon.makh = dbo.KhachHang.makh
GROUP BY dbo.loai.tenloai
GO
/****** Object:  View [dbo].[Vtktest]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vtktest]
AS
SELECT     dbo.loai.tenloai, SUM(dbo.sach.soluong) AS Tongsl, SUM(dbo.ChiTietHoaDon.SoLuongMua) AS Tongslmua, COUNT(dbo.KhachHang.hoten) AS SoKhach
FROM         dbo.hoadon INNER JOIN
                      dbo.ChiTietHoaDon ON dbo.hoadon.MaHoaDon = dbo.ChiTietHoaDon.MaHoaDon INNER JOIN
                      dbo.sach INNER JOIN
                      dbo.loai ON dbo.sach.maloai = dbo.loai.maloai ON dbo.ChiTietHoaDon.MaSach = dbo.sach.masach INNER JOIN
                      dbo.KhachHang ON dbo.hoadon.makh = dbo.KhachHang.makh
GROUP BY dbo.loai.tenloai
GO
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'a1', N'ÁO POLO KHÓA KÉO PDN157', 30, 224000, N'AO PHONG', N'image_sach/298791505_5483178385054862_9176270203507987936_n_34a7d1d0086a4436a0462df787c11665_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'a10', N'T-SHIRT PHỐI 2 MẢNG MÀU ĐEN XÁM PDN158', 30, 175000, N'AO PHONG', N'image_sach/297669122_5469536079752426_8230372938681617429_n_006084fa382740789095bfd8785ec5ea_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'a2', N'T-SHIRT HỌA TIẾT BLINK PDN144', 30, 154000, N'AO PHONG', N'image_sach/293373542_5404581212914580_4126177307769937349_n_9daa3d5da30049fb9319eecada489fe3_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'a3', N'T-SHIRT DEDICATE PDN148', 30, 188000, N'AO PHONG', N'image_sach/289643154_5359268554112513_6912102657645687275_n_e862373a48064759a96660f4d34a252c_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'a4', N'T-SHIRT GOOD VIBES MẶT CƯỜI PDN129', 30, 154000, N'AO PHONG', N'image_sach/278486870_5148030511902986_6071858964300196736_n_f33a2e6b4bbb43319d69328f1788833b_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'a5', N'T-SHIRT IN CHỮ HÀN PDN097', 30, 154000, N'AO PHONG', N'image_sach/186501723_4132919356747445_6956283307074650981_n_7554d9cf090b46de93452823859b526b_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'a6', N'T-SHIRT KẺ CHIM MANDO - PDN162', 30, 153000, N'AO PHONG', N'image_sach/412_7f6c6b7695dd47a3bf90730003c35dbd_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'a7', N'T-SHIRT LAVIEN ROSE PDN152', 30, 188000, N'AO PHONG', N'image_sach/294667394_5438194869553214_3519039238241211646_n_409485e522b042da8e8686a8578f4f56_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'a8', N'T-SHIRT LET''S GO CAMPING PDN160', 30, 188000, N'AO PHONG', N'image_sach/1604_523d3c43376b40a0aaf1e88b291cb5fb_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'a9', N'T-SHIRT OPTIMISTC PDN159', 30, 188000, N'AO PHONG', N'image_sach/297820728_5469535896419111_8637185094438226148_n_1d80bfb870ac40d2b5065429214f313a_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'b1', N'ÁO SHIRT CỔ SƠ MI TRƠN SHT003', 20, 287000, N'SO MI', N'image_sach/sht003_web__16__ecd88a9f0e98471294ef9d675d12dbda_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'b2', N'ÁO SƠ MI CARO NAM MANDO - ACB40', 30, 99000, N'SO MI', N'image_sach/acb40__8__ff965fe7c4b644a1a53ea122c0db954b_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'b3', N'ÁO SƠ MI CARO NAM MANDO - ACB96', 30, 149000, N'SO MI', N'image_sach/acb96__23__59713a89ce3b4987ae9b1eb92f552cff_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'b4', N'ÁO SƠ MI CARO NAM MANDO - SMD034', 30, 149000, N'SO MI', N'image_sach/278474301_5147200058652698_3195364430245986804_n_e230d571bc4f4fdc8d9caa53051071b3_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'b5', N'ÁO SƠ MI CARO NAM MANDO - SMD083', 30, 149000, N'SO MI', N'image_sach/smd083__6__6c1bbb3804984c4ba0a9084c26bb2b4c_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'b6', N'ÁO SƠ MI CARO NAM MANDO - SMD108', 30, 199000, N'SO MI', N'image_sach/1082_f285627e763d4de883e9c48420e3d6dd_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'c1', N'ÃO BLAZER TAY Lá»  WOULD YOU - AVH002', 20, 315000, N'BLAZER TAY LO', N'image_sach/avh002__6__62b6789176294021a7d98f3ec4b50e10_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'c2', N'BLAZER TAY LỠ AVH009', 20, 199000, N'BLAZER TAY LO', N'image_sach/277558182_5118861558153215_3930532514650599555_n_1f56e55778b84bdfbe3ba581eb354cff_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'c3', N'BLAZER TAY LỠ AVH011', 20, 199000, N'BLAZER TAY LO', N'image_sach/278859220_5157866950919342_5287272918553998496_n_6b87c9695bf24f4cbf8d9b7517147a92_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'c4', N'BLAZER TAY LỠ AVH013', 20, 199000, N'BLAZER TAY LO', N'image_sach/1132_6a2e3db90400457f8c073dda1084c013_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'c5', N'BLAZER TAY LỠ AVH014', 20, 199000, N'BLAZER TAY LO', N'image_sach/279852444_5215588435147193_5500433922773351109_n_fac577da0314416198007cf9a5a437cf_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'd1', N'ÁO KHOÁC JEAN NAM CÓ MŨ - KJN006', 30, 385000, N'QUAN JEANS', N'image_sach/imgm1752_result_3d2d2d8b428a40428e4d0c30a05b2bf7_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'd2', N'QUẦN JEAN FORM SKINNY RÁCH GỐI - QJN058', 40, 333000, N'QUAN JEANS', N'image_sach/qjn058_7ee6b7f725a04ab997166f39542d4ea6_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'd3', N'QUẦN JEAN NAM ỐNG XUÔNG MANDO - QJ33', 40, 315000, N'QUAN JEANS', N'image_sach/337_8426bcf717844ca7b6c9a75eb08110bf_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'd4', N'QUẦN JEAN NAM ỐNG XUÔNG MANDO - QJN056', 40, 224000, N'QUAN JEANS', N'image_sach/apt01__32__51b134312b7a4e9bbec2688893126879_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'd5', N'QUẦN JEAN NAM ỐNG XUÔNG MANDO - QJN057', 40, 315000, N'QUAN JEANS', N'image_sach/qjn057__2__aa42425474204ae48bbbca5922b14b93_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'e1', N'QUẦN ÂU NAM DÁNG LOOSE - TRS011', 15, 279000, N'QUAN AU', N'image_sach/2_893ec9ba13c94fd1b85c4f9c2fb572eb_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'e2', N'QUẦN ÂU NAM ỐNG CÔN - QA01', 15, 361000, N'QUAN AU', N'image_sach/nvk_3305_345f10aeac4c455e97cb9bc853979d88_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'e3', N'QUẦN ÂU NAM ỐNG CÔN - QKN056', 15, 315000, N'QUAN AU', N'image_sach/qkn056__1__9b5b336aa1954ed89e8b522adc7ca463_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'e4', N'QUẦN ÂU NAM ỐNG XUÔNG CẠP SAU CHUN - TRS007', 15, 223000, N'QUAN AU', N'image_sach/qkn054__1__75aa1f39281a4dd7a631c415be7e8f04_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'e5', N'QUẦN ÂU NAM ỐNG XUÔNG CẠP SAU CHUN MANDO - TRS002', 15, 314000, N'QUAN AU', N'image_sach/nvk_9198_c967388288da447c99cf0fa57403d6ed_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'f1', N'QUẦN SHORT ÂU PHỐI DÂY ĐAI - QSN042', 30, 160000, N'QUAN SHORTS', N'image_sach/nvk_1725_614cfdf5917f481ca038219b8310df44_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'f2', N'QUẦN SHORT GIÓ NAM MANDO - QSN044', 30, 135000, N'QUAN SHORTS', N'image_sach/nvk_0146_d38f8191b0c741c58f89f383084f012a_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'f3', N'QUẦN SHORT KAKI NAM MANDO - QSN045', 30, 189000, N'QUAN SHORTS', N'image_sach/nvk_0118_fb6603ab835f430fa2cdde38d58307f6_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'f4', N'QUẦN SHORT NAM MANDO - QSN043', 30, 126000, N'QUAN SHORTS', N'image_sach/412_3d114cd54e974b568c0167e3feaa8ead_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'f5', N'QUẦN SHORT UMI NAM MANDO - QSN035', 30, 175000, N'QUAN SHORTS', N'image_sach/nvk_3932_1dd1d9c1c68a4560b0ef636685bec8dd_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'g1', N'ÁO NỈ DÀI TAY CỔ BẺ 3 MÀU MANDO SWT022', 10, 209000, N'SWEATER', N'image_sach/sht005_web_501812b727d145918538496f06e0cdc7_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'g2', N'ÁO SWEATER BASIC SIMPLE LOVE MANDO SWT006', 10, 209000, N'SWEATER', N'image_sach/sht005_web__18__b4c08d58f5e54d4093c78435e66c6a3b_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'g3', N'ÁO SWEATER CHỮ M FRIEND SWT002', 10, 224000, N'SWEATER', N'image_sach/dang_2_web__4__aabc034efda5498db3d103aefc34d50b_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'g4', N'ÁO SWEATER FRIEND YOUTH SWT001', 10, 314000, N'SWEATER', N'image_sach/hod002_web__21__351e76e3ceec4d09a905144d4e1180c2_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'g5', N'ÁO SWEATER NAM PHỐI MÀU FORM RỘNG - SWT012', 10, 224000, N'SWEATER', N'image_sach/swt012___jog007_7096697de5b84241bcb6839cf9b42cc9_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'h1', N'ÃO HOODIE NAM 2 CÃC Báº¤M PEEK-A-DOO0 - HOD008', 25, 359000, N'HOODIE', N'image_sach/hod008___jog007_3944e9edf5f146829aafb08b0c09d3b9_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'h2', N'ÃO HOODIE NAM FORM Rá»NG CHáº¤T LIá»U Ná» CÃO DÃY Dáº¶N - HOD004', 25, 315000, N'HOODIE', N'image_sach/hod004___jog007__1__3100eaba2e12453cb8b86fe2cff9a69a_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'h3', N'ÃO HOODIE NAM FORM Rá»NG HÃNH IN Äá»C ÄÃO MANDO - HOD005', 25, 359000, N'HOODIE', N'image_sach/hod005___jog007_6944aada5f7448e9ae2c2a0467580651_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'h4', N'ÃO HOODIE Ná» BÃNG THÃU MDHL HOD001', 25, 449000, N'HOODIE', N'image_sach/hod001_web__3__426b450e380b43d9aa10d70b7e7bb449_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'h5', N'ÃO HOODIE TRÆ N BASIC HOD002', 25, 314000, N'HOODIE', N'image_sach/hod002_web__27__fa11fc542c8341b1af12cf4d137ce8c8_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'i1', N'ÁO HOODIE NAM 2 CÚC BẤM PEEK-A-DOO0 - HOD008', 30, 449000, N'AO KHOAC', N'image_sach/bob005__1__aeb6b6da474b4046b8ea00f363feb44c_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'i2', N'ÁO HOODIE NAM FORM RỘNG CHẤT LIỆU NỈ CÀO DÀY DẶN - HOD004', 30, 449000, N'AO KHOAC', N'image_sach/dang_2_web__19__c7278192db1e4e2bb748e97e4a94e9de_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'i3', N'ÁO HOODIE NAM FORM RỘNG HÌNH IN ĐỘC ĐÁO MANDO - HOD005', 30, 349000, N'AO KHOAC', N'image_sach/dang_2_web__31__c5f371afcc6a471886d8fb068314214e_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'i4', N'ÁO HOODIE NỈ BÔNG THÊU MDHL HOD001', 30, 494000, N'AO KHOAC', N'image_sach/hod002_web__28__5a7803e8a8ce42aa81bf3d2434b6da6c_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'i5', N'ÁO HOODIE TRƠN BASIC HOD002', 30, 449000, N'AO KHOAC', N'image_sach/hod002_web__15__2201d31ec9a34ef4935738d683f609c9_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'i6', N'HOODIE BASIC IN CHỮ YOUTH 2 MÀU HOD003', 30, 494000, N'AO KHOAC', N'image_sach/dang_2_web__26__8884eba5eb334261ba802479f00b07a5_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'j1', N'ÁO BLAZER DÀI TAY TÚI TRẦN CHỈ BLZ002', 15, 315000, N'BLAZER DAI TAY', N'image_sach/avh011__qkn053__18__5cd18a3ceef84b0fa750f842b9a54bb9_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'j2', N'BLAZER CÓ ĐAI THẮT CÁ TÍNH BLZ007', 15, 349000, N'BLAZER DAI TAY', N'image_sach/dang_2_web__6__2d0d73dfda3248bea57a50160c9e476c_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'j3', N'BLAZER DÀI TAY CÓ XÍCH TREO TRƯỚC NGỰC BLZ005', 15, 449000, N'BLAZER DAI TAY', N'image_sach/avh011__qkn053__7__8348dbf634e4497885cb349832b57e2c_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'j4', N'BLAZER DÀI TAY NEW TREND BLZ003', 15, 349000, N'BLAZER DAI TAY', N'image_sach/dang_2_web_e41932f74a3544dfa7bc68e01b4309a1_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'j5', N'BLAZER DÀI TAY THÊU CHỮ BLZ001', 15, 349000, N'BLAZER DAI TAY', N'image_sach/avh011__qkn053__13__d75cbf4787804d749ec14d661e5c0d57_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'j6', N'BLAZER DÀI TAY TỔ ONG BLZ004', 30, 349000, N'BLAZER DAI TAY', N'image_sach/sht005_web__8__bc21030baef74780826e2fd67ae5ae71_grande.jpg')
INSERT [dbo].[AoQuan] ([maao], [tenao], [soluong], [gia], [maloai], [anh]) VALUES (N'j7', N'BLAZER TRƠN CHẤT LIỆU TUYẾT MƯA BLZ006', 15, 404000, N'BLAZER DAI TAY', N'image_sach/sht003_web__8__7afddda2a69148b3b6ce9641ad84a778_grande.jpg')
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [Maao], [SoLuongMua], [MaHoaDon], [damua]) VALUES (34, N'a1', 1, 32, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [Maao], [SoLuongMua], [MaHoaDon], [damua]) VALUES (35, N'a2', 1, 32, 0)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'admin', N'123', 0)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'dencan', N'111', 1)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'nhha', N'2ezur0ziU1o=', 1)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'nhha76', N'J2A461dUG8UKL/8XBhus3g==', 1)
GO
SET IDENTITY_INSERT [dbo].[hoadon] ON 

INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (1, 20, CAST(N'1989-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (2, 21, CAST(N'1945-01-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (3, 20, CAST(N'2017-10-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (4, 22, CAST(N'2022-12-16T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (5, 22, CAST(N'2022-12-16T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (6, 22, CAST(N'2022-12-16T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (7, 22, CAST(N'2022-12-16T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (8, 22, CAST(N'2022-12-16T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (9, 22, CAST(N'2022-12-16T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (10, 22, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (11, 21, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (12, 21, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (13, 22, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (14, 22, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (15, 22, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (16, 22, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (17, 22, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (18, 20, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (19, 20, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (20, 20, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (21, 20, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (22, 22, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (23, 22, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (24, 20, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (25, 21, CAST(N'2022-12-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (26, 22, CAST(N'2022-12-18T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (27, 22, CAST(N'2022-12-18T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (28, 22, CAST(N'2022-12-20T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (29, 22, CAST(N'2022-12-20T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (30, 22, CAST(N'2022-12-20T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (31, 22, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (32, 22, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[hoadon] OFF
GO
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (20, N'Nguyễn Khắc Chung', N'Huế', NULL, NULL, N'nkchung', N'123123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (21, N'Le Van Duc', N'hu hu', NULL, NULL, N'Le Van Duc', N'123123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (22, N'Pham Van Trai', N'hu hu', NULL, NULL, N'Pham Van Trai', N'123123')
GO
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'AO KHOAC', N'ÁO KHOÁC')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'AO PHONG', N'ÁO PHÔNG')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'BLAZER DAI TAY', N'BLAZER DÀI TAY')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'BLAZER TAY LO', N'BLAZER TAY LỠ')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'HOODIE', N'HOODIE')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'QUAN AU', N'QUẦN ÂU')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'QUAN JEANS', N'QUẦN JEANS')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'QUAN SHORTS', N'QUẦN SHORTS')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'SO MI', N'SƠ MI')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'SWEATER', N'SWEATER')
GO
ALTER TABLE [dbo].[AoQuan]  WITH CHECK ADD  CONSTRAINT [FK_AoQuan_loai] FOREIGN KEY([maloai])
REFERENCES [dbo].[loai] ([maloai])
GO
ALTER TABLE [dbo].[AoQuan] CHECK CONSTRAINT [FK_AoQuan_loai]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_hoadon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[hoadon] ([MaHoaDon])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_hoadon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_sach] FOREIGN KEY([Maao])
REFERENCES [dbo].[AoQuan] ([maao])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_sach]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_KhachHang] FOREIGN KEY([makh])
REFERENCES [dbo].[KhachHang] ([makh])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_KhachHang]
GO
/****** Object:  StoredProcedure [dbo].[TimKiem]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TimKiem](@bien nvarchar(5))
as
  select * from sach where maloai =@bien
GO
/****** Object:  StoredProcedure [dbo].[TimMaLoai]    Script Date: 21/12/2022 12:02:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TimMaLoai]( @maloai nvarchar(50))
as
select * from sach where maloai=@maloai
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[23] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "loai"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 95
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sach"
            Begin Extent = 
               Top = 6
               Left = 434
               Bottom = 125
               Right = 594
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'abc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'abc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "loai"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 95
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sach"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HtSach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HtSach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[31] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AoQuan"
            Begin Extent = 
               Top = 105
               Left = 64
               Bottom = 302
               Right = 286
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 254
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 16
               Left = 593
               Bottom = 213
               Right = 815
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 112
               Left = 876
               Bottom = 309
               Right = 1098
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LichSuMuaHang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LichSuMuaHang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "loai"
            Begin Extent = 
               Top = 6
               Left = 434
               Bottom = 95
               Right = 594
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sach"
            Begin Extent = 
               Top = 0
               Left = 588
               Bottom = 119
               Right = 748
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'rrr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'rrr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'rrr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[37] 4[37] 2[1] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "loai"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 95
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sach"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 2505
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "loai"
            Begin Extent = 
               Top = 6
               Left = 434
               Bottom = 95
               Right = 594
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sach"
            Begin Extent = 
               Top = 96
               Left = 434
               Bottom = 215
               Right = 594
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vabcd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'nd
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vabcd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vabcd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[37] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "sach"
            Begin Extent = 
               Top = 6
               Left = 240
               Bottom = 125
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 0
               Left = 445
               Bottom = 119
               Right = 605
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 4
               Left = 31
               Bottom = 123
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vhoadon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vhoadon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "loai"
            Begin Extent = 
               Top = 6
               Left = 434
               Bottom = 95
               Right = 594
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sach"
            Begin Extent = 
               Top = 5
               Left = 580
               Bottom = 124
               Right = 740
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vqq'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vqq'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vqq'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -172
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 6
               Left = 434
               Bottom = 125
               Right = 594
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 114
               Left = 236
               Bottom = 233
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "loai"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 215
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sach"
            Begin Extent = 
               Top = 126
               Left = 434
               Bottom = 245
               Right = 594
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VTamBay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VTamBay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VTamBay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[14] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 6
               Left = 434
               Bottom = 125
               Right = 594
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "loai"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 215
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sach"
            Begin Extent = 
               Top = 126
               Left = 236
               Bottom = 245
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vtest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vtest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vtest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[23] 4[43] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "loai"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 95
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sach"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VTK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VTK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[19] 4[43] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "loai"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 95
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sach"
            Begin Extent = 
               Top = 0
               Left = 244
               Bottom = 119
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 16
               Left = 547
               Bottom = 135
               Right = 707
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 96
               Left = 38
               Bottom = 215
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 97
               Left = 439
               Bottom = 216
               Right = 599
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Ta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VTKabc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'ble = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VTKabc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VTKabc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[30] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "sach"
            Begin Extent = 
               Top = 0
               Left = 206
               Bottom = 119
               Right = 366
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "loai"
            Begin Extent = 
               Top = 2
               Left = 535
               Bottom = 91
               Right = 695
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 47
               Left = 375
               Bottom = 166
               Right = 535
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 36
               Left = 0
               Bottom = 155
               Right = 160
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 96
               Left = 573
               Bottom = 215
               Right = 733
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vtktest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vtktest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vtktest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[29] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AoQuan"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 9
               Left = 615
               Bottom = 206
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 9
               Left = 894
               Bottom = 206
               Right = 1116
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VXacNhanChiTiet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VXacNhanChiTiet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "VXacNhanChiTiet"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VXacNhanHoaDon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VXacNhanHoaDon'
GO
