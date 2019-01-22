ALTER TABLE [Downfall_avatar_hairs] DROP COLUMN Id_hair
ALTER TABLE [Downfall_avatar_hairs] ADD Id_hair INT IDENTITY(1,1)

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


INSERT INTO Downfall_users ([Username], [Email], [Password], [mkoin], [profile_img], [first_access]) VALUES ('PippoBUG', 'skills_07@live.it', '123456', 0, 'abcd', 1);
INSERT INTO Downfall_users ([Username], [Email], [Password], [mkoin], [profile_img], [first_access]) VALUES ('BlackMamba97', 'blackmamba@gmail.com', '123456', 0, 'abcd', 1);
INSERT INTO Downfall_users ([Username], [Email], [Password], [mkoin], [profile_img], [first_access]) VALUES ('Japif', 'japif@live.it', '123456', 0, 'abcd', 1);
INSERT INTO Downfall_users ([Username], [Email], [Password], [mkoin], [profile_img], [first_access]) VALUES ('ReadBeard', 'redbeard@live.it', '123456', 0, 'abcd', 1);
INSERT INTO Downfall_users ([Username], [Email], [Password], [mkoin], [profile_img], [first_access]) VALUES ('Rhagee', 'raghee@live.it', '123456', 0, 'abcd', 1);



INSERT INTO Downfall_avatars([id_type], [color_skin], [hair_type], [description], [sex_type]) VALUES (1, 'White Caucasic', 1, 'Standard White Caucasic Man', 'Male');
INSERT INTO Downfall_avatars([id_type], [color_skin], [hair_type], [description], [sex_type]) VALUES (2, 'Black Skin', 2, 'Standard Black Man', 'Male');
INSERT INTO Downfall_avatars([id_type], [color_skin], [hair_type], [description], [sex_type]) VALUES (3, 'Yellow Asian Skin', 3, 'Standard Asiatic Man', 'Male');
INSERT INTO Downfall_avatars([id_type], [color_skin], [hair_type], [description], [sex_type]) VALUES (4, 'White Caucasic', 4, 'Standard White Caucasic Woman', 'Female');
INSERT INTO Downfall_avatars([id_type], [color_skin], [hair_type], [description], [sex_type]) VALUES (5, 'White Caucasic', 5, 'Standard White Caucasic Woman', 'Female');


INSERT INTO Downfall_TypeClothes([type_clothes], [descr_clothes]) values ('Yellow Skirt', 'Standard Yellow Skirt');
INSERT INTO Downfall_TypeClothes([type_clothes], [descr_clothes]) values ('Red Skirt', 'Standard Red Skirt');
INSERT INTO Downfall_TypeClothes([type_clothes], [descr_clothes]) values ('Black Skirt', 'Standard Black Skirt');
INSERT INTO Downfall_TypeClothes([type_clothes], [descr_clothes]) values ('Green Skirt', 'Standard Green Skirt');
INSERT INTO Downfall_TypeClothes([type_clothes], [descr_clothes]) values ('Blue Skirt', 'Standard Blue Skirt');
INSERT INTO Downfall_TypeClothes([type_clothes], [descr_clothes]) values ('White Skirt', 'Standard White Skirt');
INSERT INTO Downfall_TypeClothes([type_clothes], [descr_clothes]) values ('Orange Skirt', 'Standard Orange Skirt');







