CREATE DATABASE PRO1041_SD19308
GO
USE PRO1041_SD19308
GO 

CREATE TABLE NhanVien (
    id_nhanVien INT identity(1,1) PRIMARY KEY,
    maNhanVien NVARCHAR(50) NOT NULL ,
    tenNhanVien NVARCHAR(100) NOT NULL,
	taiKhoan VARCHAR(50) NOT NULL,
	matKhau VARCHAR(50) NOT NULL,
	gioiTinh NVARCHAR(10) NOT NULL,
    trangThai bit not null,
    sdt VARCHAR(11) not null,
	email VARCHAR(11)  null,
	ngayTao DATE DEFAULT CURRENT_TIMESTAMP,
	ngaySua DATE,
);
GO
INSERT INTO NhanVien(maNhanVien,tenNhanVien,taiKhoan,matKhau,gioiTinh,trangThai,sdt,email,ngayTao,ngaySua) 
VALUES ( 'NV001', N'trungdungdtr','admin','1234',N'Nam',1,'0987654321',null,DEFAULT,DEFAULT);
GO
INSERT INTO NhanVien(maNhanVien,tenNhanVien,taiKhoan,matKhau,gioiTinh,trangThai,sdt,email,ngayTao,ngaySua) 
VALUES ( 'NV002', N'abc','trungdungdtr','12345',N'Nữ',0,'0987654321',null,DEFAULT,DEFAULT);
GO
INSERT INTO NhanVien(maNhanVien,tenNhanVien,taiKhoan,matKhau,gioiTinh,trangThai,sdt,email,ngayTao,ngaySua) 
VALUES ( 'NV003', N'Vũ Trung Dũng','abc','123',N'Nam',1,'0888578882',null,DEFAULT,DEFAULT);
GO


SELECT * FROM NhanVien


Create Table KhachHang( 
id_khachHang int IDENTITY(1,1) PRIMARY KEY,
maKh NVARCHAR(30)  NULL,
hoTenKh NVARCHAR(100) NOT NULL,
diaChi NVARCHAR(100) NULL,
	gioiTinh NVARCHAR(10)  NULL,
	email NVARCHAR(100) NULL,
sdt VARCHAR(11)  NULL,
  ngayTao DATE DEFAULT CURRENT_TIMESTAMP,
    ngaySua DATE
);
GO
INSERT INTO KhachHang(maKh,hoTenKh,diaChi,gioiTinh,email,sdt,ngayTao,ngaySua)
VALUES('KH1',N'Lê Minh Quang',N'Hà Nội',N'Nam','abc@gmail.com','0123456789',DEFAULT,DEFAULT);
GO
INSERT INTO KhachHang(maKh,hoTenKh,diaChi,gioiTinh,email,sdt,ngayTao,ngaySua)
VALUES('KH2',N'Nguyễn Thị Tính',N'Hà Nam',N'Nữ','tinhxaugai@gmail.com','0152785697',DEFAULT,DEFAULT);
GO
INSERT INTO KhachHang(maKh,hoTenKh,diaChi,gioiTinh,email,sdt,ngayTao,ngaySua)
VALUES('KH3',N'Vũ Trung Hải',N'Ninh Bình',N'Nam','trunghaiabc@gmail.com','0555565478',DEFAULT,DEFAULT);
GO
SELECT * FROM KhachHang



CREATE TABLE ThanhToan(
    id_HTTT INT IDENTITY(1,1) PRIMARY KEY,
    loai NVARCHAR(50),
    trangThai  BIT NULL,
    NGAYTAO DATE DEFAULT CURRENT_TIMESTAMP,
    NGAYSUA DATE
);
GO
INSERT INTO ThanhToan(loai,trangThai,NGAYTAO,NGAYSUA)
VALUES(N'Tiền Mặt',1,DEFAULT,DEFAULT);
GO
INSERT INTO ThanhToan(loai,trangThai,NGAYTAO,NGAYSUA)
VALUES(N'Chuyển Khoản',1,DEFAULT,DEFAULT);
GO
INSERT INTO ThanhToan(loai,trangThai,NGAYTAO,NGAYSUA)
VALUES(N'VISA',0,DEFAULT,DEFAULT);
GO
SELECT * FROM ThanhToan



CREATE TABLE HoaDon(
id_hoaDon int IDENTITY(1,1) PRIMARY KEY,
maHoaDon NVARCHAR(50)  NULL,
tenHoaDon NVARCHAR(50)  NULL,
trangThai bit NOT NULL,
ngayTao DATE DEFAULT CURRENT_TIMESTAMP,
ngaySua DATE,
id_nhanVien int NULL,
id_KhachHang int NULL,
id_HTTT int NULL,
FOREIGN KEY (id_nhanVien)
  REFERENCES NhanVien (id_nhanVien) ON DELETE CASCADE,
  FOREIGN KEY (id_KhachHang)
  REFERENCES KhachHang (id_KhachHang) ON DELETE CASCADE,
  FOREIGN KEY (id_HTTT)
  REFERENCES ThanhToan (id_HTTT)
  ON DELETE CASCADE
);
GO
INSERT INTO HoaDon(maHoaDon,tenHoaDon,trangThai,ngayTao,ngaySua,id_nhanVien,id_KhachHang,id_HTTT)
VALUES('HD1',N'Hóa Đơn 1',1,DEFAULT,DEFAULT,1,2,3);
INSERT INTO HoaDon(maHoaDon,tenHoaDon,trangThai,ngayTao,ngaySua,id_nhanVien,id_KhachHang,id_HTTT)
VALUES('HD2',N'Hóa Đơn 2',0,DEFAULT,DEFAULT,2,3,1);
SELECT * FROM HoaDon



CREATE TABLE KhuyenMai(
    id_khuyenMai INT IDENTITY(1,1) PRIMARY KEY,
    tenKM NVARCHAR(255) NOT NULL,
    ngayBatDau DATE NOT NULL,
    ngayKetThuc DATE NOT NULL,
    giaTri DECIMAL(10,2) NOT NULL,
    donVi NVARCHAR(10) NOT NULL,
    trangThai BIT NULL,
    ngayTao DATE DEFAULT CURRENT_TIMESTAMP,
    ngaySua DATE
);
GO
INSERT INTO KhuyenMai (tenKM,ngayBatDau,ngayKetThuc,giaTri,donVi,trangThai,ngayTao,ngaySua) 
VALUES (N'Khuyến mãi mùa hè','2024-07-01','2024-07-31',20.00,N'Giảm Tiền',1,DEFAULT,DEFAULT
);
INSERT INTO KhuyenMai (tenKM,ngayBatDau,ngayKetThuc,giaTri,donVi,trangThai,ngayTao,ngaySua) 
VALUES (N'Khuyến mãi mùa đông','2024-12-01','2024-12-31',5.00,N'Giảm Tiền',1,DEFAULT,DEFAULT
);
INSERT INTO KhuyenMai (tenKM,ngayBatDau,ngayKetThuc,giaTri,donVi,trangThai,ngayTao,ngaySua) 
VALUES (N'Khuyến mãi mùa xuân','2024-01-01','2024-01-31',15.00,N'Giảm Tiền',1,DEFAULT,DEFAULT
);
INSERT INTO KhuyenMai (tenKM,ngayBatDau,ngayKetThuc,giaTri,donVi,trangThai, ngayTao,ngaySua) 
VALUES (N'Khuyến mãi mùa thu','2024-06-01','2024-07-31',25.00,N'Giảm Tiền',0,DEFAULT,DEFAULT
);
SELECT * FROM KhuyenMai


CREATE TABLE NhaSanXuat (
    id_NSX INT IDENTITY(1,1) PRIMARY KEY,
    tenNSX NVARCHAR(100) NOT NULL,
	maNSX NVARCHAR(50) NOT NULL,
    dia_chi VARCHAR(255),
    email VARCHAR(100),
    sdt VARCHAR(11)  NULL,
	ngayTao DATE DEFAULT CURRENT_TIMESTAMP,
	ngaySua DATE
);
GO

INSERT INTO NhaSanXuat (tenNSX,maNSX,dia_chi,email, sdt, ngaySua,ngayTao
) VALUES (N'Nhà Sản Xuất A',N'NSX1',N'456 Đường XYZ, Quận 2, TP.HCM','nsx_a@gmail.com','0907654321',DEFAULT,DEFAULT
);
GO
INSERT INTO NhaSanXuat (tenNSX,maNSX,dia_chi,email, sdt, ngaySua,ngayTao
) VALUES (N'Nhà Sản Xuất B',N'NSX2',N'123 Đường ACB, Hà Nội','nsx_b@gmail.com','0888578882',DEFAULT,DEFAULT
);
GO
INSERT INTO NhaSanXuat (tenNSX,maNSX,dia_chi,email, sdt, ngaySua,ngayTao
) VALUES (N'Nhà Sản Xuất C',N'NSX3',N'53/59 Đường Minh Khai, Hà Nội','nsx_c@gmail.com','0123456789',DEFAULT,DEFAULT
);
GO
INSERT INTO NhaSanXuat (tenNSX,maNSX,dia_chi,email, sdt, ngaySua,ngayTao
) VALUES (N'Nhà Sản Xuất D',N'NSX4',N'53/59 Đường Minh Khai, Hà Nội','nsx_d@gmail.com','0123456789',DEFAULT,DEFAULT
);
GO
INSERT INTO NhaSanXuat (tenNSX,maNSX,dia_chi,email, sdt, ngaySua,ngayTao
) VALUES (N'Nhà Sản Xuất E',N'NSX5',N'53/59 Đường Minh Khai, Hà Nội','nsx_e@gmail.com','0123456789',DEFAULT,DEFAULT
);
GO
SELECT * FROM NhaSanXuat


CREATE TABLE ThuongHieu (
    id_thuongHieu INT IDENTITY(1,1) PRIMARY KEY,
    tenThuongHieu NVARCHAR(100) NOT NULL,
	maThuongHieu NVARCHAR(50) NOT NULL,
	ngayTao DATE DEFAULT CURRENT_TIMESTAMP,
	ngaySua DATE,
	trangThai bit NULL
);
GO
INSERT INTO ThuongHieu (tenThuongHieu,maThuongHieu,ngayTao, ngaySua, trangThai
) VALUES (N'UNIQLO',N'TH1',DEFAULT,DEFAULT,1
);
GO
INSERT INTO ThuongHieu (tenThuongHieu,maThuongHieu,ngayTao, ngaySua, trangThai
) VALUES (N'NO NAME',N'TH2',DEFAULT,DEFAULT,1
);
GO
INSERT INTO ThuongHieu (tenThuongHieu,maThuongHieu,ngayTao, ngaySua, trangThai
) VALUES (N'ADIDAS',N'TH2',DEFAULT,DEFAULT,1
);
GO
INSERT INTO ThuongHieu (tenThuongHieu,maThuongHieu,ngayTao, ngaySua, trangThai
) VALUES (N'SWE',N'TH3',DEFAULT,DEFAULT,1
);
GO
INSERT INTO ThuongHieu (tenThuongHieu,maThuongHieu,ngayTao, ngaySua, trangThai
) VALUES (N'Degrey',N'TH4',DEFAULT,DEFAULT,1
);
GO
INSERT INTO ThuongHieu (tenThuongHieu,maThuongHieu,ngayTao, ngaySua, trangThai
) VALUES (N'Tobi',N'TH5',DEFAULT,DEFAULT,1
);
GO
INSERT INTO ThuongHieu (tenThuongHieu,maThuongHieu,ngayTao, ngaySua, trangThai
) VALUES (N'Davies ',N'TH6',DEFAULT,DEFAULT,1
);
GO
SELECT  * FROM ThuongHieu
SELECT * FROM NhaSanXuat
CREATE TABLE SanPham(
	id_sanPham INT IDENTITY(1,1) PRIMARY KEY,
	maSanPham NVARCHAR(30) NULL,
	tenSanPham NVARCHAR(50) NOT NULL,
	ngayTao DATE DEFAULT CURRENT_TIMESTAMP,
	ngaySua DATE,
	id_thuongHieu INT  NULL,
	id_NSX INT  NULL,
	FOREIGN KEY (id_thuongHieu)
	REFERENCES ThuongHieu (id_thuongHieu) ON DELETE CASCADE,
    FOREIGN KEY (id_NSX)
	REFERENCES NhaSanXuat (id_NSX) 
	ON DELETE CASCADE
);
GO
INSERT INTO SanPham (maSanPham, tenSanPham, ngaySua, id_thuongHieu, id_NSX)
VALUES 
(N'P001', N'Sản phẩm 1', '2023-07-01', 1, 1),
(N'P002', N'Sản phẩm 2', '2023-07-02', 2, 2),
(N'P003', N'Sản phẩm 3', '2023-07-03', 1, 3),
(N'P004', N'Sản phẩm 4', '2023-07-04', 3, 2),
(N'P005', N'Sản phẩm 5', '2023-07-05', 2, 1);
GO
INSERT INTO SanPham (maSanPham, tenSanPham, ngaySua, id_thuongHieu, id_NSX)
VALUES 
(N'P006', N'I will never ghost you', '2023-07-01', 2, 4),
(N'P007', N'Cloudzy ', '2023-07-02', 5, 3),
(N'P008', N'Essential ', '2023-07-03', 4, 2),
(N'P009', N'Paradise ', '2023-07-04', 3, 4),
(N'P0010', N'Lucid ', '2023-07-05', 7, 5),
(N'P0011', N'City Cycle ', '2023-07-04', 5, 2),
(N'P0012', N'Athanor  ', '2023-07-05', 7, 3);
GO
SELECT * FROM NhaSanXuat
SELECT * FROM ThuongHieu
SELECT * FROM SanPham
CREATE TABLE KichThuoc (
    id_kichThuoc INT IDENTITY(1,1) PRIMARY KEY,
    maKichThuoc NVARCHAR(50) NOT NULL,
	tenKichThuoc NVARCHAR(50) NOT NULL,
	ngayTao DATE DEFAULT CURRENT_TIMESTAMP,
	ngaySua DATE,
	trangThai bit NULL
);
GO
INSERT INTO KichThuoc (maKichThuoc, tenKichThuoc, ngaySua, trangThai)
VALUES 
(N'KT001', N'S', '2023-07-01', 1),
(N'KT002', N'M', '2023-07-02', 1),
(N'KT003', N'L', '2023-07-03',  0),
(N'KT004', N'XL', '2023-07-04',  1),
(N'KT005', N'XXL', '2023-07-05',  0);
GO
SELECT * FROM KichThuoc


CREATE TABLE MauSac (
    id_mauSac INT IDENTITY(1,1) PRIMARY KEY,
    maMauSac NVARCHAR(50) NOT NULL,
	tenMauSac NVARCHAR(50) NOT NULL,
	ngayTao DATE DEFAULT CURRENT_TIMESTAMP,
	ngaySua DATE,
	trangThai bit NULL
);
GO
INSERT INTO MauSac (maMauSac, tenMauSac, ngaySua, trangThai)
VALUES 
(N'MS001', N'Màu đỏ', '2023-07-01', 1),
(N'MS002', N'Màu xanh', '2023-07-02', 1),
(N'MS003', N'Màu vàng', '2023-07-03', 0),
(N'MS004', N'Màu trắng', '2023-07-04', 1),
(N'MS005', N'Màu đen', '2023-07-05', 0);
GO
SELECT * FROM MauSac

CREATE TABLE ChatLieu (
    id_chatLieu INT IDENTITY(1,1) PRIMARY KEY,
    maChatLieu NVARCHAR(50) NOT NULL,
	tenChatLieu NVARCHAR(50) NOT NULL,
	ngayTao DATE DEFAULT CURRENT_TIMESTAMP,
	ngaySua DATE,
	trangThai bit  NULL
);
GO
INSERT INTO ChatLieu (maChatLieu, tenChatLieu, ngaySua, trangThai)
VALUES 
(N'CL001', N'Vải Cotton', '2023-07-01',  1),
(N'CL002', N'Vải PE',  '2023-07-02',  1),
(N'CL003', N'Vải Lanh',  '2023-07-03', 0),
(N'CL004', N'Vải Lycra',  '2023-07-04',  1),
(N'CL005', N'Vải Rayon', '2023-07-05',  0);
GO


CREATE TABLE KieuDang(
    id_kieuDang INT IDENTITY(1,1) PRIMARY KEY,
	maKieuDang NVARCHAR(50) NOT NULL,
    tenKieuDang NVARCHAR(555) NOT NULL,
    trangThai bit NULL,
    ngayTao DATE DEFAULT CURRENT_TIMESTAMP,
    ngaySua DATE
);
GO
INSERT INTO KieuDang (maKieuDang,tenKieuDang,trangThai, ngaySua)
VALUES 
(N'KD1',N'Form Rộng', 1, '2023-07-01'),
(N'KD2',N'Truyền thống', 1, '2023-07-02'),
(N'KD3',N'Cách tân', 0, '2023-07-03'),
(N'KD4',N'Dáng dài', 1, '2023-07-04'),
(N'KD5',N'Dáng suông', 0, '2023-07-05'),
(N'KD6',N'Zip', 1, '2023-07-05'),
(N'KD7',N'Không mũ', 0, '2023-07-05');
GO
SELECT * FROM KieuDang
CREATE TABLE KhoaAo(
    id_khoaAo INT IDENTITY(1,1) PRIMARY KEY,
    maKhoa NVARCHAR(55)  NULL,
    tenKhoa NVARCHAR(55)  NULL,
    ngayTao DATE DEFAULT CURRENT_TIMESTAMP,
    ngaySua DATE ,
	trangThai BIT NULL
);
GO
INSERT INTO KhoaAo (maKhoa, tenKhoa, ngayTao,trangThai)
VALUES
('MK1', N'Khóa kéo kim loại', '2024-07-10',1),
('MK2', N'Khóa cúc nhựa', '2024-07-10',1),
('MK3', N'Khóa bấm kim loại', '2024-07-10',1);
GO
SELECT * FROM KhoaAo
CREATE TABLE SanPhamChiTiet (
    id_SPCT INT IDENTITY(1,1) PRIMARY KEY,
    id_chatLieu INT NULL,
    id_kichThuoc INT NULL,
    id_sanPham INT NULL,
	id_mauSac INT NULL,
	id_kieuDang int NULL,
	id_khoaAo INT NULL,
    gia DECIMAL(10, 2) NOT NULL,
    soluongtonkho INT NOT NULL,
    mota nvarchar(100) NULL,
	FOREIGN KEY (id_chatLieu)
	REFERENCES ChatLieu (id_chatLieu) ON DELETE CASCADE,
	FOREIGN KEY (id_mauSac)
	REFERENCES MauSac (id_mauSac) ON DELETE CASCADE,
	FOREIGN KEY (id_kichThuoc)
	REFERENCES KichThuoc (id_kichThuoc) ON DELETE CASCADE,
	FOREIGN KEY (id_sanPham)
	REFERENCES SanPham (id_sanPham) ON DELETE CASCADE,
	FOREIGN KEY (id_kieuDang)
	REFERENCES KieuDang (id_kieuDang) ON DELETE CASCADE,
	FOREIGN KEY (id_khoaAo)
	REFERENCES KhoaAo (id_khoaAo)
	ON DELETE CASCADE
);
GO 

INSERT INTO SanPhamChiTiet (id_chatLieu, id_kichThuoc, id_sanPham, id_mauSac, id_kieuDang,id_khoaAo, gia, soluongtonkho, mota)
VALUES 
(1, 1, 1, 1, 1,1, 100000.00, 50, N'Mô tả sản phẩm chi tiết 1'),
(2, 2, 2, 2, 2,2, 200000.00, 40, N'Mô tả sản phẩm chi tiết 2'),
(3, 3, 3, 3, 3,1, 300000.00, 30, N'Mô tả sản phẩm chi tiết 3'),
(4, 4, 4, 4, 2,3, 400000.00, 20, N'Mô tả sản phẩm chi tiết 4'),
(5, 5, 5, 5, 1,2, 500000.00, 10, N'Mô tả sản phẩm chi tiết 5');
GO

SELECT * FROM SanPhamChiTiet

CREATE TABLE HoaDonChiTiet(
id_HDCT int identity(1,1) PRIMARY KEY,
maHDCT  NVARCHAR(30)  NULL,
trangThai bit  NULL,
soLuong INT  NULL,
donGia DECIMAL(10, 2)  NULL,
tongTien  DECIMAL(10, 2)  NULL,
ngaySua DATE NULL,
ngayTao DATE NULL,
id_hoaDon int  NULL,
id_SPCT int  NULL,
FOREIGN KEY (id_hoaDon)
  REFERENCES HoaDon (id_hoaDon) ON DELETE CASCADE,
  FOREIGN KEY (id_SPCT)
  REFERENCES SanPhamChiTiet (id_SPCT) ON DELETE CASCADE
);
GO
INSERT INTO HoaDonChiTiet (maHDCT, trangThai, soLuong,donGia, tongTien, ngaySua, ngayTao, id_hoaDon, id_SPCT)
VALUES 
(N'HDCT001', 1, 5,100000, 500000.00, '2023-07-01', '2023-06-30', 1, 1),
(N'HDCT002', 1, 3,100000, 300000.00, '2023-07-02', '2023-06-30', 2, 2),
(N'HDCT003', 0, 4,100000, 400000.00, '2023-07-03', '2023-06-30', 2, 3),
(N'HDCT004', 1, 2,100000, 200000.00, '2023-07-04', '2023-06-30', 1, 4),
(N'HDCT005', 0, 1,100000, 100000.00, '2023-07-05', '2023-06-30', 2, 5);
GO
SELECT * FROM HoaDonChiTiet

CREATE TABLE SanPhamKhuyenMai(
    id_SPCT INT ,
    id_khuyenMai INT,
    trangThai bit,
    ngayTao DATE DEFAULT CURRENT_TIMESTAMP,
    ngaySua DATE,
    PRIMARY KEY(id_khuyenMai, id_SPCT),
    FOREIGN KEY(id_SPCT) REFERENCES SanPhamChiTiet(id_SPCT) ON DELETE CASCADE,
    FOREIGN KEY(id_khuyenMai) REFERENCES KhuyenMai(id_khuyenMai) ON DELETE CASCADE
);
GO
INSERT INTO SanPhamKhuyenMai (id_SPCT, id_khuyenMai, trangThai, ngaySua)
VALUES 
(1, 1, 1, '2023-07-01'),
(2, 2, 1, '2023-07-02'),
(4, 3, 0, '2023-07-03'),
(2, 4, 1, '2023-07-04'),
(5, 3, 0, '2023-07-05');
GO
SELECT * FROM SanPhamChiTiet
SELECT * FROM KhuyenMai
SELECT * FROM SanPhamKhuyenMai

SELECT 
    sp.id_sanPham,
    sp.maSanPham,
    sp.tenSanPham,
    spc.gia,
	    spc.soluongtonkho,
	    sp.ngayTao AS 'Ngày Tạo',
	sp.ngaySua AS 'Ngày Sửa',
    nsx.tenNSX,
    th.tenThuongHieu,
	cl.tenChatLieu,
	ha.tenKhoa,
	kt.tenKichThuoc,
	ms.tenMauSac,
	    spc.id_SPCT
FROM 
    SanPham sp
JOIN 
    SanPhamChiTiet spc ON sp.id_sanPham = spc.id_sanPham
JOIN 
    NhaSanXuat nsx ON sp.id_NSX = nsx.id_NSX
JOIN 
    ThuongHieu th ON sp.id_thuongHieu = th.id_thuongHieu
	JOIN 
	ChatLieu cl ON spc.id_chatLieu = cl.id_chatLieu
	JOIN 
	KhoaAo  ha ON spc.id_khoaAo = ha.id_khoaAo
	JOIN 
	KichThuoc kt ON spc.id_kichThuoc = kt.id_kichThuoc
	JOIN 
	MauSac ms ON spc.id_mauSac = ms.id_mauSac

	SELECT * FROM dbo.ChatLieu
	DELETE FROM dbo.ChatLieu WHERE id_chatLieu = 1
	
	UPDATE dbo.SanPhamChiTiet SET id_chatLieu = NULL WHERE id_chatLieu = 2;