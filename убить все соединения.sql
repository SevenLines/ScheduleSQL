USE master
GO

DECLARE @kill varchar(8000);  
SET @kill = ''
SELECT @kill = @kill + 'kill ' + CONVERT(varchar(5), spid) + ';'  
FROM master..sysprocesses  
WHERE dbid = db_id('SPR_POLITEX')

EXEC(@kill); 

/*
RESTORE DATABASE [SPR_POLITEX] FROM  DISK = N'C:\SQLData\BackUP\SPR_POLITEX_BU' WITH  FILE = 184,  NOUNLOAD,  STATS = 10
*/


--4261065 -> 4261784