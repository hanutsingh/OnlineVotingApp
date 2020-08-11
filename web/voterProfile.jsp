<%-- 
    Document   : voterProfile
    Created on : 31 Jul, 2020, 9:44:16 PM
    Author     : HANUT SINGH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<c:if test="${utype ne 'voter'}">
    <c:redirect url="index.jsp" />
</c:if>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="Voterheader.jsp" />
       
            <s:query var="rs" dataSource="${con}">
                Select * from voters where Email=?
                <s:param value="${email}"/>
            </s:query>                
        <form method="post">
            
        <table align="center">
            <tr>
                <td>Email:</td><td><c:out value="${rs.rows[0].Email}" /><input type='hidden' value='<c:out value="${rs.rows[0].Email}" />' name='t1'></td><td></td>
            </tr>
            <tr>
                <td>Name:</td><td><c:out value="${rs.rows[0].Name}" /></td><td></td>
            </tr>
            <tr>
                <td>FName:</td><td><c:out value="${rs.rows[0].FName}" /></td><td></td>
            </tr>
            <tr>
                <td>MName:</td><td><c:out value="${rs.rows[0].MName}" /></td><td></td>
            </tr>
            <tr>
                <td>Mobile No.:</td><td><c:out value="${rs.rows[0].MobileNO}" /></td><td></td>
            </tr>
            <tr>
                <td>House No.:</td><td><c:out value="${rs.rows[0].HouseNo}" /></td><td></td>
            </tr>
            <tr>
                <td>Address:</td><td><c:out value="${rs.rows[0].Address}" /></td><td></td>
            </tr>
            <tr>
                <td>Area:</td><td><c:out value="${rs.rows[0].Area}" /></td><td></td>
            </tr>
            <tr>
                <td>District:</td><td><c:out value="${rs.rows[0].District}" /></td><td></td>
            </tr>
            <tr>
                <td>Pincode:</td><td><c:out value="${rs.rows[0].Pincode}" /></td><td></td>
            </tr>
            <tr>
                <td>State:</td><td><c:out value="${rs.rows[0].State}" /></td><td></td>
            </tr>
            <tr>
                <td>Voter Card No.:</td><td><c:out value="${rs.rows[0].VoterCardNo}" /></td><td></td>
            </tr>
           
        </table></form>
        <hr>
       <jsp:include page="footer.jsp" />
    </body>
</html>
