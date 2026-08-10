@echo off
rem ------------------------------------------------------------
rem  MeshPnP3D - 3D mesh based aerial image localization
rem  Double-click this file to open the dashboard.
rem  (A .lnk shortcut stores an absolute path and breaks after
rem   unzipping to a different folder, so we use this instead.)
rem ------------------------------------------------------------
if not exist "%~dp0app\MeshPnP3D.exe" (
  echo [ERROR] app\MeshPnP3D.exe not found.
  echo         Unzip the whole folder, keeping "app" next to this file.
  pause
  exit /b 1
)
start "" "%~dp0app\MeshPnP3D.exe"
