## Evaluation 4: interactions' impact in the adaptation process by interactiong with a unique agent
output='Interacao'
now=$(date +"%T")
echo "Start time: $now"
java -jar ExperimentalSensingModule.jar 55666 3 2 2000 0 0 'Interaction00' ipsAddresses.in no
java -jar ExperimentalSensingModule.jar 55666 3 2 2000 0 0 'Interaction01' ipsAddresses.in no
java -jar ExperimentalSensingModule.jar 55666 3 2 2000 0 0 'Interaction02' ipsAddresses.in no
java -jar ExperimentalSensingModule.jar 55666 3 2 2000 0 0 'Interaction03' ipsAddresses.in no
java -jar ExperimentalSensingModule.jar 55666 3 2 2000 0 0 'Interaction04' ipsAddresses.in no
java -jar ExperimentalSensingModule.jar 55666 3 2 2000 0 0 'Interaction05' ipsAddresses.in no
java -jar ExperimentalSensingModule.jar 55666 3 2 2000 0 0 'Interaction06' ipsAddresses.in no
java -jar ExperimentalSensingModule.jar 55666 3 2 2000 0 0 'Interaction07' ipsAddresses.in no
java -jar ExperimentalSensingModule.jar 55666 3 2 2000 0 0 'Interaction08' ipsAddresses.in no
java -jar ExperimentalSensingModule.jar 55666 3 2 2000 0 0 'Interaction09' ipsAddresses.in yes
now=$(date +"%T")
echo "End time: $now"
