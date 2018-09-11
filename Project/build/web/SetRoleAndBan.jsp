<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ducnh" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>SetRole&BanAccount</title>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Collaborator.css">
        <script src="JavaScript.js"></script>
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
                                    <h4 id="welcome">Hi, ${sessionScope.ADMIN.fullname}</h4>
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
                    <a href="ManageAccountAdmin.jsp" class="list-group-item active">Manage Account</a>
                    <a href="CreateAccountAdmin.jsp" class="list-group-item">Create Account</a>                    
                    <a href="Report.jsp" class="list-group-item">Report</a>
                </div>
                <div class="col-md-9 rightBody">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 id="add">Set Role & Ban Account</h1>
                        </div>
                    </div>                    
                    <div class="row">
                        <div class="col-md-12">
                            <form class="form-horizontal" action="MainController" method="POST">
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="userName">UserName:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="userName" placeholder="UserName" name="txtUserId" value="${requestScope.AccountDetails.userId}" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="fullName">Full Name:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="fullName" placeholder="Enter FullName" name="txtFullname" value="${requestScope.AccountDetails.fullname}" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="birthday">BirthDay:</label>
                                    <div class="col-sm-10">
                                        <input type="Date" class="form-control" id="birthday" name="txtBirthday" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${requestScope.AccountDetails.birthday}'/>" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">Sex:</label>
                                    <div class="col-sm-10">
                                        <label class="radio-inline">
                                            <input type="radio"disabled="true" name="radioSex" value="Male" ${requestScope.AccountDetails.sex eq 'True' ? 'checked': ''}/> Male
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" disabled="true" name="radioSex" value="Female" ${requestScope.AccountDetails.sex eq 'False' ? 'checked': ''}/> Female
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="phone">Phone:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="phone" placeholder="Enter Phone Number" name="txtPhone" value="${requestScope.AccountDetails.phone}" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="email">Email:</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="email" placeholder="Enter Email" name="txtEmail" value="${requestScope.AccountDetails.mail}" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="address">Address:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="address" placeholder="Enter Address" name="txtAddress" value="${requestScope.AccountDetails.address}" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="address">Role:</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="cbRole" name="listRole">
                                            <option <ducnh:if test="${requestScope.AccountDetails.role eq '3'}">selected=""</ducnh:if> value="Moderator">Moderator</option>
                                            <option <ducnh:if test="${requestScope.AccountDetails.role eq '2'}">selected=""</ducnh:if> value="Collaborator">Collaborator</option>
                                            <option <ducnh:if test="${requestScope.AccountDetails.role eq '1'}">selected=""</ducnh:if> value="Member">Member</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="address">Status:</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" id="cbStatus" name="listStatus">
                                                <option <ducnh:if test="${requestScope.AccountDetails.statusId eq '0'}">selected=""</ducnh:if> value="Banned">Banned</option>
                                            <option <ducnh:if test="${requestScope.AccountDetails.statusId eq '1'}">selected=""</ducnh:if> value="Active">Active</option>    
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <input type="hidden" value="SetRoleAndBanned" name="subAction"/>                                        
                                            <button type="submit" class="btn btn-primary update" value="Update" name="action">Update Account</button>
                                        </div>
                                    </div>
                                </form>
                                <div class="col-md-12 messageTitle">
                                    <span id="message">
                                    <ducnh:if test="${not empty requestScope.AdUdSuccess}">
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-md-offset-2 col-md-6">
                                                    <font color="red"> 
                                                    ${AdUdSuccess}
                                                    </font>
                                                    <br/><br/>
                                                </div>
                                            </div>
                                        </div>
                                    </ducnh:if>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <button type="button" class="btn btn-primary btnBack" onclick="goBack()">
                            <span class="glyphicon glyphicon-menu-left"></span> Back
                        </button>
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
                    <ul>Pháº¡m Tuáº¥n Kiá»t - SE.....</ul>
                    <ul>Nguyá»n Há»ng Äá»©c - SE.....</ul>
                    <ul>Nguyá»n HoÃ ng Anh Trung - SE62282</ul>
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
