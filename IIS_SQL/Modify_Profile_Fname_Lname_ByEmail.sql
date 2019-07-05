--ForceConnectionString=CCW_USER_BETA
-- **** is to remove credential information
DECLARE @email VARCHAR(50)
DECLARE @F_Name VARCHAR(50)
DECLARE @L_Name VARCHAR(50)
DECLARE @pr_id int
SET @email = '{Email}'
SET @F_Name = '{FName}'
SET @L_Name = '{LName}'


SET @pr_id = (SELECT **** FROM [****].[****].[****] WHERE **** = @email)

UPDATE [****].[****].[****] SET **** = @F_Name, L_Name = @L_Name WHERE **** = @email)