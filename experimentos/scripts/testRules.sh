## Evaluation 2: rules' impact in the adaptation process
now=$(date +"%T")
echo "Start time: $now"
java -jar ExperimentalSensingModule.jar 55666 2 100 50 1 0 'Rules50'
java -jar ExperimentalSensingModule.jar 55666 2 100 100 1 0 'Rules100'
java -jar ExperimentalSensingModule.jar 55666 2 100 200 1 0 'Rules200'
java -jar ExperimentalSensingModule.jar 55666 2 100 300 1 0 'Rules300'
java -jar ExperimentalSensingModule.jar 55666 2 100 400 1 0 'Rules400'
java -jar ExperimentalSensingModule.jar 55666 2 100 600 1 0 'Rules600'
java -jar ExperimentalSensingModule.jar 55666 2 100 800 1 0 'Rules800'
java -jar ExperimentalSensingModule.jar 55666 2 100 1000 1 0 'Rules1000'
java -jar ExperimentalSensingModule.jar 55666 2 100 1200 1 0 'Rules1200'
java -jar ExperimentalSensingModule.jar 55666 2 100 1400 1 0 'Rules1400'
java -jar ExperimentalSensingModule.jar 55666 2 100 1600 1 0 'Rules1600'
java -jar ExperimentalSensingModule.jar 55666 2 100 2000 1 0 'Rules2000'
java -jar ExperimentalSensingModule.jar 55666 2 100 2400 1 0 'Rules2400'
java -jar ExperimentalSensingModule.jar 55666 2 100 2800 1 0 'Rules2800'
java -jar ExperimentalSensingModule.jar 55666 2 100 3200 1 0 'Rules3200'
java -jar ExperimentalSensingModule.jar 55666 2 100 4000 1 0 'Rules4000'
now=$(date +"%T")
echo "End time: $now"
