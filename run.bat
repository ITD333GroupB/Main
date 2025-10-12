REM ########################################################
REM # This auto run script will run all the commands       #
REM # needed to autonomously setup the website from start  #
REM # to finish - provided the target machine has all of   #
REM # necessary software installed on their machine.       #
REM ########################################################

REM Firstly, setup the SQL server using sqlcmd
REM TODO: UPDATE THIS COMMAND
SQLCMD -S SetServerName\SetInstanceName -U SetTheUsername -P SetThePassword -i .\Path\To\SetupScript.sql

REM Secondly, with the server instance running, startup the backend application.
REM TODO: UPDATE THIS COMMAND
DOTNET PUBLISH .\Path\To\App\Project.csproj -c Release -r win-x64 -o ..\backend
START ..\backend\backend.exe

REM Lastly, setup the frontend service.
REM TODO: SET UP FRONTEND BUILD.
