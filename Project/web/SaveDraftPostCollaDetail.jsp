<%-- 
    Document   : SaveDraftPostCollaDetail
    Created on : Oct 19, 2017, 11:48:38 PM
    Author     : KietPT
--%>
<%@page import="kietpt.dto.CategoryDTO"%>
<%@page import="kietpt.dto.UserDTO"%>
<%@page import="kietpt.dao.PostDAO"%>
<%@page import="java.util.List"%>
<%@page import="kietpt.dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Save Draft Post Detail</title>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Collaborator.css">
        <script src="JavaScript.js"></script>

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

        <script src="bootstrap-3.3.7-dist/js/jquery.form.js"></script>
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
                                    <h4 id="welcome">Hi,${sessionScope.COLLABORATOR.fullname}</h4>
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
                    <a href="SaveDraftPostByCollaborator.jsp" class="list-group-item active">Save Draft</a>
                    <a href="SubmittedPostCollaborator.jsp" class="list-group-item">Submited Post</a>
                    <a href="UpdatePostCollaborator.jsp" class="list-group-item">Update Post</a>
                </div>
                <div class="col-md-9 rightBody">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 id="add">SAVE DRAFT POST DETAILS</h1>
                        </div>
                    </div>
                    <form action="MainController" method="Post">
                    <div class="row">
                        <div class="col-md-9 title">
                            <div class="input-group">
                                <span class="input-group-addon">Title</span>
                                <input id="msg" type="text" class="form-control" name="txtTitle" value="${INFO.title}"  required="">
                            </div>
                        </div>
                        <div class="col-md-3 categories">
                            <div class="form-group">
                                <label for="sel1">Please select Categories:</label>
                                <select name="txtCategory" class="form-control">
                                    <option <c:if test="${INFO.cateId eq 1}">selected=""</c:if>>Laptop</option>
                                    <option <c:if test="${INFO.cateId eq 2}">selected=""</c:if>>Camera</option>
                                    <option <c:if test="${INFO.cateId eq 3}">selected=""</c:if>>Mobile</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 mainContent">

                                <div class="form-group">
                                    <label for="comment">Main Content:</label>
                                    <textarea name="txtMainContent" class="form-control" rows="3">${INFO.mainContent}</textarea>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-9 ">
                            <div class="row">
                                <div class="form-group content">
                                    <label for="comment">Content:</label>
                                    <textarea id="edit" name="txtContent" cols="118" rows="10">${INFO.content}</textarea>
                                </div>
                            </div>
                            <div class="row">
                                <input type="hidden" name="txtUserId" value="${sessionScope.COLLABORATOR.userId}"/>
                                <input type="hidden" name="txtPostId" value="${INFO.postId}"/>
                                <input type="hidden" name="txtSymbolPic" id="URL-Thumbnail" value="${INFO.symbolPic}"/>

                                <input type="hidden" value="${lastSearch}" name="txtSearch"/>
                                
                                
                                <!-- nút Submit trong trang SaveDraftDetail-->
                                <input type="hidden" name="subAction" value="SubmitSaveDraftPostColla"/>
                                 <button type="submit" class="btn btn-primary saveDraft" value="Submit" name="action" id="btnSubmit">Submit</button>

                                <!--Nut Save Draft trong trang SaveDraft Detail-->
                                
                                <button type="submit" class="btn btn-primary saveDraft" value="Save Draft" name="action" id="btnSaveDraft">Save Draft</button>
                                <input type="hidden" value="SaveDraftPostSaveDraft" name="subSaveDraft"/>

                            </div>
                        </div>
                        </form>
                        <div class="col-md-3 mainPicture">
                            <form id="upload-form" action="/Texteditor/upload_image" method="POST" enctype="multipart/form-data">
                                <input type="file" name="file" id="fileUploader" />
                                <span id="upload-error" class="error"></span>
                                <input type="submit" value="upload" id="upload-button" />
                            </form>
                            <div class="picture">
                                <img class="img-responsive" src="${INFO.symbolPic}" id="pic">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <button type="button" class="btn btn-primary btnBack" onclick="goBack()">
                            <span class="glyphicon glyphicon-menu-left"></span> Back
                        </button>
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
    <script>
        $(function () {
            $('#edit').froalaEditor({
                // Set the image upload URL.
                imageUploadURL: '/Texteditor/upload_image',
                imageUploadParams: {
                    id: 'my_editor'
                }
            }).on('froalaEditor.image.inserted', function (e, editor, $img, response) {
                // Do something here.
                var index = 0;
                for (var i = 0; i < 3; i++) {
                    index = $img.attr("src").indexOf('/', index) + 1;
                }
//                alert(index);
                var link = $img.attr("src").slice(index - 1, $img.attr("src").length);
                $img.attr("src", link);
//                alert($img.attr("src"));
            });
            $('#upload-form').ajaxForm({
                success: function (msg) {
                    alert("File has been uploaded successfully");
                    var index = 0;
                    for (var i = 0; i < 2; i++) {
                        index = msg["link"].indexOf('/', index) + 1;

                    }
                    var link = msg["link"].slice(index - 1, msg["link"].length);
                    $("#URL-Thumbnail").attr("value", link);
                    $(".picture img").attr("src", link);
                },
                error: function (msg) {
                    $("#upload-error").text("Couldn't upload file");
                }
            });
        });
    </script>
</html>
