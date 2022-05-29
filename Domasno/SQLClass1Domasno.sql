--create database SEDCACADEMYDB
use SEDCACADEMYDB
go

create table Students
(
Id int identity (1,1) not null,
FirstName nvarchar (100) not null,
LastName nvarchar (100)not null,
DateOfBirth date null,
Gender char (1) null,
NationalIdNumber nvarchar (100) not null,
StudentIdNumber nvarchar (100) not null,
constraint [PK_Student] primary key clustered 
(
	[Id] asc
))

create table Teachers
(
Id int identity (1,1) not null,
FirstName nvarchar (100) not null,
LastName nvarchar (100)not null,
DateOfBirth date null,
AcademicRank nvarchar (100) null,
HireDate date not null,
constraint [PK_Teachers] primary key clustered 
(
	[Id] asc
))

create table Grade
(
Id int identity (1,1) not null,
StudentId nvarchar (100) not null,
CourseId nvarchar (100) not null,
TeacherId nvarchar (100) not null,
Grade nvarchar (10) not null,
Comment nvarchar (2000) null,
CreatedDate date not null,
constraint [PK_Grade] primary key clustered 
(
	[Id] asc
))

create table Course
(
Id int identity (1,1) not null,
[Name] nvarchar (100) not null,
Credit int not null,
AcademicYear int not null,
Semester int not null,
constraint [PK_Course] primary key clustered 
(
	[Id] asc
))

create table GradeDetail
(
Id int identity (1,1) not null,
GradeId nvarchar not null,
AchievementTypeId nvarchar not null,
AchievementPoints int not null,
AchievementMaxPoints int not null,
AchievementDate date null,
constraint [PK_GradeDetail] primary key clustered 
(
	[Id] asc
))

create table AchievementType
(
Id int identity (1,1) not null,
[Name] nvarchar (100) not null,
[Description] nvarchar (2000) null,
ParticipationRate int null
constraint [PK_AchievementType] primary key clustered 
(
	[Id] asc
))

select *
from Students
select *
from Teachers
select *
from Grade
select *
from Course
select *
from GradeDetail
select *
from AchievementType