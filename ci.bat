@echo off
setlocal

REM ci.bat — simple, robust local CI/build script for Windows (CMD)
REM Usage: ci.bat
REM It performs a clean build: removes build, creates it, configures, builds and runs tests.

set BUILD_DIR=build
set CONFIG=Debug

echo [ci] Build dir: %BUILD_DIR%, Config: %CONFIG%

where cmake >nul 2>nul
IF %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%

where ctest >nul 2>nul
IF %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%

IF EXIST "%BUILD_DIR%" rmdir /s /q "%BUILD_DIR%"
IF %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%

mkdir "%BUILD_DIR%"
IF %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%

cd /d "%BUILD_DIR%"
IF %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%

echo [ci] Configuring with cmake ..
cmake .. -DCMAKE_BUILD_TYPE=%CONFIG%
IF %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%

echo [ci] Building (cmake --build . --config %CONFIG%)
cmake --build . --config %CONFIG%
IF %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%

echo [ci] Running tests (ctest -C %CONFIG% --output-on-failure)
ctest -C %CONFIG% --output-on-failure
IF %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%

echo SUCCESS

endlocal
exit /b 0
