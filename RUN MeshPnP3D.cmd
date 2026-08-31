@echo off
rem ------------------------------------------------------------
rem  MeshPnP3D - 3D mesh based aerial image localization
rem
rem  Double-click this file to open the dashboard.
rem  A .lnk shortcut stores an absolute path and breaks after
rem  unzipping elsewhere, so this relative-path script is used.
rem
rem  ASCII only: cmd.exe reads .cmd in the system codepage,
rem  so non-ASCII text here would be mangled.
rem ------------------------------------------------------------
if not exist "%~dp0app\MeshPnP3D.exe" (
  echo [ERROR] app\MeshPnP3D.exe not found.
  echo         Unzip the whole folder, keeping "app" next to this file.
  echo.
  pause
  exit /b 1
)
start "" "%~dp0app\MeshPnP3D.exe"
