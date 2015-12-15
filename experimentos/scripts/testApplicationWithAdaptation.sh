## Experimento 1: Aplicacao com adaptacao
now=$(date +"%T")
echo "Start time: $now"
java -jar ExperimentalSensingModule.jar 55666 1 172800000 
now=$(date +"%T")
echo "End time: $now"
