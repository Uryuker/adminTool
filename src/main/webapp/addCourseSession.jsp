<%-- 
    Document   : addCourseSession
    Created on : 11 juin 2015, 18:30:00
    Author     : Quentin Barthélémy
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Date"%>
<%@page import="fr.utbm.projetlo54.repository.HibernateLocationDAO"%>
<%@page import="fr.utbm.projetlo54.repository.HibernateCourseDAO"%>
<%@page import="fr.utbm.projetlo54.entity.Course"%>
<%@page import="fr.utbm.projetlo54.entity.Location"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fr.utbm.projetlo54.entity.CourseSession"%>
<%@page import="fr.utbm.projetlo54.repository.HibernateCourseSessionDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    CourseSession cs = new CourseSession();
    SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
    String startDate = request.getParameter("start_date");
    Date result = formater.parse(startDate);
    cs.setStartDate(result);
    String endDate = request.getParameter("end_date");
    result = formater.parse(endDate);
    cs.setEndDate(result);
    Course cours = new Course();
    cours.setTitle(request.getParameter("course"));
    cs.setCourse(cours);
    Location loc = new Location();
    loc.setId(Integer.parseInt(request.getParameter("location")));
    cs.setLocation(loc);
    cs.setId(2);
    new HibernateCourseSessionDAO().addCourseSession(cs);
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
            <li><p><b>Start Date:</b>
                <%= request.getParameter("start_date")%>
            </p></li>
            <li><p><b>End Date:</b>
                <%= request.getParameter("end_date")%>
            </p></li>
            <li><p><b>Course:</b>
                <%= request.getParameter("course") %> 
                    
            </p></li>
            <li><p><b>Location :</b>
                <%= request.getParameter("location")%> 
            </p></li>
        </ul>
        <br />
        <input type="button" name="b10" value="Return to Home Page" onclick="location.href='index.html'"><br />
    </body>
</html>
    
