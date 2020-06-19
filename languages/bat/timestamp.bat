@echo off
REM https://ss64.com/nt/for_f.html
REM cmd /c date /t
REM cmd /c time /t
REM echo time=%TIME%
For /f "tokens=1,2,3 delims=- " %%a in ('cmd /c date /t') do (set mydate=%%a%%b%%c)
For /f "tokens=1-2 delims=/:" %%a in ('cmd /c time /t') do (set mytime12=%%a%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)
echo %mydate%_%mytime%

For /f "tokens=1-6 delims=/:-," %%a in ("%DATE%-%TIME%") do (set timestamp=%%a%%b%%c_%%d%%e%%f)
echo %timestamp%
