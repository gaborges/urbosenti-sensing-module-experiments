## Evaluation: 1, 2 and 3
output='condicao'
now=$(date +"%T")
rm urbosenti.db
echo "Start Condition Experiment Time: $now" 
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
echo "End Condition Experiment time: $now"
rm urbosenti.db
now=$(date +"%T")
echo "Start rule experiment time: $now"
java -jar ExperimentalSensingModule.jar 55666 2 100 50 0 0 'Rules50' 
java -jar ExperimentalSensingModule.jar 55666 2 100 100 0 0 'Rules100' 
java -jar ExperimentalSensingModule.jar 55666 2 100 200 0 0 'Rules200' 
java -jar ExperimentalSensingModule.jar 55666 2 100 300 0 0 'Rules300' 
java -jar ExperimentalSensingModule.jar 55666 2 100 400 0 0 'Rules400' 
java -jar ExperimentalSensingModule.jar 55666 2 100 600 0 0 'Rules600' 
java -jar ExperimentalSensingModule.jar 55666 2 100 800 0 0 'Rules800' 
java -jar ExperimentalSensingModule.jar 55666 2 100 1000 0 0 'Rules1000' 
java -jar ExperimentalSensingModule.jar 55666 2 100 1200 0 0 'Rules1200' 
java -jar ExperimentalSensingModule.jar 55666 2 100 1400 0 0 'Rules1400' 
java -jar ExperimentalSensingModule.jar 55666 2 100 1600 0 0 'Rules1600' 
java -jar ExperimentalSensingModule.jar 55666 2 100 2000 0 0 'Rules2000' 
java -jar ExperimentalSensingModule.jar 55666 2 100 2400 0 0 'Rules2400' 
java -jar ExperimentalSensingModule.jar 55666 2 100 2800 0 0 'Rules2800' 
java -jar ExperimentalSensingModule.jar 55666 2 100 3200 0 0 'Rules3200' 
java -jar ExperimentalSensingModule.jar 55666 2 100 4000 0 0 'Rules4000' 
now=$(date +"%T")
echo "End  rule experiment time: $now"
rm urbosenti.db
now=$(date +"%T")
echo "Start event experiment time: $now"
java -jar ExperimentalSensingModule.jar 55666 2 1000 0 0 0 'Events00' 
java -jar ExperimentalSensingModule.jar 55666 2 1000 0 0 0 'Events01' 
java -jar ExperimentalSensingModule.jar 55666 2 1000 0 0 0 'Events02' 
java -jar ExperimentalSensingModule.jar 55666 2 1000 0 0 0 'Events03' 
java -jar ExperimentalSensingModule.jar 55666 2 1000 0 0 0 'Events04' 
java -jar ExperimentalSensingModule.jar 55666 2 1000 0 0 0 'Events05' 
java -jar ExperimentalSensingModule.jar 55666 2 1000 0 0 0 'Events06' 
java -jar ExperimentalSensingModule.jar 55666 2 1000 0 0 0 'Events07' 
java -jar ExperimentalSensingModule.jar 55666 2 1000 0 0 0 'Events08' 
java -jar ExperimentalSensingModule.jar 55666 2 1000 0 0 0 'Events09' 
java -jar ExperimentalSensingModule.jar 55666 2 1000 0 0 0 'Events10' 
now=$(date +"%T")
echo "End event experiment time: $now"

