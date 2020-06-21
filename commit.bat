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
REM git config user.name ikarus512 && git config user.email ikarus512 && git config core.editor code
git add . && git commit -m %MSG% && git push
