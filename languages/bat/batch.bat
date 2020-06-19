
REM https://www.tutorialspoint.com/batch_script/batch_script_variables.htm
REM http://steve-jansen.github.io/guides/windows-batch-scripting/part-5-if-then-conditionals.html

IF EXIST "temp.txt" (
    ECHO found
) ELSE (
    ECHO not found
)
