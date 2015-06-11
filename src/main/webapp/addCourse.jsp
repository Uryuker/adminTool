<%-- 
    Document   : addCourse
    Created on : 11 juin 2015, 18:04:50
    Author     : Quentin Barthélémy
--%>

<%@page import="fr.utbm.projetlo54.entity.Course"%>
<%@page import="fr.utbm.projetlo54.repository.HibernateCourseDAO"%>

<%
    Course c = new Course();
    c.setCode(request.getParameter("code"));
    c.setTitle(request.getParameter("title"));
    HibernateCourseDAO h = new HibernateCourseDAO();
    h.addCourse(c);
    %>
<!DOCTYPE html>


<html>
    <head>
        <title>Course added</title>
    </head>
    <body>
        <h1> Course added :</h1>
        <ul>
            <li><p><b>Code :</b>
                <%= request.getParameter("code")%>
            </p></li>
            <li><p><b>Title :</b>
                <%= request.getParameter("title")%>
            </p></li>
        </ul>
             
           
    </body>
</html>
    
