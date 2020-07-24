<%-- 
    Document   : EC
    Created on : 22 Jul, 2020, 1:42:03 PM
    Author     : HANUT SINGH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<c:if test="${utype ne 'EC'}">
    <c:redirect url="index.jsp" />
</c:if>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="ECheader.jsp" />
        <jsp:include page="footer.jsp" />
    </body>
</html>
