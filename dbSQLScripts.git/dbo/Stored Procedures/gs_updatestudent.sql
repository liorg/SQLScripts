--EXEC gs_updatestudent @firstname='L' ,@lastname='G',@email='XX.XX'
CREATE PROCEDURE gs_updatestudent
           @firstname nvarchar(100) =null,
           @lastname nvarchar(100) =null,
           @age int =null,
           @city nvarchar(100) =null,
           @street nvarchar(100) =null,
           @desc nvarchar(max) =null,
           @email nvarchar(100) =null,
           @tel nvarchar(100) =null
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	
declare @idtemp uniqueidentifier=null,@DupKey_FLE int,@DupKey_FLT int;
 select TOP 1 @DupKey_FLT=DupKey_FLT ,
               @DupKey_FLE=DupKey_FLE 
             from dbo.GetAllKindsOfUniqueKey(@firstname,@lastname, @tel,@email);

exec [dbo].[SearchMatchingKeyInOrder] @idtemp OUT,@DupKey_FLT=@DupKey_FLT,@DupKey_FLE=@DupKey_FLE
if(@idtemp is null)
begin
INSERT INTO [dbo].[tblStudent]
           ([firstname] ,[lastname] ,[age] ,[city]  ,[street] ,[CreatedOn] ,[desc],[email]  ,[tel],DupKey_FLT,DupKey_FLE)
     VALUES
           (@firstname,@lastname,@age,@city,@street,getdate(),@desc,@email,@tel,@DupKey_FLT,@DupKey_FLE)
end
else
begin
	UPDATE [dbo].[tblStudent]
	   SET [firstname] = isnull(@firstname,firstname)
		  ,[lastname] = isnull(@firstname,firstname)
		  ,[age] = isnull(@age,age)
		  ,[city] = isnull(@city,city)
		  ,[street] = isnull(@firstname,firstname)
		  ,[desc] = isnull(@desc,[desc])
		  ,[email] =isnull(@email,email)
		  ,[tel] = isnull(@tel,tel)
		  ,DupKey_FLT=@DupKey_FLT
		  ,DupKey_FLe=@DupKey_FLE
	 WHERE id=@idtemp
end

END