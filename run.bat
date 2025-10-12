REM ########################################################
REM # This auto run script will run all the commands       #
REM # needed to autonomously setup the website from start  #
REM # to finish - provided the target machine has all of   #
REM # necessary software installed on their machine.       #
REM ########################################################

REM Make the Out directory for build outputs
MKDIR .\Out

REM Firstly, setup the SQL server using sqlcmd
REM TODO: UPDATE THIS COMMAND
SQLCMD -S SetServerName\SetInstanceName -U SetTheUsername -P SetThePassword -i .\Database\SetupScript.sql

REM Secondly, with the server instance running, startup the backend application.
REM TODO: UPDATE THIS COMMAND
DOTNET PUBLISH .\Backend\Project.csproj -c Release -r win-x64 -o .\Out\Backend
START .\Out\Backend\Backend.exe

REM Lastly, setup the frontend service.
REM TODO: SET UP FRONTEND BUILD.
