@cls
set v=a_tag


git clean -f
git reset --hard

git checkout %v% || git status && exit

git reset HEAD~    && REM To see last commit diff in vscode...
code .
