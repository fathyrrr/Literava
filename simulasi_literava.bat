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

echo.
echo [1/3] Menyalakan jendela emulator Pixel_Codex...
start "" "%ANDROID_HOME%\emulator\emulator.exe" -avd Pixel_Codex

echo [2/3] Menunggu sistem Android selesai booting...
adb.exe wait-for-device

:wait_boot
for /f "tokens=*" %%a in ('adb.exe shell getprop sys.boot_completed 2^>nul') do set BOOT=%%a
if not "%BOOT%"=="1" (
    timeout /t 2 /nobreak > nul
    goto wait_boot
)

echo Android sudah siap!
timeout /t 2 /nobreak > nul

echo [3/3] Membuka aplikasi Literava di layar HP virtual...
adb.exe shell am start -n com.literava.literava/com.literava.literava.MainActivity

echo.
echo ========================================================
echo    Simulasi BERHASIL! 
echo    Aplikasi Literava sudah terbuka di layar emulator Anda.
echo ========================================================
echo Silakan berinteraksi langsung di jendela emulator.
echo Anda boleh menutup jendela hitam ini sekarang.
echo.
pause
