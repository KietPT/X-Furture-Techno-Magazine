<%-- 
    Document   : Camera
    Created on : Oct 21, 2017, 11:07:11 AM
    Author     : KietPT
--%>

<%@page import="java.util.List"%>
<%@page import="kietpt.dto.PostDTO"%>
<%@page import="kietpt.dao.PostDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="ducnh"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Camera</title>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="ForumCamera.css">
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
                                <img class="img-responsive" src="Picture/logo.jpg" alt="">
                            </div>
                        </div>
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-nav">
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="Camera.jsp">Camera</a></li>
                                <li><a href="Mobile.jsp">Mobile</a></li>
                                <li class="active"><a href="Laptop.jsp">Laptop</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <ducnh:if test="${not empty sessionScope.READER}">
                                    <li><h4 id="welcome">Hi, ${sessionScope.READER.fullname}</h4></li>
                                    <li>
                                        <form action="MainController" method="Post">
                                            <input type="hidden" value="ViewProfileReader" name="subAction"/>
                                            <button type="submit" class="btn btn-primary btn-sm logout" name="action" value="View Profile">
                                                <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Profile
                                            </button>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="MainController" method="Post">
                                            <button type="submit" class="btn btn-primary btn-sm logout" name="action" value="Logout">
                                                <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Logout
                                            </button>
                                        </form>
                                    </li>
                                </ducnh:if>
                                <ducnh:if test="${empty sessionScope.READER}">
                                    <li><a href="Register.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                    <li><a href="logintp.jsp?page=laptop"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                                </ducnh:if>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div class="container abody">
            <div class="row">
                <div class="col-md-9">
                    <%
                        PostDAO dao = new PostDAO();
                        List<PostDTO> list = dao.showLaptop();
                        if (list != null) {

                    %>
                    <div class="row">
                        <%                            for (int i = 0; i < list.size(); i++) {
                        %>
                        <div class="col-md-12 leftBody">
                            <div class="row">
                                <div class="col-md-12 headerTitle">
                                     <a href="ShowPostDetail?txtpostId=<%=list.get(i).getPostId()%>">
                                        <h2><%=list.get(i).getTitle()%></h2>
                                    </a>
                                </div>
                            </div>
                            <div class="row">
                                <span class="timeUp">By <%=list.get(i).getCollaboratorName()%> at <%=list.get(i).getPostedDate()%></span>
                            </div>
                            <div class="row">
                                <div class="col-md-12 mainPicture">
                                    <div class="row">
                                         <a href="ShowPostDetail?txtpostId=<%=list.get(i).getPostId()%>">
                                            <img class="img-responsive leftPicture" src="<%=list.get(i).getSymbolPic()%>">   
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 content">
                                    <div class="row">
                                        <span class="mainContent"><%=list.get(i).getMainContent()%></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <%
                        }
                    %>
                </div>
                <div class="col-md-3">
                    <div class="col-md-12 rightBody">

                        <div class="row">
                            <div class="col-md-12 headerRight">
                                <span>Tin Nổi Bật</span>
                            </div>
                        </div>
                        <%
                            List<PostDTO> list1 = dao.showPostTinNoiBat();
                            if (list1 != null) {
                                for (int i = 0; i < list1.size(); i++) {
                        %>
                        <a href="ShowPostDetail?txtpostId=<%=list.get(i).getPostId()%>">
                        <div class="row">
                            <div class="col-md-12 news-column">
                                <img class="img-responsive" src="<%=list1.get(i).getSymbolPic()%>" title="name">
                                <h4><%=list1.get(i).getTitle()%></h4>
                            </div>
                        </div>
                        </a>
                        <%                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <footer class="container footer">
        <div class="col-md-4 col-sm-4 col-xs-4">
            <div class="row">
                <h4>About us</h4>
                <li>
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
    </footer>

</html>