@echo off

if "%*"=="" (
    set MSG="default msg"
) else (
    set MSG="%*"
)
echo MSG=%MSG%

REM git fetch && git pull && git status
git config user.name ikarus512 && git config user.email ikarus512@yandex.ru && git config core.editor code
git pull
git add . && git commit -m %MSG% && git push
