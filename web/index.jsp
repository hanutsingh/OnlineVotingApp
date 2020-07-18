<%-- 
    Document   : index
    Created on : 11 Jul, 2019, 1:43:49 PM
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
        <s:setDataSource driver="org.gjt.mm.mysql.Driver" url="jdbc:mysql://127.0.0.1/VotingApp" user="root" password="" var="con" scope="session" />
        <c:if test="${param.b1 ne nil}">
            <s:query var="rs" dataSource="${con}">
                Select * from Users where Ulogin=? and upassword=? and status='E'
                <s:param value="${param.t1}"/>
                <s:param value="${param.t2}"/>
            </s:query>
                <c:if test="${f:length(rs.rows) eq 1}">
                    <c:set var="email" value="${rs.rows[0].ulogin}" scope="session" />
                    <c:set var="utype" value="${rs.rows[0].utype}" scope="session" />
                    <c:if test="${rs.rows[0].utype eq 'EC'}">
                        <c:redirect url="EC.jsp" />
                    </c:if>
                    <c:if test="${rs.rows[0].utype eq 'voter'}">
                        <c:redirect url="voter.jsp" />
                    </c:if>
                    <c:if test="${rs.rows[0].utype eq 'candidate'}">
                        <c:redirect url="candidate.jsp" />
                    </c:if>
                </c:if>    
                <c:if test="${f:length(rs.rows) eq 0}">
                    <c:set var="msg" value="Invalid Login/Password!!" />                           
                </c:if>    
        </c:if>
        <img src="banner.jpg" width='100%'><hr>
        <br>
        <form method="post">
        <table align='center'>
            <tr>
                <td>Login:</td><td><input type='text' name='t1'></td><td></td>
            </tr>
            <tr>
                <td>Password:</td><td><input type='password' name='t2'></td><td></td>
            </tr>
            <tr>
                <td></td><td><input type='checkbox' name='c1'>Remember Me</td><td></td>
            </tr>
            <tr>
                <td></td><td><input type='submit' name='b1' value='Login'> <a href='register.jsp'>Voters Registration</a></td><td></td>
            </tr>
            <tr>
                <td></td><td><font color='red'><c:out value="${msg}" /></font></td><td></td>
            </tr>
        </table></form><br><br>
        <hr><img src="fotter.jpg" width='100%'>
    </body>
</html>

