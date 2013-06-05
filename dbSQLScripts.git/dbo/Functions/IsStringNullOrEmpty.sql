  
  create FUNCTION [dbo].[IsStringNullOrEmpty]
(
	-- Add the parameters for the function here
	 @string NVARCHAR(400)
)
RETURNS bit
AS
BEGIN
	set @string=ISNULL(ltrim(rtrim(@string)), '');
	if @string=''
     	RETURN 1
	 RETURN 0
END