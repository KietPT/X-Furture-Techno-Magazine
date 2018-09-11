<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ducnh" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Report</title>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="ManageAccount-Admin.css">
    </head>

    <body>
        <div class="container header">
            <div class="row">
                <div class="col-md-4 logo">
                    <img src="Picture/logo.jpg" width="60%" height="80%">
                </div>
                <div class="col-md-3 signin">
                    <img src="Picture/icon/user.png" alt=""> <span style="font-size: 20px">Hi,${sessionScope.ADMIN.fullname}</span>
                </div>
                <div class="col-md-1 logout">
                    <div class="row">
                        <form action="MainController" method="Post">
                            <div class="row">
                                <input type="submit" class="btn btn-info" value="Logout" name="action">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="container abody">
            <div class="row">
                <div class="col-md-2 menu">
                    <div class="row">
                        <div class="submenu">
                            <a href="ManageAccountAdmin.jsp">Manage Account</a>
                        </div>
                        <div class="submenu">
                            <a href="CreateAccountAdmin.jsp">Create Account</a>
                        </div>
                        <div class="submenu">
                            <a href="Report.jsp">Report</a>
                        </div>

                    </div>
                </div>
                <div class="col-md-9 nextbody">
                    <div class="row">
                        <div class="col-md-6 title">
                            <h3>Top 5 collaborators have the most posts(*) and total views</h3>
                        </div>
                    </div>
                    <form action="MainController" method="POST">
                        <div class="row">
                            <div class="col-md-6 title">
                                <div class="form-group">
                                    <label for="pwd" class="control-label col-md-4 label" id="passowrd">
                                        From
                                    </label>
                                    <div class="col-md-6">
                                        <input type="date" class="form-control text" id="pwd" name="txtFrom" value="${param.txtFrom}"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 title">
                                <div class="form-group">
                                    <label for="pwd" class="control-label col-md-4 label" id="passowrd">
                                        To
                                    </label>
                                    <div class="col-md-6">
                                        <input type="date" class="form-control text" id="pwd" name="txtTo" value="${param.txtTo}"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 search">
                            <div class="row">                            
                                <div class="input-group">                                    
                                    <div class="input-group-btn">
                                        <input type="hidden" name="subAction" value="Report"/>
                                        <input class="btn btn-default" type="submit" value="Search" name="action"/>
                                    </div>
                                </div>                            
                            </div>
                        </div>
                    </form>
                    <div class="row">
                        <div class="col-md-10">
                            <ducnh:if test="${not empty requestScope.TOPPOST}">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>NO</th>
                                            <th>Collaborator</th>
                                            <th>Total Post</th>
                                            <th>Total View</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <ducnh:forEach items="${requestScope.TOPPOST}" var="dto" varStatus="counter">
                                            <tr class="active">
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
    </body>
</html>