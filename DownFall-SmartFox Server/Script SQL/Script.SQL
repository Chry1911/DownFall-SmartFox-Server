create DownFall_TheLostCityDB;

use DownFall_TheLostCityDB;
GO

-- Delete all database data if exists.

BEGIN
	DROP DATABASE DownFall_TheLostCityDB
END

-- Create a new database 

CREATE DATABASE DownFall_TheLostCityDB;

-- Create the users table

CREATE TABLE dbo.Downfall_users
	(ID_User int primary key not null,
	Username nvarchar(200) null,
	Email nvarchar(200) null,
	mkoin int null,
	profile_img nvarchar(200) null
	)
GO