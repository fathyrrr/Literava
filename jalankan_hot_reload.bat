@echo off
title Literava - Flutter Run (Hot Reload)
cd /d "D:\Project Pemrograman Mobile\literava"

set ANDROID_AVD_HOME=D:\Android\.android\avd
set ANDROID_USER_HOME=D:\Android\.android
set ANDROID_HOME=D:\Android\Sdk

echo ========================================================
echo    Menjalankan Flutter Run (Hot Reload: tekan 'r')
echo ========================================================
"D:\flutter\bin\flutter.bat" run
pause
