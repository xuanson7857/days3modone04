CREATE DATABASE SS3_BT02;
USE SS3_BT02;

CREATE TABLE Custome(
cID int auto_increment primary key,
cName varchar(50),
cAge int
);

CREATE table Ordere(
oID int auto_increment primary key,
cID int ,
foreign key (cID) references Custome(cID),
oDate date,
oTotalprice float
);

CREATE TABLE Product(
pID int  auto_increment primary key,
pName varchar(50),
pPrice float
);

CREATE TABLE OrderDetail(
oID int auto_increment primary key,
foreign key (oID) references Ordere(oID),
pID int, 
foreign key (pId) references Product(pId),
odQTY int
);

insert into Custome(cID,cName,cAge) values(1,'minh quan',10);
insert into Custome(cID,cName,cAge) values(2,'ngoc oanh',20);
insert into Custome(cID,cName,cAge) values(3,'hong ha',50);

insert into Ordere(oID,cID,oDate,oTotalprice) values(1,1,'2023-11-11',12000);
insert into Ordere(oID,cID,oDate,oTotalprice) values(2,2,'2023-8-10',13000);
insert into Ordere(oID,cID,oDate,oTotalprice) values(3,1,'2023-6-9',14000);

insert into Product(pID,pName,pPrice) values(1,'may giat',3);
insert into Product(pID,pName,pPrice) values(2,'tu lanh',5);
insert into Product(pID,pName,pPrice) values(3,'dieu hoa',7);
insert into Product(pID,pName,pPrice) values(4,'quat',1);
insert into Product(pID,pName,pPrice) values(5,'bep dien',2);

insert into OrderDetail(oID,pID,odQTY) values(1,1,3);
insert into OrderDetail(oID,pID,odQTY) values(2,1,1);
insert into OrderDetail(oID,pID,odQTY) values(3,1,8);

-- Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oID, oDate, oTotalprice from Ordere;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.cID,c.cName,o.oID,o.oDate,o.oTotalprice,odr.oID, odr.pID
from Custome c
join Ordere o
on c.cID = o.cID
join OrderDetail odr
on  o.oID = odr.oID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.cID, c.cName,o.oDate
from Custome c
left join  Ordere o
on c.cID = o.cID 
where o.oDate is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng
-- giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.oID, o.oDate, sum(odQTY*pPrice)
FROM  Ordere o
join OrderDetail od on o.oID = od.oID
join Product p on  od.oID = p.pID
group by od.oID, o.oDate;

