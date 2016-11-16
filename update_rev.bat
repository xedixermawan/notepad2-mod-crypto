@echo OFF
setlocal
pushd %~dp0

set VERREV_H="src\VersionRev.h"

set /p SCI_BUILD=<.\scintilla\version.txt
set /p VERSION_BUILD=<.\build_no.txt
set /a "VERSION_BUILD+=1"
@echo.%VERSION_BUILD%>.\build_no.txt

@echo. #define VERSION_MAJOR 4.2 > %VERREV_H%
@echo. #define VERSION_MINOR 25 >> %VERREV_H%
:: notepad2-mod version
@echo. #define VERSION_REV 985 >> %VERREV_H%

@echo. #define VERSION_BUILD %VERSION_BUILD% >> %VERREV_H%
@echo. #define VERSION_HASH _T("( SciTE %SCI_BUILD% )") >> %VERREV_H%
@echo. #define SCINTILLA_BUILD L"( SciTE v.%SCI_BUILD%ß )" >> %VERREV_H%

:END
popd
endlocal
exit /B
