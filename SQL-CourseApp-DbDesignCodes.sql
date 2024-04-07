create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(100)
)

create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[CountryId] int foreign key references Countries(Id)
)

create table Students(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[Surname] nvarchar(100),
[Address] nvarchar(200),
[Age] int,
[Email] nvarchar(100),
[CityId] int foreign key references Cities(Id)
)

create table StudentGroups(
[Id] int primary key identity(1,1),
[StudentId] int foreign key references  Students(Id),
[GroupId] int foreign key references  Groups(Id)
)


create table Groups(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[Capacity] int,
[RoomId] int foreign key references  Rooms(Id),
[EducationId] int foreign key references  Educations(Id)
)

create table GroupTeachers(
[Id] int primary key identity(1,1),
[GroupId] int foreign key references  Groups(Id),
[TeacherId] int foreign key references  Teachers(Id)
)



create table Rooms(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[Capacity] int
)

create table Educations(
[Id] int primary key identity(1,1),
[Name] nvarchar(100)
)


create table Teachers(
[Id] int primary key identity(1,1),
[FullName] nvarchar(100),
[Salary] int,
[Address] nvarchar(200),
[Email] nvarchar(100)
)



create table StaffMembers(
[Id] int primary key identity(1,1),
[FullName] nvarchar(100),
[Salary] int,
[Age] int,
[CityId] int foreign key references Cities(Id)
)



create table RoleStaffMembers(
[Id] int primary key identity(1,1),
[StaffMemberId] int foreign key references StaffMembers(Id),
[RoleId] int foreign key references Roles(Id)
)

create table Roles(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[DepartmentId] int foreign key references Departments(Id)
)

create table Departments(
[Id] int primary key identity(1,1),
[Name] nvarchar(100)
)

select * from Cities
select * from Countries
select * from Departments
select * from Educations
select * from Groups
select * from GroupTeachers
select * from Roles
select * from RoleStaffMembers
select * from Rooms
select * from StaffMembers
select * from StudentGroups
select * from Students
select * from Teachers




create procedure createCountries
@Name nvarchar(100)
as
	insert into Countries([Name])
	values (@Name)

exec createCountries 'AZERBAYCAN' 
exec createCountries 'Turkiye' 
exec createCountries 'Rusiya'
exec createCountries 'Gurcustan'
exec createCountries 'Ukrayna'



create procedure createCities
@Name nvarchar(100),
@CountryId int
as
	insert into Cities([Name],[CountryId])
	values (@Name, @CountryId)

exec createCities 'Baki' , 1
exec createCities 'Sumqayit' , 1
exec createCities 'Gence' , 1
exec createCities 'Istanbul' , 2
exec createCities 'Moskva'  , 3
exec createCities 'Tiflis' , 4
exec createCities 'Kiyev' , 5




create procedure createStudents
@Name nvarchar(100),
@Surname nvarchar(100),
@Address nvarchar(200),
@Age int,
@Email nvarchar(100),
@CityId int
as
	insert into Students([Name],[Surname],[Address],[Age],[Email],[CityId])
	values (@Name, @Surname,@Address,@Age,@Email,@CityId)

exec createStudents 'Nurlan' , 'Umudov' ,  'Baki Hovsan' , 22, 'nurlan@gmail.com', 1
exec createStudents 'Sirac' , 'Mamedov' ,  'Masazir' , 22, 'sirac@gmail.com', 1
exec createStudents 'Kamran' , 'Mahmudov' ,  'Sumqayit' , 24, 'kamran@gmail.com', 2
exec createStudents 'Elmir' , 'Qafarzade' ,  'Sahil' , 21, 'elmir@gmail.com', 3
exec createStudents 'Ayxan' , 'Aghayev' ,  '20 Yanvar' , 24, 'ayxan@gmail.com', 3
exec createStudents 'Reshad' , 'Aghayev' ,  'Neftciler' , 21, 'reshad@gmail.com', 2
exec createStudents 'Deniz' , 'Can' ,  'Kadikoy' , 25, 'deniz@gmail.com', 4
exec createStudents 'Ivan' , 'Sasha' ,  'Krasnodar' , 19, 'ivan@gmail.com', 5
exec createStudents 'Georgi' , 'Kxvara' ,  'Borchali' , 32, 'georgi@gmail.com', 6
exec createStudents 'Dima' , 'Makson' ,  'Lvov' , 23, 'dima@gmail.com', 7




create procedure createGroups
@Name nvarchar(100),
@Capacity int,
@RoomId int,
@EducationId int
as
	insert into Groups([Name],[Capacity],[RoomId],[EducationId])
	values (@Name,@Capacity,@RoomId,@EducationId )


exec createGroups 'PB-101' , 18 , 1 , 1
exec createGroups 'F-100' , 12 , 2 , 2
exec createGroups 'D-88' , 28 , 3 , 3
exec createGroups 'M-200' , 14 , 4 , 4
exec createGroups 'SC-666' , 14 , 4 , 5



create procedure createRooms
@Name nvarchar(100),
@Capacity int
as
	insert into Rooms([Name],[Capacity])
	values (@Name,@Capacity )

	exec createRooms 'Sun' , 18
	exec createRooms 'Neptun' , 12
	exec createRooms 'Olimp' , 28
	exec createRooms 'Jupiter' , 14

	
create procedure createEducations
@Name nvarchar(100)
as
	insert into Educations([Name])
	values (@Name)

	exec createEducations 'Backend'
	exec createEducations 'Frontend'
	exec createEducations 'Design'
	exec createEducations 'Marketing'
	exec createEducations 'Cyber Security'


	
create procedure createTeachers
@FullName nvarchar(100),
@Salary int,
@Address nvarchar(200),
@Email nvarchar(100)
 
as
	insert into Teachers([FullName],[Salary],[Address],[Email])
	values (@FullName,@Salary,@Address,@Email)


	exec createTeachers 'Cavid Beshirov', 4000, 'Ehmedli' , 'cavid@gmail.com'
	exec createTeachers 'Ulvi Ekberov', 3000, 'Nizami' , 'ulvi@gmail.com'
	exec createTeachers 'Ulker Asgerova', 3000, 'Yasamal' , 'ulker@gmail.com'
	exec createTeachers 'Hesen Cavadov', 4000, 'Neftciler' , 'hesen@gmail.com'
	exec createTeachers 'Kamran Agayev', 4000, 'Sumqayit' , 'kamran@gmail.com'


	
create procedure createDepartments
@Name nvarchar(100)
as
	insert into Departments([Name])
	values (@Name)

	exec createDepartments 'Technical'
	exec createDepartments 'Human Resources'
	exec createDepartments 'Call Center'
	exec createDepartments 'Sales D'
	exec createDepartments 'Reception'
	exec createDepartments 'Production '
	exec createDepartments 'Accounting'

		
create procedure createRoles
@Name nvarchar(100),
@DepartmentId int
as
	insert into Roles([Name], [DepartmentId])
	values (@Name,@DepartmentId)


	exec createRoles 'IT SUPPORT D' , 1
	exec createRoles 'Engineering D' , 1
	exec createRoles 'Administrative D' , 1
	exec createRoles 'Finance D' , 2
	exec createRoles 'Legal D' , 2
	exec createRoles 'Customer Service D' , 2
	exec createRoles 'Customer Support D' , 3
	exec createRoles 'Client Relations D' , 3
	exec createRoles 'Marketing D' , 4
	exec createRoles 'Operations D' , 4
	exec createRoles 'Front Desk D' , 5
	exec createRoles 'Guest Services D' , 5
	exec createRoles 'Back Office D' , 5
	exec createRoles 'Logistic  D' , 6
	exec createRoles 'Data Entry D' , 7
	exec createRoles 'Administrative D' , 7



	
	
create procedure createStaffMembers
@FullName nvarchar(100),
@Age int,
@Salary int,
@CityId int
as
	insert into StaffMembers([FullName],[Age], [Salary],[CityId])
	values (@FullName,@Age,@Salary,@CityId)



	EXEC createStaffMembers 'Aqshin Quliyev', 24, 400 , 1
	EXEC createStaffMembers 'Sabir Orucov ', 27, 500 , 2
	EXEC createStaffMembers 'Hesen Hesnov', 24, 300 , 1
	EXEC createStaffMembers 'Cabir Imanov', 26, 400 , 2
	EXEC createStaffMembers 'Aleksey Yurovich', 24, 400 , 3
	EXEC createStaffMembers 'Kanan Quliyev', 34, 450 , 1
	EXEC createStaffMembers 'Xatire Islam', 44, 600 , 2
	EXEC createStaffMembers 'Abbas Quliyev', 29, 400 , 3
	EXEC createStaffMembers 'Senan Cabbarov', 24, 389 , 1
	EXEC createStaffMembers 'Yasemen Quliyeva', 28, 400 , 2
	EXEC createStaffMembers 'Nuray Semedova', 22, 400 , 3
	EXEC createStaffMembers 'Canan Eliyeva', 24, 400 , 3
	EXEC createStaffMembers 'Vefa Aliyeva', 25, 400 , 1
	EXEC createStaffMembers 'Ramil Sheydayev', 21, 400 , 2
	EXEC createStaffMembers 'Musa Qurbanli', 24, 400 , 1
	EXEC createStaffMembers 'Qara Qarayev ', 34, 400 , 2
	EXEC createStaffMembers 'Ayan Orucova', 34, 500 , 1
	

		
create procedure createRoleStaffMembers
@RoleId int,
@StaffMemberId int
as
	insert into RoleStaffMembers([RoleId], [StaffMemberId])
	values (@RoleId, @StaffMemberId)


	exec  createRoleStaffMembers 1,1
	exec  createRoleStaffMembers 2,2
	exec  createRoleStaffMembers 3,3
	exec  createRoleStaffMembers 4,4
	exec  createRoleStaffMembers 5,5
	exec  createRoleStaffMembers 6,6
	exec  createRoleStaffMembers 7,7
	exec  createRoleStaffMembers 8,8
	exec  createRoleStaffMembers 9,9
	exec  createRoleStaffMembers 10,10
	exec  createRoleStaffMembers 11,11
	exec  createRoleStaffMembers 12,12
	exec  createRoleStaffMembers 13,13
	exec  createRoleStaffMembers 14,14
	exec  createRoleStaffMembers 15,15
	exec  createRoleStaffMembers 16,16
	exec  createRoleStaffMembers 1,17


			
create procedure createStudentGroups
@StudentId int,
@GroupId int
as
	insert into StudentGroups([StudentId], [GroupId])
	values (@StudentId, @GroupId)


	exec createStudentGroups  1 ,1
	exec createStudentGroups  2 , 1
	exec createStudentGroups  3,2
	exec createStudentGroups  4,2
	exec createStudentGroups  5,3
	exec createStudentGroups  6,3
	exec createStudentGroups  7 ,4
	exec createStudentGroups  8,4
	exec createStudentGroups  9 ,5
	exec createStudentGroups  10,5


			
create procedure createGroupTeachers
@GroupId int,
@TeacherId int
as
	insert into GroupTeachers([GroupId],[TeacherId])
	values (@GroupId, @TeacherId)


	exec createGroupTeachers 1,1
	exec createGroupTeachers 2,2
	exec createGroupTeachers 3,3
	exec createGroupTeachers 4,4
	exec createGroupTeachers 5,5



	
select * from Cities
select * from Countries
select * from Departments
select * from Educations
select * from Groups
select * from GroupTeachers
select * from Roles
select * from RoleStaffMembers
select * from Rooms
select * from StaffMembers
select * from StudentGroups
select * from Students
select * from Teachers



 --CREATE VIEW CourseApp
	--	 as 
	--	select 
