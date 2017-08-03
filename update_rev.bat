@echo OFF
setlocal enableextensions
set SCRIPTDIR=%~dp0
set CWD=%CD%

pushd "%SCRIPTDIR%"

set VERREV_H=".\src\VersionRev.h"

:: build number
set /p VERSION_BUILD=<.\build_no.txt
set /a "VERSION_BUILD+=1"
@echo.%VERSION_BUILD%>.\build_no.txt

:: Scintilla version
set /p SCI_BUILD=<.\scintilla\version.txt

:: define notepad2-mod based version
set VMAJ=5.2
set VMIN=25
set VREV=985
@echo. #define VERSION_MAJOR %VMAJ% > %VERREV_H%
@echo. #define VERSION_MINOR %VMIN% >> %VERREV_H%
@echo. #define VERSION_REV %VREV% >> %VERREV_H%
@echo. #define VERSION_BUILD %VERSION_BUILD% >> %VERREV_H%
::@echo. #define VERSION_HASH _T("( Scintilla %SCI_BUILD%* )") >> %VERREV_H%
@echo. #define SCINTILLA_BUILD L"( Scintilla %SCI_BUILD%* )" >> %VERREV_H%

:: patch manifest file
set MANIFEST_SRC=.\res\Notepad2Crypt.exe.manifest.conf
set MANIFEST_DST=.\res\Notepad2Crypt.exe.manifest
.\tools\far.exe -o "%MANIFEST_SRC%" "%MANIFEST_DST%" "$VERSION$" "%VMAJ%.%VMIN%.%VREV%"

:END
popd
endlocal
exit /B
