:: Place this batch file in the micro-sd SteamLibrary folder

@echo off 
setlocal enableextensions 

cd steamapps
mkdir acf-tmp
move *.acf acf-tmp\ >NUL

:: Get Game Directory Names
for /d %%D in (.\common\*) do (
	:: Find matching acf file that contains game name and copy to ..\tmp
	for /f "tokens=*" %%a in ('findstr /i /m /c:"%%~nxD" acf-tmp\*.acf') do (
		copy %%a . >NUL
	)
)
rmdir /S /Q acf-tmp

endlocal
