create table dbo.businessentity_details 
(
ID int identity (1,1) primary key,
BusinessentityID int not null,
AccountNumber nvarchar (15)  not null,
[Address] nvarchar (250) not null,
Contact nvarchar (100) not null,
email nvarchar (250) not null,
comment nvarchar (MAX) null
)
insert into dbo.businessentity_details (BusinessentityID,AccountNumber,[Address],Contact,email,comment)
values(1,'210500222333','Partizanski Odredi 15','070555666','aaa@vitalia.com','Nema zabeleshka')
go
insert into dbo.businessentity_details (BusinessentityID,AccountNumber,[Address],Contact,email,comment)
values(2,'210500222334','XXXX 15','070779523','bbb@vitalia.com',NULL)
go
insert into dbo.businessentity_details (BusinessentityID,AccountNumber,[Address],Contact,email,comment)
values(3,'210500222335','XXXX 16','070779523','ccc@vitalia.com','TEST 1')
go
insert into dbo.businessentity_details (BusinessentityID,AccountNumber,[Address],Contact,email,comment)
values(4,'210500222335','XXXX 17','070779523','dddvitalia.com',NULL)
go
insert into dbo.businessentity_details (BusinessentityID,AccountNumber,[Address],Contact,email,comment)
values(5,'210500222336','XXXX 18','070779544','vvv@vitaliacom','Nema plateno faktura')
go
insert into dbo.businessentity_details (BusinessentityID,AccountNumber,[Address],Contact,email,comment)
values(6,'210500222337','XXXX 19','070779555','ddd@vitaliacom',NULL)
go
insert into dbo.businessentity_details (BusinessentityID,AccountNumber,[Address],Contact,email,comment)
values(7,'210500222338','XXXX 20','070779566','aa@vitalia.com','Nevaliden kontakt')
go



--update dbo.businessentity_details
--set BusinessentityID = 0 where ID in (7)

alter table dbo.businessentity_details with check
add constraint [FK_businessentity_details_BusinessEntity]
foreign key (BusinessEntityId)
references dbo.BusinessEntity(Id)

alter table dbo.businessentity_details with check
add constraint Contact check
(substring (Contact,1,2) = '07')

--update dbo.businessentity_details
--set email = 'ddd@vitalia.com'
--where ID = 4

--update dbo.businessentity_details
--set email = 'vvv@vitalia.com'
--where ID = 5

--update dbo.businessentity_details
--set email = 'ddd@vitalia.com'
--where ID = 6

alter table dbo.businessentity_details with check
add constraint email check (email like '%@%.%')

alter table dbo.businessentity_details with check
add constraint UNQ_businessentity_AcNo unique (AccountNumber)

--update dbo.businessentity_details
--set AccountNumber = '210500222332'
--where ID = 4

update dbo.businessentity_details
set comment = N'Nema zabaleshka za smetkaна сите колини од табелата dbo.businessentity_details'

select * from businessentity_details

select * from BusinessEntity

select * from OrderDetails

create function dbo.fn_ProductCount (@ProductId int)
returns int
as
begin
	declare @Result int

	select @Result = Quantity
	from dbo.OrderDetails
	where ProductId = @ProductId
	return @Result
end

select dbo.fn_ProductCount (3)

create function dbo.fn_ProductSum (@ProductId int)
returns decimal (18,2)
as
begin
	declare @Result decimal (18,2)

	select @Result = Quantity * Price
	from dbo.OrderDetails
	where ProductId = @ProductId
	return @Result
end

select dbo.fn_ProductSum (35)



--create view dbo.Comp_Reg_Prod_Details as
--	select (dbo.BusinessEntity.Name, 
--	dbo.BusinessEntity.Region, 
--	dbo.BusinessEntity.Zipcode, 
--	dbo.businessentity_details.AccountNumber, 
--	dbo.businessentity_details.Address)

--create view dbo.Comp_Reg_Prod_Details as
--(
--select [Name], Region, Zipcode from dbo.BusinessEntity
--inner join on
--select AccountNumber, [Address]  from dbo.businessentity_details
--)

--create view dbo.Comp_Reg_Prod_Details as
--(
--select [Name], Region, Zipcode from dbo.BusinessEntity

--select AccountNumber, [Address]  from dbo.businessentity_details
--)

--create view dbo.Comp_Reg_Prod_Details as
--(
--select [Name], Region, Zipcode from dbo.BusinessEntity,
-- AccountNumber, [Address]  from dbo.businessentity_details
--)