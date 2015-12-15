## Evaluation 4: interactions' impact in the adaptation process by interactiong with a unique agent
output='Interacao'
now=$(date +"%T")
echo "Start time: $now"
java -jar ExperimentalSensingModule.jar 55666 3 2 4000 1 1 $output'00' ipsAddresses.in no
now=$(date +"%T")
echo "End time: $now"
