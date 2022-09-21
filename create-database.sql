-- database create
CREATE DATABASE $(DBASE);
GO

USE $(DBASE);
GO

-- create login
CREATE LOGIN $(USER_NAME) WITH PASSWORD = '$(USER_PASS)';
GO
-- create user
CREATE USER $(USER_NAME) FOR LOGIN $(USER_NAME);
GO
-- add access for user to db
--EXEC sp_addrolemember 'db_datareader', $(USER_NAME)
--EXEC sp_addrolemember 'db_datawriter', $(USER_NAME)
ALTER SERVER ROLE sysadmin ADD MEMBER [$(USER_NAME)];
GO