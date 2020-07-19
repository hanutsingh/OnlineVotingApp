<%-- 
    Document   : register
    Created on : 18 Jul, 2020, 1:45:33 PM
    Author     : HANUT SINGH
--%>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    Class.forName("org.gjt.mm.mysql.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/VotingApp","root","");
    PreparedStatement stmt=con.prepareStatement("Select distinct states from indianstates order by states");
    ResultSet rs=stmt.executeQuery();
%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
        function validate()
        {
            a1=document.getElementById("t1");
            a2=document.getElementById("t2");
            a3=document.getElementById("t3");
            a4=document.getElementById("t4");
            a5=document.getElementById("t5");
            a6=document.getElementById("t6");
            a7=document.getElementById("t7");
            a8=document.getElementById("t8");
            a9=document.getElementById("t9");
            a10=document.getElementById("t10");
            a11=document.getElementById("t11");
            a12=document.getElementById("t12");
            a13=document.getElementById("t13");
            a14=document.getElementById("t14");
            a15=document.getElementById("t15");
            a16=document.getElementById("t16");
            
            len=a1.value.length;
            at=a1.value.indexOf("@");
            dot=a1.value.lastIndexOf(".");
            if(len<10 || at<3 || dot<7)
            {
                document.getElementById("d1").innerHTML="<font color=red>*Invalid Email Type!!!</font>";
                a1.focus();
                return false;
            }
            else
            {
                document.getElementById("d1").innerHTML="";                
            }
            
            if(a2.value.length<8)
            {
                document.getElementById("d2").innerHTML="<font color=red>*Min 8 Characters.</font>";
                a2.focus();
                return false;
            }
            else
            {
                document.getElementById("d2").innerHTML="";
            }
            
            
            if(a2.value!=a3.value)
            {
                document.getElementById("d3").innerHTML="<font color=red>*Enter Same Password</font>";
                a3.focus();
                return false;
            }
            else
            {
                document.getElementById("d3").innerHTML="";
            }
            
            
            if(a4.value.length<=3)
            {
                document.getElementById("d4").innerHTML="<font color=red>*Enter Your Name</font>";
                a4.focus();
                return false;
            }
            else
            {
                document.getElementById("d4").innerHTML="";
            }
            
            
             if(a5.value.length<=3)
            {
                document.getElementById("d5").innerHTML="<font color=red>*Enter Your Father's Name</font>";
                a5.focus();
                return false;
            }
            else
            {
                document.getElementById("d5").innerHTML="";
            }
            
            if(a6.value.length<=3)
            {
                document.getElementById("d6").innerHTML="<font color=red>*Enter Your Mother's Name</font>";
                a6.focus();
                return false;
            }
            else
            {
                document.getElementById("d6").innerHTML="";
            } 
            
            if(a7.value.length!=10)
            {
                document.getElementById("d7").innerHTML="<font color=red>Invalid Mobile Number!!!</font>";
                a7.focus();
                return false;
            }
            else
            {
                for(i=0;i<10;i++)
                {
                    s=a7.value.substring(i,i+1);
                    if(s<'0' || s>'9')
                    {
                        document.getElementById("d7").innerHTML="<font color=red>Non Digit Mobile Number!!!</font>";
                        return false;
                    }
                }
            }
            
            if(a8.value.length<=1)
            {
                document.getElementById("d8").innerHTML="<font color=red>*Enter Your House No</font>";
                a8.focus();
                return false;
            }
            else
            {
                document.getElementById("d8").innerHTML="";
            } 
            
            if(a9.value.length<=1)
            {
                document.getElementById("d9").innerHTML="<font color=red>*Enter Your Address</font>";
                a9.focus();
                return false;
            }
            else
            {
                document.getElementById("d9").innerHTML="";
            }
            
            if(a10.value.length<=1)
            {
                document.getElementById("d10").innerHTML="<font color=red>*Enter Your Area</font>";
                a10.focus();
                return false;
            }
            else
            {
                document.getElementById("d10").innerHTML="";
            } 
            
            if(a11.value.length<=3)
            {
                document.getElementById("d11").innerHTML="<font color=red>*Enter District</font>";
                a11.focus();
                return false;
            }
            else
            {
                document.getElementById("d11").innerHTML="";
            } 
            
            if(a12.value.length<=4)
            {
                document.getElementById("d12").innerHTML="<font color=red>*Enter Pincode</font>";
                a12.focus();
                return false;
            }
            else
            {
                document.getElementById("d12").innerHTML="";
            } 
            
            
            if(a14.value.length!=10)
            {
                document.getElementById("d14").innerHTML="<font color=red>*Enter Correct Voter Card No.</font>";
                a14.focus();
                return false;
            }
            else
            {
                document.getElementById("d14").innerHTML="";
            } 
           return true;
        }
        var xmlhttp;
        function checkEmail()
        {
            xmlhttp=new XMLHttpRequest();
            xmlhttp.onreadystatechange=showStatus;
            s=document.getElementById("t1").value;
            if(s!="")
            {
                xmlhttp.open("GET","checkemail.jsp?email="+s,true);
                xmlhttp.send(null);
            }
        }
        function showStatus()
        {
            if(xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                reply=xmlhttp.responseText.trim();
                if(reply=="Y")
                {
                    document.getElementById("d1").innerHTML="Email Already Exists";
                    document.getElementById("t1").focus();
                }
                else
                {
                    document.getElementById("d1").innerHTML="";
                }
            }
        }
        </script>
    </head>
    <body>
        <c:if test="${param.b1 ne nil}">
            <s:update dataSource="${con}">
                Insert into voters values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)
                <s:param value="${param.t1}"/>
                <s:param value="${param.t4}"/>
                <s:param value="${param.t5}"/>
                <s:param value="${param.t6}"/>
                <s:param value="${param.t7}"/>
                <s:param value="${param.t8}"/>
                <s:param value="${param.t9}"/>
                <s:param value="${param.t10}"/>
                <s:param value="${param.t11}"/>
                <s:param value="${param.t12}"/>
                <s:param value="${param.t13}"/>
                <s:param value="${param.t14}"/>
                <s:param value="${param.t15}"/>
                <s:param value="${param.t16}"/>
            </s:update>
                <s:update dataSource="${con}">
                    Insert into users values(?,?,'voter','N')
                    <s:param value="${param.t1}"/>
                    <s:param value="${param.t2}"/>    
                </s:update>    
                    <c:set var="msg" value="Your Request is accepted.We are forwarding the request to the Election Commition for verification.After Verification you can login" />    
        </c:if>
        <img src="banner.jpg" width='100%'><hr>
        <br>
        <form method="post">
        <table align='center'>
            <tr>
                <td>Email:</td><td><input type='email' name='t1' id="t1" onBlur="checkEmail()"></td><td><div id="d1"></div><td>
            </tr>
            <tr>
                <td>Password:</td><td><input type='password' name='t2' id="t2"></td><td><div id="d2"></div></td>
            </tr>
            <tr>
                <td>Re-Password:</td><td><input type='password' name='t3' id="t3"></td><td><div id="d3"></div></td>
            </tr>
             <tr>
                <td>Name:</td><td><input type='text' name='t4' id="t4"></td><td><div id="d4"></div></td>
            </tr>
             <tr>
                <td>FName:</td><td><input type='text' name='t5' id="t5"></td><td><div id="d5"></div></td>
            </tr>
             <tr>
                <td>MName:</td><td><input type='text' name='t6' id="t6"></td><td><div id="d6"></div></td>
            </tr>
             <tr>
                <td>Mobile No.:</td><td><input type='text' name='t7' id="t7"></td><td><div id="d7"></div></td>
            </tr>
             <tr>
                <td>House No.:</td><td><input type='text' name='t8' id="t8"></td><td><div id="d8"></div></td>
            </tr>
             <tr>
                <td>Address:</td><td><input type='text' name='t9' id="t9"></td><td><div id="d9"></div></td>
            </tr>
             <tr>
                <td>Area:</td><td><input type='text' name='t10' id="t10"></td><td><div id="d10"></div></td>
            </tr>
             <tr>
                <td>District:</td><td><input type='text' name='t11' id="t11"></td><td><div id="d11"></div></td>
            </tr>
             <tr>
                <td>Pincode:</td><td><input type='text' name='t12' id="t12"></td><td><div id="d12"></div></td>
            </tr>
             <tr>
                <td>State:</td><td><select name="t13" id="t13">
            <%
                while(rs.next())
                {
                    out.write("<option>"+rs.getString(1)+"</option>");
                }
            %></select></td><td></td>
            </tr>
             <tr>
                <td>Voter Card No.:</td><td><input type='text' name='t14' id="t14"></td><td><div id="d14"></div></td>
            </tr>
            <tr>
                <td>Photo:</td><td><input type='file' name='t15' id="t15"></td><td><div id="d15"></div></td>
            </tr>
             <tr>
                <td>Voter Card Photo:</td><td><input type='file' name='t16' id="t16"></td><td><div id="d16"></div></td>
            </tr>
          
            <tr>
                <td></td><td></td><td></td>
            </tr>
            <tr>
                <td></td><td><input type='submit' onClick="return validate()" name='b1' value='Register'></td><td></td>
            </tr>
            <tr>
                <td colspan="3"></td>
            </tr>
        </table></form><br><br>
    <center><font color='red'><c:out value="${msg}" /></font></center>
        <hr><img src="fotter.jpg" width='100%'>
    </body>
</html>
