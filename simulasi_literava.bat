@echo off
title Simulasi Literava Sanctum
echo ========================================================
echo    LITERAVA - Virtual Library ^& Bookshelf Sanctum
echo    Memulai Simulasi di Android Emulator (Pixel_Codex)...
echo ========================================================

set ANDROID_AVD_HOME=D:\Android\.android\avd
set ANDROID_USER_HOME=D:\Android\.android
set ANDROID_HOME=D:\Android\Sdk
set PATH=%ANDROID_HOME%\platform-tools;%PATH%

echo [1/4] Membersihkan berkas kunci lama (Auto-unlock AVD)...
del /f /q /s "D:\Android\.android\avd\Pixel_Codex.avd\*.lock" >nul 2>&1
taskkill /f /im adb.exe >nul 2>&1

echo [2/4] Menyalakan emulator Pixel_Codex...
start "" "%ANDROID_HOME%\emulator\emulator.exe" -avd Pixel_Codex

echo [3/4] Menghubungkan ke Android ADB (mohon tunggu beberapa detik)...
adb.exe wait-for-device

echo [4/4] Sistem Android terhubung! Membuka Literava...
timeout /t 5 /nobreak > nul
adb.exe shell am start -n com.literava.literava/com.literava.literava.MainActivity

echo.
echo ========================================================
echo    SUKSES! Aplikasi Literava sudah tampil di layar Anda.
echo ========================================================
echo Anda boleh menutup jendela terminal ini.
pause
