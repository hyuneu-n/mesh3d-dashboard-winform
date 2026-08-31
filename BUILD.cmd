@echo off
setlocal
rem ------------------------------------------------------------
rem  BUILD.cmd - rebuild the dashboard into .\app
rem
rem  For maintainers only. End users do not need this file.
rem  Requires the .NET SDK and the source tree two levels up:
rem      <repo>\test\MeshPnP3D\MeshPnP3D.csproj   (source)
rem      <repo>\test\MeshPnP3D\MeshPnP3D\app      (this output)
rem
rem  ASCII only: cmd.exe reads .cmd in the system codepage,
rem  so non-ASCII text here would be mangled.
rem ------------------------------------------------------------

set "PROJ=%~dp0..\MeshPnP3D.csproj"
set "OUT=%~dp0app"

if not exist "%PROJ%" (
  echo [ERROR] Project not found: %PROJ%
  echo         Keep this folder inside the source tree to build.
  echo.
  pause
  exit /b 1
)

where dotnet >nul 2>nul
if errorlevel 1 (
  echo [ERROR] dotnet SDK not found on PATH.
  echo.
  pause
  exit /b 1
)

echo Building and publishing to:
echo   %OUT%
echo.

dotnet publish "%PROJ%" -c Release -f net10.0-windows -r win-x64 --self-contained true -o "%OUT%"
if errorlevel 1 (
  echo.
  echo [ERROR] publish failed.
  echo         Close MeshPnP3D.exe if it is running and retry.
  echo.
  pause
  exit /b 1
)

rem Runtime-only cache. Never ship it.
if exist "%OUT%\matchcache" rd /s /q "%OUT%\matchcache"

echo.
echo [OK] Done.
echo      Run "RUN MeshPnP3D.cmd" to start the dashboard.
echo.
pause
