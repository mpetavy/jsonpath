@echo off
cls
banner %0
rem pause 
if exist go.work del go.work
go work init
for /d %%a in (*.) do (
    echo ----------------------------------------------------------------------
    echo %%a
    echo.
    go work use %%a
)
