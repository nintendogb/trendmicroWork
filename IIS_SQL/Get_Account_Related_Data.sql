--ForceConnectionString=CCW_USER_BETA
-- **** is to remove credential information
DECLARE @email VARCHAR(50)
DECLARE @ac_id int
SET @email = '{Email}'



SET @ac_id = (select AccountID from [****].[****].[****] as ACN WHERE ACN.**** = @email)

SELECT * FROM [****].[****].[****]
WHERE **** = @email


SELECT * FROM [****].[****].[****]
WHERE **** = @email

SELECT * FROM [****].[****].[****]
WHERE **** = @email

SELECT * FROM [****].[****].[****]
WHERE **** = @email

SELECT * FROM [****].[****].[****]
WHERE **** IN (SELECT PurchaseIndex FROM [****].[****].[****] WHERE **** = @ac_id);

SELECT * FROM [****].[****].[****]
WHERE **** = @ac_id