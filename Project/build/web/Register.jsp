<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ducnh" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="Register.css" />

    </head>

    <body>
        <div class="container">
            <div class="login-box animated fadeInUp">
                <div class="box-header header">
                    <h2>Register</h2>
                </div>
                <div class="col-md-12">
                    <form class="form-horizotal" id="RegisterForm" action="MainController" method="POST">
                        <div class="form-group">
                            <label for="pwd">UserName:</label>
                            <input type="text" class="form-control text" id="userName" placeholder="Enter UserName" name="txtUserId" value="${sessionScope.INFOREGISTER.userId}" required="">
                            <ducnh:if test="${not empty requestScope.DupPK}">
                                <font color="red"> ${DupPK}</font>
                            </ducnh:if>
                        </div>

                        <div class="form-group">
                            <label for="pwd">Password:</label>
                            <input type="password" class="form-control text" id="password" placeholder="Enter Password" name="txtPassword" required="">
                            <ducnh:if test="${not empty requestScope.REGISTERERROR.errorPass}">
                                <font color="red"> ${REGISTERERROR.errorPass}</font>
                            </ducnh:if>
                        </div>
                        <div class="form-group">
                            <label for="pwd">Confirm Password:</label>
                            <input type="password" class="form-control text" id="password" placeholder="Enter Password" name="txtConfirmPassword" required="">
                            <ducnh:if test="${not empty requestScope.REGISTERERROR.errorPass}">
                                <font color="red"> ${REGISTERERROR.errorPass}</font>
                            </ducnh:if>
                        </div>
                        <div class="form-group">
                            <label for="fullName">Full Name:</label>
                            <input type="text" class="form-control text" id="fullName" placeholder="Enter Full Name" name="txtFullname" value="${requestScope.INFOREGISTER.fullname}" required="">
                            <ducnh:if test="${not empty requestScope.REGISTERERROR.errorFullname}">
                                <font color="red"> ${REGISTERERROR.errorFullname}</font>
                            </ducnh:if>
                        </div>
                        <div class="form-group">
                            <label for="birthDay">Birthday:</label>
                            <input type="date" class="form-control text" id="birthday" name="txtBirthday" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${requestScope.INFOREGISTER.birthday}'/>" required=""/>
                            <ducnh:if test="${not empty requestScope.REGISTERERROR.errorDob}">
                                <font color="red"> ${REGISTERERROR.errorDob}</font>
                            </ducnh:if>
                        </div>
                        <div class="form-group">
                            <label for="birthDay">Sex:</label>
                            <label class="radio-inline">
                                <input type="radio" name="radioSex" value="Male" checked="" ${requestScope.INFOREGISTER.sex eq 'True' ? 'checked': ''}/>Male
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="radioSex" value="Female" ${requestScope.INFOREGISTER.sex eq 'False' ? 'checked': ''}/>Female
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="fullName">email:</label>
                            <input type="text" class="form-control text" id="email" placeholder="Enter Email" name="txtEmail" value="${requestScope.INFOREGISTER.mail}"  required=""/>
                            <ducnh:if test="${not empty requestScope.REGISTERERROR.errorMail}">
                                <font color="red"> ${REGISTERERROR.errorMail}</font>
                            </ducnh:if>
                        </div>
                        <div class="form-group">
                            <label for="fullName">phone:</label>
                            <input type="text" class="form-control text" id="phone" placeholder="Phone Number" name="txtPhone" value="${requestScope.INFOREGISTER.phone}" required=""/>
                            <ducnh:if test="${not empty requestScope.REGISTERERROR.errorPhone}">
                                <font color="red"> ${REGISTERERROR.errorPhone}</font>
                            </ducnh:if>
                        </div>
                        <div class="form-group">
                            <label for="fullName">address:</label>
                            <input type="text" class="form-control text" id="address" placeholder="Address" name="txtAddress" value="${requestScope.INFOREGISTER.address}" required=""/>
                            <ducnh:if test="${not empty requestScope.REGISTERERROR.errorAddr}">
                                <font color="red"> ${REGISTERERROR.errorAddr}</font>
                            </ducnh:if>
                        </div>

                        <button type="submit" value="Register" name="action" class="btn btn-default register">Register</button>
                    </form>
                    <ducnh:if test="${not empty requestScope.CREATESUCCESS}">
                        <font color="red" style="text-align: 'center'; font-size: 20px;">${CREATESUCCESS}</font>
                    </ducnh:if>
                    <br/><br/>
                    <a href="index.jsp" style="text-decoration: none">Back To home</a>
                </div>
            </div>
        </div>
    </body>

</html>
