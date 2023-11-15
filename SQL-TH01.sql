CREATE DATABASE thuchanh01;
USE thuchanh01;

CREATE TABLE test(
id int primary key not null auto_increment,
name varchar(255) not null,
age int,
address varchar(255),
country varchar(255)
);

-- thêm _ hiện _ sửa _ xoá
insert into test (id,name,age,address,country) values (1,'tuan',26,'ha noi','viet nam');
insert into test (id,name,age,address,country) values (2,'bang',26,'c','japan');
insert into test (id,name,age,address,country) values (3,'tam',26,'da nang','china');
SELECT * from test;
update test SET name = 'aaa' where id=2;
delete from test where id=2;


-- thêm cột
alter table test add column add_new text;
-- thêm mới ràng buộc
alter table test add check(add_new>100);
-- xoá cột
alter table test drop column add_new;
-- sửa kiểu dữ liệu
alter table test modify add_new varchar(100);


-- Toán tử AND được sử dụng để quy định trả về đúng nếu 2 điều kiện ở hai vế đều trả vềgiá trị TRUE
select * from test where address='hb' AND country='japan';

-- Toán tử OR được sử dụng để quy định trả về đúng nếu 1 trong 2 điều kiện ở hai vế trả vềgiá trị TRUE
select * from test where address='da nang' OR country='japan';

-- Toán tử NOT được sử dụng để quy định trả về đúng nếu giá trị ở vế sau là FALSE
select * from test where NOT country='viet nam';


-- Câu lệnh WHERE --
CREATE TABLE CUSTOMERS(
ID int primary key,
NAME varchar(50),
AGE varchar(50),
ADDRESS varchar(50),
SALARY float
);

insert into CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) values (1,'tuan',26,'ha noi',12000000);
insert into CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) values (2,'tu',26,'ho chi minh',13000000);
insert into CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) values (3,'tam',26,'da nang',14000000);

select ID,NAME,SALARY from CUSTOMERS where SALARY>=13000000;
select ID,NAME,SALARY from CUSTOMERS where SALARY>=2000;

-- Mệnh đề ORDER BY
-- Mệnh đề ORDER BY trong SQL được sử dụng để sắp xếp dữ liệu theo thứ tự tăng dần hoặc giảm dần, dựa trên một hoặc nhiều cột. 
-- ASC được sử dụng để sắp xếp tăng dần và DESC được sử dụng để sắp xếp giảm dần.
select* from CUSTOMERS Order By SALARY DESC;

-- Mệnh đề Group By
-- Mệnh đề GROUP BY trong SQL được sử dụng hợp tác với câu lệnh SELECT để sắp xếp dữ liệu giống nhau thành các nhóm.
-- Mệnh đề GROUP BY này tuân theo mệnh đề WHERE trong câu lệnh SELECT và đứng trước mệnh đề ORDER BY.
select NAME,SUM(SALARY) from CUSTOMERS Group By NAME;

select COUNT(*) from CUSTOMERS;

select c.*, COUNT(*) as total_product 
from category as c
Join product as p
ON c.id = p.category_id
group by c.id;




-- Câu lệnh JOIN
create table khach_hang (
MaKh int primary key,
TenKh varchar(30),
DicCHiKh varchar(30),
TuoiKh int
);

create table order_kh  (
Order_ID int primary key,
Soluong double,
id_khach_hang int,
foreign key (id_khach_hang) references khach_hang(MaKh)
);

insert into khach_hang (MaKh,TenKh,DicCHiKh,TuoiKh) values (1,'nam','ha noi',25);
insert into khach_hang (MaKh,TenKh,DicCHiKh,TuoiKh) values (2,'tuan','hcm',24);
insert into khach_hang (MaKh,TenKh,DicCHiKh,TuoiKh) values (3,'quang','da nang',23);

insert into order_kh (Order_ID,Soluong,id_khach_hang) values (1,100,1);
insert into order_kh (Order_ID,Soluong,id_khach_hang) values (2,200,2);
insert into order_kh (Order_ID,Soluong,id_khach_hang) values (3,300,3);


Select *  
from khach_hang
inner join order_kh
on khach_hang.MaKh = order_kh.id_khach_hang ;


-- MD4-SS3-TH01   Thêm dữ liệu vào trong cơ sở dữ liệu quản lý sinh viên
CREATE TABLE Class(
 ClassId int primary key auto_increment,
 ClassName varchar(50),
 StartDate date,
 Status bit(1)
);

CREATE TABLE Student(
StudentId int primary key auto_increment,
StudentName varchar(50),
Address varchar(50),
Phone varchar(50),
Status bit(1),
id_class int,
foreign key(id_class) references Class(ClassId)
);

CREATE TABLE Subject(
SubId int primary key auto_increment,
SubName varchar(50),
Credit double,
Status bit(1)
);

CREATE TABLE Mark(
MarkID int primary key auto_increment,
Mark double,
ExamTimes int,
id_sub int,
id_student int,
foreign key(id_sub) references Subject(SubId),
foreign key(id_student) references Student(StudentId)
);

insert into Class(ClassId,ClassName,StartDate,Status) values (1,'A1','2023-11-11',1);
insert into Class(ClassId,ClassName,StartDate,Status) values (2,'A2','2023-11-11',1);
insert into Class(ClassId,ClassName,StartDate,Status) values (3,'A3','2023-11-11',0);

insert into Student(StudentId,StudentName,Address,Phone,Status,id_class) values (1,'hung','ha noi',0232232323,1,1);
insert into Student(StudentId,StudentName,Address,Phone,Status,id_class) values (2,'tam','hcm',0232232323,1,1);
insert into Student(StudentId,StudentName,Address,Phone,Status,id_class) values (3,'manh','da nang',0232232323,0,2);

insert into Subject(SubId,SubName,Credit,Status) values (1,'CF',5,1);
insert into Subject(SubId,SubName,Credit,Status) values (2,'C',6,1);
insert into Subject(SubId,SubName,Credit,Status) values (3,'EWEWW',5,1);
insert into Subject(SubId,SubName,Credit,Status) values (4,'QYQYQ',10,1);

insert into Mark(MarkID,id_sub,id_student,Mark,ExamTimes) values (1,1,1,8,1);
insert into Mark(MarkID,id_sub,id_student,Mark,ExamTimes) values (2,1,2,10,2);
insert into Mark(MarkID,id_sub,id_student,Mark,ExamTimes) values (3,2,1,12,1);