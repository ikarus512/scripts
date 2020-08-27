@echo off
:: USAGE
::    scripts commit message
::    scripts commit
::    scripts status
::    scripts pull
::    scripts diff

REM cls
C:
cd C:/m/scripts
echo ##### REPOSITORY: git clone https://github.com/ikarus512/scripts

IF NOT "%1"=="commit" (
    IF "%*"=="" (echo Nothing to do) ELSE git %*
    exit 0
)

:: HERE if command is commit

:: Emulate command    set MSG="%2 %3 ..."
shift     &:: The shift command does not change %*. Do it manually into Args.
set Args=%1
:Parse
shift
set First=%1
if not defined First goto :EndParse
set Args=%Args% %First%
goto :Parse
:EndParse
set MSG=%Args%




git status

:: Choice from Y/N (1/2), default N, timeout 20 sec, message:
choice /C YN /D N /T 20 /M "Are you surely want to commit/push the changes? "
set CHOICE=%ERRORLEVEL%


IF "%CHOICE%"=="2" (
    echo "User declined to commit/push the changes."
    exit 0
)

IF "%MSG%"==""     SET /p MSG="Enter commit message: "

echo do git commit -m "%MSG%"


git config user.name ikarus512 && git config user.email ikarus512@yandex.ru && git config core.editor code
git pull || exit 1
git add . && git commit -m "%MSG%" && git push
