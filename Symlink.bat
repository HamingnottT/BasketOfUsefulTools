@echo off

echo ========================================================================
echo This script will create the symlinks necessary for connecting different
echo directories.
echo ========================================================================

echo.
echo.
echo ~~~ Contruction of the Symlink ~~~
echo.
echo.

echo.
echo Input Symlink type:
echo.
echo    f = file
echo    d = directory
echo    j = junction
echo.
set /p symType=Symlink type:   
echo.

echo.
echo -------------------------------------
echo.

echo.
echo Please input the target directory that will hold the Symlink:
echo Format in drive:\path\to\dir
echo.
@REM source folder of symlink			
set /p getCurrentDir=Target dir:       
echo.

echo.
echo -------------------------------------
echo.

echo.
@REM User input of new mod directory
echo.
echo Please input the desired Symlink name:
echo.

set /p modFolderInput=Desired name:  
echo.

echo.
echo.
echo ~~~ Pointing The New Symlink To The Source Folder ~~~
echo.
echo.

echo.
echo Please input the source directory that the Symlink will read from:
echo Format in drive:\path\to\dir\DesiredNameIfAny
echo.
@REM target folder for symlink
set /p targetOutput=Source dir:     
echo.   

echo.
echo -------------------------------------
echo.

echo.
echo Please input the source drive letter (eg. "C:", or "E:") :
echo.
echo NOTE: Must be same as source dir from above
echo.
set /p sourceLetter=Source drive:   
echo.

cd /d %sourceLetter%:\

echo.
echo ------------------------------------------------------------------------
echo.

echo.
echo Making Symlink at target %targetOutput%\%modFolderInput%
echo.

if %symType%==f (
mkdir "%targetOutput%"
mklink "%getCurrentDir%\%modFolderInput%" "%targetOutput%"
)

if %symType%==d (
    mkdir "%targetOutput%"
    mklink /d "%getCurrentDir%\%modFolderInput%" "%targetOutput%"
)

if %symType%==j (
    mkdir "%targetOutput%"
    mklink /j "%getCurrentDir%\%modFolderInput%" "%targetOutput%"
)

echo.
echo You should now be able to move any installed contents into this folder.
echo.

echo.
echo ------------------------------------------------------------------------
echo.


pause