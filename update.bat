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
    go get github.com/mpetavy/common@v1.4.24
    if exist update-vendor.bat call update-vendor.bat
    if "%%a" == "hydra" (
	go run . -codegen
    )
    go mod tidy
    go install
    cd ..
)
