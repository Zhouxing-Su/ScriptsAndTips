@set cpu=
@setlocal enabledelayedexpansion
@for /f "delims= skip=1" %%a in ('wmic cpu get Name') do @set cpu=!cpu!%%a
@setlocal disabledelayedexpansion
@set cpu=%cpu: =%
echo %cpu%