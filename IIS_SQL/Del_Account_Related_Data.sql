--ForceConnectionString=CCW_USER_BETA
-- **** is to remove credential information
DECLARE @email VARCHAR(50)
DECLARE @ac_id int
SET @email = '{Email}'






SET @ac_id = (select AccountID from [****].[****].[Account] as ACN WHERE ACN.**** = @email)


DELETE FROM [****].[****].[****]
WHERE **** = @email


DELETE FROM [****].[****].[****]
WHERE **** = @email

DELETE FROM [****].[****].[****]
WHERE **** = @email

DELETE FROM [****].[****].[****]
WHERE **** = @email

DELETE FROM [****].[****].[****]
  where **** IN (SELECT PurchaseIndex FROM [****].[****].[****] WHERE **** = @ac_id);

DELETE FROM [****].[****].[****]
WHERE **** = @ac_id