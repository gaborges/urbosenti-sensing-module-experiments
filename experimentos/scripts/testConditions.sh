## Evaluation 1: conditions' impact in the adaptation process
output='condicao'
now=$(date +"%T")
echo "Start time: $now"
java -jar ExperimentalSensingModule.jar 55666 2 100 1 0 0 'Conditions00'
java -jar ExperimentalSensingModule.jar 55666 2 100 1 1 0 'Conditions01'
java -jar ExperimentalSensingModule.jar 55666 2 100 1 2 0 'Conditions02'
java -jar ExperimentalSensingModule.jar 55666 2 100 1 3 0 'Conditions03'
java -jar ExperimentalSensingModule.jar 55666 2 100 1 4 0 'Conditions04'
java -jar ExperimentalSensingModule.jar 55666 2 100 1 5 0 'Conditions05'
java -jar ExperimentalSensingModule.jar 55666 2 100 1 6 0 'Conditions06'
java -jar ExperimentalSensingModule.jar 55666 2 100 1 7 0 'Conditions07'
java -jar ExperimentalSensingModule.jar 55666 2 100 1 8 0 'Conditions08'
java -jar ExperimentalSensingModule.jar 55666 2 100 1 9 0 'Conditions09'
java -jar ExperimentalSensingModule.jar 55666 2 100 1 10 0 'Conditions10'
now=$(date +"%T")
echo "End time: $now"
