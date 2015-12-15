#!/bin/bash

# opcoes
if [ "$1" != "" ]; then
	pid=$1
else
	echo "digite o PID:"
	read pid
fi

now=$(date +"%T")
echo "Start time: $now"

#count=172800 -- 720
#count=34560
count=720
count=2880 # 12h
i=0
#pid=$(ps | grep  'br.ufrgs.urbosenti')

while (($i < $count))
do
	dumpsys meminfo br.ufrgs.urbosenti >> memoryDump.out
	dumpsys cpuinfo br.ufrgs.urbosenti >> cpuDump.out
	ls -l /data/data/br.ufrgs.urbosenti/databases/urbosenti.db >> fileSize.out
	cat /proc/$(($pid))/stat >> cpuPidStat.out
	cat /proc/stat >> cpuStat.out
	sleep 5
	i=$(( i+1 ))
done
  
now=$(date +"%T")
echo "End time: $now"