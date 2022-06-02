@echo off
cls
banner %0
# pause 
go clean -cache
for /d %%a in (*.) do (
    echo ----------------------------------------------------------------------
    echo %%a
    echo.
    cd %%a
    git status
    cd ..
)