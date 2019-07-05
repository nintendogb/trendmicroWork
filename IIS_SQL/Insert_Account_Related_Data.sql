--ForceConnectionString=CCW_USER_BETA
-- **** is to remove credential information
DECLARE @email VARCHAR(50)
DECLARE @serial VARCHAR(50)
DECLARE @guid VARCHAR(50)
DECLARE @pid VARCHAR(50)
DECLARE @F_Name VARCHAR(50)
DECLARE @L_Name VARCHAR(50)
DECLARE @userid int
DECLARE @prfid int
DECLARE @ac_id int
DECLARE @ca_id int
DECLARE @ph_id int
DECLARE @product_id int
SET @email = '{Email}'
SET @serial = '{SN}'

SET @pid = '{PID}'
SET @F_Name = 'F_WD'
SET @L_Name = 'L_WD'
SET @product_id = '{ProductID}'
SET @guid = '{GUID}'


DECLARE @CreateUTCDate VARCHAR(50)
SET @CreateUTCDate = GETUTCDATE()

DECLARE @expire_date VARCHAR(50)
SET @expire_date = GETUTCDATE()

DECLARE @F_Name_UDB VARCHAR(50)
SET @F_Name_UDB = 'pc1'


IF NOT EXISTS ( select **** from [****].[****].[****] as FG where FG.**** = @serial )
  INSERT INTO [****].[****].[****]
           ([****]
           ,[****]
           ,[****]
           ,[****]
           )
       VALUES
           (
           ,1
           ,NULL
           ,DATEADD(day,366,GETDATE())
           ,GETDATE()
           ,'U'
           )
ELSE
  select 'exist'

IF NOT EXISTS ( select **** from [****].[****].[****] as UDB where UDB.**** = @email )
  INSERT INTO [****].[****].[****]
  (****, ****)
  VALUES
  (@F_Name_UDB, @email)
ELSE
  select 'exist'



SET @userid = (select **** from [****].[****].[****] as UDB where UDB.**** = @email)



IF NOT EXISTS ( select **** from [****].[****].[****] as PRF where PRF.**** = @email )
  INSERT INTO [****].[****].[****]
  (****, ****, ****, ****, ****)
  VALUES
  (@F_Name, @L_Name, @email, 123, 3)
ELSE
  select 'exist'




SET @prfid = (select **** from [****].[****].[****] as PRF where PRF.**** = @email)


IF NOT EXISTS ( SELECT * FROM [****].[****].[****] WHERE **** = @email )
  INSERT INTO [****].[****].[****]
  (****, ****, ****, ****, ****, ****)
  VALUES
  (@email, 'Y', @prfid, '12345678', 1, 1)
ELSE
  select 'exist'






SET @ac_id = (select **** from [****].[****].[****] as ACN WHERE ACN.**** = @email)




IF NOT EXISTS ( select **** from [****].[****].[****] as CA WHERE CA.**** = @email )
  INSERT INTO [****].[****].[****]
  (****, ****, ****, ****, ****, ****, ****, ****, ****)
  VALUES
  (@email, 1, @ac_id, 0, 1, '12345678', 1, 4, GETUTCDATE())
ELSE
  select 'exist'



SET @ca_id = (select **** from [****].[****].[****] as CA WHERE CA.**** = @email)

IF NOT EXISTS ( select **** from [****].[****].[****] as PH WHERE PH.**** = @serial and  PH.**** = @guid )
  INSERT INTO [****].[****].[****]
  (****, ****, ****, ****, ****, ****, ****, ****)
  VALUES
  (@product_id, @userid, @serial, @guid, GETUTCDATE(), 'Y', @pid, '')
ELSE
  select 'exist'

SET @ph_id = (select top 1 **** from [****].[****].[****] as PH WHERE PH.**** = @serial)


INSERT INTO [****].[****].[****]
(****, ****, ****)
VALUES
(@ac_id, @ph_id, 1)