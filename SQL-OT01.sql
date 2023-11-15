CREATE DATABASE ONTAPJOIN;
USE ONTAPJOIN;

create table category(
id int primary key auto_increment,
name varchar(100) unique,
status tinyint default(1)
);

create table product(
id int primary key auto_increment,
category_id int,
foreign key (category_id) references category(id),
name varchar(200),
price float check(price > 0),
sale_price float ,
constraint check (price > sale_price)
);

create table customer(
id int primary key auto_increment,
name varchar(200),
email varchar(100),
birthday date,
gender tinyint
);

create table orders(
id int primary key auto_increment,
customer_id int,
foreign key (customer_id) references customer(id),
created date default(curdate()),
status tinyint
);

create table order_detail(
order_id int,
product_id int,
foreign key (order_id) references orders(id),
foreign key (product_id) references product(id),
quantity int,
price float
);

insert into `category`(`name`) values('danh muc 1');
insert into `category`(`name`) values('danh muc 2');
insert into `category`(`name`) values('danh muc 3');
insert into `category`(`name`) values('danh muc 4');
insert into `category`(`name`) values('danh muc 5');

insert into `product` (`category_id`,`name`,`price`,`sale_price`) values ('1','san pham 1','12000','10000');
insert into `product`(`category_id`,`name`,`price`,`sale_price`) values ('2','san pham 2','13000','10000');
insert into `product`(`category_id`,`name`,`price`,`sale_price`) values ('3','san pham 3','14000','10000');
insert into `product`(`category_id`,`name`,`price`,`sale_price`) values ('4','san pham 4','15000','10000');
insert into `product`(`category_id`,`name`,`price`,`sale_price`) values ('5','san pham 5','16000','10000');

insert into `customer`(`name`,`email`,`birthday`,`gender`) values('tran van a','tva@gmail.com','2023-11-11','1');
insert into `customer`(`name`,`email`,`birthday`,`gender`) values('tran van b','tvb@gmail.com','2023-11-11','0');
insert into `customer`(`name`,`email`,`birthday`,`gender`) values('tran van c','tvc@gmail.com','2023-11-11','1');
insert into `customer`(`name`,`email`,`birthday`,`gender`) values('tran van d','tvd@gmail.com','2023-11-11','0');
insert into `customer`(`name`,`email`,`birthday`,`gender`) values('tran van e','tve@gmail.com','2023-11-11','1');

insert into `orders`(`customer_id`,`status`) values('1','1');
insert into `orders`(`customer_id`,`status`) values('2','2');
insert into `orders`(`customer_id`,`status`) values('3','3');
insert into `orders`(`customer_id`,`status`) values('4','4');
insert into `orders`(`customer_id`,`status`) values('5','5');

insert into `order_detail`(`order_id`,`product_id`,`quantity`,`price`) values('1','1','100','12000');
insert into `order_detail`(`order_id`,`product_id`,`quantity`,`price`) values('2','2','200','13000');
insert into `order_detail`(`order_id`,`product_id`,`quantity`,`price`) values('3','3','300','14000');
insert into `order_detail`(`order_id`,`product_id`,`quantity`,`price`) values('4','4','400','15000');
insert into `order_detail`(`order_id`,`product_id`,`quantity`,`price`) values('5','5','500','16000');

SELECT a.id, b.name as user_name, c.name as product_name,
d.quantity,c.price, a.created,a.status,
c.price* d.quantity as total_price
FROM orders as a
LEFT JOIN customer as b
ON a.customer_id = b.id
LEFT JOIN order_detail as d
ON d.order_id = a.id
LEFT JOIN product as c
ON d.product_id = c.id;

SELECT b.order_id,b.quantity,b.price,c.name as product_name, c.price* b.quantity as total_price
FROM order_detail as b
LEFT JOIN product as c
ON b.product_id = c.id;
	













