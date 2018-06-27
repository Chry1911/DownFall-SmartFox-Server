USE DownFall_TheLostCityDB;
GO

CREATE LOGIN UserRoot
with Password = N'123root',
CHECK_POLICY = OFF,
CHECK_EXPIRATION = OFF;
GO
EXEC sp_addsrvrolemember 
    @loginame = N'UserRoot', 
    @rolename = N'sysadmin';