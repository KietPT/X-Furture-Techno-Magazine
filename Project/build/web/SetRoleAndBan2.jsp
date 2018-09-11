<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ducnh" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title></title>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="CreateAccountAdmin.css">
        <script src="JavaScript.js"></script>
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
        <div class="col-md-12 title">
            <title>Manage Account Admin</title>
        </div>
        <div class="col-md-6 created">
            <form>
                <div class="row">
                    <div class="form-group">
                        <label for="pwd" class="control-label col-md-4 label">
                            User ID:
                        </label>
                        <div class="col-md-6">
                            <input type="text" class="form-control text" id="pwd" placeholder="User ID" name="txtUserId" value="${requestScope.AccountDetails.userId}" readonly="true"/>
                            <span class="error" id="errorUserName"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="pwd" class="control-label col-md-4 label">
                            Full Name:
                        </label>
                        <div class="col-md-6">
                            <input type="text" class="form-control text" id="pwd" placeholder="Full Name" name="txtFullname" value="${requestScope.AccountDetails.fullname}" readonly="true"/>
                            <span class="error" id="errorFullName"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="pwd" class="control-label col-md-4 label">
                            Birthday:
                        </label>
                        <div class="col-md-6">
                            <input type="date" class="form-control text" id="pwd" name="txtBirthday" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${requestScope.AccountDetails.birthday}'/>" readonly="true"/>
                            <span class="error" id="errorBirthday"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="pwd" class="control-label col-md-4 label">
                            Sex:
                        </label>
                        <div class="col-md-6 sex">
                            <div class="row">
                                <div class="radio-inline">
                                    <label class="">
                                        <input type="radio"disabled="true" name="radioSex" value="Male" ${requestScope.AccountDetails.sex eq 'True' ? 'checked': ''}/> Male
                                    </label>
                                </div>
                                <div class="radio-inline">
                                    <label class="">
                                        <input type="radio" disabled="true" name="radioSex" value="Female" ${requestScope.AccountDetails.sex eq 'False' ? 'checked': ''}/> Female
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="pwd" class="control-label col-md-4 label">
                            Phone:
                        </label>
                        <div class="col-md-6">
                            <input type="text" class="form-control text" id="pwd" placeholder="Phone" name="txtPhone" value="${requestScope.AccountDetails.phone}" readonly="true"/>
                            <span class="error" id="errorPhone"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="pwd" class="control-label col-md-4 label">
                            Email:
                        </label>
                        <div class="col-md-6">
                            <input type="text" class="form-control text" id="pwd" placeholder="Email" name="txtEmail" value="${requestScope.AccountDetails.mail}" readonly="true"/>
                            <span class="error" id="errorEmail"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="pwd" class="control-label col-md-4 label">
                            Address:
                        </label>
                        <div class="col-md-6">
                            <input type="text" class="form-control text" id="pwd" placeholder="Address" name="txtAddress" value="${requestScope.AccountDetails.address}" readonly="true"/>
                            <span class="error" id="errorAddress"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="pwd" class="control-label col-md-4 label">
                            Role:
                        </label>
                        <div class="col-md-6">
                            <div class="row">
                                <div class="styled-select slate">
                                    <select name="listRole">
                                        <option <ducnh:if test="${requestScope.AccountDetails.role eq '3'}">selected=""</ducnh:if> value="Moderator">Moderator</option>
                                        <option <ducnh:if test="${requestScope.AccountDetails.role eq '2'}">selected=""</ducnh:if> value="Collaborator">Collaborator</option>
                                        <option <ducnh:if test="${requestScope.AccountDetails.role eq '1'}">selected=""</ducnh:if> value="Member">Member</option>
                                        </select>
                                    </div>
                                    <span class="error" id="errorRole"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label for="pwd" class="control-label col-md-4 label">
                                Status:
                            </label>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="styled-select slate">
                                        <select name="listStatus">
                                            <option <ducnh:if test="${requestScope.AccountDetails.statusId eq '0'}">selected=""</ducnh:if> value="Banned">Banned</option>
                                        <option <ducnh:if test="${requestScope.AccountDetails.statusId eq '1'}">selected=""</ducnh:if> value="Active">Active</option>                                                    
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
                <div class="row">
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-6">
                            <input type="hidden" value="SetRoleAndBanned" name="subAction"/>
                            <input type="submit" class="btn btn-success createButton" value="Update" name="action"/>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>