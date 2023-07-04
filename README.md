# Bash-Scripting
Some useful bash scripts

## contents

- system monitoring :
This directory includes a bash script which monitors the system resources such as memory and cpu usage. It raises a warning whenever the usage passes the defined threshold.
A service have been created based on this script which starts whenever the system boots.

- network scripts :
A bash script which connects to a webpage remotely using post request and check the connection with a given period to maintain the connection.
There is also a script named "shecan.sh" which changes the DNS.
Services of both these scripts are also available.

- mount-NTFS :
For users who use Ubuntu besides Windows in dual boot, there might be some problems with mounting NTFS files. This script handle this probable issue by correctly mounting the NTFS disks.
