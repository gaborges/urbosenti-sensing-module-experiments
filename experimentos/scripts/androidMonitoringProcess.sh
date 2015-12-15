#!/bin/bash

now=$(date +"%T")
echo "Start time: $now"

pid=$(ps | grep  'br.ufrgs.urbosenti')
dumpsys meminfo br.ufrgs.urbosenti >> memoryDump.out
dumpsys cpuinfo br.ufrgs.urbosenti >> cpuDump.out
ls -l /data/data/br.com.urbosenti/databases/urbosenti.db >> fileSize.out
cat /proc/$(($pid))/stat >> cpuPidStat.out
cat /proc/stat >> cpuStat.out
  
now=$(date +"%T")
echo "End time: $now"