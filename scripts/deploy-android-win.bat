set ANDROID_HOME=C:/adt-bundle-windows-x86_64-20140321/sdk
set ANDROID_NDK_HOST=windows-x86_64
set ANDROID_NDK_PLATFORM=android-19
set ANDROID_NDK_ROOT=C:\android-ndk-r9d
set ANDROID_NDK_TOOLCHAIN_PREFIX=arm-linux-androideabi
set ANDROID_NDK_TOOLCHAIN_VERSION=4.8
set ANDROID_NDK_TOOLS_PREFIX=arm-linux-androideabi
set ANDROID_SDK_ROOT=C:/adt-bundle-windows-x86_64-20140321/sdk
set JAVA_HOME=C:/Program Files/Java/jdk1.8.0_05

c:\Qt\5.3\android_armv7\bin\qmake.exe -r
c:\Qt\Tools\mingw482_32\bin\mingw32-make.exe
c:\Qt\Tools\mingw482_32\bin\mingw32-make.exe install INSTALL_ROOT=./android-build

c:\QtOnline\5.3\android_armv7\bin\androiddeployqt.exe --input ./android-libHelloWorld.so-deployment-settings.json ^
--output ./android-build --deployment bundled --install --ant C:\apache-ant-1.9.4\bin\ant.bat ^
--android-platform android-19 --jdk C:\Program Files\Java\jdk1.8.0_05 --device DEVICE_ID
