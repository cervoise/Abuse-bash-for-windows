# Abuse-bash-for-windows
Pentest scripts for abuse Bash on Windows (Cygwin/WSL) - HackLu 2018
- Slides: Wait for upload.
- Video: https://www.youtube.com/watch?v=X0h8sNBmB3c

## Backdoor

Some simple backdoors for bash on Windows.

### Elevate
Used to ask for elevation when Cygwin/WSL is runned.

Please:
- (only for WSL) replace victim by your targeted user in "c:\users\victim\BashUpdate.bat"
- insert you payload in "echo yourPayload > BashUpdate.bat"

Compromission hint: elevation is asked every time. For WSL is an update is needed, password will be asked but no update will be done.

### Get Hash

Is the script, replace "yourIp" by the IP used by your Responder (https://github.com/SpiderLabs/Responder) server.

### Steal password

You can replace the part where the password is written somewhere by sending the password with curl.

#### WSL/Cygwin-fake-win-password-prompt.bat

Create a fake password prompt at bash startup (for update).

Compromission hint: password is asked every time. For WSL is an update is needed, password will be asked but no update will be done.

#### WSL-fake-sudo.bat

Create a fake sudo script for WSL. Every time the user will ask for sudo, a fake password prompt will be runned. After that the real sudo binary will be called.

Compromission hint: the first password is always wrong. If the user failed at each attempts, he will have performed four attempts, which is unusual.

## Metasploit module

This is a module that extract /etc/shadow files from Linux filesystems (from WSL) for every user (if run as non admin, only the current user can be checked).

Known bug: if there is no /etc/shadow file, an empty file is downloaded.
