<%-- 
    Document   : addCourseSession
    Created on : 11 juin 2015, 18:30:00
    Author     : Quentin Barthélémy
--%>

<%@page import="fr.utbm.projetlo54.service.CourseSessionService"%>
<%@page import="fr.utbm.projetlo54.service.LocationService"%>
<%@page import="fr.utbm.projetlo54.service.CourseService"%>
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
    // create the new course session
    CourseSession cs = new CourseSession();
    
    // set its start and end dates
    SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
    String startDate = request.getParameter("start_date");
    Date result = formater.parse(startDate);
    cs.setStartDate(result);
    String endDate = request.getParameter("end_date");
    result = formater.parse(endDate);
    cs.setEndDate(result);
    
    // set its course
    CourseService cservice = new CourseService();
    Course course = cservice.getCourseByCode(request.getParameter("course"));
    cs.setCourse(course);
    course.addCourseSession(cs);
    
    // set its location
    LocationService lservice = new LocationService();
    Location loc = lservice.getLocation(Integer.parseInt(request.getParameter("location")));
    cs.setLocation(loc);

    CourseSessionService css = new CourseSessionService();
    css.insertCourseSession(cs);
    
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
    
