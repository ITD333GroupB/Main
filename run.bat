@echo off
REM ########################################################
REM # This auto run script will run all the commands       #
REM # needed to autonomously setup the website from start  #
REM # to finish - provided the target machine has all of   #
REM # necessary software installed on their machine.       #
REM ########################################################

REM Make the Out directory for build outputs
MKDIR .\Out

REM Firstly, setup the SQL server using sqlcmd

REM Make sure SQL Server allows for basic SQL Authentication as opposed to Windows Authentication only
REM This will -not- work if CMD isn't startup up in Administrative mode and will output a permissions error

REG ADD "HKLM\SOFTWARE\Microsoft\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQLServer" ^
    /v LoginMode /t REG_DWORD /d 2 /f

REM Create a default user credential that we can use via the application's configuration
SQLCMD -S localhost -E -Q "IF NOT EXISTS (SELECT 1 FROM sys.sql_logins WHERE name = 'User1') EXEC('CREATE LOGIN [User1] WITH PASSWORD = ''Pass1!'';'); ALTER LOGIN [User1] ENABLE; ALTER LOGIN [User1] WITH PASSWORD = 'Pass1!' UNLOCK;"

REM Init database
SQLCMD -S localhost -E -i "%~dp0Database\preliminary_start.sql"

REM Assign default user access to database
SQLCMD -S localhost -d TaskHubDb -E -Q "IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'User1') BEGIN CREATE USER [User1] FOR LOGIN [User1]; ALTER ROLE db_owner ADD MEMBER [User1]; END"

REM Quickly restart SQL server
NET STOP MSSQLSERVER
NET START MSSQLSERVER

REM Secondly, with the server instance running, startup the backend application.

dotnet publish .\Backend\TaskHub\TaskHub\TaskHub.csproj -c Release -r win-x64 -o .\Out
START .\Out\TaskHub.exe
