## Experimento 1: Avaliação de desempenho por condições 
now=$(date +"%T")
echo "Start time: $now"
java -jar ExperimentalSensingModule.jar 55666 2 30 100 0 0 experimento01
java -jar ExperimentalSensingModule.jar 55666 2 30 100 1 0 experimento02
java -jar ExperimentalSensingModule.jar 55666 2 30 100 2 0 experimento03
java -jar ExperimentalSensingModule.jar 55666 2 30 100 3 0 experimento04
java -jar ExperimentalSensingModule.jar 55666 2 30 100 4 0 experimento05
java -jar ExperimentalSensingModule.jar 55666 2 30 200 0 0 experimento06
java -jar ExperimentalSensingModule.jar 55666 2 30 200 1 0 experimento07
java -jar ExperimentalSensingModule.jar 55666 2 30 200 2 0 experimento08
java -jar ExperimentalSensingModule.jar 55666 2 30 200 3 0 experimento09
java -jar ExperimentalSensingModule.jar 55666 2 30 200 4 0 experimento10
java -jar ExperimentalSensingModule.jar 55666 2 30 400 0 0 experimento11
java -jar ExperimentalSensingModule.jar 55666 2 30 400 1 0 experimento12
java -jar ExperimentalSensingModule.jar 55666 2 30 400 2 0 experimento13
java -jar ExperimentalSensingModule.jar 55666 2 30 400 3 0 experimento14
java -jar ExperimentalSensingModule.jar 55666 2 30 400 4 0 experimento15
java -jar ExperimentalSensingModule.jar 55666 2 30 800 0 0 experimento16
java -jar ExperimentalSensingModule.jar 55666 2 30 800 1 0 experimento17
java -jar ExperimentalSensingModule.jar 55666 2 30 800 2 0 experimento18
java -jar ExperimentalSensingModule.jar 55666 2 30 800 3 0 experimento19
java -jar ExperimentalSensingModule.jar 55666 2 30 800 4 0 experimento20
java -jar ExperimentalSensingModule.jar 55666 2 30 1600 0 0 experimento21
java -jar ExperimentalSensingModule.jar 55666 2 30 1600 1 0 experimento22
java -jar ExperimentalSensingModule.jar 55666 2 30 1600 2 0 experimento23
java -jar ExperimentalSensingModule.jar 55666 2 30 1600 3 0 experimento24
java -jar ExperimentalSensingModule.jar 55666 2 30 1600 4 0 experimento25
now=$(date +"%T")
echo "End time: $now"  