
<%@page import="kietpt.dto.PostDTO"%>
<%@page import="java.util.List"%>
<%@page import="kietpt.dao.PostDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ducnh" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Index Page</title>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Index1_1.css"/>
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
                                <li class="active"><a href="index.jsp">Home</a></li>
                                <li><a href="Camera.jsp">Camera</a></li>
                                <li><a href="Mobile.jsp">Mobile</a></li>
                                <li><a href="Laptop.jsp">Laptop</a></li>
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
                                    <li><a href="logintp.jsp?page=index"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                                </ducnh:if>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div class="container abody">
            <div class="row">
                <div class="col-md-6">
                    <%
                        PostDAO dao = new PostDAO();
                        List<PostDTO> list = dao.showPostHeader();
                        if (list != null) {
                    %>
                    <div class="row">
                        <div class="col-md-12 abody1">

                            <div class="row">
                                <a href="ShowPostDetail?txtpostId=<%=list.get(0).getPostId()%>">
                                    <div class="abody1Picture">
                                        <img class="img-responsive" src="<%=list.get(0).getSymbolPic()%>" alt="">
                                    </div>
                                    <div class="abody1Title">
                                        <span><%=list.get(0).getTitle()%></span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 abody2">
                    <div class="row">
                        <div class="col-md-12 abody21">
                            <div class="row">
                                <a href="ShowPostDetail?txtpostId=<%=list.get(1).getPostId()%>">
                                    <div class="abody21Picture">
                                        <img class="img-responsive" src="<%=list.get(1).getSymbolPic()%>" alt="">
                                    </div>
                                    <div class="abody21Title">
                                        <span><%=list.get(1).getTitle()%></span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <%
                            for (int i = 2; i < list.size(); i++) {
                        %>
                        <div class="col-md-6">

                            <div class="row">
                                <div class="col-md-12 abody22">
                                    <div class="row">
                                        <a href="ShowPostDetail?txtpostId=<%=list.get(i).getPostId()%>">
                                            <div class="abody22Picture">
                                                <img class="img-responsive" src="<%=list.get(i).getSymbolPic()%>" alt="">
                                            </div>
                                            <div class="abody22Title">
                                                <span><%=list.get(i).getTitle()%></span>
                                            </div>
                                        </a>
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
            </div>
            <div class="row">
                <div class="col-md-7 rightBody">
                    <div class="row">
                        <div class="col-md-12 rightBody1">
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="row">
                                        <div class="headerBody1">
                                            <span>CAMERA</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 middleBody">
                            <div class="row">
                                <%
                                    List<PostDTO> list1 = dao.showPostCamera();
                                    if (list1 != null) {
                                %>
                                <div class="col-md-6 col-sm-6 col-xs-6 middleBody1">
                                    <div class="row">
                                        <a href="ShowPostDetail?txtpostId=<%=list1.get(0).getPostId()%>" style="text-decoration: none">
                                            <div class="img">
                                                <img class="img-responsive" src="<%=list1.get(0).getSymbolPic()%>" alt="">
                                            </div>
                                            <div class="bodyTitle">
                                                <h4><%=list1.get(0).getTitle()%></h4>
                                                <p><%=list1.get(0).getMainContent()%>...</p>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6 middleBody2">
                                    <%
                                        for (int i = 1; i < list1.size(); i++) {
                                    %>
                                    <div class="row">
                                        <a href="ShowPostDetail?txtpostId=<%=list1.get(i).getPostId()%>">
                                            <div class="img2">
                                                <img class="img-responsive" src="<%=list1.get(i).getSymbolPic()%>" alt="">
                                            </div>
                                            <div class="title2">
                                                <span><%=list1.get(i).getTitle()%></span>
                                            </div>
                                        </a>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 rightBody2">
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="row">
                                        <div class="headerBody2">
                                            <span>Laptop</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 middleBody">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <%
                                            List<PostDTO> list2 = dao.showPostLatop1();
                                            if (list2 != null) {
                                                for (int i = 0; i < list2.size(); i++) {
                                        %>
                                        <div class="col-md-6 col-sm-6 col-xs-6 middleBody1">
                                            <div class="row">
                                                <a href="ShowPostDetail?txtpostId=<%=list2.get(i).getPostId()%>" style="text-decoration: none">
                                                    <div class="img4">
                                                        <img class="img-responsive" src="<%=list2.get(i).getSymbolPic()%>" alt="">
                                                    </div>
                                                    <div class="bodyTitle">
                                                        <h4><%=list2.get(i).getTitle()%></h4>
                                                        <p><%=list2.get(i).getMainContent()%>,...</p>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <%
                                                }
                                            }
                                        %>
                                    </div>
                                    <br>

                                    <div class="row">
                                        <%
                                            List<PostDTO> list3 = dao.showPostLatop2();
                                            if (list3 != null) {
                                                for (int i = 0; i < list3.size(); i++) {
                                        %>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <div class="row">
                                                <a href="ShowPostDetail?txtpostId=<%=list3.get(i).getPostId()%>">
                                                    <div class="img3">
                                                        <img class="img-responsive" src="<%=list3.get(i).getSymbolPic()%>" alt="">
                                                    </div>
                                                    <div class="title2">
                                                        <span><%=list3.get(i).getTitle()%></span>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <%
                                                }
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 rightBody3">
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="row">
                                        <div class="headerBody3">
                                            <span>Moblie</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-12 middleBody">
                                    <div class="row">
                                        <%
                                            List<PostDTO> list4 = dao.showPostMobile();
                                            if (list4 != null) {
                                        %>
                                        <div class="col-md-6 col-sm-6 col-xs-6 middleBody1">
                                            <div class="row">
                                                <a href="ShowPostDetail?txtpostId=<%=list4.get(0).getPostId()%>" style="text-decoration: none">
                                                    <div class="img">
                                                        <img class="img-responsive" src="<%=list4.get(0).getSymbolPic()%>" alt="">
                                                    </div>
                                                    <div class="bodyTitle">
                                                        <h4><%=list4.get(0).getTitle()%></h4>
                                                        <p><%=list4.get(0).getMainContent()%>...</p>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6 middleBody2">
                                            <%
                                                for (int i = 1; i < list4.size(); i++) {
                                            %>
                                            <div class="row">
                                                <a href="ShowPostDetail?txtpostId=<%=list4.get(i).getPostId()%>">
                                                    <div class="img2">
                                                        <img class="img-responsive" src="<%=list4.get(i).getSymbolPic()%>" alt="">
                                                    </div>
                                                    <div class="title2">
                                                        <span><%=list4.get(i).getTitle()%></span>
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }
                                            %>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    List<PostDTO> list10 = dao.showPostTinNoiBat();
                    if (list10 != null) {
                %>
                <div class="col-md-4 leftBody">
                    <div class="row">
                        <div class="col-md-6 leftBody1">
                            <div class="row">
                                <h3>Tin nổi bật</h3>
                            </div>
                        </div>
                    </div>
                    <%
                        for (int i = 0; i < list10.size(); i++) {
                    %>
                    <div class="row">
                        <a href="ShowPostDetail?txtpostId=<%=list10.get(i).getPostId()%>&txtNumberOfView=<%=list10.get(i).getNumberOfView()%>">
                            <div class="col-md-2 img5">
                                <img class="img-responsive" src="<%=list10.get(i).getSymbolPic()%>" alt="" width="100%"/>
                            </div>
                            <div class="col-md-9 title3">
                                <%=list10.get(i).getTitle()%>
                            </div>
                        </a>
                    </div>
                    <%
                        }
                    %> 


                </div>
                <%
                    }
                %> 
            </div>
        </div>
    </body>
    <footer class="container">
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
