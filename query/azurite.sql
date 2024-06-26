/* Delete Credential */

-- DROP CREDENTIAL azure_secret;
-- GO


/* Azurite Emulator */

-- IF NOT EXISTS
-- (SELECT * FROM sys.credentials
-- WHERE name = 'azure_secret')
-- CREATE CREDENTIAL [azure_secret] WITH IDENTITY = 'devstoreaccount1'
-- ,SECRET = 'Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==';

/* Azure Storage */

-- IF NOT EXISTS
-- (SELECT * FROM sys.credentials
-- WHERE name = 'azure_secret')
-- CREATE CREDENTIAL [azure_secret] WITH IDENTITY = 'stashqa'
-- ,SECRET = 'VnbR75fFvUwGMFzLUfELju054pcdxqpHgvSdPavikhsI44RrzStNTWkoWmrCrHM/BukG/654mr0Z+ASt8RuwNA==';


/* SAS */

IF NOT EXISTS
(SELECT * FROM sys.credentials
WHERE name = 'https://stashqa.blob.core.windows.net/stashqa')
CREATE CREDENTIAL [https://stashqa.blob.core.windows.net/stashqa]
   WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
   SECRET = '';



/* SAS */

IF NOT EXISTS
(SELECT * FROM sys.credentials
WHERE name = 'http://127.0.0.1:10000/devstoreaccount1/kubestash')
CREATE CREDENTIAL [http://127.0.0.1:10000/devstoreaccount1/kubestash]
   WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
   SECRET = '';

SELECT name FROM sys.credentials
GO










/* To URL using storage account identity and access key */

-- BACKUP DATABASE demo
-- TO URL = N'https://stashqa.blob.core.windows.net/kubestash/sunny.bak'
--       WITH CREDENTIAL = 'azure_secret'
--      ,COMPRESSION , FORMAT
--      ,STATS = 5;
-- GO


/* To URL using Shared Access Signature **Working */

-- BACKUP DATABASE demo
-- TO URL = 'https://stashqa.blob.core.windows.net/stashqa/demo.bak';
-- GO


/* To URL using Shared Access Signature. Emulator  */

BACKUP DATABASE demo
TO URL = 'http://127.0.0.1:10000/devstoreaccount1/kubestash/demo.bak' WITH FORMAT

    GO


/* Github Issues URL

https://github.com/Azure/Azurite/issues/1089
https://github.com/microsoft/mssql-docker/issues/721
https://feedback.azure.com/d365community/idea/7a582cd4-11d2-ed11-a81c-000d3ae51e62
https://learn.microsoft.com/en-us/archive/msdn-technet-forums/125f9019-07fd-4df4-9724-c94fe5f60320

*/