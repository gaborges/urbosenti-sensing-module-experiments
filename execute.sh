#java -jar ExperimentalSensingModule.jar 
# Exemplos abaixo
# experimento 1 (Aplicação) - (0) porta; (1) Experimento; (2) tempo de parada(s); (3) intervalo entre uploads 
java -jar ExperimentalSensingModule.jar 55666 1 172800 1 

# Experimento 2 (Eventos internos): (0) porta; (1) Experimento, (2) quantityOfEvents, 
# (3) quantityOfRules, (4) quantityOfConditions,(5) parâmetro nulo ,(6) nomeArquivoDeSaída
java -jar ExperimentalSensingModule.jar 55666 2 100 50 1 0 experimento01

# Experimento 3 (Interações): (0) porta; (1) Experimento, (2) modo de operação 1 (Escutador)
java -jar ExperimentalSensingModule.jar 55666 3 1

# Experimento 3 (Interações): (0) porta; (1) Experimento, (2) modo de operação 2 (Envia mensagens)
# (3) quantityOfEvents, (4) int quantityOfRules, (5) quantityOfConditions,
# (6) nomeArquivoDeSaída; (7) arquivo de lista de ips; (8) desligar escutadores?
java -jar ExperimentalSensingModule.jar 55666 3 2 20 50 1 experimento01 ipsAddresses.in yes

# Experimento 4 (Interações e eventos internos): (0) porta; (1) Experimento, (2) modo de operação 1 (Escutador)
java -jar ExperimentalSensingModule.jar 55666 4 1

# Experimento 4 (Interações e eventos internos): (0) porta; (1) Experimento, (2) modo de operação 2 (Envia mensagens)
# (3) quantityOfEvents, (4) int quantityOfRules, (5) quantityOfConditions,
# (6) nomeArquivoDeSaída; (7) arquivo de lista de ips; (8) desligar escutadores?
java -jar ExperimentalSensingModule.jar 55666 3 2 100 50 1 experimento01 ipsAddresses.in no

java -jar ExperimentalSensingModule.jar 55666 3 2 4000 1 1 interacoes01 ipsAddresses.in no


55666 2 100 100 1 0 experimento01

10.0.0.5
 10.0.0.6