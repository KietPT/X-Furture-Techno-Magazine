<%-- 
    Document   : PostDetail
    Created on : Oct 17, 2017, 8:32:30 PM
    Author     : KietPT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kietpt.dto.PostDTO"%>
<%@page import="kietpt.dao.PostDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Index Page</title>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="ForumCamera.css"/>
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
                                <li><a href="Laptop.jsp">Laptop</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <c:if test="${not empty sessionScope.READER}">
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
                                </c:if>
                                <c:if test="${empty sessionScope.READER}">
                                    <li><a href="Register.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                    <li><a href="logintp.jsp?page=postDetail"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div class="container abody">
            <div class="row">
                <div class="col-md-9 leftBody">
                     <div class="row">
                         <span class="timeUpDetails">Author: <font style="font-size: 20px;color: #009900">${sessionScope.INFO.collaboratorName}</font></span>
                         <span class="timeUpDetails">Time:  <font style="font-size: 20px; color: slategray">${sessionScope.INFO.postedDate}</font></span>
                         <span class="timeUpDetails">View : <font style="font-size: 20px;color: tomato">${sessionScope.INFO.numberOfView}</font></span>
                    </div>
                    <div class="row">
                        <div class="col-md-12 mainPicture">
                            <div class="row">
                                <a href="#">
                                    <img class="img-responsive leftPicture" src="${INFO.symbolPic}"/>   
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 headerTitleDetail">
                            <h2>${sessionScope.INFO.title}</h2>
                        </div>
                    </div>
                   
                    <div class="row">
                        <div class="col-md-12 content">
                            <span class="mainContentDetails">
                                ${INFO.content}
                            </span>
                        </div>
                    </div>
                            
                    <div class="row">
                        <h4 id="titleComment">Comment: </h4>
                    </div>
                    <c:set value="${sessionScope.LIST}" var="list"/>
                    <c:if test="${not empty list}">
                        <c:forEach var="dto" items="${list}">
                            <div class="row">
                                <div class="comments-list listCmt">
                                    <div class="media">
                                        <p class="pull-right"><small>${dto.timeOfCmt}</small></p>
                                        <a class="media-left" href="#">
                                            <img id="avatar" src="Picture/icon/male.png">
                                        </a>
                                        <div class="media-body">
                                            <h4 class="media-heading user_name">${dto.fullname}</h4>
                                            ${dto.contentOfCmt}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${not empty sessionScope.READER}">
                        <div class="row">
                            <form action="MainController" method="Post">
                                <div class="form-group comment">
                                    <label for="comment" id="lbCmt">Comment:</label>
                                    <textarea name="txtComment" class="form-control" rows="5" placeholder="Comment" id="da"></textarea>
                                    <input type="hidden" name="txtUserId" value="${sessionScope.READER.userId}"/>
                                    <input type="hidden" name="txtPostId" value="${sessionScope.INFO.postId}"/>
                                </div>
                                <button type="submit" value="Insert" name="action" class="btn btn-primary btnCmt">Send</button>
                            </form>
                        </div>
                    </c:if>
                </div>
                <div class="col-md-3">
                    <div class="col-md-12 rightBody">

                        <div class="row">
                            <div class="col-md-12 headerRight">
                                <span>Tin Nổi Bật</span>
                            </div>
                        </div>
                        <%
                            PostDAO dao = new PostDAO();
                            List<PostDTO> list = dao.showPostTinNoiBat();
                            if (list != null) {
                                for (int i = 0; i < list.size(); i++) {
                        %>
                        <a href="ShowPostDetail?txtpostId=<%=list.get(i).getPostId()%>">
                            <div class="row">
                                <div class="col-md-12 news-column">
                                    <img class="img-responsive" src="<%=list.get(i).getSymbolPic()%>" title="name">
                                    <h4><%=list.get(i).getTitle()%></h4>
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
