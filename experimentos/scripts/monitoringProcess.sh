#!/bin/bash

echo "monitor de rede, io, memoria e CPU"
# opcoes
if [ "$1" != "" ]; then
	pid=$1
else
	echo "digite o PID:"
	read pid
fi

#parametros
#count=43200
#count=5
count=172800
i=0
interval=2
interval=1
sleepSeconds=$(($count * $interval))

now=$(date +"%T")
echo "Start time: $now"
#processos

pidstat -p $(($pid)) -h -d $(($interval)) $(($count)) > $(($pid))io.out & 
pidstat -p $(($pid)) -h -u $(($interval)) $(($count)) > $(($pid))cpu.out & 
pidstat -p $(($pid)) -h -r $(($interval)) $(($count)) > $(($pid))memory.out & 
ifstat -t -q $(($interval)) $(($count)) > $(($pid))network.out &

while (($i < $count))
do
	du -hsb --time urbosenti.db >> $(($pid))fileSize.out & 
	sleep $interval 
	i=$(( i+1 ))
done
	
	
#dormir
wait
now=$(date +"%T")
echo "Sleeped time: $sleepSeconds"
echo "Monitoring Process was finished"
echo "End time: $now"
