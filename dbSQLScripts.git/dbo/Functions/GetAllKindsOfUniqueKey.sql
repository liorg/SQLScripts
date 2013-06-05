
 CREATE FUNCTION [dbo].[GetAllKindsOfUniqueKey]
(
	@Fname nvarchar(max)= null,
	@Lname nvarchar(max)= null,
	@telephone nvarchar(max)= null,
	@email nvarchar(max)= null
)	
returns @retTable table
(
    DupKey_FLT int NULL,DupKey_FLE int NULL
)
BEGIN
  INSERT INTO @retTable 
	             (DupKey_FLT,DupKey_FLE)
	        VALUES 
	            (null,null);
	declare @checksumKey int=0,@checksumFieldName nvarchar(100)='';
	select @checksumKey=checksumKey,@checksumFieldName=lower(checksumFieldName)
	 from [dbo].GetUniqueKey(@fname,@lname,
								@telephone,null) ;
	 --  TEL only
	if(@checksumKey<>0 and @checksumFieldName=lower('DupKey_FLT'))
	begin
	   update @retTable set DupKey_FLT=@checksumKey;
	end	  
	  --  email only
	set @checksumKey =0;set @checksumFieldName='';
	select @checksumKey=checksumKey,@checksumFieldName=lower(checksumFieldName)
	 from [dbo].GetUniqueKey(@fname,@lname,
								null,@email) ;
		if(@checksumKey<>0 and @checksumFieldName=lower('DupKey_FLE'))
	begin
	    update @retTable set DupKey_FLE=@checksumKey;
	end	  
	RETURN
END