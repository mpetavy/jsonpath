@echo off
if #%GITHUB_USERNAME%# == ## goto username
if #%GITHUB_PAT%# == ## goto pat
banner %0
curl --user "%GITHUB_USERNAME%:%GITHUB_PAT%" "https://api.github.com/user/repos?per_page=1000" > %temp%\github.txt
rem curl --user "%GITHUB_USERNAME%:%GITHUB_PAT%" "https://api.github.com/users/mpetavy/repos?per_page=1000" > %temp%\github.txt
jsonpath -nb -f %temp%\github.txt -q "$..[?(@.owner.login=='mpetavy')].name" > %temp%\repos.txt
for /F "tokens=*" %%a in (%temp%\repos.txt) do (
	if not %%a==cv git clone https://github.com/mpetavy/%%a
)
goto end

:username
echo please set GITHUB_USERNAME
goto end

:pat
echo please set GITHUB_PAT
goto end

:end
