
-- exec [gs_UpdateUniqueHashKeyByEntity] '4E3BC571-6199-47BE-A028-00008B038DB1','contact','1','2','3','4','5','6'
CREATE procedure [dbo].[gs_UpdateUniqueHashKey]
(
    @id uniqueidentifier ,
    @DupKey_FLT int =null,
    @DupKey_FLE int =null
)
AS
BEGIN
      DECLARE  @sSQL nvarchar(500), @ParmDefinition nvarchar(500);
    
    SELECT @sSQL = N'UPDATE [dbo].tblStudent
	                  SET   DupKey_FLT=@new_New_DupKey_FLT,
	                  new_New_DupKey_FLE=@new_New_DupKey_FLE
	                Where id=@recordId';
    SET @ParmDefinition = N'@recordId uniqueidentifier ,@Dupkey_FLE int, @DupKey_FLT int';
    EXEC sp_executesql @sSQL, @ParmDefinition, @recordId=@id ,
									@DupKey_FLT=@DupKey_FLT,
									@DupKey_FLE=@DupKey_FLE 
    PRINT @sSQL 

END