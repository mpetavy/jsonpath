echo REALLY??????????

end

cd %1
rd .git /s /q
curl -X DELETE -H "Accept: application/vnd.github.v3+json" --user %GITHUB_USERNAME%:%GITHUB_PAT% https://api.github.com/repos/mpetavy/%1
curl -X POST -H "Accept: application/vnd.github.v3+json" --user %GITHUB_USERNAME%:%GITHUB_PAT% https://api.github.com/user/repos -d "{""name"":""%1"",""license"":""apache-2.0""}"
copy ..\LICENSE . /y
copy ..\README.md . /y
copy ..\.gitignore . /y
sar -f README.md -s THISPROJECT -r %1 -tc
go mod init github.com/mpetavy/%1
go install
git init 
git add --all
git commit -m "initial commit"
git tag -a v1.0.0 -m "v1.0.0"
git remote add origin https://github.com/mpetavy/%1.git
git remote -v
git push --set-upstream origin master
git push --tags origin master
cd ..
