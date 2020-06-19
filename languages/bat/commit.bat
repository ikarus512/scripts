@echo off

if "%*"=="" (
    echo empty
    set MSG="doc added"
) else (
    echo not empty
    set MSG="%*"
)
echo MSG=%MSG%

REM git fetch && git pull && git status
git add . && git commit -m %MSG% && git push
