create database QuanLyThuVien;
use QuanLyThuVien;

create table TacGia(
	MaTacGia int primary key auto_increment,
    TenTacGia varchar(100) not null,
    QuocTich varchar(50)
);
    
create table DocGia(
	MaDocGia int primary key auto_increment,
    TenDocGia varchar(100) not null,
    DiaChi varchar(50),
    SoDienThoai varchar(15) unique
);

select distinct SoDienThoai
from DocGia;

insert into TacGia(TenTacGia, QuocTich)
values ('Nguyễn Nhật Ánh', 'Việt Nam'),
('J.K. Rowling', 'Anh'),
('Haruki Murakami', 'Nhật Bản'),
('Dale Carnegie', 'Mỹ');

insert into DocGia(TenDocGia, DiaChi, SoDienThoai)
values ('Nguyễn Văn A', '123 Đường ABC, Hà Nội', '0901234567'),
('Trần Thị B', '456 Đường XYZ, TP.HCM', '0912345678'),
('Lê Văn C', '789 Đường LMN, Đà Nẵng', '0923456789'),
('Phạm Thị D', '101 Đường QRS, Hà Nội', '0934567890'),
('Hoàng Văn E', '202 Đường UVW, Cần Thơ', '0945678901');

select * from TacGia
where QuocTich like 'Việt Nam';

select * from DocGia
where DiaChi like '%Hà Nội%';

select TenDocGia, SoDienThoai
from DocGia;

update DocGia
set DiaChi = '200 Đường XYZ, TP. Thủ Đức'
where MaDocGia = 2;

DELETE FROM TacGia
WHERE MaTacGia = 3;

create table Sach(
	MaSach int primary key auto_increment,
    TenSach varchar(200) not null,
    NamXuatBan int,
	MaTacGia int,
    foreign key (MaTacGia) references TacGia(MaTacGia)
);

insert into Sach(TenSach, NamXuatBan, MaTacGia)
values ('Cho tôi xin một vé đi tuổi thơ', 2008, 1),
('Mắt biếc', 1990, 1),
('Harry Potter và Hòn đá Phù thủy', 1997, 2),
('Harry Potter và Phòng chứa Bí mật', 1998, 2),
('Đắc nhân tâm', 1936, 4);

select * from Sach
where NamXuatBan>=1990 and NamXuatBan<=20;

select * from Sach
where TenSach like 'Harry Potter và Hòn đá Phù thủy' or TenSach like 'Harry Potter và Phòng chứa Bí mật';

select * from Sach
where MaTacGia = 1 and NamXuatBan>2000;

select * from Sach
order by NamXuatBan desc;

select * from DocGia
order by TenDocGia asc;

create table PhieuMuon(
	MaPhieuMuon int primary key auto_increment,
    NgayMuon date,
    NgayTra date null,
    MaDocGia int,
    foreign key (MaDocGia) references DocGia(MaDocGia),
    MaSach int,
    foreign key (MaSach) references Sach(MaSach)
);

alter table Sach
add column TrangThai varchar(50);

update Sach
set TrangThai = 'Còn hàng'
where NamXuatBan<2000;

update Sach
set TrangThai = 'Mới nhập'
where NamXuatBan>=2000;

insert into PhieuMuon(MaDocGia, MaSach, NgayMuon, NgayTra)
values (1, 1, '2024-01-10', '2024-01-25'),
(2, 3, '2024-02-15', NULL),
(1, 2, '2024-03-01', '2024-03-15'),
(3, 4, '2024-03-05', NULL),
(5, 5, '2024-04-20', '2024-05-01');

select * from PhieuMuon
where MaDocGia = 1; 

select * from PhieuMuon
where NgayTra = null;

