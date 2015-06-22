<%-- 
    Document   : addLocation
    Created on : 11 juin 2015, 18:30:00
    Author     : Quentin Barthélémy

--%>
<%@page import="fr.utbm.projetlo54.service.LocationService"%>
<%@page import="java.util.List"%>
<%@page import="fr.utbm.projetlo54.repository.HibernateLocationDAO"%>
<%@page import="fr.utbm.projetlo54.entity.Location"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Location l = new Location();
    l.setCity(request.getParameter("city"));
    new HibernateLocationDAO().addLocation(l);
    
    
   

    %>
<!DOCTYPE html>
<html>
    <head>
        <title>Location added</title>
    </head>
    <body>

        <h1>Location added:</h1>
        <ul>

            <li><p><b>City:</b>
                <%= request.getParameter("city")%>
            </p></li>
            <li><p><b>Existing locations:</b>
                <% List<Location> locations = new LocationService().getAllLocations();
                out.println(locations.toString());%>
                    
            
        </ul>
        <br />
        <input type="button" name="b10" value="Return to Home Page" onclick="location.href='index.html'"><br />
    </body>
</html>