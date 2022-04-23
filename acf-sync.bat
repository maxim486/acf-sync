:: Place this batch file in the micro-sd SteamLibrary folder

@echo off 
setlocal enableextensions 

mkdir tmp

:: Need to be within the \steamapps directory for findstr to work
:: 	there is less clutter in \SteamLibrary so it's easier to launch from here
cd steamapps

:: Get Game Directory Names
for /d %%D in (.\common\*) do (
	:: Find matching acf file that contains game name and copy to ..\tmp
	for /f "tokens=*" %%a in ('findstr /i /m /c:"%%~nxD" *.acf') do (
		copy %%a ..\tmp >NUL
	)
)

del *.acf
cd ..
copy tmp\*.acf steamapps >NUL
rmdir /S /Q tmp

endlocal
REM pause