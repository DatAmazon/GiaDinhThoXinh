create database giadinhthoxinh
go
create table tblPromote(
	PK_iPromoteID int identity(1,1) primary key,
	sPromoteName nvarchar(100),
	sPromoteRate float,
	dtStartDay datetime,
	dtEndDay datetime
)
go
create table tblCategory(
	PK_iCategoryID int identity(1,1) primary key,
	sCategoryName nvarchar(40)
)
go
create table tblProduct(
	PK_iProductID int identity(1,1) primary key,
	FK_iCategoryID int,
	FK_iPromoteID int,
	sProductName nvarchar(50),
	iPrice int,
	sDescribe nvarchar(1000),
	sColor nvarchar(20),
	sSize nvarchar(15),
	constraint fk_product_category foreign key (FK_iCategoryID) references tblCategory(PK_iCategoryID),
	constraint fk_product_promote foreign key (FK_iPromoteID) references tblPromote(PK_iPromoteID)
)
go
create table tblImage(
	PK_iImageID int identity(1,1) primary key,
	FK_iProductID int,
	sImage nvarchar(80),
	iState int
	constraint fk_img_product foreign key(FK_iProductID) references tblProduct (PK_iProductID)
)
go
create table tblSupplier(
	PK_iSupplierID int identity(1,1) primary key,
	sSupplierName nvarchar(50),
	sPhone varchar(12),
	sEmail varchar(50),
	sAddress nvarchar(250)	
)
go
create table tblReview(
	PK_iReviewID int identity(1,1) primary key,
	FK_iProductID int,
	FK_iAccountID int,
	iStarRating int,
	sImage nvarchar(80),
	dtReviewTime datetime,
	constraint fk_review_product foreign key(FK_iProductID) references tblProduct (PK_iProductID),
	constraint fk_review_account foreign key(FK_iAccountID) references tblUser(PK_iAccountID)
)
go
create table tblPermission(
	PK_iPermissionID int identity(1,1) primary key,
	sPermissionName nvarchar(50),
	iState int	
)
drop table tblPermission
go
create table tblUser(
	PK_iAccountID int identity(1,1) primary key,
	FK_iPermissionID int,
	sEmail varchar(50),
	sPass nvarchar(50),
	sUserName nvarchar(50),
	sPhone varchar(12),
	sAddress nvarchar(200),
	iState int,
	constraint fk_user_permission foreign key(FK_iPermissionID) references tblPermission (PK_iPermissionID)
)
go
create table tblImportOrder(
	PK_iImportOrderID int identity(1,1) primary key,
	FK_iAccountID int,
	FK_iSupplierID int,
	dtDateAdded datetime,
	sDeliver nvarchar(50),
	sReceiver nvarchar(50),
	constraint fk_importOrder_account foreign key(FK_iAccountID) references tblUser(PK_iAccountID),
	constraint fk_importOrder_supplier foreign key(FK_iSupplierID) references tblSupplier(PK_iSupplierID)
)
go
create table tblOrder(
	PK_iOrderID int identity(1,1) primary key,
	FK_iAccountID int,
	sCustomerName nvarchar(50),
	sCustomerPhone varchar(12),
	sDeliveryAddress nvarchar(150),
	dInvoidDate datetime,
	sBiller nvarchar(50),
	iState int,
	constraint fk_order_account foreign key(FK_iAccountID) references tblUser(PK_iAccountID)
)
go

create table tblCheckinDetail(
	PK_iCheckinDetailID int identity(1,1) primary key,
	FK_iImportOrderID int,
	FK_iProductID int,
	iQuatity int,
	iPrice int,
	iTotalMoney int,
	constraint fk_checkinDetail_importOrder foreign key(FK_iImportOrderID) references tblImportOrder(PK_iImportOrderID),
	constraint fk_checkinDetail_product foreign key(FK_iProductID) references tblProduct(PK_iProductID)	
)
go
create table tblCheckoutDetail(
	PK_iCheckoutDetailID int identity(1,1) primary key,
	FK_iOrderID int,
	FK_iProductID int,
	iQuantity int,
	iTotalMoney int,
	constraint fk_checkoutDetail_order foreign key(FK_iOrderID) references tblOrder(PK_iOrderID),
	constraint fk_checkoutDetail_product foreign key(FK_iProductID) references tblProduct(PK_iProductID)
)
go
-------------------------------------------Query--------------------------------------
-----1.Category
--insert
go
create proc proAddCategory
@sCategoryName nvarchar(40)
as
begin
	insert into tblCategory values(@sCategoryName)
end

--update
go
create proc proUpdateCategory
@sCategoryID int,
@sCategoryName nvarchar(40)
as
begin
	Update tblCategory 
	set sCategoryName = @sCategoryName
	where PK_iCategoryID = @sCategoryID
end

--delete
go
create proc proDeleteCategory
@sCategoryID int
as
begin
	delete from tblCategory 
	where PK_iCategoryID = @sCategoryID
end

-----2. Image
go
create proc proAddImage
@FK_iImageID int,
@url nvarchar(80),
@state int
as
begin
	insert into tblImage values(@FK_iImageID, @url, @state)
end

go
create proc pro_getProduct 
as
begin
	select * from tblProduct
end

go
create proc pro_Image--select image for ID
@PK_iImageID int
as
begin
	select * from tblImage
	where PK_iImageID = @PK_iImageID
end

go
create proc proUpdateImage
@PK_iImageID int,
@FK_iProductID int,
@urlImage nvarchar(80),
@state int
as
begin
	update tblImage
	set 
	FK_iProductID = @FK_iProductID,
	sImage = @urlImage,
	iState = @state
	where PK_iImageID = @PK_iImageID
end

go
create proc proDeleteImage
@PK_iImageID int
as
begin
	delete from tblImage 
	where PK_iImageID = @PK_iImageID
end

--3. Permission
--insert
go
create proc proAddPermission
@sPermissionName nvarchar(50),
@iState int
as
begin
	insert into tblPermission values(@sPermissionName, @iState)
end

--update
go
create proc proUpdatePermission
@PK_iPermissionID int,
@sPermissionName nvarchar(50),
@iState int
as
begin
	Update tblPermission 
	set sPermissionName = @sPermissionName,
	iState = @iState
	where PK_iPermissionID = @PK_iPermissionID
end

--delete
go
create proc proDeletePermission
@PK_iPermissionID int
as
begin
	delete from tblPermission 
	where @PK_iPermissionID = PK_iPermissionID
end

--4. Supplier
--insert
go
create proc proAddSupplier
@sSupplierName nvarchar(50),
@sPhone varchar(12),
@sEmail varchar(50),
@sAddress nvarchar(250)
as
begin
	insert into tblSupplier values(@sSupplierName, @sPhone, @sEmail, @sAddress)
end

--update
go
create proc proUpdateSupplier
@PK_iSupplierID int,
@sSupplierName nvarchar(50),
@sPhone varchar(12),
@sEmail varchar(50),
@sAddress nvarchar(250)
as
begin
	Update tblSupplier 
	set sSupplierName = @sSupplierName,
	sPhone = @sPhone,
	sEmail = @sEmail,
	sAddress = @sAddress
	where PK_iSupplierID = @PK_iSupplierID
end

--delete
go
create proc proDeleteSupplier
@PK_iSupplierID int
as
begin
	delete from tblSupplier 
	where PK_iSupplierID = @PK_iSupplierID
end

--5.User
--insert
go
create proc proAddUser
@FK_iPermissionID int,
@sEmail varchar(50),
@sPass nvarchar(50),
@sUserName nvarchar(50),
@sPhone varchar(12),
@sAddress nvarchar(200),
@iState int
as
begin
	insert into tblUser values(@FK_iPermissionID, @sEmail, @sPass, @sUserName, @sPhone, @sAddress, @iState)
end

--update
go
create proc proUpdateUser
@PK_iAccountID int,
@FK_iPermissionID int,
@sEmail varchar(50),
@sPass nvarchar(50),
@sUserName nvarchar(50),
@sPhone varchar(12),
@sAddress nvarchar(200),
@iState int
as
begin
	Update tblUser 
	set FK_iPermissionID = @FK_iPermissionID,
	sEmail = @sEmail,
	sPass = @sPass,
	sUserName = @sUserName,
	sPhone = @sPhone,
	sAddress = @sAddress,
	iState = @iState
	where PK_iAccountID = @PK_iAccountID
end

--delete
go
create proc proDeleteUser
@PK_iAccountID int
as
begin
	delete from tblUser 
	where PK_iAccountID = @PK_iAccountID
end
--6. CheckoutDetail
select * from tblCheckoutDetail

