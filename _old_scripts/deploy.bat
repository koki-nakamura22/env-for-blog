powershell -NoProfile -ExecutionPolicy Unrestricted .\deploy.ps1

@echo off

REM REM Build the project.
REM hugo

REM REM Go to public directory.
REM cd public

REM REM Add changes to git.
REM git add .

REM REM Create a commit message.
REM set d=%date%
REM set yyyy=%d:~-8,4%
REM set mm=%d:~-11,2%
REM set dd=%d:~-0,2%
REM set t=%time: =0%
REM set hh=%t:~0,2%
REM set mn=%t:~3,2%
REM set ss=%t:~6,2%
REM set commitMsg=Site updated: %yyyy%-%mm%-%dd% %hh%:%mn%:%ss%

REM REM Commit.
REM git commit -m "%commitMsg%"

REM REM Push source and build repos.
REM git push origin master

REM REM Come back to the project root.
REM cd ..

REM echo "The web page has been updated!"
