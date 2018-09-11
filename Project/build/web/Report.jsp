<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ducnh" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report</title>
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
                    <a href="CreateAccountAdmin.jsp" class="list-group-item">Create Account</a>                
                    <a href="Report.jsp" class="list-group-item active">Report</a>
                </div>
                <div class="col-md-9 rightBody">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 id="add">REPORT</h1>
                            <h4 id="add">TOP COLLABORATOR HAVE THE MOST POST(*) AND HIGHEST VIEW</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 searchReport">
                            <form class="form-inline" action="MainController" method="POST">
                                <div class="form-group">
                                    <label for="fromDay">From:</label>
                                    <input type="date" class="form-control" id="fromDay" name="txtFrom" value="${param.txtFrom}"/>
                                </div>
                                <div class="form-group">
                                    <label for="toDay">To:</label>
                                    <input type="date" class="form-control" id="toDay" name="txtTo" value="${param.txtTo}"/>
                                </div>
                                <input type="hidden" name="subAction" value="Report"/>
                                <button type="submit" class="btn btn-default" value="Search" name="action">Search</button>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <div class="table-responsive">
                            <ducnh:if test="${not empty requestScope.TOPPOST}">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Author</th>
                                            <th>Total Post</th>
                                            <th>Total View</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <ducnh:forEach items="${requestScope.TOPPOST}" var="dto" varStatus="counter">
                                            <tr>
                                                <td>${counter.count}</td>
                                                <td>${dto.collaboratorName}</td>
                                                <td>${dto.totalPost}</td>
                                                <td>${dto.totalView}</td>
                                            </tr> 
                                        </ducnh:forEach>                                                                           
                                    </tbody>
                                </table>
                            </ducnh:if>
                            <ducnh:if test="${not empty requestScope.SEARCHERROR}">
                                <div class="row">
                                    <div class="form-group">
                                        <font color="red"> 
                                        ${SEARCHERROR.searchError}
                                        </font>
                                        <br/><br/>             
                                    </div>
                                </div>
                            </ducnh:if>
                            <ducnh:if test="${not empty requestScope.FROMTOERROR}">
                                <div class="row">
                                    <div class="form-group">
                                        <font color="red"> 
                                        ${FROMTOERROR.fromtoError}
                                        </font>
                                        <br/><br/>             
                                    </div>
                                </div>
                            </ducnh:if>
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
