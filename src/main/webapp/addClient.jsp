<%-- 
    Document   : addClient
    Created on : 11 juin 2015, 18:30:00
    Author     : Quentin Barthélémy
--%>
<%@page import="fr.utbm.projetlo54.repository.HibernateClientDAO"%>
<%@page import="fr.utbm.projetlo54.entity.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Client cl = new Client();
    cl.setId(Integer.parseInt(request.getParameter("id")));
    cl.setLastName(request.getParameter("last_name"));
    cl.setFirstName(request.getParameter("first_name"));
    cl.setAddress(request.getParameter("address"));
    cl.setPhone(request.getParameter("phone"));
    cl.setEmail(request.getParameter("mail"));
    cl.setSessionID(Integer.parseInt(request.getParameter("session_id")));
    HibernateClientDAO h = new HibernateClientDAO();
    h.addClient(cl);
    
    %>
<!DOCTYPE html>
<html>
    <head>
        <title>Location added</title>
    </head>
    <body>

        <h1>Location added :</h1>
        <ul>
            <li><p><b>Id : </b>
                <%= request.getParameter("id")%>
            </p></li>
            <li><p><b>Last Name : </b>
                <%= request.getParameter("last_name")%>
            </p></li>
            <li><p><b>First Name : </b>
                <%= request.getParameter("first_name")%>
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
            <li><p><b>SessionId : </b>
                <%= request.getParameter("session_id")%>
            </p></li>
        </ul>

    </body>
</html>