ALTER TABLE [Downfall_avatars_hairs] DROP COLUMN Id_hair
ALTER TABLE [Downfall_avatars_hairs] ADD Id_hair INT IDENTITY(1,1)

ALTER TABLE [Downfall_avatars] DROP COLUMN ID_avatar
ALTER TABLE [Downfall_avatars] ADD ID_avatar INT IDENTITY(1,1)

ALTER TABLE [Downfall_TypeClothes] DROP COLUMN Id_clothes
ALTER TABLE [Downfall_TypeClothes] ADD Id_clothes INT IDENTITY(1,1)

ALTER TABLE [Downfall_UserClothes] DROP COLUMN ID
ALTER TABLE [Downfall_UserClothes] ADD ID INT IDENTITY(1,1)

ALTER TABLE [Downfall_users] DROP COLUMN ID_User
ALTER TABLE [Downfall_users] ADD ID_User INT IDENTITY(1,1)

ALTER TABLE [Downfall_users_avatars] DROP COLUMN Id
ALTER TABLE [Downfall_users_avatars] ADD Id INT IDENTITY(1,1)


INSERT INTO Downfall_users ([Username], [Email], [Password], [mkoin], [profile_img], [first_access]) VALUES ('PippoBUG', 'skills_07@live.it', '123456', 0, 'abcd', true);
INSERT INTO Downfall_users ([Username], [Email], [Password], [mkoin], [profile_img], [first_access]) VALUES ('BlackMamba97', 'blackmamba@gmail.com', '123456', 0, 'abcd', true);
INSERT INTO Downfall_users ([Username], [Email], [Password], [mkoin], [profile_img], [first_access]) VALUES ('Japif', 'japif@live.it', '123456', 0, 'abcd', true);
INSERT INTO Downfall_users ([Username], [Email], [Password], [mkoin], [profile_img], [first_access]) VALUES ('ReadBeard', 'redbeard@live.it', '123456', 0, 'abcd', true);


