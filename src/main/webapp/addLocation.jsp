<%-- 
    Document   : addLocation
    Created on : 11 juin 2015, 18:30:00
    Author     : Quentin Barthélémy

--%>
<%@page import="fr.utbm.projetlo54.repository.HibernateLocationDAO"%>
<%@page import="fr.utbm.projetlo54.entity.Location"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Location l = new Location();
    l.setCity(request.getParameter("city"));
    l.setId(Integer.parseInt(request.getParameter("id")));
    HibernateLocationDAO h = new HibernateLocationDAO();
    h.addLocation(l);
    
    %>
<!DOCTYPE html>
<html>
    <head>
        <title>Location added</title>
    </head>
    <body>

        <h1>Location added :</h1>
        <ul>
            <li><p><b>Id:</b>
                <%= request.getParameter("id")%>
            </p></li>
            <li><p><b>City :</b>
                <%= request.getParameter("city")%>
            </p></li>
        </ul>
        <br />
        <input type="button" name="b10" value="Return Home Page" onclick="location.href='index.html'"><br />
    </body>
</html>