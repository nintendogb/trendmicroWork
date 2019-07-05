--ForceConnectionString=CCW_USER_BETA
-- **** is to remove credential information
DECLARE @email VARCHAR(50)
SET @email = '{Email}'
DECLARE @valid int
DECLARE @value int

SET @valid = (SELECT **** from [****].[****].[****] WHERE **** = @email)
SET @value = (CASE WHEN @valid=0 then 1 ELSE 0 END)

update [****].[****].[****] set IsValid = @value WHERE **** = @email

