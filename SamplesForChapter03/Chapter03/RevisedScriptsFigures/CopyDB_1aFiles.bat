REM Erase old database and log files
cd c:\prosseapps\chapter03\ 
ERASE Database_1a*.*

REM Copy new database and log files to new folder
REM and to .bak files in the same folder
cd c:\program files\microsoft sql server\mssql.1\mssql\data\ 
copy Database_1a*.* c:\prosseapps\chapter03\
copy Database_1a.mdf Database_1a.bak
copy Database_1a_log.ldf Database_1a_log.bak