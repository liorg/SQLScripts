
create FUNCTION [dbo].[GetUniqueKey]
(
@fname nvarchar(max)= null,
@lname nvarchar(max)= null,
@telephone nvarchar(max)= null,
@email nvarchar(max)= null
)
returns @retTable table
(
    checksumKey int,checksumFieldName nvarchar(100)
)
BEGIN
DECLARE  @checksumKey int=0, @fieldName nvarchar(100)='';

if (@fname is null and @lname is null)
		begin
		-- no need!!!
		  set @checksumKey =0;
		  --return
		end
 else if(dbo.IsStringNullOrEmpty(@telephone)=0 and  dbo.IsStringNullOrEmpty(@email) =1 )
		begin
		 set @checksumKey= CHECKSUM(dbo.TrimAndLowerCase(@fname), dbo.TrimAndLowerCase(@lname),  dbo.udf_GetNumeric(@telephone) )
		 set @fieldName='DupKey_FLT'
		end
else if( dbo.IsStringNullOrEmpty(@telephone)=1  and dbo.IsStringNullOrEmpty(@email) =0 )
		begin
		 set @checksumKey= CHECKSUM(dbo.TrimAndLowerCase(@fname), dbo.TrimAndLowerCase(@lname),  dbo.TrimAndLowerCase(@email))
		 set @fieldName='DupKey_FLE'
end
 INSERT INTO @retTable
		            (checksumKey,checksumFieldName)
		          VALUES 
		            (@checksumKey,@fieldName)

RETURN --@retTable;
END
 
 