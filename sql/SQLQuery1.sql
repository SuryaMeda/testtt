create procedure select_reg
as begin
select * from Registation
end



create procedure insert_reg(@name varchar(20),@dob date,@phone bigint,@country varchar(10),@state varchar(10),@district varchar(10),@city varchar(10),@email varchar(30),@pwd varchar(20),@Cpwd varchar(20),@gender varchar(10),@lang varchar(10),@addres varchar(100),@blood varchar(10),@photo varchar(100))
as begin
declare @id int,@bno varchar(10)
set @id=(select ISNULL(MAX(id),0)+1 from Registation)
set @bno='blood'+RIGHT('_',5)+CAST(@id as varchar(10))
insert into Registation values(@name,@dob,@phone,@country,@state,@district,@city,@email,@pwd,@Cpwd,@gender,@lang,@addres,@blood,@photo,@bno)
end

create procedure delete_reg(@bno varchar(10))
as begin
   delete from Registation where bno=@bno
end


alter procedure update_reg(@name varchar(20),@dob date,@phone varchar(50),@country varchar(10),@state varchar(50),@district varchar(50),@city varchar(50),@email varchar(30),@pwd varchar(20),@Cpwd varchar(20),@gender varchar(10),@lang varchar(50),@addres varchar(100),@blood varchar(50),@photo varchar(100),@bno varchar(10),@bloodGroup varchar(10))
as begin
update Registation set name=@name,dob=@dob,phone=@phone,country=@country,states=@state,district=@district,city=@city,email=@email,pwd=@pwd,Cpwd=@Cpwd,gender=@gender,lang=@lang,addres=@addres,blood=@blood,photo=@photo,bloodGroup=@bloodGroup where bno=@bno
end

alter procedure Search_data(@country varchar(10),@states varchar(50),@district varchar(50),@city varchar(50),@bloodGroup varchar(10))
as begin 
select Name,DOB,phone,country,states,district,city,email,pwd,Cpwd,gender,lang,addres,blood,photo,bno,bloodGroup from  Registation
 where bloodGroup=@bloodGroup and country=@country and states=@states and district=@district and city=@city
end



alter table Registation add  bno varchar(10)
delete from state where state_1='Andaman and Nicobar'
create table State(state_id varchar(10) primary key,state_Name varchar(20),country_id varchar(10) foreign key references Country(country_id))
alter table Registation add bloodGroup varchar(10)
alter table Registation alter column blood varchar(50)
truncate table Registation



drop table Report

create table Report(id int identity(1,1),Name varchar(50),phone varchar(50),Report varchar(50))

alter table Report alter column id int not null
alter table Report alter id  int identity(1,1)

truncate table report