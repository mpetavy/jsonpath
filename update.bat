@echo off
cls
banner %0
pause
go clean -cache
for /d %%a in (*.) do (
    echo ----------------------------------------------------------------------
    echo %%a
    echo.
    cd %%a
    go get github.com/mpetavy/common@v1.1.55
    go mod tidy
    go install
    cd ..
)
