CREATE TABLE [dbo].[tblStudent] (
    [id]         UNIQUEIDENTIFIER CONSTRAINT [DF_tblStudent_id] DEFAULT (newid()) ROWGUIDCOL NULL,
    [firstname]  NVARCHAR (50)    NULL,
    [lastname]   NVARCHAR (50)    NULL,
    [age]        INT              NULL,
    [isDeleted]  BIT              CONSTRAINT [DF_tblStudent_isDeleted] DEFAULT ((0)) NOT NULL,
    [city]       NVARCHAR (50)    NULL,
    [street]     NVARCHAR (50)    NULL,
    [CreatedOn]  DATETIME         NULL,
    [desc]       NVARCHAR (MAX)   NULL,
    [email]      NVARCHAR (100)   NULL,
    [tel]        NVARCHAR (100)   NULL,
    [DupKey_FLT] INT              NULL,
    [DupKey_FLE] INT              NULL
);

