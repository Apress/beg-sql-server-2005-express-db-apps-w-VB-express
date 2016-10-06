REM Rename backup files as database and log files
cd c:\program files\microsoft sql server\mssql.1\mssql\data\
rename Database_1a.bak Database_1a.mdf
rename Database_1a_log.bak Database_1a_log.ldf