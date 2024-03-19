<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : profile
    Created on : Jan 17, 2024, 2:48:08 AM
    Author     : LanChau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/profile.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    </head>
    <body>
        <%@include file="/navigator/userHeaderVer2.jsp"%>
        <div class="container-xl px-4 mt-4">
            <%@include file="/navigator/subMenuUser.jsp"%>
            <hr class="mt-0 mb-4">
            <div class="row">
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <!--<div class="card-header"></div>-->
                        <div class="card-body text-center">
                            <!-- Profile picture image--> 
                            <img class="img-account-profile rounded-circle mb-2" 
                                 src="${pageContext.request.contextPath}/imgUser/${userAccount.getAvatar()}"
                                 onerror="this.src='http://bootdey.com/img/Content/avatar/avatar1.png'"  
                                 alt="">
                            <!-- Profile picture help block-->
                            <div class="small font-italic text-muted mb-4">  </div>
                            <!-- Profile picture upload button-->  
                            <a class="btn btn-primary" href="#">Log out</a>
                            <button id="updateImageBtn" class="btn btn-primary">Update Image</button>
                            <form id="formImg" hidden action="UpdateImageUser" method="post" enctype="multipart/form-data">
                                <input id="inputFile" type="file" name="photo" accept="image/*"/>
                            </form>
                            <script>
                                // Lấy tham chiếu đến nút và input
                                var updateImageBtn = document.getElementById('updateImageBtn');
                                var inputFile = document.getElementById('inputFile');
                                var formImg = document.getElementById('formImg');

                                // Thêm sự kiện click cho nút "Update Image"
                                updateImageBtn.addEventListener('click', function () {
                                    // Kích hoạt sự kiện click cho input file
                                    inputFile.click();
                                });

                                // Thêm sự kiện change cho input file
                                inputFile.addEventListener('change', function () {
                                    // Kiểm tra xem có tệp nào được chọn hay không
                                    if (inputFile.files.length > 0) {
                                        var file = inputFile.files[0];
                                        var fileType = file.type;

                                        // Kiểm tra định dạng tệp có phải là hình ảnh hay không
                                        if (fileType.startsWith('image/')) {
                                            // Tự động gửi form khi người dùng chọn ảnh
                                            formImg.submit();
                                        } else {
                                            // Hiển thị thông báo lỗi nếu tệp không phải là hình ảnh
                                            alert('Please choose a file image.');
                                        }
                                    }
                                });
                            </script>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/UpdateProfileUser" method="post">
                                <p class="text-danger"> ${errorUsername}</p>
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputUsername">Username </label>
                                    <input class="form-control" id="inputUsername" type="text" name="txtUsername" required
                                           placeholder="Enter your username" value="${userAccount.getUser_name()}">
                                </div>
                                <p class="text-danger"> ${errorGmail}</p>
                                <div class="row gx-3 mb-3">

                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputFirstName">Gmail</label>
                                        <input class="form-control" id="inputFirstName" type="email" name="txtGmail" required
                                               placeholder="Enter your gmail" value="${userAccount.getEmail()}">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputLastName">Full Name</label>
                                        <input class="form-control" id="inputLastName" type="text" name="textFullName" required
                                               placeholder="Enter your last name" value="${userAccount.getFullName()}">
                                    </div>
                                </div>
                                <div class="row gx-3 mb-3">
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputOrgName">Phone</label>
                                        <input class="form-control" id="inputOrgName" type  ="text" name="txtPhone" required
                                               placeholder="Enter your phone" value="${userAccount.getPhone()}">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputLocation">Address</label>
                                        <input class="form-control" id="inputLocation" type="text" name="txtAddress" required
                                               placeholder="Enter your address" value="${userAccount.getAddress()}">
                                    </div>
                                </div>
                                <div hidden class="mb-3">
                                    <label class="small mb-1" for="inputEmailAddress">Link Avatar</label>
                                    <input  class="form-control" id="inputEmailAddress" type="text" name="txtAvatar" required
                                            placeholder="Enter your link avatar" value="${userAccount.getAvatar()}">
                                </div>
                                <div class="row gx-3 mb-3">

                                    <div class="col-md-6">
                                        <label class="small mb-1" >Gender: </label>
                                        <input  id="inputGenderMale" type="radio" name="gender"
                                                checked   value="1"> 
                                        <label for="inputGenderMale">Male</label>
                                        <input  id="inputGenderFeMale" type="radio" name="gender"
                                                <c:if test="${!userAccount.getGender()}">
                                        checked
                                        </c:if>
                                        value="0">
                                        <label for="inputGenderFeMale">FeMale</label>
                                    </div>
                                </div>
                                <button class="btn btn-primary" type="submit">Save changes</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
