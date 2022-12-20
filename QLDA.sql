CREATE DATABASE QLDA
USE QLDA

-- CREATE TABLES
CREATE TABLE DEAN
(
	TENDA NVARCHAR(15),
	MADA INT NOT NULL,
	DDIEM_DA NVARCHAR(15) NOT NULL,
	PHONG INT NOT NULL,
	
	PRIMARY KEY (MADA)
)

CREATE TABLE PHONGBAN
(
	TENPHG NVARCHAR(15),
	MAPHG INT NOT NULL,
	TRPHG NVARCHAR(9),
	NG_NHANCHUC DATE,
	
	PRIMARY KEY (MAPHG)
)

CREATE TABLE DIADIEM_PHG
(
	MAPHG INT NOT NULL,
	DIADIEM NVARCHAR(15),
	
	PRIMARY KEY (MAPHG, DIADIEM)
)

CREATE TABLE NHANVIEN
(
	HONV NVARCHAR(15),
	TENLOT NVARCHAR(15),
	TENNV NVARCHAR(15),
	MANV NVARCHAR(9) NOT NULL,
	NGSINH DATE,
	DCHI NVARCHAR(30),
	PHAI NVARCHAR(3),
	LUONG FLOAT,
	MA_NQL NVARCHAR(9),
	PHG INT NOT NULL,
	
	PRIMARY KEY (MANV)
)

CREATE TABLE THANNHAN
(
	MA_NVIEN NVARCHAR(9) NOT NULL,
	TENTN NVARCHAR(15),
	PHAI NVARCHAR(3),
	NGSINH DATE,
	QUANHE NVARCHAR(15),
	
	PRIMARY KEY (MA_NVIEN, TENTN)
)

CREATE TABLE CONGVIEC
(
	MADA INT NOT NULL,
	STT INT NOT NULL,
	TEN_CONG_VIEC NVARCHAR(50),
	
	PRIMARY KEY (MADA, STT)
)

CREATE TABLE PHANCONG
(
	MA_NVIEN NVARCHAR(9) NOT NULL,
	MADA INT NOT NULL,
	STT INT NOT NULL,
	THOIGIAN FLOAT,
	
	PRIMARY KEY (MA_NVIEN, MADA, STT)
)

-- Cài đặt ràng buộc khóa ngoại cho các bảng 
ALTER TABLE DEAN
ADD CONSTRAINT FK_DEAN_PHONG
FOREIGN KEY (PHONG)
REFERENCES PHONGBAN (MAPHG)

ALTER TABLE PHONGBAN
ADD CONSTRAINT FK_PHONGBAN_NHANVIEN
FOREIGN KEY (TRPHG)
REFERENCES NHANVIEN (MANV)

ALTER TABLE DIADIEM_PHG
ADD CONSTRAINT FK_DIADIEM_PHG_PHONGBAN
FOREIGN KEY (MAPHG)
REFERENCES PHONGBAN (MAPHG)

ALTER TABLE CONGVIEC
ADD CONSTRAINT FK_CONGVIEC_DEAN
FOREIGN KEY (MADA)
REFERENCES DEAN (MADA)

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NHANVIEN_PHONGBAN
FOREIGN KEY (PHG)
REFERENCES PHONGBAN (MAPHG)

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NHANVIEN_NHANVIEN
FOREIGN KEY (MA_NQL)
REFERENCES NHANVIEN (MANV)

ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PHANCONG_DEAN
FOREIGN KEY (MADA)
REFERENCES DEAN (MADA)

ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PHANCONG_NHANVIEN
FOREIGN KEY (MA_NVIEN)
REFERENCES NHANVIEN (MANV)

ALTER TABLE THANNHAN
ADD CONSTRAINT FK_THANNHAN_NHANVIEN
FOREIGN KEY (MA_NVIEN)
REFERENCES NHANVIEN (MANV)

BEGIN /** NHANVIEN **/
	ALTER TABLE NHANVIEN
	NOCHECK CONSTRAINT ALL
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Đinh', N'Bá', N'Tiến', '009', '02/11/1960', N'119, Cống Quỳnh, TP.HCM', N'Nam', 30000, '005', 5)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Nguyễn', N'Thanh', N'Tùng', '005', '08/20/1962', N'222, Nguyễn Văn Cừ, TP.HCM', N'Nam', 40000, '006', 5)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Bùi', N'Ngọc', N'Hằng', '007', '03/11/1954', N'332, Nguyễn Thái Học, TP.HCM', N'Nam', 25000, '001', 4)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Lê', N'Quỳnh', N'Như', '001', '02/01/1967', N'291, Hồ Văn Huê, TP.HCM', N'Nữ', 43000, '006', 4)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Nguyễn', N'Mạnh', N'Hùng', '004', '03/04/1967', N'95, Bà Rịa - Vũng Tàu', N'Nam', 38000, '005', 5)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Trần', N'Thanh', N'Tâm', '003', '05/04/1957', N'34, Mai Thị Lự, TP.HCM', N'Nam', 25000, '005', 5)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Trần', N'Hồng', N'Quang', '008', '09/01/1967', N'45, Lê Hồng Phong, TP.HCM', N'Nam', 25000, '001', 4)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, PHG)
	VALUES (N'Phạm', N'Văn', N'Vinh', '006', '01/01/1965', N'45, Trưng Vương', N'Nữ', 55000, 1)
	ALTER TABLE NHANVIEN
	CHECK CONSTRAINT ALL
END

BEGIN /** PHONGBAN **/
	ALTER TABLE PHONGBAN
	NOCHECK CONSTRAINT ALL
	INSERT INTO PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
	VALUES (N'Nghiên cứu', 5, '005', '05/22/1978')
	INSERT INTO PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
	VALUES (N'Điều hành', 4, '008', '01/01/1985')
	INSERT INTO PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
	VALUES (N'Quản lý', 1, '006', '06/19/1971')
	ALTER TABLE PHONGBAN
	CHECK CONSTRAINT ALL
END

BEGIN /** DEAN **/
	ALTER TABLE DEAN
	NOCHECK CONSTRAINT ALL
	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Sản phẩm X', 1, N'Vũng Tàu', 5)
	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Sản phẩm Y', 2, N'Nha Trang', 5)
	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Sản phẩm Z', 3, N'TP.HCM', 5)
	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Tin học hóa', 10, N'Hà Nội', 4)
	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Cáp quang', 20, N'TP.HCM', 1)
	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Đào tạo', 30, N'Hà Nội', 4)
	ALTER TABLE DEAN
	CHECK CONSTRAINT ALL
END

BEGIN /** THANNHAN **/
	ALTER TABLE THANNHAN
	NOCHECK CONSTRAINT ALL
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('005', N'Trinh', N'Nữ', '04/05/1976', N'Con gái')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('005', N'Khang', N'Nam', '10/25/1973', N'Con trai')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('005', N'Phương', N'Nữ', '05/03/1948', N'Vợ chồng')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('001', N'Minh', N'Nam', '02/29/1932', N'Vợ chồng')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('009', N'Tiến', N'Nam', '01/01/1978', N'Con trai')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('009', N'Châu', N'Nữ', '12/30/1978', N'Con gái')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('009', N'Phương', N'Nữ', '05/05/1957', N'Vợ chồng')
	ALTER TABLE THANNHAN
	CHECK CONSTRAINT ALL
END

BEGIN /** DIADIEM_PHG **/
	ALTER TABLE DIADIEM_PHG
	NOCHECK CONSTRAINT ALL
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (1, N'TP.HCM')
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (4, N'Hà Nội')
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (5, N'Vũng Tàu')
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (5, N'Nha Trang')
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (5, N'TP.HCM')
	ALTER TABLE DIADIEM_PHG
	CHECK CONSTRAINT ALL
END

BEGIN /** PHANCONG **/
	ALTER TABLE PHANCONG
	NOCHECK CONSTRAINT ALL
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('009', 1, 1, 32)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('009', 2, 2, 8)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('004', 3, 1, 40)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('003', 1, 2, 20.0)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('003', 2, 1, 20.0)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('008', 10, 1, 35)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('008', 30, 2, 5)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('001', 30, 1, 20)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('001', 20, 1, 15)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('006', 20, 1, 30)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('005', 3, 1, 10)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('005', 10, 2, 10)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('005', 20, 1, 10)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('007', 30, 2, 30)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('007', 10, 2, 10)
	ALTER TABLE PHANCONG
	CHECK CONSTRAINT ALL
END

BEGIN /** CONGVIEC **/
	ALTER TABLE CONGVIEC
	NOCHECK CONSTRAINT ALL
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (1, 1, N'Thiết kế sản phẩm X')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (1, 2, N'Thử nghiệm sản phẩm X')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (2, 1, N'Sản xuất sản phẩm Y')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (2, 2, N'Quảng cáo sản phẩm Y')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (3, 1, N'Khuyến mãi sản phẩm Z')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (10, 1, N'Tin học hóa phòng nhân sự')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (10, 2, N'Tin học hóa phòng kinh doanh')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (20, 1, N'Lắp đặt cáp quang')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (30, 1, N'Đào tạo nhân viên Marketing')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (30, 2, N'Đào tạo chuyên viên thiết kế')
	ALTER TABLE CONGVIEC
	CHECK CONSTRAINT ALL
END
GO

BEGIN /** BÀI TẬP **/
--BT.1. Cho biết thông tin chi tiết của các nhân viên.
	SELECT*
	FROM NHANVIEN
--BT.2. Cho biết tên các nhân viên ở phòng số 5.
	SELECT NHANVIEN.HONV + NHANVIEN.TENLOT + NHANVIEN.TENNV AS N'Nhân viên phòng 5'
	FROM NHANVIEN
	WHERE NHANVIEN.PHG = 5
--BT.3. Cho biết tên phòng mà nhân viên trực thuộc.
	SELECT DISTINCT PHONGBAN.TENPHG AS N'Tên phòng'
	FROM NHANVIEN, PHONGBAN
	WHERE NHANVIEN.PHG = PHONGBAN.MAPHG
--BT.4. Cho biết tên của trưởng phòng phòng nghiên cứu.
	SELECT NHANVIEN.HONV + NHANVIEN.TENLOT + NHANVIEN.TENNV AS N'Trưởng phòng nghiên cứu'
	FROM NHANVIEN, PHONGBAN
	WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND
		  PHONGBAN.TENPHG = N'Nghiên cứu'
--BT.5. Cho biết mức lương trung bình của từng phòng ban.
	SELECT PHONGBAN.MAPHG, PHONGBAN.TENPHG, AVG(NHANVIEN.LUONG) AS N'Lương trung bình'
	FROM NHANVIEN, PHONGBAN
	WHERE NHANVIEN.PHG = PHONGBAN.MAPHG
	GROUP BY PHONGBAN.MAPHG, PHONGBAN.TENPHG
--BT.6. Cho biết tên các phòng có mức lương trung bình cao nhất.
	SELECT LUONG_TB_PHONG.MAPHG, LUONG_TB_PHONG.TENPHG
	FROM
		(SELECT PHONGBAN.MAPHG, PHONGBAN.TENPHG, AVG(NHANVIEN.LUONG) AS LTB
		 FROM NHANVIEN, PHONGBAN
		 WHERE NHANVIEN.PHG = PHONGBAN.MAPHG
		 GROUP BY PHONGBAN.MAPHG, PHONGBAN.TENPHG
		) AS LUONG_TB_PHONG
	WHERE LUONG_TB_PHONG.LTB >= ALL (
									SELECT MAX(LUONG_TB_PHONG.LTB)
									FROM (SELECT PHONGBAN.MAPHG, PHONGBAN.TENPHG, AVG(NHANVIEN.LUONG) AS LTB
										  FROM NHANVIEN, PHONGBAN
										  WHERE NHANVIEN.PHG = PHONGBAN.MAPHG
										  GROUP BY PHONGBAN.MAPHG, PHONGBAN.TENPHG
										 ) AS LUONG_TB_PHONG
									)
--BT.7. Cho biết tên các nhân viên không tham gia đề án nào.
	SELECT*
	FROM NHANVIEN
	WHERE NHANVIEN.PHG NOT IN (SELECT DEAN.PHONG
							   FROM DEAN
							  )
--BT.8. Cho biết tên các nhân viên tham gia tất cả các đề án.
	SELECT NHANVIEN.MANV
	FROM NHANVIEN, PHANCONG
	WHERE NHANVIEN.MANV = PHANCONG.MA_NVIEN
	GROUP BY NHANVIEN.MANV
	HAVING COUNT(NHANVIEN.MANV) >= (SELECT COUNT(DEAN.MADA)
									FROM DEAN)
--BT.9. Cho biết tên các nhân viên tham gia trên 2 đề án ở TP.HCM.
	SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Nhân viên tham gia trên 2 đề án ở TP.HCM'
	FROM NHANVIEN, DEAN, PHANCONG
	WHERE NHANVIEN.PHG = DEAN.PHONG AND
		  NHANVIEN.MANV = PHANCONG.MA_NVIEN AND
		  DEAN.DDIEM_DA LIKE '%TP.HCM'
	GROUP BY (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV)
	HAVING COUNT(*) > 2
--BT.10. Cho biết tên nhân viên có mức lương cao nhất ở phòng quản lý.
	SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Nhân viên lương cao nhất phòng quản lý'
	FROM NHANVIEN,PHONGBAN
	WHERE NHANVIEN.PHG = PHONGBAN.MAPHG AND
		  PHONGBAN.TENPHG = N'Quản lý' AND
		  NHANVIEN.LUONG >=(SELECT MAX(NHANVIEN.LUONG)
							FROM NHANVIEN, PHONGBAN
							WHERE NHANVIEN.PHG = PHONGBAN.MAPHG AND
								  PHONGBAN.TENPHG = N'Quản lý'
							)
END
GO

BEGIN /** BÀI TẬP 2.1.1 **/
--1. Tìm các nhân viên làm việc ở phòng số 4.
	SELECT NHANVIEN.MANV
	FROM NHANVIEN, PHONGBAN
	WHERE NHANVIEN.PHG = PHONGBAN.MAPHG AND
		  PHONGBAN.MAPHG = 4
--2. Tìm các nhân viên có mức lương trên 30000.
	SELECT NHANVIEN.MANV
	FROM NHANVIEN
	WHERE NHANVIEN.LUONG > 30000
--3. Tìm các nhân viên có mức lương trên 25,000 ở phòng 4 hoặc các nhân viên có mức lương trên 30,000 ở phòng 5.
	SELECT NHANVIEN.MANV
	FROM NHANVIEN, PHONGBAN
	WHERE NHANVIEN.PHG = PHONGBAN.MAPHG AND
		  (NHANVIEN.LUONG > 25000 AND PHONGBAN.MAPHG = 4) OR
		  (NHANVIEN.LUONG > 30000 AND PHONGBAN.MAPHG = 5)
--4. Cho biết họ tên đầy đủ của các nhân viên ở TP HCM.
	SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Nhân viên ở HCM'
	FROM NHANVIEN
	WHERE NHANVIEN.DCHI LIKE '%HCM'
--5. Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự 'N'.
	SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Nhân viên có họ bắt đầu bằng "N"'
	FROM NHANVIEN
	WHERE NHANVIEN.HONV LIKE 'N%'
--6. Cho biết ngày sinh và địa chỉ của nhân viên Đinh Bá Tiến.
	SELECT NHANVIEN.NGSINH, NHANVIEN.DCHI
	FROM NHANVIEN
	WHERE NHANVIEN.HONV = N'Đinh' AND
		  NHANVIEN.TENLOT = N'Bá' AND
		  NHANVIEN.TENNV = N'Tiến'	
--7. Cho biết các nhân viên có năm sinh trong khoảng 1960 đến 1965.
	SELECT NHANVIEN.MANV
	FROM NHANVIEN
	WHERE YEAR(NHANVIEN.NGSINH) BETWEEN 1960 AND 1965
--8. Cho biết các nhân viên và năm sinh của nhân viên.
	SELECT NHANVIEN.MANV, YEAR(NHANVIEN.NGSINH) AS 'Năm sinh'
	FROM NHANVIEN
--9. Cho biết các nhân viên và tuổi của nhân viên.
	SELECT NHANVIEN.MANV, (YEAR(GETDATE()) - YEAR(NHANVIEN.NGSINH)) AS 'Tuổi'
	FROM NHANVIEN
END
GO

BEGIN /* 2.1.2 Truy vấn có sử dụng phép kết */
--10. Với mỗi phòng ban, cho biết tên phòng ban và địa điểm phòng.
	SELECT PHONGBAN.MAPHG, PHONGBAN.TENPHG, DIADIEM_PHG.DIADIEM
	FROM PHONGBAN, DIADIEM_PHG
	WHERE PHONGBAN.MAPHG = DIADIEM_PHG.MAPHG
	GROUP BY PHONGBAN.MAPHG, PHONGBAN.TENPHG, DIADIEM_PHG.DIADIEM
--11. Tìm tên những người trưởng phòng của từng phòng ban.
	SELECT PHONGBAN.TENPHG, (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên trưởng phòng'
	FROM NHANVIEN, PHONGBAN
	WHERE NHANVIEN.PHG = PHONGBAN.MAPHG AND
		  NHANVIEN.MANV = PHONGBAN.TRPHG
--12. Tìm tên và địa chỉ của tất cả các nhân viên của phòng "Nghiên cứu".
	SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV), NHANVIEN.DCHI
	FROM NHANVIEN, PHONGBAN
	WHERE NHANVIEN.PHG = PHONGBAN.MAPHG AND
		  PHONGBAN.TENPHG = N'Nghiên cứu'
--13. Với mỗi đề án ở Hà Nội, cho biết tên đề án, tên phòng ban, họ tên và ngày nhận chức của trưởng phòng của phòng ban chủ trì đề án đó.
	SELECT DEAN.TENDA, PHONGBAN.TENPHG, (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV), PHONGBAN.NG_NHANCHUC
	FROM NHANVIEN, PHONGBAN, DEAN
	WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND
		  PHONGBAN.MAPHG = DEAN.PHONG AND
		  DEAN.DDIEM_DA LIKE N'%Hà Nội'
--14. Tìm tên những nữ nhân viên và tên người thân của họ.
	SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên nữ', THANNHAN.TENTN
	FROM NHANVIEN, THANNHAN
	WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN AND
		  NHANVIEN.PHAI = N'Nữ'
--15. Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp của nhân viên đó.
	SELECT (NV.HONV + ' ' + NV.TENLOT + ' '+ NV.TENNV) AS 'Họ tên nhân viên', (QL.HONV + ' ' + QL.TENLOT + ' '+ QL.TENNV) AS 'Họ tên quản lý'
	FROM NHANVIEN AS NV, NHANVIEN AS QL
	WHERE QL.MANV = NV.MA_NQL
--16. Với mỗi nhân viên, cho biết họ tên của nhân viên đó, họ tên người trưởng phòng và họ tên người quản lý trực tiếp của nhân viên đó.
	SELECT (NV.HONV + ' ' + NV.TENLOT + ' '+ NV.TENNV) AS 'Họ tên nhân viên', (TP.HONV + ' ' + TP.TENLOT + ' '+ TP.TENNV) AS 'Họ tên trưởng phòng', (QL.HONV + ' ' + QL.TENLOT + ' '+ QL.TENNV) AS 'Họ tên quản lý'
	FROM NHANVIEN AS NV, NHANVIEN AS TP,NHANVIEN AS QL, PHONGBAN
	WHERE TP.MANV = PHONGBAN.TRPHG AND
		  QL.MANV = NV.MA_NQL AND
		  NV.PHG = PHONGBAN.MAPHG
--17. Tên những nhân viên phòng số 5 có tham gia vào đề án "Sản phẩm X" và nhân viên này do "Nguyễn Thanh Tùng" quản lý trực tiếp.
	SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên phòng 5 tham gia đề án "sản phẩm X" do Nguyễn Thanh Tùng quản lý'
	FROM NHANVIEN, DEAN
	WHERE NHANVIEN.PHG = DEAN.PHONG AND
		  NHANVIEN.PHG = 5 AND
		  DEAN.TENDA = N'Sản phẩm X' AND
		  NHANVIEN.MA_NQL = (SELECT NHANVIEN.MANV
							 FROM NHANVIEN
							 WHERE NHANVIEN.HONV = N'Nguyễn'AND
								   NHANVIEN.TENLOT = N'Thanh' AND
								   NHANVIEN.TENNV = N'Tùng'
							)
--18. Cho biết tên các đề án mà nhân viên Đinh Bá Tiến đã tham gia.
	SELECT DEAN.TENDA
	FROM NHANVIEN, DEAN, PHANCONG
	WHERE DEAN.MADA	= PHANCONG.MADA AND
		  NHANVIEN.MANV = PHANCONG.MA_NVIEN AND
		  NHANVIEN.HONV = N'Đinh' AND
		  NHANVIEN.TENLOT = N'Bá' AND
		  NHANVIEN.TENNV = N'Tiến'
END
GO

BEGIN /* 2.2 GOM NHÓM */ 
--19. Cho biết số lượng đề án của công ty.
	SELECT COUNT(DEAN.MADA)
	FROM DEAN
--20. Cho biết số lượng đề án do phòng 'Nghiên Cứu' chủ trì.
	SELECT COUNT(DEAN.MADA)
	FROM DEAN, PHONGBAN
	WHERE DEAN.PHONG = PHONGBAN.MAPHG AND
		  PHONGBAN.TENPHG = N'Nghiên cứu'
--21. Cho biết lương trung bình của các nữ nhân viên.
	SELECT AVG(NHANVIEN.LUONG)
	FROM NHANVIEN
	WHERE NHANVIEN.PHAI = N'Nữ'
--22. Cho biết số thân nhân của nhân viên 'Đinh Bá Tiến'.
	SELECT COUNT(THANNHAN.MA_NVIEN)
	FROM NHANVIEN, THANNHAN
	WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN AND
		  NHANVIEN.HONV = N'Đinh' AND
		  NHANVIEN.TENLOT = N'Bá' AND
		  NHANVIEN.TENNV = N'Tiến'
--23. Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc [một tuần] của tất cả các nhân viên tham dự đề án đó.
	SELECT DEAN.MADA, DEAN.TENDA, SUM(PHANCONG.THOIGIAN)
	FROM DEAN, PHANCONG
	WHERE DEAN.MADA = PHANCONG.MADA
	GROUP BY DEAN.MADA, DEAN.TENDA
--24. Với mỗi đề án, cho biết có bao nhiêu nhân viên tham gia đề án đó.
	SELECT DEAN.MADA, COUNT(PHANCONG.MA_NVIEN) AS 'Số nhân viên tham gia'
	FROM DEAN, PHANCONG
	WHERE DEAN.MADA = PHANCONG.MADA
	GROUP BY DEAN.MADA
--25. Với mỗi nhân viên, cho biết họ và tên nhân viên và số lượng thân nhân của nhân viên đó.
	SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên', COUNT(THANNHAN.MA_NVIEN) AS 'Số lượng thân nhân'
	FROM NHANVIEN, THANNHAN
	WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
	GROUP BY (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV)
--26. Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà nhân viên đó đã tham gia.
	SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên', COUNT(PHANCONG.MA_NVIEN) AS'Số lượng đề án tham gia'
	FROM NHANVIEN, DEAN, PHANCONG
	WHERE NHANVIEN.MANV = PHANCONG.MA_NVIEN AND
		  DEAN.MADA = PHANCONG.MADA
	GROUP BY (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV)
--27. Với mỗi nhân viên, cho biết số lượng nhân viên mà nhân viên đó quản lý trực tiếp.
	SELECT NV.MANV, COUNT(QL.MANV) AS 'Số lượng nhân viên'
	FROM NHANVIEN AS NV, NHANVIEN AS QL
	WHERE NV.MANV = QL.MA_NQL
	GROUP BY NV.MANV
--28. Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó.
	SELECT PHONGBAN.MAPHG, PHONGBAN.TENPHG, AVG(NHANVIEN.LUONG) AS 'Lương trung bình'
	FROM NHANVIEN, PHONGBAN
	WHERE NHANVIEN.PHG = PHONGBAN.MAPHG
	GROUP BY PHONGBAN.MAPHG, PHONGBAN.TENPHG
--29. Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.
	SELECT PHONGBAN.TENPHG, COUNT(NHANVIEN.MANV) AS N'Số lượng nhân viên'
	FROM NHANVIEN, PHONGBAN
	WHERE NHANVIEN.PHG = PHONGBAN.MAPHG
	GROUP BY PHONGBAN.TENPHG
	HAVING AVG(NHANVIEN.LUONG)>30000
--30. Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì.
	SELECT PHONGBAN.TENPHG, COUNT(DEAN.PHONG) AS 'Số lượng đề án'
	FROM PHONGBAN, DEAN
	WHERE PHONGBAN.MAPHG = DEAN.PHONG
	GROUP BY PHONGBAN.TENPHG
--31. Với mỗi phòng ban, cho biết tên phòng ban, họ tên người trưởng phòng và số lượng đề án mà phòng ban đó chủ trì.
	SELECT PHONGBAN.TENPHG, (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên trưởng phòng', COUNT(DEAN.PHONG) AS 'Số lượng đề án'
	FROM NHANVIEN, PHONGBAN, DEAN
	WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND
		  PHONGBAN.MAPHG = DEAN.PHONG
	GROUP BY PHONGBAN.TENPHG, (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV)
--32. Với mỗi phòng ban có mức lương trung bình lớn hơn 40,000, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì.
	SELECT PHONGBAN.TENPHG, COUNT(DEAN.PHONG) AS 'Số lượng đề án'
	FROM NHANVIEN, PHONGBAN, DEAN
	WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND
		  PHONGBAN.MAPHG = DEAN.PHONG
	GROUP BY PHONGBAN.TENPHG
	HAVING AVG(NHANVIEN.LUONG) > 40000
--33. Cho biết số đề án diễn ra tại từng địa điểm.
	SELECT DEAN.DDIEM_DA, COUNT(DEAN.DDIEM_DA) AS 'Số lượng đề án'
	FROM DEAN
	GROUP BY DEAN.DDIEM_DA
--34. Với mỗi đề án, cho biết tên đề án và số lượng công việc của đề án này.
	SELECT DEAN.MADA, DEAN.TENDA, COUNT(DEAN.MADA) AS 'Số lượng công việc'
	FROM DEAN, CONGVIEC
	WHERE DEAN.MADA = CONGVIEC.MADA
	GROUP BY DEAN.MADA, DEAN.TENDA
--35. Với mỗi công việc trong đề án có mã đề án là 30, cho biết số lượng nhân viên được phân công.
	SELECT CONGVIEC.TEN_CONG_VIEC, COUNT(PHANCONG.MA_NVIEN) AS 'Số lượng nhân viên được phân công'
	FROM CONGVIEC, PHANCONG
	WHERE CONGVIEC.MADA = PHANCONG.MADA AND
		  CONGVIEC.MADA = 30
	GROUP BY CONGVIEC.TEN_CONG_VIEC
--36. Với mỗi công việc trong đề án có mã đề án là 'Đào Tạo', cho biết số lượng nhân viên được phân công.
	SELECT CONGVIEC.TEN_CONG_VIEC, COUNT(PHANCONG.MA_NVIEN) AS 'Số lượng nhân viên được phân công'
	FROM CONGVIEC, DEAN, PHANCONG
	WHERE CONGVIEC.MADA = DEAN.MADA AND
		  CONGVIEC.MADA = PHANCONG.MADA AND
		  DEAN.TENDA = N'Đào tạo'
	GROUP BY CONGVIEC.TEN_CONG_VIEC
END
GO

BEGIN /* 2.3 TRUY VẤN LỒNG + GOM NHÓM */
--37. Cho biết danh sách các đề  án (MADA) có: nhân công với họ  (HONV) là 'Đinh'  hoặc  có  người  trưởng  phòng  chủ  trì  đề  án  với  họ  (HONV)  là 'Đinh'.
	SELECT PHANCONG.MADA
	FROM NHANVIEN, PHANCONG
	WHERE NHANVIEN.MANV = PHANCONG.MA_NVIEN AND
		  NHANVIEN.HONV = N'Đinh'
	UNION --phép kết
	SELECT DEAN.MADA
	FROM NHANVIEN, PHONGBAN, DEAN
	WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND
		  PHONGBAN.MAPHG = DEAN.PHONG AND
		  NHANVIEN.HONV = N'Đinh'
--38. Danh  sách  những  nhân  viên  (HONV,  TENLOT,  TENNV)  có  trên  2  thân nhân.
	SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' '+ NHANVIEN.TENNV) AS 'Họ tên nhân viên có trên 2 thân nhân'
	FROM NHANVIEN, THANNHAN
	WHERE NHANVIEN.MANV= THANNHAN.MA_NVIEN
	GROUP BY (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' '+ NHANVIEN.TENNV)
	HAVING COUNT(THANNHAN.MA_NVIEN) > 2
--39.  Danh  sách  những  nhân  viên  (HONV,  TENLOT,  TENNV)  không  có  thân nhân nào.
	SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' '+ NHANVIEN.TENNV) AS 'Họ tên nhân viên không có thân nhân'
	FROM NHANVIEN
	WHERE NHANVIEN.MANV NOT IN (SELECT THANNHAN.MA_NVIEN
								FROM NHANVIEN, THANNHAN
								WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
								)
--40. Danh  sách  những  trưởng  phòng  (HONV,  TENLOT,  TENNV)  có  tối  thiểu một thân nhân.
	SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' '+ NHANVIEN.TENNV) AS 'Họ tên trưởng phòng có ít nhất 1 thân nhân'
	FROM NHANVIEN, PHONGBAN
	WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND
		  PHONGBAN.TRPHG IN (SELECT THANNHAN.MA_NVIEN
							 FROM NHANVIEN, THANNHAN
							 WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
							 )
--41. Tìm họ (HONV) của những trưởng phòng chưa có gia đình.
	SELECT NHANVIEN.HONV
	FROM NHANVIEN, PHONGBAN
	WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND
		  PHONGBAN.TRPHG NOT IN (SELECT PHONGBAN.TRPHG
								 FROM PHONGBAN, THANNHAN
								 WHERE PHONGBAN.TRPHG = THANNHAN.MA_NVIEN AND
									  THANNHAN.QUANHE = N'Vợ chồng'
								 )
--42. Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình của phòng "Nghiên cứu".
	SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên có lương trung bình trên mức lương trung bình của phòng "Nghiên cứu"'
	FROM NHANVIEN
	WHERE NHANVIEN.LUONG > (SELECT AVG(NHANVIEN.LUONG)
							FROM NHANVIEN, PHONGBAN
							WHERE NHANVIEN.PHG = PHONGBAN.MAPHG AND
								  PHONGBAN.TENPHG = N'Nghiên cứu')
--43. Cho biết tên phòng ban và họ tên trưởng phòng của phòn ban có đông nhân viên nhất.
	SELECT PHONGBAN.TENPHG, (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên trưởng phòng của phòng ban đông nhân viên nhất'
	FROM NHANVIEN, PHONGBAN
	WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND
		  PHONGBAN.MAPHG = (SELECT TOP 1 PHONGBAN.MAPHG
							FROM NHANVIEN, PHONGBAN
							WHERE NHANVIEN.PHG = PHONGBAN.MAPHG
							GROUP BY PHONGBAN.MAPHG
							ORDER BY COUNT (NHANVIEN.PHG) DESC
							)
--44. Cho biết danh sách các mã đề án mà nhân viên có mã là 009 chưa làm.
	SELECT DEAN.MADA
	FROM DEAN
	WHERE DEAN.MADA NOT IN (SELECT PHANCONG.MADA
							FROM PHANCONG
							WHERE PHANCONG.MA_NVIEN = '009'
							)

--45. Cho biết danh sách các công việc (tên công việc) trong đề án "Sản phẩm X" mà nhân viên có mã là 009 chưa làm.
	SELECT CONGVIEC.TEN_CONG_VIEC
	FROM CONGVIEC, DEAN
	WHERE CONGVIEC.MADA = DEAN.MADA AND
		  DEAN.TENDA = N'Sản phẩm X' AND
		  CONGVIEC.TEN_CONG_VIEC NOT IN (SELECT CONGVIEC.TEN_CONG_VIEC
										 FROM CONGVIEC, PHANCONG
										 WHERE CONGVIEC.MADA = PHANCONG.MADA AND
										 PHANCONG.MA_NVIEN = '009')
--46. Tìm họ tên và địa chỉ của những nhân viên làm việc cho một đề án ở 'TP HCM' nhưng phòng ban mà họ trực thuộc lại không tọa lạc ở thành phố 'TP HCM'.
	SELECT DISTINCT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên', NHANVIEN.DCHI
	FROM NHANVIEN, DEAN, DIADIEM_PHG
	WHERE NHANVIEN.PHG = DEAN.PHONG AND
		  NHANVIEN.PHG = DIADIEM_PHG.MAPHG AND
		  DEAN.DDIEM_DA LIKE '%HCM' AND
		  DIADIEM_PHG.DIADIEM NOT LIKE '%HCM'
--47. Tổng quát câu 46, tìm họ tên và địa chỉ của các nhân viên làm việc cho một đề án ở một thành phố nhưng phòng ban mà họ trực thuộc lại không toạ lạc ở thành phố đó.
	SELECT DISTINCT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên', NHANVIEN.DCHI
	FROM NHANVIEN, DEAN, DIADIEM_PHG
	WHERE NHANVIEN.PHG = DEAN.PHONG AND
		  NHANVIEN.PHG = DIADIEM_PHG.MAPHG AND
		  DEAN.DDIEM_DA IN (SELECT DEAN.DDIEM_DA
							FROM DEAN
							) AND
		  DIADIEM_PHG.DIADIEM NOT LIKE DEAN.DDIEM_DA
END
GO

BEGIN /* BIẾN */
--01. Tính tổng các số tự nhiên trong đoạn 1 - 100.
	DECLARE @tong INT;
	DECLARE @dem INT;
	SET @tong = 0;
	SET @dem = 1;
	--
	WHILE (@dem <=100)
	BEGIN
		SET @tong = @tong + @dem;
		SET @dem = @dem + 1;	
	END
	PRINT @tong;
--02. Tính tổng các số chẵn trong đoạn 1 -  100.
	DECLARE @tong INT;
	DECLARE @dem INT;
	SET @tong = 0;
	SET @dem = 1;
	--
	WHILE (@dem <=100)
	BEGIN
		IF(@dem%2 = 0)
			BEGIN
				SET @tong = @tong+ @dem
			END
		SET @dem = @dem + 1
	END
	PRINT @tong;
--03. Tìm ước chung lớn nhất của hai số nguyên a, b cho trước.
	DECLARE @a INT;
	DECLARE @b INT;
	DECLARE @r INT;
	SET @a = 10;
	SET @b = 24;
	--
	WHILE (@b!=0)
	BEGIN
		SET @r = @a%@b;
		SET @a = @b;
		SET @b = @r;
	END
	PRINT @a;
--04. Tìm bội chung nhỏ nhất của hai số nguyên a, b cho trước.
	DECLARE @a INT;
	DECLARE @b INT;
	DECLARE @r INT;
	DECLARE @tich INT;
	SET @a = 4;
	SET @b = 10;
	SET @tich = @a*@b;
	--
	WHILE (@b!=0)
	BEGIN
		SET @r = @a%@b;
		SET @a = @b;
		SET @b = @r;
	END
	PRINT @tich/@a;
--05. Kiểm tra số n cho trước có phải là số nguyên tố.
	DECLARE @n INT;
	DECLARE @i INT;
	DECLARE @flag BIT;
	SET @n = 10;
	SET @i = 2;
	--
	IF (@i<=SQRT(@n))
	WHILE (@i<=SQRT(@n))
	BEGIN
		IF(@n<1)
			SET @flag = 0;
		IF(@n=1)
			SET @flag = 1;
		ELSE
			BEGIN
				IF(@n%2 = 0)
					SET @flag = 0;
			END
			SET @i = @i + 1;
	END
	ELSE
		SET @flag = 1;
	--
	IF (@flag = 0)
		BEGIN
			PRINT @n
			PRINT N'Không là số nguyên tố';
		END
	ELSE
		BEGIN
			PRINT @n
			PRINT N'Là số nguyên tố';
		END
--06. Cho trước 03 số nguyên, kiểm tra đây có phải là số đo ba cạnh của một tam giác.
	DECLARE @a INT;
	DECLARE @b INT;
	DECLARE @c INT;
	SET @a = 3;
	SET @b = 4;
	SET @c = 5;
	--
	IF ((@a+@b>@c) AND (@b+@c > @a) AND (@c+@a>@b))
		PRINT N'Là số đo ba cạnh của một tam giác!';
	ELSE
		PRINT N'Không là số đo ba cạnh của một tam giác!';
--07. Giải phương trình bậc nhất ax + b = 0.
	DECLARE @a INT;
	DECLARE @b INT;
	SET @a = 3;
	SET @b = 7;
	--
	IF(@a = 0)
		IF(@b = 0)
			PRINT N'Phương trình vô số nghiệm!';
		ELSE
			PRINT N'Phương trình vô nghiệm!';
	ELSE
	PRINT -@b/@a;
END
GO

BEGIN  /* STORED PROCEDURE */
--01. Tìm danh sách nhân viên theo mã phòng ban (SP_NHANVIEN_PHG).
	CREATE PROC SP_NHANVIEN_PHG
	@ma_phong INT
	AS
		SELECT*
		FROM NHANVIEN
		WHERE NHANVIEN.PHG = @ma_phong
	--
	EXEC SP_NHANVIEN_PHG 5
--02. Tìm danh sách thân nhân theo mã nhân viên (SP_THANNHAN_MANV).
	CREATE PROC SP_THANNHAN_MANV
	@ma_nhan_vien INT
	AS
		SELECT*
		FROM THANNHAN
		WHERE THANNHAN.MA_NVIEN = @ma_nhan_vien
	--
	EXEC SP_THANNHAN_MANV 005
--03. Tìm những nhân viên theo mã phòng ban có có mức lương cao hơn mức lương cần tìm (SP_NHANVIEN_PHG_LUONNG).
	CREATE PROC SP_NHANVIEN_PHG_LUONG
	@ma_phong INT, @luong FLOAT
	AS
		SELECT*
		FROM NHANVIEN
		WHERE NHANVIEN.PHG = @ma_phong AND
			  NHANVIEN.LUONG > @luong
	--
	EXEC SP_NHANVIEN_PHG_LUONG 5, 33000
--04. Thêm thông tin cho nhân viên mới (SP_THEM_NHANVIEN), yêu cầu chỉ thêm nhân viên phòng Nghiên cứu.
	CREATE PROC SP_THEM_NHANVIEN
	@ho_nhan_vien NVARCHAR(15), @ten_lot NVARCHAR(15), @ten_nhan_vien NVARCHAR(15), @ma_nhan_vien NVARCHAR(9), @ngay_sinh DATE,
	@dia_chi NVARCHAR(30), @phai NVARCHAR(3), @luong FLOAT, @ma_nguoi_quan_ly NVARCHAR(9), @phong INT
	AS
		DECLARE @ma_phong_phong_nghien_cuu INT;
		SET @ma_phong_phong_nghien_cuu = (SELECT PHONGBAN.MAPHG
										  FROM PHONGBAN
										  WHERE PHONGBAN.TENPHG = N'Nghiên cứu'
										  )
		IF(@phong = @ma_phong_phong_nghien_cuu)
		INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
		VALUES (@ho_nhan_vien, @ten_lot, @ten_nhan_vien, @ma_nhan_vien, @ngay_sinh, @dia_chi, @phai, @luong, @ma_nguoi_quan_ly, @phong)
	--
	EXEC SP_THEM_NHANVIEN N'Đặng', N'Minh', N'Tân', '2368', '7-16-1997', N'399/6 Ấp Bình Khương', N'Nam', 38000, '007', 4
--05. Tìm danh sách các đề án được thực hiện bởi nhân viên có mã cho trước (SP_DEAN_MANV)
	CREATE PROC SP_DEAN_MANV
	@ma_nhan_vien NVARCHAR(9)
	AS
		SELECT PHANCONG.MADA
		FROM PHANCONG
		WHERE PHANCONG.MA_NVIEN = @ma_nhan_vien
	--
	EXEC SP_DEAN_MANV '007'
--06. Tính lương trung bình của phòng ban theo tên phòng (SP_LUONGTB_TENPB).
	CREATE PROC SP_LUONGTB_TENPB
	@ten_phong_ban NVARCHAR(15)
	AS
		SELECT PHONGBAN.MAPHG, PHONGBAN.TENPHG, AVG(NHANVIEN.LUONG) AS 'Lương trung bình của phòng ban'
		FROM NHANVIEN, PHONGBAN
		WHERE NHANVIEN.PHG = PHONGBAN.MAPHG AND
			  PHONGBAN.TENPHG = @ten_phong_ban
		GROUP BY PHONGBAN.MAPHG, PHONGBAN.TENPHG
	--
	EXEC SP_LUONGTB_TENPB N'Nghiên cứu'
--07. Cho biết danh sách các công việc được phân công cho các nhân viên ở phòng ban cần tìm theo mã phòng (SP_CV_MAPHG).
	CREATE PROC SP_CV_MAPHG
	@ma_phong INT
	AS
		SELECT CONGVIEC.TEN_CONG_VIEC AS 'Danh sách công việc'
		FROM NHANVIEN, PHANCONG, CONGVIEC
		WHERE NHANVIEN.MANV = PHANCONG.MA_NVIEN AND
			  PHANCONG.MADA = CONGVIEC.MADA AND
			  NHANVIEN.PHG = @ma_phong
	--
	EXEC SP_CV_MAPHG 1
--08. Tính số lượng công việc của nhân viên theo mã nhân viên (SP_SOCV_MANV).
	CREATE PROC SP_SOCV_MANV
	@ma_nhan_vien NVARCHAR(9)
	AS
		SELECT COUNT(PHANCONG.MA_NVIEN) AS 'Số lượng công việc'
		FROM PHANCONG
		WHERE PHANCONG.MA_NVIEN = @ma_nhan_vien
	--
	EXEC SP_SOCV_MANV '005'
END
GO

BEGIN /* FUNCTIONS */
-- 01. Cho biết địa chỉ của một nhân viên dựa theo tên nhân viên.
	CREATE FUNCTION F_DCHI_TENNV (@ten_nhan_vien NVARCHAR(15))
	RETURNS NVARCHAR (30)
	AS
		BEGIN
			RETURN (SELECT NHANVIEN.DCHI AS N'Địa chỉ'
					FROM NHANVIEN
					WHERE NHANVIEN.TENNV = @ten_nhan_vien
					)
		END
	--
	SELECT dbo.F_DCHI_TENNV (N'Hằng')
-- 02. Cho biết họ tên đầy đủ của nhân viên dựa theo mã nhân viên.
	CREATE FUNCTION F_HOTENNV_MANV (@ma_nhan_vien NVARCHAR(9))
	RETURNS NVARCHAR(47)
	AS
		BEGIN
			RETURN (SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên'
					FROM NHANVIEN
					WHERE NHANVIEN.MANV = @ma_nhan_vien
					)
		END
	--
	SELECT dbo.F_HOTENNV_MANV ('2368')
-- 03. Truyền vào một mã nhân viên, cho biết họ tên đầy đủ của nhân viên quản lý nhân viên đó.
	CREATE FUNCTION F_HOTENQL_MANV (@ma_nhan_vien NVARCHAR(9))
	RETURNS NVARCHAR(47)
	AS
		BEGIN
			RETURN (SELECT (QL.HONV + ' ' + QL.TENLOT + ' ' + QL.TENNV) AS 'Họ tên quản lý'
					FROM NHANVIEN AS NV, NHANVIEN AS QL
					WHERE NV.MANV = @ma_nhan_vien AND
						  NV.MA_NQL = QL.MANV
					)
		END
	--
	SELECT dbo.F_HOTENQL_MANV ('005')
-- 04. Tên công việc của nhân viên cần tìm theo mã nhân viên đó.
	CREATE FUNCTION F_TENCV_MANV (@ma_nhan_vien NVARCHAR(9))
	RETURNS TABLE
	AS
		RETURN (SELECT CONGVIEC.TEN_CONG_VIEC
				FROM PHANCONG, CONGVIEC
				WHERE PHANCONG.MADA = CONGVIEC.MADA AND
				PHANCONG.MA_NVIEN = @ma_nhan_vien
				)
	--
	SELECT*
	FROM dbo.F_TENCV_MANV ('005')
-- 05. Cho biết tên của thân nhân có quan hệ vợ chồng với nhân viên theo mã.
	CREATE FUNCTION F_HOTENTN_VOCHONG_MANV (@ma_nhan_vien NVARCHAR(9))
	RETURNS NVARCHAR(15)
	AS
		BEGIN
			RETURN (SELECT THANNHAN.TENTN AS 'Họ tên thân nhân'
					FROM THANNHAN
					WHERE THANNHAN.MA_NVIEN = @ma_nhan_vien AND
						  THANNHAN.QUANHE = N'Vợ chồng'
					)
		END
	--
	SELECT dbo.F_HOTENTN_VOCHONG_MANV ('005')
-- 06. Với mã phòng ban cho trước, tính lương trung bình của phòng ban đó.
	CREATE FUNCTION F_LUONGTB_PHG (@ma_phong INT)
	RETURNS FLOAT
	AS
		BEGIN
			RETURN (SELECT AVG(NHANVIEN.LUONG) AS 'Lương trung bình của phòng ban'
					FROM NHANVIEN
					WHERE NHANVIEN.PHG = @ma_phong
					)  
		END
	--
	SELECT dbo.F_LUONGTB_PHG (5)
-- 07. Tính giờ công thực hiện đề án của phòng ban theo mã phòng.
	CREATE FUNCTION F_GIOTHUCHIEN_MAPHG (@ma_phong INT)
	RETURNS FLOAT
	AS
		BEGIN
			RETURN (SELECT SUM(PHANCONG.THOIGIAN) AS 'Số giờ thực hiện'
					FROM DEAN,PHANCONG
					WHERE DEAN.MADA = PHANCONG.MADA AND
						  DEAN.PHONG = @ma_phong
					)
		END
	--
	SELECT dbo.F_GIOTHUCHIEN_MAPHG (5)
-- 08. Cho biết số lượng nhân viên của phòng ban theo mã phòng.
	CREATE FUNCTION F_SOLUONGNV_MAPHG (@ma_phong INT)
	RETURNS INT
	AS
		BEGIN
			RETURN (SELECT COUNT(NHANVIEN.MANV)
					FROM NHANVIEN
					WHERE NHANVIEN.PHG = @ma_phong
					)
		END
	--
	SELECT dbo.F_SOLUONGNV_MAPHG (5)
-- 09. Họ tên đầy đủ của trưởng phòng của nhân viên theo mã nhân viên.
	CREATE FUNCTION F_HOTENTP_MANV (@ma_nhan_vien NVARCHAR(9))
	RETURNS NVARCHAR(47)
	AS
		BEGIN
			RETURN (SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên trưởng phòng'
					FROM NHANVIEN, PHONGBAN
					WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND
						  NHANVIEN.MANV = @ma_nhan_vien
				  )
		END
	--
	SELECT dbo.F_HOTENTP_MANV ('005')
-- 10. Cho biết tên đề án của phòng ban chủ trì theo mã phòng ban.
	CREATE FUNCTION F_TENDA_MAPHG (@ma_phong INT)
	RETURNS TABLE
	AS
		RETURN (SELECT DEAN.TENDA AS 'Tên đề án'
				FROM DEAN
				WHERE DEAN.PHONG = @ma_phong
				)
	--
	SELECT*
	FROM dbo.F_TENDA_MAPHG (5)
-- 11. Tìm danh sách nhân viên theo mã phòng ban.
	CREATE FUNCTION F_DANHSACHNV_MAPHG (@ma_phong INT)
	RETURNS TABLE
	AS
		RETURN (SELECT*
				FROM NHANVIEN
				WHERE NHANVIEN.PHG = @ma_phong
				)
	--
	SELECT*
	FROM dbo.F_DANHSACHNV_MAPHG (5)
-- 12. Tìm danh sách thân nhân theo mã nhân viên.
	CREATE FUNCTION F_THANNHAN_MANV (@ma_nhan_vien NVARCHAR(9))
	RETURNS TABLE
	AS
		RETURN (SELECT*
				FROM THANNHAN
				WHERE THANNHAN.MA_NVIEN = @ma_nhan_vien
				)
	--
	SELECT*
	FROM F_THANNHAN_MANV ('005')
-- 13. Tìm những nhân viên theo mã phòng ban có có mức lương cao hơn mức lương cần tìm.
	CREATE FUNCTION F_NHANVIEN_MAPHG_LUONG (@ma_phong INT, @luong FLOAT)
	RETURNS TABLE
	AS
		RETURN (SELECT*
				FROM NHANVIEN
				WHERE NHANVIEN.PHG = @ma_phong AND
					  NHANVIEN.LUONG > @luong
				)
	--
	SELECT*
	FROM F_NHANVIEN_MAPHG_LUONG (5, 34000)
-- 14. Tìm danh sách các đề án được thực hiện bởi nhân viên có mã cho trước.
	CREATE FUNCTION F_DEAN_MANV (@ma_nhan_vien NVARCHAR(9))
	RETURNS TABLE
	AS
		RETURN (SELECT DEAN.TENDA AS 'Tên đề án'
				FROM DEAN, PHANCONG
				WHERE DEAN.MADA = PHANCONG.MADA AND
					  PHANCONG.MA_NVIEN = @ma_nhan_vien
			   )
	--
	SELECT*
	FROM F_DEAN_MANV ('005')
-- 15. Tính lương trung bình của phòng ban theo tên phòng.
	CREATE FUNCTION F_LUONGTB_TENPB (@ten_phong NVARCHAR(15))
	RETURNS FLOAT
	AS
		BEGIN
			RETURN (SELECT AVG(NHANVIEN.LUONG)
					FROM NHANVIEN, PHONGBAN
					WHERE NHANVIEN.PHG = PHONGBAN.MAPHG AND
						  PHONGBAN.TENPHG = @ten_phong
					)
		END
	--
	SELECT dbo.F_LUONGTB_TENPB (N'Nghiên cứu')
-- 16. Cho biết danh sách các công việc được phân công cho các nhân viên ở phòng ban cần tìm theo mã phòng.
	CREATE FUNCTION F_DANHSACHCV_MAPHG (@ma_phong INT)
	RETURNS TABLE
	AS
		RETURN (SELECT DISTINCT CONGVIEC.TEN_CONG_VIEC
				FROM CONGVIEC, PHANCONG, NHANVIEN
				WHERE CONGVIEC.MADA = PHANCONG.MADA AND
					  PHANCONG.MA_NVIEN = NHANVIEN.MANV AND
					  NHANVIEN.PHG = @ma_phong
				)
	--
	SELECT*
	FROM F_DANHSACHCV_MAPHG (4)
-- 17. Tính số lượng công việc của nhân viên theo mã nhân viên.
	CREATE FUNCTION F_SOLUONGCV_MANV (@ma_nhan_vien NVARCHAR(9))
	RETURNS INT
	AS
		BEGIN
			RETURN (SELECT COUNT(PHANCONG.MA_NVIEN)
					FROM PHANCONG
					WHERE PHANCONG.MA_NVIEN = @ma_nhan_vien
					)
		END
	--
	SELECT dbo.F_SOLUONGCV_MANV ('003')
-- 18. Cho biết tên công việc theo mã đề án và STT cho trước.
	CREATE FUNCTION F_TENCV_MADA_STT (@ma_de_an INT, @so_thu_tu INT)
	RETURNS NVARCHAR(50)
	AS
		BEGIN
			RETURN (SELECT CONGVIEC.TEN_CONG_VIEC AS 'Tên công việc'
					FROM CONGVIEC
					WHERE CONGVIEC.MADA = @ma_de_an AND
						  CONGVIEC.STT = @so_thu_tu
					)
		END
	--
	SELECT dbo.F_TENCV_MADA_STT (20,1)
END
GO
