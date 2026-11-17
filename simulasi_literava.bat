@echo off
title Simulasi Literava Sanctum
echo ========================================================
echo    LITERAVA - Virtual Library ^& Bookshelf Sanctum
echo    Memulai Cold Boot Android Emulator (Pixel_Codex)...
echo ========================================================

set ANDROID_AVD_HOME=D:\Android\.android\avd
set ANDROID_USER_HOME=D:\Android\.android
set ANDROID_HOME=D:\Android\Sdk
set PATH=%ANDROID_HOME%\platform-tools;%PATH%

echo [1/4] Membersihkan berkas kunci dan snapshot lama...
del /f /q /s "D:\Android\.android\avd\Pixel_Codex.avd\*.lock" >nul 2>&1
rd /s /q "D:\Android\.android\avd\Pixel_Codex.avd\snapshots\default_boot" >nul 2>&1
taskkill /f /im adb.exe >nul 2>&1

echo [2/4] Menyalakan emulator Pixel_Codex (Cold Boot bersih)...
start "" "%ANDROID_HOME%\emulator\emulator.exe" -avd Pixel_Codex -no-snapshot-load

echo [3/4] Menunggu sistem Android selesai booting...
adb.exe wait-for-device
powershell -NoProfile -Command "while ((adb shell getprop sys.boot_completed 2>$null).Trim() -ne '1') { Start-Sleep -Seconds 2 }"

echo [4/4] Sistem Android siap! Membuka Literava...
adb.exe shell input keyevent 3
timeout /t 2 /nobreak > nul
adb.exe shell am start -n com.literava.literava/com.literava.literava.MainActivity

echo.
echo ========================================================
echo    SUKSES! Aplikasi Literava sudah terbuka di emulator.
echo ========================================================
echo Jendela emulator sudah siap digunakan.
echo Tekan tombol apa saja untuk menutup jendela ini...
pause > nul
