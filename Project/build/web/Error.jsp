    <%-- 
    Document   : Error
    Created on : Oct 8, 2017, 9:05:55 PM
    Author     : KietPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Error Page</h1>
        <%
            String err = (String)request.getAttribute("ERROR");
        %>
        <h1>Invalid Page</h1>
        <h2><font color="red"><%=err%></font></h2>
        
    </body>
</html>
