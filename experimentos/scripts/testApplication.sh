## Experimento 1: Aplicacao com adaptacao
rm urbosenti.db 
now=$(date +"%T")
echo "Start time: $now"
# experimento 1 (Aplicação) - (0) porta; (1) Experimento; (2) tempo de parada(s); (3) intervalo entre uploads (ms); (4) com adaptação? (no e n significam nao, qualquer outra sim)
java -jar ExperimentalSensingModule.jar 55666 1 172800000 10000 no & 
sleep 3 
# busca o PID da tarefa anterior
pid=$(pidof 'java')
# processo de monitoramento
./monitoringProcess.sh $pid 
du -hsb --time urbosenti.db >> $(($pid))fileSize.out
rm urbosenti.db 
java -jar ExperimentalSensingModule.jar 55666 1 172800000 10000 yes & 
sleep 3 
# busca o PID da tarefa anterior
pid=$(pidof 'java')
# processo de monitoramento
./monitoringProcess.sh $pid 
du -hsb --time urbosenti.db >> $(($pid))fileSize.out
rm urbosenti.db 
java -jar ExperimentalSensingModule.jar 55666 1 172800000 10000 no & 
sleep 3 
# busca o PID da tarefa anterior
pid=$(pidof 'java')
# processo de monitoramento
./monitoringProcess.sh $pid 
du -hsb --time urbosenti.db >> $(($pid))fileSize.out
rm urbosenti.db 
java -jar ExperimentalSensingModule.jar 55666 1 172800000 10000 yes & 
sleep 3 
# busca o PID da tarefa anterior
pid=$(pidof 'java')
# processo de monitoramento
./monitoringProcess.sh $pid 
du -hsb --time urbosenti.db >> $(($pid))fileSize.out
now=$(date +"%T")
echo "End time: $now"
