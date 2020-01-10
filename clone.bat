@echo off
banner %0
pause
curl --user "%GITHUB_USERNAME%:%GITHUB_PASSWORD%" "https://api.github.com/users/mpetavy/repos?per_page=1000" > %temp%\github.txt
jsonpath -f %temp%\github.txt -q "$..[?(@.private == false)].name" > %temp%\repos.txt
for /F "tokens=*" %%a in (%temp%\repos.txt) do (
    git clone https://github.com/mpetavy/%%a
)
