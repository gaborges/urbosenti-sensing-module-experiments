/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package urbosenti;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import urbosenti.core.communication.PushServiceReceiver;
import urbosenti.core.communication.interfaces.WiredCommunicationInterface;
import urbosenti.core.communication.receivers.HTTPPushServiceReceiver;
import urbosenti.core.device.DeviceManager;
import urbosenti.core.device.model.Service;
import urbosenti.test.ConcreteApplicationHandler;
import urbosenti.test.DesktopOperationalSystemDiscovery;
import urbosenti.test.TestCommunication;
import urbosenti.test.TestECADiagnosisModel;
import urbosenti.test.TestManager;
import urbosenti.test.TestStaticPlanningModel;

/**
 *
 * @author Guilherme
 *
 *
 * falta todas as funções. 1) testar o push para interação. OBS.: falta
 * implementar os onCreate 2) modelar segundo modelo que fiz ontem 3) modelar e
 * implementar toda a comunicação e os eventos internos
 */
public class Main {

    /**
     *
     * @param args // Experimentos // Args: (0) porta; (1) Experimento; (2 ...)
     * depepende dos experimentos
     * <ul>
     * <li>Args Gerais: (0) porta; (1) Experimento; (2 ...) depende dos
     * experimentos</li>
     * <li>Experimento 1 (Aplicação): (2) tempo de parada; (3) intervalo entre uploads </li>
     * <li>Experimento 2 (Eventos internos): (2) quantityOfEvents, (3) int
     * quantityOfRules, (4) quantityOfConditions, (5) nomeArquivoDeSaída</li>
     * <li>Experimento 3 (Interações): (2) Modo de operação (1 ou 2); </li>
     * <li>Experimento 3 (Interações) - modo de operação 1 (Escutador): nenhum
     * parâmetro;</li>
     * <li>Experimento 3 (Interações) - modo de operação 2 (Envia mensagens):
     * (3) quantityOfEvents, (4) int quantityOfRules, (5) quantityOfConditions,
     * (6) nomeArquivoDeSaída; (7) arquivo de lista de ips; (8) desligar
     * escutadores?</li>
     * <li>Experimento 4 (Interações e eventos internos) - modo de operação 2
     * (Envia mensagens): (3) quantityOfEvents, (4) int quantityOfRules, (5)
     * quantityOfConditions, (6) nomeArquivoDeSaída; (7) arquivo de lista de
     * ips; (8) desligar escutadores?</li>
     * </ul>
     * @throws java.io.IOException
     * @throws java.lang.InterruptedException
     *
     */
    public static void main(String[] args) throws IOException, InterruptedException {

        System.out.println("Início experimento: " + (new Date()).getTime());
        String currentData = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").format(new Date());
        System.out.println("Início experimento: " + currentData);
        /**
         * *** Configuração do middleware pelo framework ****
         */
        // Instanciar componentes -- Device manager e os demais onDemand
        DeviceManager deviceManager = new DeviceManager(); // Objetos Core já estão incanciados internamente
        deviceManager.enableAdaptationComponent(); // Habilita componente de adaptação
        // adiciona os tradadores de evento cursomisados
        deviceManager.getAdaptationManager().setDiagnosisModel(
                new TestECADiagnosisModel(deviceManager));
        deviceManager.getAdaptationManager().setPlanningModel(
                new TestStaticPlanningModel(deviceManager));
        TestManager testManager;
        if (args.length >= 5) {  // tem 5 ou mais itens, então usa o parâmetro 5 do arquivo  
            testManager = new TestManager(deviceManager, args[6]);
        } else {
            testManager = new TestManager(deviceManager);
        }
        deviceManager.addComponentManager(testManager);
        // Adicionar as interfaces de comunicação suportadas --- Inicialmente manual. Após adicionar um processo automático
        deviceManager.addSupportedCommunicationInterface(new WiredCommunicationInterface());
        //deviceManager.addSupportedCommunicationInterface(new WirelessCommunicationInterface()); // não implementado
        //deviceManager.addSupportedCommunicationInterface(new MobileDataCommunicationInterface()); // não implementado
        //deviceManager.addSupportedCommunicationInterface(new DTNCommunicationInterface()); // não implementado

        // Adiciona o AplicationHandler da aplicação para tratamento de eventos da aplicação
        ConcreteApplicationHandler handler = new ConcreteApplicationHandler(deviceManager);
        deviceManager.getEventManager().subscribe(handler);
        // Execução - inicia todos os serviços e threads em background. Intanciar serviço de recebimento de mensagens
        //PushServiceReceiver teste = new SocketPushServiceReceiver(deviceManager.getCommunicationManager())
        PushServiceReceiver teste = new HTTPPushServiceReceiver(deviceManager.getCommunicationManager(), Integer.parseInt(args[0]));
        //DeliveryMessagingService delivaryService = new DeliveryMessagingService(deviceManager.getCommunicationManager());
        deviceManager.addSupportedInputCommunicationInterface(teste);

        deviceManager.setOSDiscovery(new DesktopOperationalSystemDiscovery());
        // Atribuir o modelo de conhecimento do dispositivo que será descoberto pelo mecanismo de adaptação --- Falta fazer - Guilherme    
        deviceManager.setDeviceKnowledgeRepresentationModel(new File("deviceKnowledgeModel.xml"), "xmlFile");
        // deviceManager.validateDeviceKnowledgeRepresentationModel();
        // deviceManager.setAgentKnowledgeRepresentationModel(Object o,String dataType);
        // deviceManager.validateAgentKnowledgeRepresentationModel();

        // Timer feito pela aplicação pode ser adicionado usando esse método:
        // deviceManager.getEventManager().setExternalEventTimer(new AndroidEventTimerFactory("AndroidEventTimer"));
        /**
         * *** Processo de descoberta das configurações adicionadas ****
         */
        // Processo de Descoberta, executa todos os onCreate's de todos os Componentes habilidatos do módudo de sensoriamento
        deviceManager.onCreate();

        try {
            /**
             * *** Processo de inicialização dos serviços ****
             */
            automaticStartup(deviceManager);
        } catch (IOException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            System.exit(-1);
        } catch (SQLException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }

        //manualStartup(deviceManager, teste);
        /**
         * *** Inicio das funções e aplicação de sensoriamento ****
         */
        // (1) Experimento
        switch (Integer.parseInt(args[1])) {
            case 1: // Experimento 1 (Aplicação): nenhum
                // Aplicação de sensoriamento blablabla
                // Testes
                TestCommunication tc = new TestCommunication(deviceManager);
                // experimento de aplicação
                try{
                    if (args.length < 4)
                        tc.test2(0, Long.parseLong(args[2]));
                    else
                        tc.test2(Long.parseLong(args[3]),Long.parseLong(args[2]));
                } catch (java.lang.ArrayIndexOutOfBoundsException ex){
                    tc.test2(0,Long.parseLong(args[2]));
                }
                break;
            case 2: //Experimento 2 (Eventos internos): 
                // (2) quantityOfEvents, (3) quantityOfRules, (4) quantityOfConditions, (5) nomeArquivoDeSaída
                testManager.startExperimentOfInternalEvents(
                        Integer.parseInt(args[2]),//quantityOfInteractions, 
                        Integer.parseInt(args[3]),//quantityOfRules, 
                        Integer.parseInt(args[4]));//quantityOfConditions, 
                testManager.waitEventsQueueBeFinished();
                break;
            case 3: // Experimento 3 (Interações): (2) Modo de operação (1 ou 2); 
                if (args[2].equals("1")) {
                    //modo de operação 1 (Escutador): nenhum parâmetro
                    testManager.startAndWaitExperiment();
                } else if (args[2].equals("2")) { // modo de operação 2 (Envia mensagens):
                    // (3) quantityOfEvents, (4) int quantityOfRules, (5) quantityOfConditions,
                    // (6) nomeArquivoDeSaída; (7) arquivo de lista de ips; (8) desligar escutadores?
                    // abrir arquivo e repetir eventos por agente extraído por porta e ip
                    ArrayList<String> ips = new ArrayList();
                    ArrayList<Integer> ports = new ArrayList<Integer>();
                    FileReader agentAddresses = new FileReader(args[7]); //  (6) arquivo de lista de ips; 
                    BufferedReader br = new BufferedReader(agentAddresses);
                    String s, ss[];
                    while ((s = br.readLine()) != null) {
                        ss = s.split(":");
                        ips.add(ss[0]);
                        ports.add(Integer.parseInt(ss[1]));
                    }
                    agentAddresses.close();
                    for (int i = 0; i < ips.size(); i++) {
                        testManager.startExperimentOfContinuosInteractionEvents(
                                Integer.parseInt(args[3]),//quantityOfInteractions, 
                                Integer.parseInt(args[4]),//quantityOfRules, 
                                Integer.parseInt(args[5]),//quantityOfConditions, 
                                ips.get(i),
                                ports.get(i));
                    }
                    testManager.waitEventsQueueBeFinished();
                    args[8] = args[8].trim();
                    // testar se precisa desligar
                    if (args[8].equals("sim") || args[8].equals("yes") || args[8].equals("s") || args[8].equals("y")) {
                        testManager.stopAgents(ips, ports);
                        Thread.sleep(5000);
                    }
                }
                break;
            case 4: //Experimento 4 (Interações e eventos internos)
                if (args[3].equals("1")) {
                    //modo de operação 1 (Escutador): nenhum parâmetro
                    testManager.startAndWaitExperiment();
                } else if (args[3].equals("2")) { // modo de operação 2 (Envia mensagens):
                    // (2) quantityOfEvents, (3) int quantityOfRules, (4) quantityOfConditions,
                    // (5) nomeArquivoDeSaída; (6) arquivo de lista de ips; (7) desligar escutadores?
                    ArrayList<String> ips = new ArrayList();
                    ArrayList<Integer> ports = new ArrayList<Integer>();
                    FileReader agentAddresses = new FileReader(args[7]); //  (6) arquivo de lista de ips; 
                    BufferedReader br = new BufferedReader(agentAddresses);
                    String s, ss[];
                    while ((s = br.readLine()) != null) {
                        ss = s.split(":");
                        ips.add(ss[0]);
                        ports.add(Integer.parseInt(ss[1]));
                    }
                    agentAddresses.close();
                    for (int i = 0; i < ips.size(); i++) {
                        testManager.startExperimentOfInteractionEvents(
                                Integer.parseInt(args[3]),//quantityOfInteractions, 
                                Integer.parseInt(args[4]),//quantityOfRules, 
                                Integer.parseInt(args[5]),//quantityOfConditions, 
                                ips.get(i),
                                ports.get(i));
                    }
                    args[8] = args[8].trim();
                    // testar se precisa desligar
                    if (args[8].equals("sim") || args[8].equals("yes") || args[8].equals("s") || args[8].equals("y")) {
                        testManager.stopAgents(ips, ports);
                    }
                    testManager.waitEventsQueueBeFinished();
                }
                break;
        }

        deviceManager.stopUrboSentiServices();
        System.out.println("Fim experimento: " + (new Date()).getTime());
        currentData = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").format(new Date());
        System.out.println("Fim experimento: " + currentData);
        System.exit(0);
    }

    public static void manualStartup(DeviceManager deviceManager, PushServiceReceiver teste) {
        deviceManager.getAdaptationManager().start();

        // Inicia o serviço de upload -- Testar em breve
        //Thread uploader = new Thread(deviceManager.getCommunicationManager());
        //uploader.start();
        // Inicia o serviço de Push, para receber mensagens do servidor. OBS.: Utilizar implementações nativas, com GCM ou o Iphone Push Service
        teste.start();

        Thread t = new Thread(deviceManager.getAdaptationManager());
        t.start();

        deviceManager.getAdaptationManager().stop();

        /**
         * *** Registro do nó de sensoriamento móvel no servidor de aplicação -
         * falta fazer a função e o servidor ****
         */
        // busca o servidor backend cadastrado no conhecimento inicial
        Service backendServer = deviceManager.getBackendService();

        try {
            // Registrar no Servidor Backend
            deviceManager.registerSensingModule(backendServer);
        } catch (IOException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            System.exit(-1);
        }

        try {
            // Adicionar o servidor da aplicação como servidor para upload
            deviceManager.setUpCommunicationUrboSentiServices();
        } catch (SQLException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Iniciar serviço de upload
        deviceManager.getCommunicationManager().startAllCommunicationServices();
    }

    public static void automaticStartup(DeviceManager deviceManager) throws IOException, SQLException {
        deviceManager.startUrboSentiServices();
    }

}
