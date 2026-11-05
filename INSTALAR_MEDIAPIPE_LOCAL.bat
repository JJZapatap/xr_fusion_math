@echo off
setlocal
cd /d "%~dp0"
echo =====================================================
echo XR FUSION MATH LAB - Instalacion local de MediaPipe
 echo =====================================================
where powershell >nul 2>&1
if errorlevel 1 (echo No se encontro Windows PowerShell.& pause & exit /b 1)
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\instalar_mediapipe.ps1"
if errorlevel 1 (echo. & echo La instalacion no se completo. Revise la conexion y el reporte anterior. & pause & exit /b 1)
echo.
echo MediaPipe instalado. Reinicie la pagina con CTRL + F5.
pause
