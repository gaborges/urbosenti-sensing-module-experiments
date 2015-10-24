## Experimento 2: Avaliação de desempenho de acordo com o número de eventos
echo "quantidade de condições"
# opcoes
if [ "$1" != "" ]; then
	conditions=$1
else
	echo "digite o PID:"
	read conditions
fi

now=$(date +"%T")
echo "Start time: $now"
java -jar ExperimentalSensingModule.jar 55666 2 30 100 $(($conditions)) 0 experimento01
java -jar ExperimentalSensingModule.jar 55666 2 30 100 $(($conditions)) 0 experimento02
java -jar ExperimentalSensingModule.jar 55666 2 30 100 $(($conditions)) 0 experimento03
java -jar ExperimentalSensingModule.jar 55666 2 30 100 $(($conditions)) 0 experimento04
java -jar ExperimentalSensingModule.jar 55666 2 30 100 $(($conditions)) 0 experimento05
java -jar ExperimentalSensingModule.jar 55666 2 30 200 $(($conditions)) 0 experimento06
java -jar ExperimentalSensingModule.jar 55666 2 30 200 $(($conditions)) 0 experimento07
java -jar ExperimentalSensingModule.jar 55666 2 30 200 $(($conditions)) 0 experimento08
java -jar ExperimentalSensingModule.jar 55666 2 30 200 $(($conditions)) 0 experimento09
java -jar ExperimentalSensingModule.jar 55666 2 30 200 $(($conditions)) 0 experimento10
java -jar ExperimentalSensingModule.jar 55666 2 30 400 $(($conditions)) 0 experimento11
java -jar ExperimentalSensingModule.jar 55666 2 30 400 $(($conditions)) 0 experimento12
java -jar ExperimentalSensingModule.jar 55666 2 30 400 $(($conditions)) 0 experimento13
java -jar ExperimentalSensingModule.jar 55666 2 30 400 $(($conditions)) 0 experimento14
java -jar ExperimentalSensingModule.jar 55666 2 30 400 $(($conditions)) 0 experimento15
java -jar ExperimentalSensingModule.jar 55666 2 30 800 $(($conditions)) 0 experimento16
java -jar ExperimentalSensingModule.jar 55666 2 30 800 $(($conditions)) 0 experimento17
java -jar ExperimentalSensingModule.jar 55666 2 30 800 $(($conditions)) 0 experimento18
java -jar ExperimentalSensingModule.jar 55666 2 30 800 $(($conditions)) 0 experimento19
java -jar ExperimentalSensingModule.jar 55666 2 30 800 $(($conditions)) 0 experimento20
java -jar ExperimentalSensingModule.jar 55666 2 30 1600 $(($conditions)) 0 experimento21
java -jar ExperimentalSensingModule.jar 55666 2 30 1600 $(($conditions)) 0 experimento22
java -jar ExperimentalSensingModule.jar 55666 2 30 1600 $(($conditions)) 0 experimento23
java -jar ExperimentalSensingModule.jar 55666 2 30 1600 $(($conditions)) 0 experimento24
java -jar ExperimentalSensingModule.jar 55666 2 30 1600 $(($conditions)) 0 experimento25
now=$(date +"%T")
echo "End time: $now"  