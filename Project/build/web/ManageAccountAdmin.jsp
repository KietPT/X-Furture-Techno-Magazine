<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ducnh" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Account</title>
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
                    <a href="ManageAccountAdmin.jsp" class="list-group-item active">Manage Account</a>
                    <a href="CreateAccountAdmin.jsp" class="list-group-item">Create Account</a>                    
                    <a href="Report.jsp" class="list-group-item">Report</a>
                </div>
                <div class="col-md-9 rightBody">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 id="add">MANAGE ACCOUNT</h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 search">
                            <form action="MainController" method="POST">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search" name="txtSearch" value="${param.txtSearch}">
                                    <div class="input-group-btn">
                                        <input type="hidden" name="subAction" value="ManageAccountAdmin"/>
                                        <button class="btn btn-default" type="submit" value="Search" name="action"><i class="glyphicon glyphicon-search"></i></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <div class="table-responsive">
                            <ducnh:if test="${not empty requestScope.ListAccount}">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>UserID</th>
                                            <th>Full Name</th>
                                            <th>Role</th>
                                            <th>Status</th>
                                            <th>Button</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <ducnh:forEach items="${requestScope.ListAccount}" var="dto" varStatus="counter">
                                            <tr>                                                
                                                <td>${counter.count}</td>
                                                <td>${dto.userId}</td>
                                                <td>${dto.fullname}</td>
                                                <td>${dto.rolename}</td>
                                                <td>${dto.statusId eq '1' ? 'Active' : 'Banned'}</td>
                                                <td>
                                                    <form action="MainController" method="POST">
                                                        <input type="hidden" name="subAction" value="ViewDetailAccount"/>
                                                        <input type="hidden" name="txtUserIdBeClicked" value="${dto.userId}"/>                                                        
                                                        <button type="submit" class="btn btn-info btn-xs" data-toggle="modal" data-target="#myModal" value="View" name="action">View</button>
                                                    </form>   
                                                </td>
                                            </tr>
                                        </ducnh:forEach>
                                    </tbody>
                                </table>
                            </ducnh:if>
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
