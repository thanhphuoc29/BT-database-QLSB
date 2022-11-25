USE QuanLySanBay
GO

INSERT INTO dbo.KhachHang
(
    id,
    ten,
    diaChi,
    cmnd,
    dob,
    sdt
)
VALUES
('KH01',N'Nguyễn Văn An',N'Dương Nội-Hà Đông','033141125','2000-02-01','09815151151'),
('KH02',N'Nguyễn Trund Đức',N'Trung Văn-Hà Đông','03314315','2000-07-12','098152462'),
('KH03',N'Lê Văn Long',N'Phùng Khoang-Hà Đông','033151526','2000-05-20','0314252525'),
('KH04',N'Trần Đình Lương',N'Cầu Giấy','0339185151','2000-12-01','09815155161'),
('KH05',N'Lê Trọng Tấn',N'Bắc Từ Liêm','0345373723','2000-09-12','09771515915')
GO
INSERT INTO dbo.ChiNhanh
(
    id,
    ten,
    diaChi
)
VALUES
('CN01',N'Chi nhánh số 1','Dương Nội-Hà Đông'),
('CN02',N'Chi nhánh số 2','Nội Bài'),
('CN03',N'Chi nhánh số 1','Bắc Ninh')
GO

INSERT INTO dbo.NhanVien
(
    id,
    ten,
    diaChi,
    dob,
    sdt,
    chucVu,
    id_cn
)
VALUES
('NV01',N'Nguyễn Đức Anh','Hà Nội','1998-12-02','09881441515',N'Tiếp tân','CN01'),
('NV02',N'Nguyễn Văn Đức','Hà Nôi','1997-03-05','0988611411',N'Tiếp tân','CN02'),
('NV03',N'Đào Trọng Tấn','Nam Định','2000-07-08','09261134152',N'Tiếp tân','CN01'),
('NV04',N'Phùng Văn An','Bắc Ninh','1999-12-20','0988144114',N'Tiếp tân','CN01'),
('NV05',N'Nguyễn Thị Mai','Hải Phòng','2000-09-01','09141551515',N'Tiếp tân','CN03')
GO
INSERT INTO dbo.SanBay
(
    id,
    ten,
    tinh
)
VALUES
('SB01',N'Sân bay Hà Nội','Tỉnh 1'),
('SB02',N'Sân bay Sài Gòn','Tỉnh 2'),
('SB03',N'Sân bay Đà Nẵng','Tỉnh 3')
GO
INSERT INTO dbo.TuyenBay
(
    id,
    ten,
    id_sbdi,
    id_sbden
)
VALUES
('TB01',N'Hà Nội - Đà Nẵng','SB01','SB03'),
('TB02',N'Hà Nội - Sài Gòn','SB01','SB02'),
('TB03',N'Đà Nẵng - Sài Gòn','SB03','SB02')

GO
INSERT INTO dbo.MayBay
(
    id,
    ten,
    soGhe,
    tinhTrang,
    id_sb
)
VALUES
('MB01',N'Airline',50,N'Mới','SB01'),
('MB02',N'Bamboo',50,N'Mới','SB02'),
('MB03',N'VietJeck',50,N'Mới','SB03')

GO
INSERT INTO dbo.ChuyenBay
(
    id,
    ngayKhoiHanh,
    gioKhoiHanh,
    id_mb,
    id_tb
)
VALUES
('CB01','2022-10-25','09:00:00','MB01','TB01'),
('CB02','2022-10-25','10:00:00','MB02','TB02'),
('CB03','2022-10-26','11:30:00','MB03','TB01'),
('CB04','2022-10-27','08:30:00','MB01','TB03'),
('CB05','2022-10-28','09:00:00','MB02','TB01')

GO
INSERT INTO dbo.Ve
(
    id,
    loaive,
    soGhe,
    hangGhe,
    tinhTrang,
    id_cb,
    id_cn
)
VALUES
('V01','Basic',50,2,'New','CB01','CN01'),
('V02','VIP',70,1,'New','CB02','CN02'),
('V03','Basic',50,3,'New','CB03','CN01'),
('V04','VIP',50,1,'New','CB04','CN02'),
('V05','Basic',50,5,'New','CB05','CN01')

GO
INSERT INTO dbo.HoaDon
(
    id,
    ngayLap,
    thanhtien,
    id_kh,
    id_ve,
    id_nv
)
VALUES
('HD01','2022-09-12',10000000,'KH01','V01','NV01'),
('HD02','2022-02-15',10000000,'KH02','V05','NV02'),
('HD03','2022-09-16',20000000,'KH03','V02','NV03'),
('HD04','2022-09-17',20000000,'KH04','V03','NV04'),
('HD05','2022-02-18',10000000,'KH05','V04','NV05')
