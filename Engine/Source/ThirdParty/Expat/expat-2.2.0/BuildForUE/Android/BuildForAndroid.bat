@ECHO OFF

REM Copyright Epic Games, Inc. All Rights Reserved.

setlocal

set PATH_TO_CMAKE_FILE=%CD%\..\..

REM Temporary build directories (used as working directories when running CMake)
set CMAKE_EXE="%ANDROID_HOME%\cmake\3.10.2.4988404\bin\cmake.exe"
set ANDROID_TOOLCHAIN_FILE="%PATH_TO_CMAKE_FILE%\BuildForUE\Android\Android.cmake"
set ANDROID_BUILD_PATH="%PATH_TO_CMAKE_FILE%\Android\Build"
set ANDROID_LIB_PATH="%PATH_TO_CMAKE_FILE%\Android"
set MAKE="%NDKROOT%\prebuilt\windows-x86_64\bin\make.exe"
set CMAKE_GLOBAL_DIR="%PATH_TO_CMAKE_FILE%\..\..\CMake\PlatformScripts"

if exist "%ANDROID_BUILD_PATH%" (rmdir "%ANDROID_BUILD_PATH%" /s/q)

echo Building for Android (ARM 64-bit) Release
mkdir "%ANDROID_BUILD_PATH%"
pushd "%ANDROID_BUILD_PATH%" 
%CMAKE_EXE% -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE="%ANDROID_TOOLCHAIN_FILE%" -DANDROID_NDK="%NDKROOT%" -DCMAKE_MAKE_PROGRAM=%MAKE% -DCMAKE_BUILD_TYPE=Release -DANDROID_NATIVE_API_LEVEL=android-21 -DANDROID_ABI=arm64-v8a -DANDROID_STL=c++_shared -DCMAKE_SUPPRESS_REGENERATION=1 -DBUILD_tools=0 -DBUILD_examples=0 -DBUILD_tests=0 -DBUILD_shared=0 %PATH_TO_CMAKE_FILE%

REM Now compile it
%MAKE%
mkdir %ANDROID_LIB_PATH%\Release\arm64
move /y %ANDROID_BUILD_PATH%\libexpat.a %ANDROID_LIB_PATH%\Release\arm64
popd
rmdir "%ANDROID_BUILD_PATH%" /s/q

echo Building for Android (ARM 64-bit) Debug
mkdir "%ANDROID_BUILD_PATH%"
pushd "%ANDROID_BUILD_PATH%" 
%CMAKE_EXE% -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE="%ANDROID_TOOLCHAIN_FILE%" -DANDROID_NDK="%NDKROOT%" -DCMAKE_MAKE_PROGRAM=%MAKE% -DCMAKE_BUILD_TYPE=Debug -DANDROID_NATIVE_API_LEVEL=android-21 -DANDROID_ABI=arm64-v8a -DANDROID_STL=c++_shared -DCMAKE_SUPPRESS_REGENERATION=1 -DBUILD_tools=0 -DBUILD_examples=0 -DBUILD_tests=0 -DBUILD_shared=0 %PATH_TO_CMAKE_FILE%

REM Now compile it
%MAKE%
mkdir %ANDROID_LIB_PATH%\Debug\arm64
move /y %ANDROID_BUILD_PATH%\libexpat.a %ANDROID_LIB_PATH%\Debug\arm64
popd
rmdir "%ANDROID_BUILD_PATH%" /s/q

echo Building for Android (x86 64-bit) Release
mkdir "%ANDROID_BUILD_PATH%"
pushd "%ANDROID_BUILD_PATH%" 
%CMAKE_EXE% -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE="%ANDROID_TOOLCHAIN_FILE%" -DANDROID_NDK="%NDKROOT%" -DCMAKE_MAKE_PROGRAM=%MAKE% -DCMAKE_BUILD_TYPE=Release -DANDROID_NATIVE_API_LEVEL=android-21 -DANDROID_ABI=x86_64 -DANDROID_STL=c++_shared -DCMAKE_SUPPRESS_REGENERATION=1 -DBUILD_tools=0 -DBUILD_examples=0 -DBUILD_tests=0 -DBUILD_shared=0 %PATH_TO_CMAKE_FILE%

REM Now compile it
%MAKE%
mkdir %ANDROID_LIB_PATH%\Release\x64
move /y %ANDROID_BUILD_PATH%\libexpat.a %ANDROID_LIB_PATH%\Release\x64
popd
rmdir "%ANDROID_BUILD_PATH%" /s/q

echo Building for Android (x86 64-bit) Debug
mkdir "%ANDROID_BUILD_PATH%"
pushd "%ANDROID_BUILD_PATH%" 
%CMAKE_EXE% -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE="%ANDROID_TOOLCHAIN_FILE%" -DANDROID_NDK="%NDKROOT%" -DCMAKE_MAKE_PROGRAM=%MAKE% -DCMAKE_BUILD_TYPE=Debug -DANDROID_NATIVE_API_LEVEL=android-21 -DANDROID_ABI=x86_64 -DANDROID_STL=c++_shared -DCMAKE_SUPPRESS_REGENERATION=1 -DBUILD_tools=0 -DBUILD_examples=0 -DBUILD_tests=0 -DBUILD_shared=0 %PATH_TO_CMAKE_FILE%

REM Now compile it
%MAKE%
mkdir %ANDROID_LIB_PATH%\Debug\x64
move /y %ANDROID_BUILD_PATH%\libexpat.a %ANDROID_LIB_PATH%\Debug\x64
popd
rmdir "%ANDROID_BUILD_PATH%" /s/q

echo Building for Android (ARM 32-bit) Release
mkdir "%ANDROID_BUILD_PATH%"
pushd "%ANDROID_BUILD_PATH%" 
%CMAKE_EXE% -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE="%ANDROID_TOOLCHAIN_FILE%" -DANDROID_NDK="%NDKROOT%" -DCMAKE_MAKE_PROGRAM=%MAKE% -DCMAKE_BUILD_TYPE=Release -DANDROID_NATIVE_API_LEVEL=android-19 -DANDROID_ABI=armeabi-v7a -DANDROID_STL=c++_shared -DCMAKE_SUPPRESS_REGENERATION=1 -DBUILD_tools=0 -DBUILD_examples=0 -DBUILD_tests=0 -DBUILD_shared=0 %PATH_TO_CMAKE_FILE%

REM Now compile it
%MAKE%
mkdir %ANDROID_LIB_PATH%\Release\armv7
move /y %ANDROID_BUILD_PATH%\libexpat.a %ANDROID_LIB_PATH%\Release\armv7
popd
rmdir "%ANDROID_BUILD_PATH%" /s/q

echo Building for Android (ARM 32-bit) Debug
mkdir "%ANDROID_BUILD_PATH%"
pushd "%ANDROID_BUILD_PATH%" 
%CMAKE_EXE% -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE="%ANDROID_TOOLCHAIN_FILE%" -DANDROID_NDK="%NDKROOT%" -DCMAKE_MAKE_PROGRAM=%MAKE% -DCMAKE_BUILD_TYPE=Debug -DANDROID_NATIVE_API_LEVEL=android-19 -DANDROID_ABI=armeabi-v7a -DANDROID_STL=c++_shared -DCMAKE_SUPPRESS_REGENERATION=1 -DBUILD_tools=0 -DBUILD_examples=0 -DBUILD_tests=0 -DBUILD_shared=0 %PATH_TO_CMAKE_FILE%

REM Now compile it
%MAKE%
mkdir %ANDROID_LIB_PATH%\Debug\armv7
move /y %ANDROID_BUILD_PATH%\libexpat.a %ANDROID_LIB_PATH%\Debug\armv7
popd

echo Building for Android (x86 32-bit) Release
mkdir "%ANDROID_BUILD_PATH%"
pushd "%ANDROID_BUILD_PATH%" 
%CMAKE_EXE% -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE="%ANDROID_TOOLCHAIN_FILE%" -DANDROID_NDK="%NDKROOT%" -DCMAKE_MAKE_PROGRAM=%MAKE% -DCMAKE_BUILD_TYPE=Release -DANDROID_NATIVE_API_LEVEL=android-19 -DANDROID_ABI=x86 -DANDROID_STL=c++_shared -DCMAKE_SUPPRESS_REGENERATION=1 -DBUILD_tools=0 -DBUILD_examples=0 -DBUILD_tests=0 -DBUILD_shared=0 %PATH_TO_CMAKE_FILE%

REM Now compile it
%MAKE%
mkdir %ANDROID_LIB_PATH%\Release\x86
move /y %ANDROID_BUILD_PATH%\libexpat.a %ANDROID_LIB_PATH%\Release\x86
popd
rmdir "%ANDROID_BUILD_PATH%" /s/q

echo Building for Android (x86 32-bit) Debug
mkdir "%ANDROID_BUILD_PATH%"
pushd "%ANDROID_BUILD_PATH%" 
%CMAKE_EXE% -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE="%ANDROID_TOOLCHAIN_FILE%" -DANDROID_NDK="%NDKROOT%" -DCMAKE_MAKE_PROGRAM=%MAKE% -DCMAKE_BUILD_TYPE=Debug -DANDROID_NATIVE_API_LEVEL=android-19 -DANDROID_ABI=x86 -DANDROID_STL=c++_shared -DCMAKE_SUPPRESS_REGENERATION=1 -DBUILD_tools=0 -DBUILD_examples=0 -DBUILD_tests=0 -DBUILD_shared=0 %PATH_TO_CMAKE_FILE%

REM Now compile it
%MAKE%
mkdir %ANDROID_LIB_PATH%\Debug\x86
move /y %ANDROID_BUILD_PATH%\libexpat.a %ANDROID_LIB_PATH%\Debug\x86
popd
rmdir "%ANDROID_BUILD_PATH%" /s/q

