<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="ducnh" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Collaborator.css">
        <!-- Include external CSS. -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">

        <!-- Include Editor style. -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.5.1/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.5.1/css/froala_style.min.css" rel="stylesheet" type="text/css" />

        <!-- Include external JS libs. -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/mode/xml/xml.min.js"></script>

        <!-- Include Editor JS files. -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.5.1//js/froala_editor.pkgd.min.js"></script>
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
                    <a href="ManageAccountAdmin.jsp" class="list-group-item">Manage Account</a>
                    <a href="CreateAccountAdmin.jsp" class="list-group-item active">Create Account</a>                    
                    <a href="Report.jsp" class="list-group-item">Report</a>
                </div>
                <div class="col-md-9 rightBody">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 id="add">CREATE ACCOUNT</h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 profile">
                            <form class="form-horizontal" action="MainController" method="POST">
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="fullName">Full Name:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="fullName" placeholder="Enter FullName" name="txtFullname" value="${requestScope.INFOCREATE.fullname}" required=""/>
                                        <ducnh:if test="${not empty requestScope.CREATEERROR.errorFullname}">
                                            <font color="red"> ${CREATEERROR.errorFullname}</font>
                                        </ducnh:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="birthday">BirthDay:</label>
                                    <div class="col-sm-10">
                                        <input type="Date" class="form-control" id="birthday" name="txtBirthday" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${requestScope.INFOCREATE.birthday}'/>" required>
                                        <ducnh:if test="${not empty requestScope.CREATEERROR.errorDob}">
                                            <font color="red"> ${CREATEERROR.errorDob}</font>
                                        </ducnh:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">Sex:</label>
                                    <div class="col-sm-10">
                                        <label class="radio-inline">
                                            <input type="radio" name="radioSex" value="Male" ${requestScope.INFOCREATE.sex eq 'True' ? 'checked': ''}>Male
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="radioSex" value="Female" ${requestScope.INFOCREATE.sex eq 'False' ? 'checked': ''}>Female
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="phone">Phone:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="phone" placeholder="Enter Phone Number" name="txtPhone" value="${requestScope.INFOCREATE.phone}" required>
                                        <ducnh:if test="${not empty requestScope.CREATEERROR.errorPhone}">
                                            <font color="red"> ${CREATEERROR.errorPhone}</font>
                                        </ducnh:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="email">Email:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="email" placeholder="Enter Email" name="txtEmail" value="${requestScope.INFOCREATE.mail}" required>
                                        <ducnh:if test="${not empty requestScope.CREATEERROR.errorMail}">
                                            <font color="red"> ${CREATEERROR.errorMail}</font>
                                        </ducnh:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="address">Address:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="address" placeholder="Enter Address" name="txtAddress" value="${requestScope.INFOCREATE.address}" required>
                                        <ducnh:if test="${not empty requestScope.CREATEERROR.errorAddr}">
                                            <font color="red"> ${CREATEERROR.errorAddr}</font>
                                        </ducnh:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="address">Role:</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="cbRole" name="listRole">
                                            <option <ducnh:if test="${requestScope.INFOCREATE.role eq '3'}">selected=""</ducnh:if> value="Moderator">Moderator</option>
                                            <option <ducnh:if test="${requestScope.INFOCREATE.role eq '2'}">selected=""</ducnh:if> value="Collaborator">Collaborator</option>    
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="submit" class="btn btn-primary update" value="AdminCreateAccount" name="action">Create Account</button>
                                        </div>
                                    </div>
                                    <div class="col-md-12 messageTitle">
                                        <span id="message">
                                        <ducnh:if test="${not empty requestScope.CREATESUCCESS}">
                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-md-offset-2 col-md-6">
                                                        <font color="red"> 
                                                        ${CREATESUCCESS}
                                                        </font>
                                                        <br/><br/>
                                                    </div>
                                                </div>
                                            </div>
                                        </ducnh:if>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
    </body>
    <script>
        $(function () {
            $('#edit').froalaEditor({
                // Set the image upload URL.
                imageUploadURL: '/Texteditor/upload_image',
                imageUploadParams: {
                    id: 'my_editor'
                }
            })
        });
    </script>

</html>
