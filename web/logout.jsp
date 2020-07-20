<%-- 
    Document   : logout
    Created on : 20 Jul, 2020, 3:39:40 PM
    Author     : HANUT SINGH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:remove var="email" scope="session"/>
        <c:remove var="utype" scope="session"/>
        <c:redirect url="index.jsp"/>
    </body>
</html>
