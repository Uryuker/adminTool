
<%@page import="java.util.Date"%>
<%@page import="org.apache.activemq.ActiveMQConnection"%>
<%@page import="javax.jms.Message"%>
<%@page import="javax.jms.TextMessage"%>
<%@page import="javax.jms.TopicSubscriber"%>
<%@page import="javax.jms.Topic"%>
<%@page import="org.apache.activemq.ActiveMQConnectionFactory"%>
<%@page import="javax.jms.Connection"%>
<%@page import="javax.jms.Session"%>
<%@page import="org.apache.log4j.BasicConfigurator"%>
<%@page import="javax.jms.ConnectionFactory"%>
<%@ page import="java.io.*"  %>
<!Doctype HTML>
<%
String subject ="TPLO54";
String url = ActiveMQConnection.DEFAULT_BROKER_URL;
String filePath = "WebLogFile.txt";
boolean endWhile=false;
boolean removeSub=false;
String windowsPath = "C:/ProjetLO54";
String linuxPath = "/home/java/Desktop/ProjetLO54";
String osName = System.getProperty ( "os.name" );
String temp = "";

BasicConfigurator.configure();

        // Creatng the connection
        ConnectionFactory connectionFactory = new ActiveMQConnectionFactory(url);
        Connection connection = connectionFactory.createConnection();
        //Set the ID of the subscriber
        connection.setClientID("20");
        connection.start();
        // Creating session for seding messages
        Session subscriberSession = connection.createSession(false,Session.AUTO_ACKNOWLEDGE);
        // Creating the topic if not existing
        Topic topic = subscriberSession.createTopic(subject); 
        //Creation of a durable subscriber
        TopicSubscriber consumer = subscriberSession.createDurableSubscriber(topic,"AppliWeb");  
        
         if(osName.matches(".*Windows.*")){
            //Create the directory in windows if not eists
            if( !new File(windowsPath).exists()){
                new File(windowsPath).mkdir();
                System.out.println("Created "+ windowsPath+ " directory");
            }
            filePath= windowsPath+"/"+filePath;
        }
        
        else{
            if(osName.matches(".*Linux.*")){
                //Create the directory in linux if not eists
                if( !new File(linuxPath).mkdirs()){
                    new File(linuxPath).mkdir();
                    System.out.println("Created" + linuxPath+ " directory");
                }
                filePath= linuxPath+"/"+filePath;
            }
        }
        //Check if the file already exists
        //If not, we create one else we append to the existing one and insert new line
        FileWriter logFile;
        File log= new File(filePath);
        if(!log.exists()){
            logFile = new FileWriter(filePath);
        }
        else {
            logFile = new FileWriter(filePath,true);
        }
        logFile.write(System.getProperty("line.separator"));
        //Significate the dtart of listening with the date
        logFile.write("------------- Begin listening : "+new Date().toString()+ " -------------");
        logFile.write(System.getProperty("line.separator"));
        
        // Waiting for the message

        while(!endWhile){
        Message message = consumer.receive();
        if (message instanceof TextMessage) {
            
            TextMessage textMessage = (TextMessage) message;
            System.out.println("Received message '" + textMessage.getText()+ "'");
            //write the message and \n in the log file
            logFile.write(textMessage.getText());
            logFile.write(System.getProperty("line.separator"));
            temp = temp +"<br />"+textMessage.getText()+System.getProperty("line.separator");
            switch (textMessage.getText()) {
                case "close connection":
                    endWhile=true;
                    break;
                case "remove subscribers":
                    removeSub=true;
                    endWhile=true;
                    break;
            }
        }
        }
        //Signifiacte the end of he listening with the date
        logFile.write("------------- Stop listening  : "+new Date().toString()+ " -------------");
        logFile.close();
        //If we received remove subscrbers the we remove durable subscribers
        if(removeSub){
            consumer.close();
            subscriberSession.unsubscribe("AppliJava");
            subscriberSession.close();
        }
        connection.close();
    System.out.println(temp);%>
    <html>
        <head><title> listener</title></head>
        
        <body>

            <div onclick="javascript_alert_demo()">Récapitulatif des messages reçus : <br /> <%=temp%></div>
            <br />
            <input type="button" name="b10" value="Return Home Page" onclick="location.href='index.html'"><br />
        </body>
            
 </html>
        