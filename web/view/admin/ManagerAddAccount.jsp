<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    // Lấy ngày tháng hiện tại
    Date currentDate = new Date();

    // Tạo đối tượng SimpleDateFormat với định dạng mong muốn
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

    // Định dạng ngày tháng năm
    String formattedDate = sdf.format(currentDate);
%>--%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>

    </head>
    <body class="sb-nav-fixed">
        <%@include file="/navigator/adminheader.jsp" %>
        <%@include file="/navigator/adminmenu.jsp" %>

        <div id="layoutSidenav_content">
            <div class="container rounded bg-white mt-5 mb-5" style="margin-top: 0;">
                <!-- container -->
                <div>
                    <div class="col-xl-4">
                        <!-- Profile picture card-->
                        <div class="mb-4 mb-xl-0">
                            <!--<div class="card-header"></div>-->
                            <div class="card-body text-center">
                                <!-- Profile picture image--> 
                                <img class="img-account-profile rounded-circle mb-2" id="imgAvatar" style="max-height: 350px; max-width: 350px"
                                     src="${userAccount.getAvatar()}" 
                                     onerror="this.src='http://bootdey.com/img/Content/avatar/avatar1.png'" 
                                     alt="">
                            </div>
                        </div>
                    </div>
                    <!-- row -->
                    <div class="col-xl-8">
                        <!-- Account details card-->
                        <div class="mb-4">
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/ManagerAddAccount" method="post" enctype="multipart/form-data">
                                    <div class="mb-3">
                                        <label class="small mb-1" for="inputUsername">Username <span class="text-danger">${errorUserName}</span></label> </label>
                                        <input class="form-control" id="inputUsername"
                                               type="text" required
                                               name="username"
                                               placeholder="Enter your username" 
                                               value="${userAccount.getUser_name()}">
                                    </div>
                                    <div class="row gx-3 mb-3">

                                        <div class="col-md-6">

                                            <label class="small mb-1" for="inputFirstName">Gmail <span class="text-danger">${errorEmail}</span></label>
                                            <input class="form-control" id="inputFirstName"
                                                   type="email" required
                                                   placeholder="Enter your gmail" 
                                                   name="gmail"
                                                   value="${userAccount.getEmail()}">
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

                                    <div class="mb-3">
                                        <label class="small mb-1" for="inputEmailAddress">Upload Avatar</label>
                                        <input id="inputFile" type="file" name="txtAvatar" accept="image/*" required/>
                                    </div>
                                    <script>
                                        // L?y tham chi?u ??n n?t v? input
                                        var inputFile = document.getElementById('inputFile');

                                        // Th?m s? ki?n change cho input file
                                        inputFile.addEventListener('change', function () {
                                            var file = inputFile.files[0];
                                            validateFileType(file);
                                        });

                                        function validateFileType(file) {
                                            if (file) {
                                                var fileType = file.type;

                                                // Ki?m tra ??nh d?ng t?p c? ph?i l? h?nh ?nh hay kh?ng
                                                if (!fileType.startsWith('image/')) {
                                                    // Hi?n th? th?ng b?o l?i n?u t?p kh?ng ph?i l? h?nh ?nh
                                                    alert('Please choose a file image.');
                                                    clearFileInput();
                                                } else {
                                                    var fileReader = new FileReader();
                                                    fileReader.onload = function () {
                                                        var link = fileReader.result;
                                                        updateAvatar(link);
                                                    };
                                                    fileReader.readAsDataURL(file);
                                                }
                                            }
                                        }

                                        function clearFileInput() {
                                            // X?a gi? tr? c?a input file
                                            inputFile.value = '';

                                            // Ti?p t?c l?ng nghe s? ki?n change cho input file
                                            inputFile.addEventListener('change', function () {
                                                var file = inputFile.files[0];
                                                validateFileType(file);
                                            });
                                        }

                                        function updateAvatar(link) {
                                            var imgElement = document.getElementById("imgAvatar");
                                            imgElement.src = link;
                                        }
                                    </script>
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
                                    <div class="row gx-3 mb-3">
                                        <div class="col-md-6">
                                            <label class="form-label small mb-1">Role</label>
                                            <select class="form-select" name="roleSelect">
                                                <option value="Customer" selected>Customer</option>
                                                <option value="Admin" 
                                                        <c:if test="${userAccount.getRoleName().equals('Admin')}">
                                                            selected
                                                        </c:if>
                                                        >Admin</option>
                                                <option value="Management" 
                                                        <c:if test="${userAccount.getRoleName().equals('Management')}">
                                                            selected
                                                        </c:if>>Management</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="small mb-1" for="inputEmailAddress">Password</label>
                                        <input class="form-control" id="inputEmailAddress"
                                               type="text" name="pass" required
                                               placeholder="Enter your password" value="${userAccount.getAvatar()}">
                                    </div>
                                    <br/>
                                    <button class="btn btn-primary" type="submit">Save changes</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /container -->
            </div>
            <!--</main>-->
            <!-- Footer-->
        </div>
    </body>
</html>
