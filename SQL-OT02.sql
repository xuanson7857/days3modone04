CREATE DATABASE ONTAP;
USE ONTAP;

-- AND, OR, NOT -- Toán tử Logic
select * from products where product_name = 'san pham 1' and price > 100;
select * from products where address='da nang' OR country='japan';
select * from products where not product_name = 'san pham 2';

-- LIKE -- Sử dụng để so sánh một chuỗi với một biểu thức chính quy (regular expression).
select * from test where test_name like 's%';

-- BETWEEN -- Chọn các giá trị nằm trong một khoảng cụ thể.
select * from test where price between 100 and 200;

-- IN -- Kiểm tra xem giá trị có trong danh sách các giá trị được chỉ định hay không.
select * from test where category in ('san pham 1', 'san pham 2');


-- INNER  JOIN --
-- INNER  JOIN --

CREATE TABLE nhacung(
nhacung_id int primary key,
nhacung_ten varchar(50)
);

CREATE TABLE donhang(
donhang_id int primary key,
nhacung_id int,
foreign key (nhacung_id) references nhacung(nhacung_id),
donhang_ngay date
);

insert into nhacung values(10000,'IBM');
insert into nhacung values(10001,'Hewlett Packard');
insert into nhacung values(10002,'Microsoft');
insert into nhacung values(10003,'NVIDIA');

insert into donhang values(500125,10000,'2003-05-12');
insert into donhang values(500126,10001,'2003-05-13');
insert into donhang values(500127,10002,'2003-05-14');

select nc.nhacung_id, nc.nhacung_ten,dh.donhang_id,dh.donhang_ngay
from nhacung as nc
join donhang as dh
on nc.nhacung_id = dh.nhacung_id;



--  SELF JOIN -- kết nối một bảng với chính nó
--  SELF JOIN -- kết nối một bảng với chính nó

CREATE TABLE nhacungcap(
nhacungcap_id int primary key,
nhacungcap_ten varchar(50)
);

insert into nhacungcap values(10000,'IBM');
insert into nhacungcap values(10001,'Hewlett Packard');
insert into nhacungcap values(10002,'Microsoft');
insert into nhacungcap values(10003,'NVIDIA');

select n1.nhacungcap_ten, n2.nhacungcap_ten as test_name
from nhacungcap n1
join nhacungcap n2 on n1.nhacungcap_id = n2.nhacungcap_id;








