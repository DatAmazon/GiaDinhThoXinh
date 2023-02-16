create database giadinhthoxinh
go
create table tblKhuyenMai(
	PK_iMaKM int identity(1,1) primary key,
	sTenKM nvarchar(100),
	sPhanTram float,
	dNgayBD datetime,
	dbngayKT datetime
)
go
create table tblDanhMuc(
	PK_iMaDanhMuc int identity(1,1) primary key,
	sTenDanhMuc nvarchar(40)
)
go
create table tblSanPham(
	PK_iMaSP int identity(1,1) primary key,
	FK_iMaDanhMuc int,
	FK_iMaKM int,
	sTenSP nvarchar(50),
	sMoTa nvarchar(1000),
	sMauSac nvarchar(20),
	sSize nvarchar(15),
	constraint fk_sanpham_danhmuc foreign key (FK_iMaDanhMuc) references tblDanhMuc(PK_iMaDanhMuc),
	constraint fk_sampham_khuyenmai foreign key (FK_iMaKM) references tblKhuyenMai(PK_iMaKM)
)
go
