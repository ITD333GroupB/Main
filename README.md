# SETUP INSTRUCTIONS

## Requirements

   1. Git
       - https://git-scm.com/downloads/win
   2. SQL Server Express
       - https://www.microsoft.com/en-us/sql-server/sql-server-downloads
       - *Optionally install SQL Server Management Studio:* https://learn.microsoft.com/en-us/ssms/install/install
   3. Dotnet SDK Version 8
       - https://dotnet.microsoft.com/en-us/download/dotnet/8.0

## Steps

   1. Run `git clone --recurse-submodules https://github.com/ITD333GroupB/Main.git`
   2. Navigate to the 'Main' directory
   3. Execute `run.bat` (*note:* you may want to run this from an administrative console if you chose 'Windows Authentication' during your SQL Server Exp/Dev install to enable regular SQL authentication)

## Notes

`Update.bat` will update all submodules to the current master branch of each repository. So this should be ran **before** the `run.bat` script is ran if you want all files to be 100% up to date.