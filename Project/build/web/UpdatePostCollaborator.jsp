<%-- 
    Document   : RejecttedPostCollaborator
    Created on : Oct 18, 2017, 10:18:25 PM
    Author     : KietPT
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="kietpt.dto.PostDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rejected Post Collaborator</title>
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
                                    <h4 id="welcome">Hi, ${sessionScope.COLLABORATOR.fullname}</h4>
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
                    <a href="UpdateProfileCollaborator.jsp" class="list-group-item">Profile</a>
                    <a href="ChangePassCollaborator.jsp" class="list-group-item">Change Password</a>
                    <a href="AddPostCollaborator.jsp" class="list-group-item">Add Post</a>
                    <a href="SaveDraftPostByCollaborator.jsp" class="list-group-item">Save Draft</a>
                    <a href="SubmittedPostCollaborator.jsp" class="list-group-item">Submited Post</a>
                    <a href="UpdatePostCollaborator.jsp" class="list-group-item active">Update Post</a>
                </div>
                <div class="col-md-9 rightBody">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 id="add">UPDATE POST</h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 search">
                            <form action="MainController" method="Post">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search" name="txtSearch" required>
                                    <input type="hidden" name="txtUserId" value="${sessionScope.COLLABORATOR.userId}"/>

                                    <input type="hidden" name="subAction" value="subSearchPost"/>
                                    <input type="hidden" name="subActionPost" value="updatePostCo"/>

                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit" name="action" value="Search"><i class="glyphicon glyphicon-search"></i></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <div class="table-responsive">
                            <%
                                String search = request.getParameter("txtSearch");
                                if (search != null) {
                                    List<PostDTO> list = (ArrayList<PostDTO>) request.getAttribute("LIST");
                                    if (list == null || list.isEmpty()) {
                            %>
                            <h3><font color="red">
                                No Record
                                </font></h3>
                                <%
                                } else {
                                %>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Title</th>
                                        <th>Categories</th>
                                        <th>Date</th>
                                        <th>Button</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (int i = 0; i < list.size(); i++) {
                                    %>
                                    <tr>
                                        <td><%=i + 1%></td>
                                        <td><%=list.get(i).getTitle()%></td>
                                        <td><%=list.get(i).getCategoryName()%></td>
                                        <td><%=list.get(i).getPostedDate()%></td>
                                        <td>
                                            <form action="MainController" method="Post">
                                                <input type="hidden" value="<%=list.get(i).getPostId()%>" name="txtPostId"/>
                                                <input type="hidden" value="${sessionScope.COLLABORATOR.userId}" name="txtUserId"/>

                                                <input type="hidden" value="${lastSearch}" name="txtSearch"/>

                                                <input type="hidden" name="subAction" value="subViewPost"/>
                                                <input type="hidden" name="subView" value="updatePostCoDetail"/>
                                                <button type="submit" name="action" value="View" class="btn btn-primary btn-sm">View</button>
                                            </form>
                                        </td>
                                    </tr> 
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                            <%
                                    }
                                }
                            %>                 
                        </div>
                    </div>
                    <div class="col-md-12 messageTitle">
                        <span id="message">${Success.message}</span>
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
    </body>
</html>
