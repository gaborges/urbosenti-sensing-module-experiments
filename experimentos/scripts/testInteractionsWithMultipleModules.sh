## Evaluation 5: interactions' impact in the adaptation process by interactiong with a multiple modules
now=$(date +"%T")
echo "Start time: $now"
java -jar ExperimentalSensingModule.jar 55666 3 2 100 1 1 'InteractionWithModules' ipsAddresses.in no
now=$(date +"%T")
echo "End time: $now"
