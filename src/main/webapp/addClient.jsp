<%-- 
    Document   : addClient
    Created on : 11 juin 2015, 18:30:00
    Author     : Quentin Barthélémy
--%>

<%@page import="fr.utbm.projetlo54.entity.CourseSession"%>
<%@page import="fr.utbm.projetlo54.repository.HibernateClientDAO"%>
<%@page import="fr.utbm.projetlo54.entity.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Client cl = new Client();
    cl.setLastName(request.getParameter("last_name"));
    cl.setFirstName(request.getParameter("first_name"));
    cl.setAddress(request.getParameter("address"));
    cl.setPhone(request.getParameter("phone"));
    cl.setEmail(request.getParameter("mail"));
    cl.setSessionID(Integer.parseInt(request.getParameter("session_id")));
    new HibernateClientDAO().addClient(cl);
    
    
    
    %>
<!DOCTYPE html>
<html>
    <head>
        <title>Client added</title>
    </head>
    <body>

        <h1>Client added :</h1>
        <ul>
            <li><p><b>First Name : </b>
                <%= request.getParameter("first_name")%>
            </p></li>
            <li><p><b>Last Name : </b>
                <%= request.getParameter("last_name")%>
            </p></li>
            <li><p><b>Address : </b>
                <%= request.getParameter("address")%>
            </p></li>
            <li><p><b>Phone : </b>
                <%= request.getParameter("phone")%>
            </p></li>
            <li><p><b>Mail : </b>
                <%= request.getParameter("mail")%>
            </p></li>
            <li><p><b>Session : </b>
                <%= request.getParameter("session_id")%> 
                   
            </p></li>
        </ul>
        <br />

        <input type="button" name="b10" value="Return to Home Page" onclick="location.href='index.html'"><br />
    </body>
</html>