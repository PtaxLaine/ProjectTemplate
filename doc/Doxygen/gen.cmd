@echo off
SETLOCAL

(git log -n 1 --pretty=format:"PROJECT_NUMBER=\"%%s / %%h / %%ai\"") > %TMP%\88cbf43e-d887-4a1d-ab43-e1b5fc44744d.txt
if %errorlevel% EQU 0 (set /P scm=<%TMP%\88cbf43e-d887-4a1d-ab43-e1b5fc44744d.txt) else (set scm=PROJECT_NUMBER=)
del %TMP%\88cbf43e-d887-4a1d-ab43-e1b5fc44744d.txt

set inp=INPUT += ../../src ::EDIT IT
set pname=PROJECT_NAME="EXAMPLE" ::EDIT IT
set brief=PROJECT_BRIEF="EXAMPLE" ::EDIT IT
set outdir=OUTPUT_DIRECTORY=./EXAMPLE ::EDIT IT
(type DoxyfileTemplate & echo %brief%  & echo %pname% & echo %inp% & echo %outdir% & echo %scm%) | doxygen.exe -

ENDLOCAL
