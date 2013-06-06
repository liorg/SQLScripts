CREATE FUNCTION [dbo].[fnNullIfEmptyGuid] 
( 
    @guidValue uniqueidentifier 
) 
RETURNS uniqueidentifier 
AS 
BEGIN 
    declare @result uniqueidentifier 
    declare @emptyGuid uniqueidentifier 
    set @emptyGuid = cast(cast(0 as binary) as uniqueidentifier)


    select @result = case when @guidValue = @emptyGuid then null else @guidValue end

    RETURN @result
END