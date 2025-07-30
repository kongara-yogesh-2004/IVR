@echo off
setlocal enabledelayedexpansion
echo ------------------------------------------------------------------------------------------------------------------------
echo                              Welcome to the setup.......... Just sit back and enjoy.....
@REM start of python installation logic
echo Setting up python ver - 3.12.0 on your machine

set "required=Python 3.12.0"
set "python312_found=false"
set "python_found=false"
set "current="

for /f "delims=" %%a in ('where python') do (
    echo %%a | findstr /i /c:"Python312" > nul && set "python312_found=true" && set "python_path=%%a"
    set "python_found=true"
)

if "%python312_found%"=="true" (
    for /f "delims=" %%b in ('%python_path% --version') do (
        set "current=%%b"
        echo The current version of Python on your machine is: !current!
    )
)

if "%required%"=="%current%" (
    echo Great! Python 3.12.0 is already installed on your machine.
    pause
) else if "%python_found%"=="false" (
    echo Python is not installed on your machine.
    echo Starting installation of required version...........
    winget install --id=Python.Python.3.12 -v "3.12.0" -e
    
) else if "%python312_found%"=="true" (
    echo You have a greater version of Python. We have to downgrade it before we proceed.
    set /p status="Would you like to proceed with the installation? (Y/N): "
    if "!status!"=="Y" (
        winget uninstall --id=Python.Python.3.12
        winget install --id=Python.Python.3.12 -v "3.12.0" -e
    ) else if "!status!"=="y" (
        winget uninstall --id=Python.Python.3.12
        winget install --id=Python.Python.3.12 -v "3.12.0" -e
    ) else (
        echo Seems that you don't want to proceed with the installation
        echo Anyways, Nice meeting you....... See you next time
        pause
        exit
    )
) else (
    echo Installing %required% on your machine......
    winget install --id=Python.Python.3.12 -v "3.12.0" -e
)
@REM end of python installation logic

echo Installing Visual Studio Build tools for building wheels
set currentDir=%CD%
set vsconfigPath=%currentDir%\.vsconfig
winget install --id=Microsoft.VisualStudio.2022.BuildTools --override "--wait --passive --config %vsconfigPath%"

@REM installing dependencies for project
set "python_path=%USERPROFILE%\AppData\Local\Programs\Python\Python312"
"%python_path%\Scripts\pip.exe" install langchain-community --no-warn-script-location
"%python_path%\Scripts\pip.exe" install langchain-huggingface --no-warn-script-location
"%python_path%\Scripts\pip.exe" install langchain-chroma --no-warn-script-location
echo .....................................................................................
echo .....................................................................................
echo       installation successful! Check the documentation for further steps......
echo .....................................................................................
echo .....................................................................................
pause