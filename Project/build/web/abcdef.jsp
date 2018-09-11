<body>
        <div class="modal-header">
            <h4 class="modal-title">Register</h4>
        </div>
        <div class="modal-body">
            <form class="form-horizotal" id="RegisterForm" action="MainController" method="POST">
                <div class="row">
                    <div class="form-group">
                        <label for="pwd" class="control-label col-md-4 label">
                            User ID:
                        </label>
                        <div class="col-md-6">
                            <input type="text" class="form-control text" id="userName" placeholder="User ID" name="txtUserId" value="${sessionScope.INFOREGISTER.userId}">
                            <span id="errorUserName" class="error"></span>
                        </div>
                    </div>
                </div>
                <ducnh:if test="${not empty requestScope.DupPK}">
                    <div class="row">
                        <div class="form-group">
                            <font color="red"> 
                            ${DupPK}
                            </font>
                            <br/><br/>             
                        </div>
                    </div>
                </ducnh:if>
                <div class="row">
                    <div class="form-group">
                        <label for="pwd" class="control-label col-md-4 label">
                            Password:
                        </label>
                        <div class="col-md-6">
                            <input type="password" class="form-control text" id="password" placeholder="Password" name="txtPassword" value="${requestScope.INFOREGISTER.password}">
                            <span id="errorPassword" class="error"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="pwd" class="control-label col-md-4 label">
                            Full Name:
                        </label>
                        <div class="col-md-6">
                            <input type="text" class="form-control text" id="fullName" placeholder="Full Name" name="txtFullname" value="${requestScope.INFOREGISTER.fullname}">
                            <span id="errorFullName" class="error"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="pwd" class="control-label col-md-4 label">
                            Birthday:
                        </label>
                        <div class="col-md-6">
                            <input type="date" class="form-control text" id="birthday" name="txtBirthday" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${requestScope.INFOREGISTER.birthday}'/>"/>
                            <span id="errorBirthday" class="error"></span>
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
                                        <input type="radio" name="radioSex" value="Male" ${requestScope.INFOREGISTER.sex eq 'True' ? 'checked': ''}/>Male
                                    </label>
                                </div>
                                <div class="radio-inline">
                                    <label class="">
                                        <input type="radio" name="radioSex" value="Female" ${requestScope.INFOREGISTER.sex eq 'False' ? 'checked': ''}/>Female
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="pwd" class="control-label col-md-4 label">
                            Email:
                        </label>
                        <div class="col-md-6">
                            <input type="text" class="form-control text" id="email" placeholder="Email" name="txtEmail" value="${requestScope.INFOREGISTER.mail}" />
                            <span id="errorEmail" class="error"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="pwd" class="control-label col-md-4 label">
                            Phone:
                        </label>
                        <div class="col-md-6">
                            <input type="text" class="form-control text" id="phone" placeholder="Phone Number" name="txtPhone" value="${requestScope.INFOREGISTER.phone}"/>
                            <span id="errorPhone" class="error"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="pwd" class="control-label col-md-4 label">
                            Address:
                        </label>
                        <div class="col-md-6">
                            <input type="text" class="form-control text" id="address" placeholder="Address" name="txtAddress" value="${requestScope.INFOREGISTER.address}"/>
                            <span id="errorAddress" class="error"></span>
                        </div>
                    </div>
                </div>
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
                <div class="row">
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-6">
                            <input type="submit" value="Register" name="action" class="btn btn-success createButton" />
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>