call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\vc\vcvarsall.bat" x86_amd64
c:\qt\5.3\winrt_x64\bin\qmake.exe ..\HelloWorld\HelloWorld.pro -r
c:\qt\Tools\QtCreator\bin\jom.exe
c:\qt\5.3\winrt_x64\bin\windeployqt.exe .\release\HelloWorld.exe --qmldir ..\HelloWorld
c:\qt\5.3\winrt_x64\bin\winrtrunner --profile appx --device 0 --install --start --stop --wait 0 .\release\HelloWorld.exe

