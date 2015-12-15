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
#count=12
#count=34560 #48h
#count=720
count=8640 # 12h
i=0
#pid=$(ps | grep  'br.ufrgs.urbosenti')

while (($i < $count))
do
	adb shell dumpsys meminfo br.ufrgs.urbosenti >> memoryDump.out
	adb shell dumpsys cpuinfo br.ufrgs.urbosenti >> cpuDump.out
	adb shell ls -l /data/data/br.ufrgs.urbosenti/databases/urbosenti.db >> fileSize.out
	adb shell cat /proc/$(($pid))/stat >> cpuPidStat.out
	adb shell cat /proc/stat >> cpuStat.out
	sleep 5
	i=$(( i+1 ))
done
  adb -d shell "run-as br.ufrgs.urbosenti cat /data/data/br.ufrgs.urbosenti/databases/urbosenti.db > /sdcard/urbosenti.db"
  adb pull /sdcard/urbosenti.db .
now=$(date +"%T")
echo "End time: $now"