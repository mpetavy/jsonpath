@echo off
cls
banner %0
rem pause 
go clean -cache
for /d %%a in (*.) do (
    echo ----------------------------------------------------------------------
    echo %%a
    echo.
    cd %%a
    git status
    cd ..
)