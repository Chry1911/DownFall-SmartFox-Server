
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
	(ID_User int primary key not null,
	Username nvarchar(200) null,
	Email nvarchar(200) null,
	Password nvarchar(200) null,
	mkoin int null,
	profile_img nvarchar(200) null
	)
GO


CREATE TABLE dbo.Downfall_TypeClothes
	(Id_clothes int primary key not null,
	type_clothes nvarchar(200) null,
	descr_clothes nvarchar(200) null
	)
GO


create Table dbo.DownFall_UserClothes
	(id_user int primary key not null,
	 list_clothes int null,
	 CONSTRAINT FK_id_user FOREIGN KEY (id_user) 
	 REFERENCES Downfall_users (ID_User)
	 )
GO