<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ducnh" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Login Page</title>

        <!-- Google Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="logintp1.css">
        <!-- Custom Stylesheet -->
        <link rel="stylesheet" href="logintp2.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    </head>

    <body>
        <div class="container">
            <div class="login-box animated fadeInUp">
                <div class="box-header">
                    <h2>Log In</h2>
                </div>
                <form action="MainController" method="POST">
                    <label for="username">Username</label>
                    <br/>
                    <input type="text" id="username" placeholder="Username" name="txtUserId"/>
                    <br/>
                    <label for="password">Password</label>
                    <br/>
                    <input type="password" id="password" placeholder="Password" name="txtPassword"/>
                    <br/>
                    <input type="hidden" name="page" value="<%= request.getParameter("page") %>"/>
                    <input type="submit" name="action" value="Login"/>
                    <br/>
                </form>		
                <ducnh:if test="${not empty requestScope.ERRORLOGIN.userPassError}">                        
                    <font color="red"> 
                    ${ERRORLOGIN.userPassError}
                    </font>
                    <br/><br/>
                </ducnh:if>
                <ducnh:if test="${not empty requestScope.ERRORLOGIN.accountBanned}">
                    <font color="red"> 
                    ${ERRORLOGIN.accountBanned}
                    </font>
                    <br/><br/>
                </ducnh:if>

            </div>
        </div>
    </body>

</html>