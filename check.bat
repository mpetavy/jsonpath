@echo off
cls
banner %0
pause
go clean -cache
for /d %%a in (*.) do (
	if not exist %%a\README.md (
		echo %%a\README.md
		if exist %%a\_README.md del %%a\_README.md
		copy netio\README.md %%a\README.md
		sar  -s "NETIO" -t "%%a" -tc -f %%a\README.md
	)
	
	if not exist %%a\.gitignore (
		copy hydra\.gitignore %%a /y
	)
)