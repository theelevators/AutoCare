--Procedure takes in a JSON Array String and transforms it into an HTML table and sends it as an email. Used for emailing datasets from the database using FOR JSON to generate the JSON array.
CREATE OR ALTER PROCEDURE [dbo].[DataProtectionEmailAlert]
    @JSON NVARCHAR(MAX),
    @Subject NVARCHAR(2000),
    @RecEmail AS VARCHAR(2000),
    @CCEmail AS VARCHAR(2000),
    @FromAddress VARCHAR(2000)
AS
IF (ISJSON(@JSON) = 0)
   OR (@JSON = '')
   OR (@JSON IS NULL)
    THROW 500001, 'Invalid JSON Format', 1


---Procedure Starts
DECLARE @Sql NVARCHAR(MAX),
        @SubQuery NVARCHAR(MAX),
        @WITH NVARCHAR(MAX)
DECLARE @cols TABLE
(
    [Name] VARCHAR(200)
)
DECLARE @BodyData TABLE
(
    Body VARCHAR(MAX)
)

DECLARE @Header NVARCHAR(MAX),
        @Body NVARCHAR(MAX)

DECLARE @ebody NVARCHAR(MAX)

INSERT INTO @Cols
SELECT j.[key]
FROM OPENJSON(
     (
         SELECT JSON_QUERY(@JSON)
     ),
     '$[1]'
             ) AS j


SELECT @sql = STUFF(
              (
                  SELECT 'CAST(' + [Name] + ' AS VARCHAR)' FROM @Cols FOR XML PATH('td')
              ),
              1,
              0,
              ''
                   )

SELECT @WITH = 'WITH(' + STUFF(
                         (
                             SELECT ',' + [Name] + ' VARCHAR (200)' FROM @Cols FOR XML PATH('')
                         ),
                         1,
                         1,
                         ''
                              ) + ')'


SELECT @SubQuery = '(SELECT * FROM OPENJSON(@JSON)' + @WITH + ' ) AS t'
SELECT @sql = N'SELECT ' + @sql + ' FROM ' + @SubQuery + ' FOR XML PATH(''tr'')'
SELECT @sql = REPLACE(REPLACE(@sql, '<td>', '''<td>''+'), '</td>', '+''</td>''')

SELECT @sql
    = 'SELECT REPLACE(REPLACE(REPLACE((' + @sql + '),'''''''',''''), ''&lt;'', ''<''),''&gt;'',''>'' ) AS Results'

INSERT INTO @BodyData
EXEC sp_executesql @sql, N'@JSON NVARCHAR(MAX)', @JSON = @JSON

SELECT @Header = '<tr>' + STUFF(
                          (
                              SELECT '' + [Name] FROM @Cols FOR XML PATH('th')
                          ),
                          1,
                          0,
                          ''
                               ) + '</tr>'

SELECT TOP 1
       @Body = Body
FROM @BodyData

SELECT @ebody = '<table> 
                  <head>
                  <style>
                  table, td, th
                  {
                  border:1px solid black;
                  }
                  th
                  {
                  background-color:95B4C0;
                  color:Black;
                  }
                  </style>
                  </head>' + 
                  @Header + @Body +
                  '</table>'


EXEC msdb.dbo.sp_send_dbmail @recipients = @RecEmail,
                             @copy_recipients = @CCEmail,
                             @body = @ebody,
                             @body_format = 'HTML',
                             @subject = @Subject,
                             @from_address = @FromAddress;


GO
