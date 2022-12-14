CREATE DATABASE QLBH
USE QLBH

-- TUAN 1

CREATE TABLE KHACHHANG
(
MAKH char(4) primary key,
HOTEN varchar(40),
DCHI varchar(50),
SODT varchar(20),
NGSINH smalldatetime,
DOANHSO money,
NGDK smalldatetime,
CMND varchar(10)
)
CREATE TABLE NHANVIEN(
MANV CHAR(4) PRIMARY KEY,
HOTEN VARCHAR(40),
DCHI VARCHAR (50),
NGVL SMALLDATETIME,
SODT VARCHAR(20)
)
CREATE TABLE SANPHAM(
MASP CHAR(4) PRIMARY KEY,
TENSP VARCHAR(40),
DVT VARCHAR(10),
NUOCSX VARCHAR(20),
GIA FLOAT
)
CREATE TABLE HOADON(
SOHD INT PRIMARY KEY,
NGHD SMALLDATETIME,
MAKH CHAR(4) FOREIGN KEY REFERENCES KHACHHANG(MAKH),
MANV CHAR(4) FOREIGN KEY REFERENCES NHANVIEN(MANV),
TRIGIA FLOAT
)
CREATE TABLE CTHD(
SOHD INT FOREIGN KEY REFERENCES HOADON(SOHD),
MASP CHAR(4) FOREIGN KEY REFERENCES SANPHAM(MASP),
SL INT,
CONSTRAINT PK_CTHD PRIMARY KEY (SOHD,MASP)
)
ALTER TABLE KHACHHANG DROP COLUMN CMND

ALTER TABLE SANPHAM ALTER COLUMN GIA MONEY

ALTER TABLE SANPHAM ALTER COLUMN DVT VARCHAR(20)

ALTER TABLE HOADON ALTER COLUMN TRIGIA MONEY

ALTER TABLE SANPHAM ADD GHICHU VARCHAR(20)

ALTER TABLE KHACHHANG ADD LOAIKH TINYINT

ALTER TABLE SANPHAM ALTER COLUMN GHICHU VARCHAR(100)

ALTER TABLE SANPHAM DROP COLUMN GHICHU

ALTER TABLE KHACHHANG ALTER COLUMN LOAIKH VARCHAR(12)

ALTER TABLE KHACHHANG ADD CONSTRAINT VALUE_CHECK CHECK(LOAIKH='Vip' OR LOAIKH='Vang lai' OR LOAIKH='Thuong xuyen')

ALTER TABLE SANPHAM ADD CONSTRAINT DVT_CHECK CHECK(DVT IN('cay','hop','cai','quyen','chuc'))

ALTER TABLE SANPHAM ADD CONSTRAINT PRICE_CHECK CHECK(GIA >= 500)

ALTER TABLE CTHD ADD CONSTRAINT AMOUNT_CHECK CHECK(SL >= 1)

ALTER TABLE KHACHHANG ADD CONSTRAINT BIRTHDAY_CHECK CHECK(NGDK > NGSINH)

-- TUAN 2

SET DATEFORMAT DMY

-- Nhập data cho KHACHHANG
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH01', 'Nguyen Van A', '731, Tran Hung Dao, Q5, TPHCM', '08823451', '22/10/1960', 13060000, '22/07/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH02', 'Tran Ngoc Han', '23/5 Nguyen Trai, Q5, TpHCM', '0908256478', '03/04/1974', 280000, '30/07/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH03', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '0938776266', '12/06/1980', 3860000, '05/08/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH04', 'Tran Minh Long', '50/34 Le Dai hanh, Q10, TpHCM', '0917325476', '09/03/1965', 250000, '02/10/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH05', 'Le Nhat Minh', '34 Truong Dinh, Q3, TPHCM', '08246108', '10/03/1960', 21000, '28/10/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH06', 'Le Hoai Thuong', '227 Nguyen Van Cu, Q5, TpHCM', '08631738', '31/12/1981', 915000, '24/11/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH07', 'Nguyen Van Tam', '32/3 Tran Binh Trong, Q5, TpHCM', '0916783565', '06/04/1971', 12500, '01/12/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH08', 'Phan Thi Thanh', '45/2 An Duong Vuong, Q5, TPHCM', '0938435756', '10/01/1971', 365000, '13/12/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH09', 'Le Ha Vinh', '873 Le Hong Phong, Q5, TPHCM', '08654763', '03/09/1979', 70000, '14/01/2007')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH10', 'Ha Duy Lap', '34/34B Nguyen Trai, Q1, TPHCM', '08768904', '02/05/1963', 67500, '16/01/2007')

-- Nhập dữ liệu cho NHANVIEN
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES ('NV01', 'Nguyen Nhu Nhut', '0927345678', '13/4/2006')
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES ('NV02', 'Le Thi Phi Yen', '0987567390', '21/4/2006')
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES ('NV03', 'Nguyen Van B', '0997047382', '27/4/2006')
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES ('NV04', 'Ngo Thanh Tuan', '0913758498', '24/6/2006')
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES ('NV05', 'Nguyen Thi Truc Thanh', '0918590387', '20/7/2006')

-- Nhập dữ liệu cho SANPHAM
INSERT INTO SANPHAM VALUES('BC01','But chi','cay','Singapore',3000)
INSERT INTO SANPHAM VALUES('BC02','But chi','cay','Singapore',5000)
INSERT INTO SANPHAM VALUES('BC03','But chi','cay','Viet Nam',3500)
INSERT INTO SANPHAM VALUES('BC04','But chi','hop','Viet Nam',30000)
INSERT INTO SANPHAM VALUES('BB01','But bi','cay','Viet Nam',5000)
INSERT INTO SANPHAM VALUES('BB02','But bi','cay','Trung Quoc',7000)
INSERT INTO SANPHAM VALUES('BB03','But bi','hop','Thai Lan',100000)
INSERT INTO SANPHAM VALUES('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
INSERT INTO SANPHAM VALUES('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
INSERT INTO SANPHAM VALUES('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
INSERT INTO SANPHAM VALUES('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
INSERT INTO SANPHAM VALUES('TV05','Tap 100 trang','chuc','Viet Nam',23000)
INSERT INTO SANPHAM VALUES('TV06','Tap 200 trang','chuc','Viet Nam',53000)
INSERT INTO SANPHAM VALUES('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
INSERT INTO SANPHAM VALUES('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
INSERT INTO SANPHAM VALUES('ST02','So tay loai 1','quyen','Viet Nam',55000)
INSERT INTO SANPHAM VALUES('ST03','So tay loai 2','quyen','Viet Nam',51000)
INSERT INTO SANPHAM VALUES('ST04','So tay','quyen','Thai Lan',55000)
INSERT INTO SANPHAM VALUES('ST05','So tay mong','quyen','Thai Lan',20000)
INSERT INTO SANPHAM VALUES('ST06','Phan viet bang','hop','Viet Nam',5000)
INSERT INTO SANPHAM VALUES('ST07','Phan khong bui','hop','Viet Nam',7000)
INSERT INTO SANPHAM VALUES('ST08','Bong bang','cai','Viet Nam',1000)
INSERT INTO SANPHAM VALUES('ST09','But long','cay','Viet Nam',5000)
INSERT INTO SANPHAM VALUES('ST10','But long','cay','Trung Quoc',7000)

-- Nhập dữ liệu cho HOADON
INSERT INTO HOADON VALUES(1001,'23/07/2006','KH01','NV01',320000)
INSERT INTO HOADON VALUES(1002,'12/08/2006','KH01','NV02',840000)
INSERT INTO HOADON VALUES(1003,'23/08/2006','KH02','NV01',100000)
INSERT INTO HOADON VALUES(1004,'01/09/2006','KH02','NV01',180000)
INSERT INTO HOADON VALUES(1005,'20/10/2006','KH01','NV02',3800000)
INSERT INTO HOADON VALUES(1006,'16/10/2006','KH01','NV03',2430000)
INSERT INTO HOADON VALUES(1007,'28/10/2006','KH03','NV03',510000)
INSERT INTO HOADON VALUES(1008,'28/10/2006','KH01','NV03',440000)
INSERT INTO HOADON VALUES(1009,'28/10/2006','KH03','NV04',200000)
INSERT INTO HOADON VALUES(1010,'01/11/2006','KH01','NV01',5200000)
INSERT INTO HOADON VALUES(1011,'04/11/2006','KH04','NV03',250000)
INSERT INTO HOADON VALUES(1012,'30/11/2006','KH05','NV03',21000)
INSERT INTO HOADON VALUES(1013,'12/12/2006','KH06','NV01',5000)
INSERT INTO HOADON VALUES(1014,'31/12/2006','KH03','NV02',3150000)
INSERT INTO HOADON VALUES(1015,'01/01/2007','KH06','NV01',910000)
INSERT INTO HOADON VALUES(1016,'01/01/2007','KH07','NV02',12500)
INSERT INTO HOADON VALUES(1017,'02/01/2007','KH08','NV03',35000)
INSERT INTO HOADON VALUES(1018,'13/01/2007','KH08','NV03',330000)
INSERT INTO HOADON VALUES(1019,'13/01/2007','KH01','NV03',30000)
INSERT INTO HOADON VALUES(1020,'14/01/2007','KH09','NV04',70000)
INSERT INTO HOADON VALUES(1021,'16/01/2007','KH10','NV03',67500)
INSERT INTO HOADON VALUES(1022,'16/01/2007',Null,'NV03',7000)
INSERT INTO HOADON VALUES(1023,'17/01/2007',Null,'NV01',330000)

-- Nhập dữ liệu cho CTHD
INSERT INTO CTHD VALUES(1001,'TV02',10)
INSERT INTO CTHD VALUES(1001,'ST01',5)
INSERT INTO CTHD VALUES(1001,'BC01',5)
INSERT INTO CTHD VALUES(1001,'BC02',10)
INSERT INTO CTHD VALUES(1001,'ST08',10)
INSERT INTO CTHD VALUES(1002,'BC04',20)
INSERT INTO CTHD VALUES(1002,'BB01',20)
INSERT INTO CTHD VALUES(1002,'BB02',20)
INSERT INTO CTHD VALUES(1003,'BB03',10)
INSERT INTO CTHD VALUES(1004,'TV01',20)
INSERT INTO CTHD VALUES(1004,'TV02',10)
INSERT INTO CTHD VALUES(1004,'TV03',10)
INSERT INTO CTHD VALUES(1004,'TV04',10)
INSERT INTO CTHD VALUES(1005,'TV05',50)
INSERT INTO CTHD VALUES(1005,'TV06',50)
INSERT INTO CTHD VALUES(1006,'TV07',20)
INSERT INTO CTHD VALUES(1006,'ST01',30)
INSERT INTO CTHD VALUES(1006,'ST02',10)
INSERT INTO CTHD VALUES(1007,'ST03',10)
INSERT INTO CTHD VALUES(1008,'ST04',8)
INSERT INTO CTHD VALUES(1009,'ST05',10)
INSERT INTO CTHD VALUES(1010,'TV07',50)
INSERT INTO CTHD VALUES(1010,'ST07',50)
INSERT INTO CTHD VALUES(1010,'ST08',100)
INSERT INTO CTHD VALUES(1010,'ST04',50)
INSERT INTO CTHD VALUES(1010,'TV03',100)
INSERT INTO CTHD VALUES(1011,'ST06',50)
INSERT INTO CTHD VALUES(1012,'ST07',3)
INSERT INTO CTHD VALUES(1013,'ST08',5)
INSERT INTO CTHD VALUES(1014,'BC02',80)
INSERT INTO CTHD VALUES(1014,'BB02',100)
INSERT INTO CTHD VALUES(1014,'BC04',60)
INSERT INTO CTHD VALUES(1014,'BB01',50)
INSERT INTO CTHD VALUES(1015,'BB02',30)
INSERT INTO CTHD VALUES(1015,'BB03',7)
INSERT INTO CTHD VALUES(1016,'TV01',5)
INSERT INTO CTHD VALUES(1017,'TV02',1)
INSERT INTO CTHD VALUES(1017,'TV03',1)
INSERT INTO CTHD VALUES(1017,'TV04',5)
INSERT INTO CTHD VALUES(1018,'ST04',6)
INSERT INTO CTHD VALUES(1019,'ST05',1)
INSERT INTO CTHD VALUES(1019,'ST06',2)
INSERT INTO CTHD VALUES(1020,'ST07',10)
INSERT INTO CTHD VALUES(1021,'ST08',5)
INSERT INTO CTHD VALUES(1021,'TV01',7)
INSERT INTO CTHD VALUES(1021,'TV02',10)
INSERT INTO CTHD VALUES(1022,'ST07',1)
INSERT INTO CTHD VALUES(1023,'ST04',6)

-- II

--2.
SELECT * INTO SANPHAM1 FROM SANPHAM
SELECT * INTO KHACHHANG1 FROM KHACHHANG

--3.
UPDATE SANPHAM1
SET GIA = 1.05*GIA
WHERE NUOCSX='Thai Lan'

--4.
UPDATE SANPHAM1
SET GIA=0.95*GIA
WHERE NUOCSX='Trung Quoc' AND GIA <= 10000

--5.
UPDATE KHACHHANG1
SET LOAIKH='Vip'
WHERE (NGDK < 1/1/2007 AND DOANHSO >= 10000000) OR (NGDK >= 1/1/2007 AND DOANHSO >= 2000000)

-- III

-- 1.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'

--2.
SELECT MASP, TENSP
FROM SANPHAM
WHERE DVT='cay' OR DVT = 'quyen'

--3.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP LIKE 'B%01'

--4.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX='Trung Quoc' 
AND GIA BETWEEN 30000 AND 40000

--5.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX IN ('Trung Quoc', 'Thai Lan')
AND GIA BETWEEN 30000 AND 40000

--6.
SELECT SOHD, TRIGIA
FROM HOADON
WHERE NGHD IN (1/1/2007, 2/12007)

--7.
SELECT SOHD, TRIGIA
FROM HOADON
WHERE MONTH(NgHD) = 1 AND YEAR(NgHD) = 2007
ORDER BY NGHD ASC, TRIGIA DESC

-- Tuan 3

--III
--8
SELECT  KHACHHANG.MAKH,HOTEN
FROM KHACHHANG,HOADON
WHERE 
 KHACHHANG.MAKH = HOADON.MAKH  AND NGHD = '1/1/2007'

 --9
 SELECT  SOHD,TRIGIA
FROM NHANVIEN,HOADON
WHERE 
 NHANVIEN.MANV = HOADON.MANV  AND HOTEN = 'Nguyen Van B' AND NGHD = '28/10/2006'
 
 SELECT*
 FROM NHANVIEN

 --10
SELECT  SANPHAM.MASP,TENSP
FROM SANPHAM,KHACHHANG,CTHD,HOADON
WHERE 
 SANPHAM.MASP = CTHD.MASP AND CTHD.SOHD = HOADON.SOHD AND HOADON.MAKH = KHACHHANG.MAKH  
 AND HOTEN = 'Nguyen Van A' AND MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006

 --11
 SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02')

--12
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02') AND SL BETWEEN 10 AND 20

--13
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP = 'BB01' AND SL BETWEEN 10 AND 20
INTERSECT
(
	SELECT DISTINCT SOHD
	FROM CTHD
	WHERE MASP = 'BB02' AND SL BETWEEN 10 AND 20
)

--14
SELECT DISTINCT SANPHAM.MASP,TENSP
FROM SANPHAM ,CTHD,HOADON
WHERE NUOCSX ='TRUNG QUOC' OR 
SANPHAM.MASP = CTHD.MASP AND CTHD.SOHD = HOADON.SOHD AND NGHD = '1/1/2007'

--15
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP NOT IN (SELECT MASP FROM CTHD)

--16
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP NOT IN 
(SELECT CTHD.MASP 
 FROM CTHD,HOADON 
 WHERE CTHD.SOHD = HOADON.SOHD AND YEAR(NGHD) = 2006 )

 --17
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX ='TRUNG QUOC' AND MASP NOT IN 
(SELECT CTHD.MASP 
 FROM CTHD,HOADON 
 WHERE CTHD.SOHD = HOADON.SOHD AND YEAR(NGHD) = 2006 )

 -- III.20 
SELECT COUNT(*)
FROM HOADON
WHERE MAKH IS NULL

 -- III.21
SELECT COUNT(DISTINCT MASP)
FROM HOADON, CTHD
WHERE
	HOADON.SOHD = CTHD.SOHD			
	AND YEAR(NGHD) = 2006

-- III.22 
SELECT MIN(TRIGIA) MIN_TRIGIA, MAX(TRIGIA) MAX_TRIGIA
FROM HOADON

-- III.23 
SELECT AVG(TRIGIA)
FROM HOADON
WHERE YEAR(NGHD) = 2006

-- III.24 
SELECT SUM(TRIGIA)
FROM HOADON
WHERE YEAR(NGHD) = 2006

-- III.25 
SELECT MAX(TRIGIA)
FROM HOADON
WHERE YEAR(NGHD) = 2006

-- III.26 
SELECT DISTINCT HOTEN
FROM KHACHHANG, HOADON
WHERE 
	HOADON.MAKH = KHACHHANG.MAKH
	AND YEAR(NGHD) = 2006
	AND TRIGIA = (SELECT MAX(TRIGIA) FROM HOADON WHERE YEAR(NGHD) = 2006)

-- tuan 4

-- III.18 
SELECT SoHD
FROM HoaDon
WHERE NOT EXISTS
(
	SELECT *
	FROM SanPham
	WHERE NuocSX = 'Singapore'
	AND NOT EXISTS
	(
		SELECT *
		FROM CTHD
		WHERE CTHD.SoHD = HoaDon.SoHD
		AND CTHD.MaSP = SanPham.MaSP
	)
)

-- III.19 
SELECT SoHD
FROM HoaDon
WHERE YEAR(NgHD) = 2006 
AND NOT EXISTS
(
	SELECT *
	FROM SanPham
	WHERE NuocSX = 'Singapore'
	AND NOT EXISTS
	(
		SELECT *
		FROM CTHD
		WHERE CTHD.SoHD = HoaDon.SoHD
		AND CTHD.MaSP = SanPham.MaSP
	)
)

--  III.27
SELECT TOP 3 MaKH, HoTen
FROM KhachHang
ORDER BY DoanhSo DESC

-- III.28
SELECT MaSP, TenSP
FROM SanPham
WHERE Gia IN (
	SELECT DISTINCT TOP 3 Gia
	FROM SanPham
	ORDER BY Gia DESC
)

-- III.29
SELECT MaSP, TenSP
FROM SanPham
WHERE NuocSX = 'Thai Lan'
AND Gia IN (
	SELECT DISTINCT TOP 3 Gia
	FROM SanPham
	ORDER BY Gia DESC
)

-- III.30
SELECT MaSP, TenSP
FROM SanPham
WHERE NuocSX = 'Trung Quoc'
AND Gia IN (
	SELECT DISTINCT TOP 3 Gia
	FROM SanPham
	WHERE NuocSX = 'Trung Quoc'
	ORDER BY Gia DESC
)
-- III.31
SELECT TOP 3 *
FROM KhachHang
ORDER BY DoanhSo DESC

-- III.32
SELECT COUNT(*)
FROM SanPham
WHERE NuocSX = 'Trung Quoc'

-- III.33
SELECT NuocSX, COUNT(*) SoSP
FROM SanPham
GROUP BY NuocSX

-- III.34
SELECT NuocSX, MAX(Gia) Max_Gia, MIN(Gia) Min_Gia, AVG(Gia) TB_Gia
FROM SanPham
GROUP BY NuocSX

-- III.35
SELECT NgHD, SUM(TriGia) DoanhThu
FROM HoaDon
GROUP BY NgHD

--- III.36
SELECT SanPham.MaSP, SUM(SL) SoLuongBan
FROM SanPham, HoaDon, CTHD
WHERE
	CTHD.MaSP = SanPham.MaSP
	AND CTHD.SoHD = HoaDon.SoHD
	AND MONTH(NgHD) = 10 AND YEAR(NgHD) = 2006
GROUP BY SanPham.MaSP

-- III.37
SELECT MONTH(NgHD) Thang, SUM(TriGia) DoanhThu
FROM HoaDon
WHERE YEAR(NgHD) = 2006
GROUP BY MONTH(NgHD)

-- III.38
SELECT SoHD
FROM CTHD
GROUP BY SoHD
HAVING COUNT(DISTINCT MaSP) >= 4

-- III.39
SELECT SoHD
FROM CTHD, SanPham
WHERE
	CTHD.MaSP = SanPham.MaSP
	AND NuocSX = 'Viet Nam'
GROUP BY SoHD
HAVING COUNT(DISTINCT CTHD.MaSP) >= 3

-- III.40
SELECT KhachHang.MaKH, HoTen
FROM KhachHang, HoaDon
WHERE KhachHang.MaKH = HoaDon.MaKH
GROUP BY KhachHang.MaKH, HoTen
HAVING COUNT(*) >= ALL(SELECT COUNT(*) FROM HoaDon GROUP BY MaKH)

-- III.41
SELECT MONTH(NgHD)
FROM HoaDon
WHERE YEAR(NgHD) = 2006
GROUP BY MONTH(NgHD)
HAVING SUM(TriGia) >= ALL(SELECT SUM(TriGia) FROM HoaDON WHERE YEAR(NgHD) = 2006 GROUP BY MONTH(NgHD))

-- III.42
SELECT TOP 1 WITH TIES SanPham.MaSP, TenSP
FROM SanPham, CTHD, HoaDon
WHERE 
	SanPham.MaSP = CTHD.MaSP
	AND HoaDon.SoHD = CTHD.SoHD
	AND YEAR(NgHD) = 2006
GROUP BY SanPham.MaSP, TenSP
ORDER BY SUM(SL)

-- III.43
SELECT NuocSX, MaSP, TenSP
FROM SanPham SP1
WHERE EXISTS
(
	SELECT NuocSX
	FROM SanPham SP2
	GROUP BY NuocSX
	HAVING SP1.NuocSX = SP2.NuocSX
	AND SP1.Gia = MAX(Gia)
)

-- III.44
SELECT NuocSX
FROM SanPham
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA) >= 3

-- III.45
SELECT *
FROM KhachHang
WHERE MaKH IN
(
	SELECT TOP 1 WITH TIES HoaDon.MaKH
	FROM (SELECT TOP 10 MaKH FROM KhachHang ORDER BY DoanhSo DESC) AS A
	JOIN HoaDon ON A.MaKH = HoaDon.MaKH
	GROUP BY HoaDon.MaKH
	ORDER BY COUNT(*) DESC
)
