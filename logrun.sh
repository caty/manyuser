#!/bin/sh

cd `dirname $0`
ulimit -n 512000

python_ver=$(ls /usr/bin|grep -e "^python[23]\.[1-9]\+$"|tail -1)
eval $(ps -ef | grep "[0-9] ${python_ver} server\\.py m" | awk '{print "kill "$2}')

${python_ver} server.py m> ssserver.log
