CREATE DATABASE thuchanh02;
USE thuchanh02;

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

-- Hiển thị danh sách tất cả các học viên
select * from Student;

-- Hiển thị danh sách các học viên đang theo học
select * from Student where status = true;

-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ
select * from Subject where Credit < 10;

-- Hiển thị danh sách học viên lớp A1
select * from Class where ClassName = 'A1';

select S.StudentId, S.StudentName, C.ClassName 
from Student S 
join Class C on S.id_class = C.ClassId
where C.ClassName = 'A1';

-- Hiển thị điểm môn CF của các học viên
select S.StudentId, S.StudentName, Sub.SubName, M.Mark
from Student S
join Mark M on M.id_student = S.StudentId
join Subject Sub on  Sub. SubId = M.id_sub
where Sub.SubName = 'CF';