

create FUNCTION [dbo].[TrimAndLowerCase]
(
	-- Add the parameters for the function here
	 @string NVARCHAR(400)
)
RETURNS NVARCHAR(400)
AS
BEGIN
	set @string=ltrim(rtrim(lower(@string)));
	RETURN @string
END