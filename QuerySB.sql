USE QuanLySanBay
GO

--Cau 1: Liet ke nhan vien co dia chi tai ha noi
SELECT * FROM dbo.NhanVien AS nv
WHERE nv.diaChi LIKE '%Hà N%'

--cau 2: Liệt kê những hóa đơn của tuyến bay có mã 01
SELECT hd.id,hd.ngayLap,hd.thanhtien,hd.id_kh,hd.id_ve,dbo.TuyenBay.id AS [Mã tuyến bay]
FROM dbo.HoaDon AS hd
JOIN dbo.Ve ON Ve.id = hd.id_ve
JOIN dbo.ChuyenBay ON ChuyenBay.id = Ve.id_cb
JOIN dbo.TuyenBay ON TuyenBay.id = ChuyenBay.id_tb
WHERE dbo.TuyenBay.id='TB01'

-- Câu 3: Liệt kê ra tất cả thông tin vé máy bay của các khách hàng có mã 01
SELECT dbo.Ve.id,dbo.Ve.loaive,dbo.Ve.soGhe,ve.hangGhe,dbo.Ve.tinhTrang,ve.id_cb,ve.id_cn,
dbo.KhachHang.id AS [id KH]
FROM dbo.Ve
JOIN dbo.HoaDon ON HoaDon.id_ve = Ve.id
JOIN dbo.KhachHang ON KhachHang.id = HoaDon.id_kh
WHERE dbo.KhachHang.id='KH01'

-- Câu 4: Liệt kê sân bay có mọi máy bay
SELECT A.id,A.ten
FROM (
	SELECT dbo.SanBay.id,dbo.SanBay.ten,COUNT(dbo.MayBay.id) AS [Số máy bay]
	FROM dbo.SanBay
	LEFT JOIN dbo.MayBay ON MayBay.id_sb = SanBay.id
	GROUP BY dbo.SanBay.id,dbo.SanBay.ten) AS A
WHERE A.[Số máy bay]=(SELECT COUNT(dbo.MayBay.id) FROM dbo.MayBay)

-- Câu 5: 
SELECT * FROM dbo.TuyenBay
WHERE id_sbdi='SB01' AND id_sbden='SB02'

-- Câu 6: Liệt kê thông tin khách hàng mua hàng vào tháng 2
SELECT kh.id,kh.ten,kh.diaChi,kh.cmnd,kh.dob,kh.sdt
FROM dbo.HoaDon
JOIN dbo.KhachHang AS kh ON kh.id = HoaDon.id_kh
WHERE MONTH(dbo.HoaDon.ngayLap)='02'

-- Câu 7: Liệt kê thông tin của hóa đơn bán hàng vào ngày 12 tháng 9
SELECT * FROM dbo.HoaDon
WHERE DAY(ngayLap)='12' AND MONTH(ngayLap)='09'

-- Câu 8: Đếm số máy bay của mỗi sân bay 
SELECT dbo.SanBay.id,dbo.SanBay.ten,COUNT(dbo.MayBay.id) AS [Số máy bay]
FROM dbo.SanBay
LEFT JOIN dbo.MayBay ON MayBay.id_sb = SanBay.id
GROUP BY dbo.SanBay.id,dbo.SanBay.ten

-- Câu 9: Đếm số chuyến bay tại sân bay Đà nẵng
SELECT dbo.SanBay.id,dbo.SanBay.ten,COUNT(dbo.ChuyenBay.id) AS [Số chuyến bay]
FROM dbo.ChuyenBay
JOIN dbo.TuyenBay ON TuyenBay.id = ChuyenBay.id_tb
JOIN dbo.SanBay ON SanBay.id = TuyenBay.id_sbdi OR SanBay.id = TuyenBay.id_sbden
GROUP BY dbo.SanBay.id,dbo.SanBay.ten
HAVING dbo.SanBay.id='SB03'

-- Câu 10: Đếm số lượng vé mỗi nhân viên bán được trong tháng 9
SELECT dbo.NhanVien.id,dbo.NhanVien.ten,A.[Số vé bán]
FROM 
(
	SELECT dbo.NhanVien.id,dbo.NhanVien.ten,COUNT(dbo.HoaDon.id) AS [Số vé bán]
	FROM dbo.NhanVien 
	LEFT JOIN dbo.HoaDon ON HoaDon.id_nv = NhanVien.id
	WHERE MONTH(dbo.HoaDon.ngayLap)='09'
	GROUP BY dbo.NhanVien.id,dbo.NhanVien.ten ) AS A
RIGHT JOIN dbo.NhanVien ON A.id=dbo.NhanVien.id
