:: Place this batch file in the micro-sd SteamLibrary folder

@echo off 
setlocal enableextensions 

:: Need to be within the \steamapps directory for findstr to work
:: 	there is less clutter in \SteamLibrary so it's easier to launch from here
cd steamapps
mkdir acf-tmp
move *.acf acf-tmp\ >NUL

:: Get Game Directory Names
for /d %%D in (.\common\*) do (
	REM echo %%~nxD
	:: Find matching acf file that contains game name and copy to ..\tmp
	for /f "tokens=*" %%a in ('findstr /i /m /c:"%%~nxD" acf-tmp\*.acf') do (
		REM echo %%a
		copy %%a . >NUL
	)
)

rmdir /S /Q acf-tmp

endlocal
REM pause
