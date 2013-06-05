CREATE procedure [dbo].[gs_FindRowByKeyTypeAndUniqueHashKey]
(
    @recordid uniqueidentifier out,
	@duplicateKeyType varchar(50) =null,
    @checksumKey int =null
)
AS
BEGIN
      DECLARE  @sSQL nvarchar(500), @ParmDefinition nvarchar(500),@recordIdOUT uniqueidentifier;
	  set @recordid=null;
	  if(@duplicateKeyType is null or @checksumKey is null )
	  begin
	   return;
	  end
	
    	SELECT @sSQL = N'SELECT @recordIdOUT = MIN(CAST(id AS BINARY(16))) FROM [dbo].tblStudent cb
	                       where  cb.statecode=0 and '+@duplicateKeyType+'=@key';   
  
    SET @ParmDefinition = N'@key varbinary(100) ,@recordIdOUT uniqueidentifier OUTPUT'; 
    
    EXEC sp_executesql @sSQL, @ParmDefinition,@key= @checksumKey, @recordIdOUT=@recordid OUTPUT; 
    PRINT @sSQL 
    print @checksumKey
END