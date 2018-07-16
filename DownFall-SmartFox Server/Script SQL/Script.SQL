-- Delete all database data if exists.

BEGIN
	DROP DATABASE DownFall_TheLostCityDB
END

-- Create a new database 

CREATE DATABASE DownFall_TheLostCityDB;

-- Use database


USE DownFall_TheLostCityDB;
GO


-- Create the users table

CREATE TABLE dbo.Downfall_users
	(ID_User int IDENTITY(1,1) primary key,
	Username nvarchar(200) null,
	Email nvarchar(200) null,
	Password nvarchar(200) null,
	mkoin int null,
	profile_img nvarchar(200) null,
	first_access bit null
	)
GO


CREATE TABLE dbo.Downfall_TypeClothes
	(Id_clothes int IDENTITY(1,1) primary key,
	type_clothes nvarchar(200) null,
	descr_clothes nvarchar(200) null
	)
GO


create Table dbo.DownFall_UserClothes
	(ID int IDENTITY(1,1) primary key,
	 id_user int not null,
	 list_clothes int null,
	 CONSTRAINT FK_id_user FOREIGN KEY (id_user) 
	 REFERENCES Downfall_users (ID_User)
	 )
GO


-- Added more table to associate avatars to users, need to create avatars into database
-- to return from the server to the client the list of all avatars of the game
-- then users can choose their avatars and then register the list of all users_avatars.


create Table dbo.Downfall_avatar_hairs
	(Id_hair int IDENTITY(1,1) primary key,
		id_type int null,
		description nvarchar(100) null,
	)
GO

-- Genereting random avatar on first access and assign it to user.

create Table dbo.Downfall_avatars
	(   ID_avatar int IDENTITY(1,1) primary key,
		id_type int null,
		colorskin nvarchar(50) null,
		hair_type int null,
		description nvarchar(50) null,
		sex_type nvarchar(50) null,
		CONSTRAINT FK_hair_type FOREIGN KEY(hair_type)
		REFERENCES Downfall_avatar_hairs(ID_hair)
	)
GO


-- Remember to insert in the table avatars type and avatars hair


create Table dbo.Downfall_users_avatars
	(Id int IDENTITY(1,1) primary key,
		id_user int not null,
		id_avatar int not null,
		CONSTRAINT FK_id_user_users FOREIGN KEY(id_user)
		REFERENCES Downfall_users(ID_User),
		CONSTRAINT FK_id_avatar FOREIGN KEY(id_avatar)
		REFERENCES Downfall_avatars(ID_avatar)
	)
GO