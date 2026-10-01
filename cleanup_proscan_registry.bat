@echo off
setlocal enabledelayedexpansion

echo ========================================
echo ProScan Registry Cleaner
echo ========================================
echo.
echo This script removes all ProScan registry entries.
echo These entries control trial dates and activation state.
echo.
echo Registry path: HKCU\Software\ProScan
echo.
pause

echo.
echo Checking for ProScan registry key...

reg query "HKCU\Software\ProScan" >nul 2>&1
if %errorlevel% equ 0 (
    echo Found: HKCU\Software\ProScan
    echo.
    echo Deleting key and all subkeys/values...
    
    reg delete "HKCU\Software\ProScan" /f
    
    if %errorlevel% equ 0 (
        echo.
        echo [OK] ProScan registry key deleted successfully.
    ) else (
        echo.
        echo [ERROR] Failed to delete registry key.
        echo Try running this script as Administrator.
    )
) else (
    echo [INFO] No ProScan registry key found. Nothing to clean.
)

echo.
echo ========================================
echo Cleanup complete.
echo ========================================
echo.
echo Note: After running this, ProScan will reset to
echo a fresh 30-day trial state (unless the compiled
echo binary has been patched to ignore registry checks).
echo.
pause
