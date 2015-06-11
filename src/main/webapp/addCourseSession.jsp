<%-- 
    Document   : addCourseSession
    Created on : 11 juin 2015, 18:30:00
    Author     : Quentin Barthélémy
--%>

<%@page import="fr.utbm.projetlo54.entity.Location"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fr.utbm.projetlo54.entity.CourseSession"%>
<%@page import="fr.utbm.projetlo54.repository.HibernateCourseSessionDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    CourseSession cs = new CourseSession();
    cs.setId(Integer.parseInt(request.getParameter("id")));
    cs.setStartDate(new SimpleDateFormat("dd/MM/yy").parse(request.getParameter("start_date")));
    cs.setEndDate(new SimpleDateFormat("dd/MM/yy").parse(request.getParameter("end_date")));
    Location l = new Location();
    l.setCity(request.getParameter("location"));
    l.setId(Integer.parseInt(request.getParameter("location_id")));
    cs.setLocation(l);
    HibernateCourseSessionDAO h = new HibernateCourseSessionDAO();
    h.addCourseSession(cs);
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>CourseSession added</title>
    </head>
    <body>

        <h1>CourseSession added :</h1>
        <ul>
            <li><p><b>Id:</b>
                <%= request.getParameter("id")%>
            </p></li>
            <li><p><b>Start Date:</b>
                <%= request.getParameter("start_date")%>
            </p></li>
            <li><p><b>End Date:</b>
                <%= request.getParameter("end_date")%>
            </p></li>
            <li><p><b>LocationID :</b>
                <%= request.getParameter("location_id")%>
            </p></li>
            <li><p><b>Location :</b>
                <%= request.getParameter("location")%>
            </p></li>
        </ul>
        <br />
        <input type="button" name="b10" value="Return Home Page" onclick="location.href='index.html'"><br />
    </body>
</html>
    
