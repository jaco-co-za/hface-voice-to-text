@echo off
cd /d "e:\Source\LLMS\voice-to-text"
start "" /min cmd /c run_whisper_service.bat
timeout /t 8 /nobreak >nul
start "" /min cmd /c run_whisper_tray.bat
