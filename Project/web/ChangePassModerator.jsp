<%-- 
    Document   : ChangePassModerator
    Created on : Oct 18, 2017, 4:36:29 PM
    Author     : KietPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ducnh" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Collaborator.css">
    </head>

    <body>
        <div class="container header">
            <div class="row">
                <nav class="navbar navbar-default menu">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span> 
                            </button>
                            <div class="" style="/* padding:4px */padding-top: 5px;padding-right: 5px;">
                                <img src="Picture/logo.jpg" alt="">
                            </div>
                        </div>
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <h4 id="welcome">Hi, ${sessionScope.MODERATOR.fullname}</h4>
                                </li>
                                <li>
                                    <form action="MainController" method="Post">
                                        <button type="submit" class="btn btn-primary btn-sm logout" name="action" value="Logout">
                                            <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Logout
                                        </button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div class="container abody">
            <div class="row">
                <div class="col-md-3 list-group menu">
                    <a href="UpdateProfileModerator.jsp" class="list-group-item ">Profile</a>
                    <a href="ChangePassModerator.jsp" class="list-group-item active">Change Password</a>
                    <a href="ManagePostModer.jsp" class="list-group-item">Manage Post</a>
                    <a href="SubmittedPostByModerator.jsp" class="list-group-item">Submited Post</a>
                    <a href="RejecttedPostModerator.jsp" class="list-group-item">Rejected Post</a>
                </div>
                <div class="col-md-9 rightBody" style="height:430px">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 id="add">CHANGE PASSWORD</h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 profile">
                            <form class="form-horizontal" action="MainController" method="POST">
                                <div class="form-group">
                                    <label class="control-label col-sm-3" for="oldPass">Old Password:</label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" id="oldPass" placeholder="Enter Old Password" name="txtOldPassword" required=""/>
                                         <ducnh:if test="${not empty requestScope.ERROROLDPASS.oldPassword}">
                                            <font color="red"> ${ERROROLDPASS.oldPassword}</font>
                                        </ducnh:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" for="newPass">New Password:</label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" id="newPass" placeholder="Enter New Password" name="txtNewPassword" required=""/>
                                        <ducnh:if test="${not empty requestScope.ERROROLDPASS.equalError}">
                                            <font color="red"> ${ERROROLDPASS.equalError}</font>
                                        </ducnh:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" for="confirmPass">Confirm New Password:</label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" id="confirmPass" name="txtConfirmPassword" placeholder="Confirm Password" required=""/>
                                        <ducnh:if test="${not empty requestScope.ERROROLDPASS.equalError}">
                                            <font color="red"> ${ERROROLDPASS.equalError}</font>
                                        </ducnh:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <input type="hidden" name="subAction" value="UpdatePassModer"/>
                                        <input type="hidden" value="${sessionScope.MODERATOR.userId}" name="txtUserId"/>
                                        <button type="submit" class="btn btn-primary update" name="action" value="Update">Change Password</button>
                                    </div>
                                </div>
                            </form>
                            <ducnh:if test="${not empty requestScope.SUCCESSCHANGEPASS}">
                                <div class="col-md-12 messageTitle">
                                    <span id="message"><font style="font-size: 20px;color: red">${SUCCESSCHANGEPASS}</font></span>
                                </div>
                            </ducnh:if>               
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <footer>
        <div class="container footer">
            <div class="row">
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <div class="row">
                        <h4>About us</h4>
                        <li class="list-unstyle">
                            <ul>Phạm Tuấn Kiệt - SE.....</ul>
                            <ul>Nguyễn Hồng Đức - SE.....</ul>
                            <ul>Nguyễn Hoàng Anh Trung - SE62282</ul>
                        </li>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <div class="row">
                        <h4>Contact Us</h4>
                        <li>
                            <ul>Email: </ul>
                            <ul>Phone: </ul>
                        </li>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <div class="row">
                        <span> Copyright 2017 by Refsnes Data. All Rights Reserved.</span>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <script>
        function changePass() {
            var oldPass = document.getElementById("oldPass");
            var newPass = document.getElementById("newPass");
            var confirmPass = document.getElementById("confirmPass");
            if (!oldPass.test(newPass.value)) {
                alert("FAIL");
            }
            if (!newPass.test(confirmPass.value)) {
                alert("FAIL");
            }
        }

    </script>
</html>
