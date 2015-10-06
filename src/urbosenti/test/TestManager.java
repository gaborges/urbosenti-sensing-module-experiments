/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package urbosenti.test;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import urbosenti.core.device.ComponentManager;
import urbosenti.core.device.DeviceManager;
import urbosenti.core.device.model.FeedbackAnswer;
import urbosenti.core.events.Action;
import urbosenti.core.events.Event;
import urbosenti.core.events.SystemEvent;
import urbosenti.util.DeveloperSettings;

/**
 *
 * @author Guilherme
 */
public class TestManager extends ComponentManager implements Runnable {

    /**
     * int EVENT_GENERIC_EVENT = 1; </ br>
     *
     * <ul><li>id: 1</li>
     * <li>evento: Evento Genérico</li>
     * <li>parâmetros: Quantidade de regras (rules); quantidade de condições
     * (conditions);</li></ul>
     *
     */
    public static final int EVENT_GENERIC_EVENT = 1;
    /**
     * int EVENT_START_INTERACTION = 2; </ br>
     *
     * <ul><li>id: 2</li>
     * <li>evento: Iniciar interação</li>
     * <li>parâmetros: ip (ip); porta (port);Quantidade de regras (rules); uid
     * (uid); quantidade de condições (conditions);</li></ul>
     *
     */
    public static final int EVENT_START_INTERACTION = 2;
    /**
     * int EVENT_SHUTDOWN_ANOTHER_AGENT = 3; </ br>
     *
     * <ul><li>id: 3</li>
     * <li>evento: Parar execução de outro agente</li>
     * <li>parâmetros: ip (ip); porta (port);uid (uid)</li></ul>
     *
     */
    public static final int EVENT_SHUTDOWN_ANOTHER_AGENT = 3;
    /*
     *********************************************************************
     ***************************** Actions ******************************* 
     *********************************************************************
     */
    /**
     * int ACTION_GENERIC_ACTION = 1;
     *
     * <ul><li>id: 1</li>
     * <li>ação: Ação genérica</li>
     * <li>parâmetros: evento que engatilhou (event)</li></ul>
     *
     */
    public static final int ACTION_GENERIC_ACTION = 1;
    /**
     * int ACTION_INTERACTION_RESULT = 2;
     *
     * <ul><li>id: 2</li>
     * <li>ação: Ação de resposta da interação</li>
     * <li>parâmetros: id o evento (eventId); tempo do evento (timestampEvent);
     * ip (ip); porta(port)</li></ul>
     *
     */
    public static final int ACTION_INTERACTION_RESULT = 2;
    /**
     * int ACTION_SHUTDOWN = 3;
     *
     * <ul><li>id: 3</li>
     * <li>ação: Ação de para parar execução</li>
     * <li>parâmetros: nenhum</li></ul>
     *
     */
    public static final int ACTION_SHUTDOWN = 3;
    /*
     *********************************************************************
     ***************************** Interactions ******************************* 
     *********************************************************************
     */
    /**
     * int INTERACTION_REQUEST_RESPONSE = 11;
     *
     * <ul><li>id: 11</li>
     * <li>ação: Interação para requirir resposta</li>
     * <li>parâmetros: id do evento (eventId);tempo de evento
     * (timestampEvent)</li></ul>
     *
     */
    public static final int INTERACTION_REQUEST_RESPONSE = 11;
    /**
     * int INTERACTION_ANSWER_THE_REQUEST_RESPONSE = 12;
     *
     * <ul><li>id: 12</li>
     * <li>ação: Interação para responder a requisição</li>
     * <li>parâmetros: id do evento (eventId);tempo de evento
     * (timestampEvent);ip(ip);porta(port)</li></ul>
     *
     */
    public static final int INTERACTION_ANSWER_THE_REQUEST_RESPONSE = 12;
    /**
     * int INTERACTION_REQUEST_SHUTDOWN = 13;
     *
     * <ul><li>id: 13</li>
     * <li>ação: Interação para desligar agente</li>
     * <li>parâmetros: nenhum</li></ul>
     *
     */
    public static final int INTERACTION_REQUEST_SHUTDOWN = 13;
    /*
     *********************************************************************
     ***************************** Outras constantes ******************************* 
     *********************************************************************
     */
    public static final int ENTITY_TEST_ENTITY = 1;
    public static final int COMPONENT_ID = 11;

    private final DeviceManager deviceManager;
    private final FileWriter experimentalResults;
    private final BufferedWriter writer;
    
    private Thread thread;
    private boolean shudown;

    public TestManager(DeviceManager deviceManager, String filesName) throws IOException {
        super(deviceManager, COMPONENT_ID);
        this.deviceManager = deviceManager;
        this.experimentalResults = new FileWriter(new File("actionResults" + filesName + ".out"));
        this.writer = new BufferedWriter(this.experimentalResults);
        this.shudown = false;
    }

    public TestManager(DeviceManager deviceManager) throws IOException {
        this(deviceManager, "");
    }

    public void startExperimentOfInternalEvents(int quantityOfEvents, int quantityOfRules, int quantityOfConditions) {
        Event event;
        HashMap<String, Object> values;
        for (int i = 0; i < quantityOfEvents; i++) {
            event = new SystemEvent(this);
            event.setId(EVENT_GENERIC_EVENT);
            event.setName("Generic test event!");
            values = new HashMap<String, Object>();
            values.put("rules", quantityOfRules);
            values.put("conditions", quantityOfConditions);
            event.setParameters(values);
            event.setEntityId(ENTITY_TEST_ENTITY);
            deviceManager.getEventManager().newEvent(event);
        }
    }

    public void startExperimentOfInteractionEvents(int quantityOfInteractions, int quantityOfRules, int quantityOfConditions, String ip, int port) {
        Event event;
        HashMap<String, Object> values;
        for (int i = 0; i < quantityOfInteractions; i++) {
            event = new SystemEvent(this);
            event.setId(EVENT_START_INTERACTION);
            event.setName("Generic interaction event!");
            values = new HashMap<String, Object>();
            values.put("ip", ip);
            values.put("port", port);
            values.put("rules", quantityOfRules);
            values.put("conditions", quantityOfConditions);
            values.put("uid", "any");
            event.setParameters(values);
            event.setEntityId(ENTITY_TEST_ENTITY);
            deviceManager.getEventManager().newEvent(event);
        }
    }

    public void stopAgents(List<String> ips, List<Integer> ports) {
        Event event;
        HashMap<String, Object> values;
        for (int i = 0; i < ips.size(); i++) {
            event = new SystemEvent(this);
            event.setId(EVENT_SHUTDOWN_ANOTHER_AGENT);
            event.setName("Stop agent!");
            values = new HashMap<String, Object>();
            values.put("ip", ips.get(i));
            values.put("port", ports.get(i));
            values.put("uid", "any");
            event.setParameters(values);
            event.setEntityId(ENTITY_TEST_ENTITY);
            deviceManager.getEventManager().newEvent(event);
        }
    }

    @Override
    public void onCreate() {

    }

    @Override
    public synchronized FeedbackAnswer applyAction(Action action) {
        Event event;
        //ações
        //ACTION_GENERIC_ACTION;
        //ACTION_INTERACTION_RESULT;      
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        FeedbackAnswer answer = null;
        switch (action.getId()) {
            case ACTION_GENERIC_ACTION:
               
                event = (Event) action.getParameters().get("event");
                try {
                    //tempoevento,id evento,tempoacao
                    this.writer.write(event.getTime().getTime() + "," + event.getId() + "," + (new Date()).getTime() + "\n");
                } catch (IOException ex) {
                    if (DeveloperSettings.SHOW_EXCEPTION_ERRORS) {
                        Logger.getLogger(TestManager.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    answer = new FeedbackAnswer(FeedbackAnswer.ACTION_RESULT_FAILED, ex.toString());
                }
                break;
            case ACTION_INTERACTION_RESULT:
                try {
                    // id o evento (eventId); tempo do evento (timestampEvent); ip (ip); porta(port)
                    //tempoevento,id evento,tempoacao
                    this.writer.write(action.getParameters().get("timestampEvent") + "," + action.getParameters().get("eventId") + "," + (new Date()).getTime() + "\n");
                } catch (IOException ex) {
                    if (DeveloperSettings.SHOW_EXCEPTION_ERRORS) {
                        Logger.getLogger(TestManager.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    answer = new FeedbackAnswer(FeedbackAnswer.ACTION_RESULT_FAILED, ex.toString());
                }
                break;
            case ACTION_SHUTDOWN:
                try {
                    this.writer.close();
                    this.writer.flush();
                } catch (IOException ex) {
                    Logger.getLogger(TestManager.class.getName()).log(Level.SEVERE, null, ex);
                }
                // o main inicia uma thread de experimentos e faz um join
                // interromper a thread
                //thread.interrupted();
                this.shudown = true;
                notifyAll();
                break;
            default:
                answer = new FeedbackAnswer(FeedbackAnswer.ACTION_DOES_NOT_EXIST);
                break;
        }
        // verifica se a ação existe ou se houve algum resultado durante a execução
        if (action.getId() >= 1 && action.getId() <= 3) {
            answer = new FeedbackAnswer(FeedbackAnswer.ACTION_RESULT_WAS_SUCCESSFUL);
        }
        return answer;
    }

    void experiment01() {
        Event emulatedEvent = new SystemEvent(this);
        // parâmetros
        // configurações
        // adiciona todos os ventos
        deviceManager.getEventManager().newEvent(emulatedEvent);
    }

    @Override
    public void run() {
        // os experimentos
        // espera a conclusão de todas as ações
        synchronized (this) {
            while (!shudown) {
                try {
                    wait();
                } catch (InterruptedException ex) {
                    Logger.getLogger(TestManager.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void startAndWaitExperiment() throws InterruptedException {
        this.thread = new Thread(this);
        this.thread.start();
        this.thread.join();
    }

    public synchronized void waitEventsQueueBeFinished() {
        try {
            while (true) {
                if (getDeviceManager().getAdaptationManager().getEventsCount() == 0) {
                    break;
                } else {
                    wait(5000);
                }
            }
            writer.close();
        } catch (InterruptedException ex) {
            Logger.getLogger(TestManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(TestManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

}
