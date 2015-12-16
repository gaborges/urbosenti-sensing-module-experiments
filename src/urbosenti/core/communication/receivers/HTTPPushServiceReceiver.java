/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package urbosenti.core.communication.receivers;

import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import urbosenti.core.communication.CommunicationManager;
import urbosenti.core.communication.PushServiceReceiver;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.Inet4Address;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

/**
 *
 * @author Guilherme
 */
public class HTTPPushServiceReceiver extends PushServiceReceiver {

    private Integer port;
    private HttpServer serverHTTP;
    private String ip;

    public HTTPPushServiceReceiver(CommunicationManager communicationManager, int port) {
        super(communicationManager);
        super.setId(3);
        super.setDescription("HTTP Input Interface");
        this.port = port;
    }

    public HTTPPushServiceReceiver(CommunicationManager communicationManager) {
        super(communicationManager);
        super.setId(3);
        super.setDescription("HTTP Input Interface");
        this.port = 55666;
    }

    @Override
    public void stop() {
        this.serverHTTP.stop(0);
        super.stop(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void start() {
        super.start(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void run() {

        if (this.serverHTTP == null) {
            throw new Error("Endereço não descoberto. Address not discovered. Please execute the method addressDiscovery()");
        }
        this.serverHTTP.start();

    }

    class MyHandler implements HttpHandler {

        @Override
        public void handle(HttpExchange t) throws IOException {
            InputStream in = t.getRequestBody();
            BufferedReader br = new BufferedReader(new InputStreamReader(in));

            String output, message = "";
            while ((output = br.readLine()) != null) {
                message += output;
            }
            t.sendResponseHeaders(HttpURLConnection.HTTP_NO_CONTENT, -1);
            communicationManager.newPushMessage(t.getRemoteAddress().getAddress().getHostAddress(), message);
        }
    }

    @Override
    public void addressDiscovery() throws IOException {
        ip = "";
        boolean updateRemoteAddress = false;
        // instancia o servidor
        if (this.serverHTTP == null) {
            this.serverHTTP = HttpServer.create(new InetSocketAddress(this.port), 0);
            // cria um contexto para acesso
            this.serverHTTP.createContext("/", new MyHandler());
        } else {
            this.stop();
            this.serverHTTP = HttpServer.create(new InetSocketAddress(this.port), 0);
            // cria um contexto para acesso
            this.serverHTTP.createContext("/", new MyHandler());
            this.start();
            updateRemoteAddress = true;
        }
        // encontra o IP
        try {
            Enumeration<NetworkInterface> interfaces = NetworkInterface.getNetworkInterfaces();
            while (interfaces.hasMoreElements()) {
                NetworkInterface iface = interfaces.nextElement();
                if (ip.length() > 0) {
                    break;
                }

                // filters out 127.0.0.1 and inactive interfaces
                if (iface.isLoopback() || !iface.isUp()) {
                    continue;
                }

                Enumeration<InetAddress> addresses = iface.getInetAddresses();
                while (addresses.hasMoreElements()) {
                    InetAddress addr = addresses.nextElement();
                    if (addr instanceof Inet4Address) {
                        ip = addr.getHostAddress();
                        break;
                    }
                }
            }
        } catch (SocketException e) {
            throw new RuntimeException(e);
        }
        // adiciona as configurações
        this.getInterfaceConfigurations().put("ipv4Address", ip);
        this.getInterfaceConfigurations().put("port", String.valueOf(serverHTTP.getAddress().getPort()));
        // atualiza
        if (updateRemoteAddress) {
            super.communicationManager.updateInputCommunicationInterfaceConfiguration(this, this.getInterfaceConfigurations());
        }
    }

}
