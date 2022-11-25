CREATE DATABASE QuanLySanBay
GO
USE QuanLySanBay
GO
CREATE TABLE KhachHang(
	id VARCHAR(255) PRIMARY KEY,
	ten nVARCHAR(255),
	diaChi nVARCHAR(255),
	cmnd VARCHAR(50),
	dob DATE,
	sdt CHAR(20)
)
GO
CREATE TABLE ChiNhanh(
	id VARCHAR(255) PRIMARY KEY,
	ten NVARCHAR(255),
	diaChi NVARCHAR(255)
)
GO
CREATE TABLE NhanVien(
	id VARCHAR(255) PRIMARY KEY,
	ten NVARCHAR(255),
	diaChi NVARCHAR(255),
	dob DATE,
	sdt CHAR(20),
	chucVu NVARCHAR(50),
	id_cn VARCHAR(255) REFERENCES dbo.ChiNhanh(id)
)
GO
CREATE TABLE SanBay(
	id VARCHAR(255) PRIMARY KEY,
	ten NVARCHAR(255),
	tinh NVARCHAR(255)
)
GO
CREATE TABLE TuyenBay(
	id VARCHAR(255) PRIMARY KEY,
	ten NVARCHAR(255),
	id_sbdi VARCHAR(255),
	id_sbden VARCHAR(255),
	FOREIGN KEY(id_sbdi) REFERENCES dbo.SanBay(id),
)
GO
CREATE TABLE MayBay(
	id VARCHAR(255) PRIMARY KEY,
	ten NVARCHAR(255),
	soGhe INT,
	tinhTrang NVARCHAR(255),
	id_sb VARCHAR(255) REFERENCES dbo.SanBay(id)
)
GO
CREATE TABLE ChuyenBay(
	id VARCHAR(255) PRIMARY KEY,
	ngayKhoiHanh DATE,
	gioKhoiHanh TIME(7),
	id_mb VARCHAR(255) REFERENCES dbo.MayBay(id),
	id_tb VARCHAR(255) REFERENCES dbo.TuyenBay(id)
)
--pending
GO
CREATE TABLE Ve(
	id VARCHAR(255) PRIMARY KEY,
	loaive VARCHAR(255),
	soGhe INT,
	hangGhe INT,
	tinhTrang VARCHAR(255),
	id_cb VARCHAR(255) REFERENCES dbo.ChuyenBay(id),
	id_cn VARCHAR(255) REFERENCES dbo.ChiNhanh(id)
)
GO
CREATE TABLE HoaDon(
	id VARCHAR(255),
	ngayLap DATE,
	thanhtien INT,
	id_kh VARCHAR(255) REFERENCES dbo.KhachHang(id),
	id_ve VARCHAR(255) REFERENCES dbo.Ve(id),
	id_nv VARCHAR(255) REFERENCES dbo.NhanVien(id)
)