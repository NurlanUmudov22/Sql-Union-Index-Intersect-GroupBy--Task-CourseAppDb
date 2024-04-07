create table Users(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Email] nvarchar(100)
)

create table Doctors(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Email] nvarchar(100)
)



create procedure usp_createDoctors
@name nvarchar(100),
@email nvarchar(100)
as
begin
	insert into Doctors([Name],[Email])
	values(@name,@email)
end

exec usp_createDoctors 'Hacker' , 'hacke@gmail.com'
exec usp_createDoctors 'Sirac' , 'sirac@gmail.com'
exec usp_createDoctors 'Fexriyye' , 'fexriyye@gmail.com'
exec usp_createDoctors 'Nesir' , 'nesir@gmail.com'
exec usp_createDoctors 'Fatime' , 'fatime@gmail.com'
exec usp_createDoctors 'test1' , 'test1@gmail.com'
exec usp_createDoctors 'test2' , 'testg2@gmail.com'


select * from Doctors


create procedure usp_createUsers
@name nvarchar(100),
@email nvarchar(100)
as
begin
	insert into Users([Name],[Email])
	values(@name,@email)
end


exec usp_createUsers 'Hacker' , 'hacke@gmail.com'
exec usp_createUsers 'Sirac' , 'sirac@gmail.com'
exec usp_createUsers 'Fexriyye' , 'fexriyye@gmail.com'
exec usp_createUsers 'Nesir' , 'nesir@gmail.com'
exec usp_createUsers 'Fatime' , 'fatime@gmail.com'
exec usp_createUsers 'test5' , 'test5@gmail.com'

select * from Users


select * from Users
union
select * from Doctors



select * from Users
union all
select * from Doctors



select [Name] from Users
union all
select [Name] from Students



select [Name] from Users
union all
select [Name] from Students
union all
select [Name] from Doctors


select * from Users
intersect
select * from Doctors



select * from Users
except
select * from Doctors

select * from Students


select count(*) as 'Student count by age', Age 
from Students
group by Age;


declare @num1  int = 50;
declare @num2 int = 30;

if @num1 > @num2
 print 'Yes'

else 
 print 'No'


 
create table Teachers(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Email] nvarchar(100),
[Age] int
)



create procedure usp_createTeachers
@name nvarchar(100),
@email nvarchar(100),
@age int
as
begin
	insert into Teachers([Name],[Email],[Age])
	values(@name,@email,@age)
end

exec usp_createTeachers 'Hacker' , 'hacke@gmail.com', 22
exec usp_createTeachers 'Elmir' , 'elmir@gmail.com', 27
exec usp_createTeachers 'Elnur' , 'elnur@gmail.com', 23
exec usp_createTeachers 'Samir' , 'samir@gmail.com', 24




 select * from Teachers 
 select * from Students


 create function dbo.getStudentsAvgAge()
 returns int
 as
 begin
   return (select avg(Age) from Students)
 end


 
 create function dbo.getTeachersAvgAge()
 returns int
 as
 begin
   return (select avg(Age) from Teachers)
 end



 create procedure usp_checktudentsAndTeachersAvgAges
 @studentAvgAge int,
 @teacherAvgAge int 
 as
 begin
   if @studentAvgAge > @teacherAvgAge
     print 'Student average age is bigger than teachers average ages'
   else 
     print  'Student average age is not bigger than teachers average ages'
 end


 declare @StuAveAge int = (select  dbo.getStudentsAvgAge())
 declare @TeachAveAge int = (select  dbo.getTeachersAvgAge())

 exec usp_checktudentsAndTeachersAvgAges @StuAveAge, @TeachAveAge



declare @Counter int 
set @Counter=1
while ( @Counter <= 10)
begin
  print 'The counter value is = ' + CONVERT(nvarchar,@Counter)
    set @Counter  = @Counter  + 1
end




BEGIN TRY
  SELECT
    1 / 0 AS Error;
END TRY
BEGIN CATCH
  SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH;