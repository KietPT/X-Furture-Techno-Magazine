<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ducnh" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Member</title>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
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
                            <ul class="nav navbar-nav">
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="Camera.jsp">Camera</a></li>
                                <li><a href="Mobile.jsp">Mobile</a></li>
                                <li><a href="Laptop.jsp">Laptop</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <h4 id="welcome">Hi, ${sessionScope.READER.fullname}</h4>
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
                    <a href="UpdateProfileReader.jsp" class="list-group-item active">Profile</a>
                    <a href="ChangePassReader.jsp" class="list-group-item">Change Password</a>
                </div>
                <div class="col-md-9 rightBody">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 id="add">PROFILE</h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 profile">
                            <form class="form-horizontal" action="MainController" method="POST">
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="userName">UserName:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="userName" placeholder="UserName" name="txtUserId" value="${sessionScope.READER.userId}" readonly/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="fullName">Full Name:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="fullName" placeholder="Enter FullName" name="txtFullname" value="${sessionScope.READER.fullname}" required/>
                                        <ducnh:if test="${not empty requestScope.REGISTERERROR.errorFullname}">
                                            <font color="red"> ${REGISTERERROR.errorFullname}</font>
                                        </ducnh:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="birthday">BirthDay:</label>
                                    <div class="col-sm-10">
                                        <input type="Date" class="form-control" id="birthday" name="txtBirthday" required value="<fmt:formatDate pattern='yyyy-MM-dd' value='${sessionScope.READER.birthday}'/>"/>
                                         <ducnh:if test="${not empty requestScope.REGISTERERROR.errorDob}">
                                            <font color="red"> ${REGISTERERROR.errorDob}</font>
                                        </ducnh:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">Sex:</label>
                                    <div class="col-sm-10">
                                        <label class="radio-inline">
                                            <input type="radio" name="radioSex" checked value="Male" ${sessionScope.READER.sex eq 'True' ? 'checked': ''}>Male
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="radioSex" value="Female" ${sessionScope.READER.sex eq 'False' ? 'checked': ''}>Female
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="phone">Phone:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="phone" placeholder="Enter Phone Number" name="txtPhone" required value="${sessionScope.READER.phone}"/>
                                        <ducnh:if test="${not empty requestScope.REGISTERERROR.errorPhone}">
                                            <font color="red"> ${REGISTERERROR.errorPhone}</font>
                                        </ducnh:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="email">Email:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="email" placeholder="Enter Email" name="txtEmail" required value="${sessionScope.READER.mail}"/>
                                         <ducnh:if test="${not empty requestScope.REGISTERERROR.errorMail}">
                                            <font color="red"> ${REGISTERERROR.errorMail}</font>
                                        </ducnh:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="address">Address:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="address" placeholder="Enter Address" name="txtAddress" required value="${sessionScope.READER.address}"/>
                                        <ducnh:if test="${not empty requestScope.REGISTERERROR.errorAddr}">
                                            <font color="red"> ${REGISTERERROR.errorAddr}</font>
                                        </ducnh:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <input type="hidden" name="subAction" value="UpdateProfileReader"/>
                                        <button type="submit" class="btn btn-primary update" name="action" value="Update">Update</button>
                                    </div>
                                </div>
                                <div class="col-md-12 messageTitle">
                                    <font style="font-size: 20px; color: red"><span id="message"> 
                                        ${Message.message}
                                    </span>
                                    </font>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
    <footer class="container footer">
        <div class="col-md-4 col-sm-4 col-xs-4">
            <div class="row">
                <h4>About us</h4>
                <li class="list-unstyle">
                    <ul>Phạm Tuấn Kiệt - SE.....</ul>
                    <ul>Nguyễn Hồng Đức - SE62389</ul>
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
    </footer>

</html>
