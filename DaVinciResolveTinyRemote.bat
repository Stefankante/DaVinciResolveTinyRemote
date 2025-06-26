@echo off
setlocal

:: Define the base directory where this script is located
:: This allows us to find the 'files' subfolder regardless of where the script is run from.
set "SCRIPT_DIR=%~dp0"

:: --- 1. Create C:\Program Files\Blackmagic Design\DaVinci Resolve folder ---
echo Creating Program Files folder...
set "PROGRAM_FILES_DIR=C:\Program Files\Blackmagic Design\DaVinci Resolve"
if not exist "%PROGRAM_FILES_DIR%" (
    mkdir "%PROGRAM_FILES_DIR%"
    echo Created: "%PROGRAM_FILES_DIR%"
) else (
    echo Folder already exists: "%PROGRAM_FILES_DIR%"
)

:: --- 2. Copy DaVinciPanelDaemon.exe and Remote Panel BAT files ---
echo Copying DaVinciPanelDaemon.exe...
set "SOURCE_DAEMON_EXE=%SCRIPT_DIR%files\DaVinciPanelDaemon.exe"
set "DEST_DAEMON_EXE=%PROGRAM_FILES_DIR%\DaVinciPanelDaemon.exe"
if exist "%SOURCE_DAEMON_EXE%" (
    copy "%SOURCE_DAEMON_EXE%" "%DEST_DAEMON_EXE%" >nul
    echo Copied: "%SOURCE_DAEMON_EXE%" to "%DEST_DAEMON_EXE%"
) else (
    echo ERROR: DaVinciPanelDaemon.exe not found at "%SOURCE_DAEMON_EXE%"
)

echo Copying DaVinciRemotePanel.bat...
set "SOURCE_REMOTE_PANEL_BAT=%SCRIPT_DIR%files\DaVinciRemotePanel.bat"
set "DEST_REMOTE_PANEL_BAT=%PROGRAM_FILES_DIR%\DaVinciRemotePanel.bat"
if exist "%SOURCE_REMOTE_PANEL_BAT%" (
    copy "%SOURCE_REMOTE_PANEL_BAT%" "%DEST_REMOTE_PANEL_BAT%" >nul
    echo Copied: "%SOURCE_REMOTE_PANEL_BAT%" to "%DEST_REMOTE_PANEL_BAT%"
) else (
    echo ERROR: DaVinciRemotePanel.bat not found at "%SOURCE_REMOTE_PANEL_BAT%"
)

echo Copying DaVinciRemoteAdvPanel.bat...
set "SOURCE_REMOTE_ADV_PANEL_BAT=%SCRIPT_DIR%files\DaVinciRemoteAdvPanel.bat"
set "DEST_REMOTE_ADV_PANEL_BAT=%PROGRAM_FILES_DIR%\DaVinciRemoteAdvPanel.bat"
if exist "%SOURCE_REMOTE_ADV_PANEL_BAT%" (
    copy "%SOURCE_REMOTE_ADV_PANEL_BAT%" "%DEST_REMOTE_ADV_PANEL_BAT%" >nul
    echo Copied: "%SOURCE_REMOTE_ADV_PANEL_BAT%" to "%DEST_REMOTE_ADV_PANEL_BAT%"
) else (
    echo ERROR: DaVinciRemoteAdvPanel.bat not found at "%SOURCE_REMOTE_ADV_PANEL_BAT%"
)


:: --- 3. Create C:\Users\XXX\AppData\Roaming\Blackmagic Design\DaVinci Resolve\Support\logs folder ---
:: %USERPROFILE% automatically resolves to C:\Users\YourUsername
echo Creating AppData logs folder...
set "APPDATA_LOGS_DIR=%USERPROFILE%\AppData\Roaming\Blackmagic Design\DaVinci Resolve\Support\logs"
if not exist "%APPDATA_LOGS_DIR%" (
    mkdir "%APPDATA_LOGS_DIR%"
    echo Created: "%APPDATA_LOGS_DIR%"
) else (
    echo Folder already exists: "%APPDATA_LOGS_DIR%"
)

:: --- 4. Create Desktop Shortcuts ---
echo Creating Desktop shortcuts...

:: Shortcut 1: DaVinciRemotePanel.bat (shortcut points to the file in the 'files' directory)
set "TARGET_BAT_1=%SCRIPT_DIR%files\DaVinciRemotePanel.bat"
set "SHORTCUT_NAME_1=DaVinciRemotePanel"
set "SHORTCUT_PATH_1=%USERPROFILE%\Desktop\%SHORTCUT_NAME_1%.lnk"
set "WORKING_DIR_1=%SCRIPT_DIR%files"

:: Create a temporary VBScript file to handle shortcut creation
echo Set WshShell = WScript.CreateObject("WScript.Shell") > "%TEMP%\createshortcut.vbs"
echo Set oShellLink = WshShell.CreateShortcut("%SHORTCUT_PATH_1%") >> "%TEMP%\createshortcut.vbs"
echo oShellLink.TargetPath = "%TARGET_BAT_1%" >> "%TEMP%\createshortcut.vbs"
echo oShellLink.WorkingDirectory = "%WORKING_DIR_1%" >> "%TEMP%\createshortcut.vbs"
echo oShellLink.Save >> "%TEMP%\createshortcut.vbs"

:: Execute the VBScript
if exist "%TARGET_BAT_1%" (
    cscript //nologo "%TEMP%\createshortcut.vbs"
    echo Created shortcut: "%SHORTCUT_PATH_1%"
) else (
    echo WARNING: %SHORTCUT_NAME_1%.bat not found at "%TARGET_BAT_1%". Shortcut not created.
)
:: Delete the temporary VBScript file
del "%TEMP%\createshortcut.vbs" >nul 2>&1


:: Shortcut 2: DaVinciRemoteAdvPanel.bat (shortcut points to the file in the 'files' directory)
set "TARGET_BAT_2=%SCRIPT_DIR%files\DaVinciRemoteAdvPanel.bat"
set "SHORTCUT_NAME_2=DaVinciRemoteAdvPanel"
set "SHORTCUT_PATH_2=%USERPROFILE%\Desktop\%SHORTCUT_NAME_2%.lnk"
set "WORKING_DIR_2=%SCRIPT_DIR%files"

:: Create a temporary VBScript file to handle shortcut creation
echo Set WshShell = WScript.CreateObject("WScript.Shell") > "%TEMP%\createshortcut.vbs"
echo Set oShellLink = WshShell.CreateShortcut("%SHORTCUT_PATH_2%") >> "%TEMP%\createshortcut.vbs"
echo oShellLink.TargetPath = "%TARGET_BAT_2%" >> "%TEMP%\createshortcut.vbs"
echo oShellLink.WorkingDirectory = "%WORKING_DIR_2%" >> "%TEMP%\createshortcut.vbs"
echo oShellLink.Save >> "%TEMP%\createshortcut.vbs"

:: Execute the VBScript
if exist "%TARGET_BAT_2%" (
    cscript //nologo "%TEMP%\createshortcut.vbs"
    echo Created shortcut: "%SHORTCUT_PATH_2%"
) else (
    echo WARNING: %SHORTCUT_NAME_2%.bat not found at "%TARGET_BAT_2%". Shortcut not created.
)
:: Delete the temporary VBScript file
del "%TEMP%\createshortcut.vbs" >nul 2>&1


echo.
echo Setup complete!
pause
endlocal
