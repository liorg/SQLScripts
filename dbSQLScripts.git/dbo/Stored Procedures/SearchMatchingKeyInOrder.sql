CREATE PROC [dbo].[SearchMatchingKeyInOrder]
(
    @recordid uniqueidentifier out,
	@DupKey_FLE int,
	@DupKey_FLT int
)
AS
BEGIN
	DECLARE		@recordIdOUT uniqueidentifier;
	SET @recordid=cast(cast(0 as binary) as uniqueidentifier); 
       
--     ORDER WICH BEST CHoice to less Choice
--		1. Match To Primary Email, First Name, Last Name
--		2. Match To Mobile Phone, First Name, Last Name

     --Match To Primary Email, First Name, Last Name
	 IF(@DupKey_FLE IS NOT NULL)
    BEGIN
      exec [dbo].gs_FindRowByKeyTypeAndUniqueHashKey @recordid out,'DupKey_FLE',@DupKey_FLE;
      IF(@recordid IS NOT NULL)
         begin
            return;
       end 
    END
     --Match to Home Phone, First Name, Last Name
	 IF(@DupKey_FLT IS NOT NULL)
    BEGIN
      exec [dbo].gs_FindRowByKeyTypeAndUniqueHashKey @recordid out,'DupKey_FLT',@DupKey_FLT;
      IF(@recordid IS NOT NULL)
         begin
          return;
       end 
    END
	
END