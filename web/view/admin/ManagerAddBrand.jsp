<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <%@include file="/navigator/adminheader.jsp"%>
        <%@include file="/navigator/adminmenu.jsp"%>

        <div id="layoutSidenav_content">
            <!-- container -->
            <div class="container">
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="mb-4 mb-xl-0">
                        <!--<div class="card-header"></div>-->
                        <div class="card-body text-center">
                            <!-- Profile picture image--> 
                            <img class="img-account-profile rounded-circle mb-2" id="imgAvatar" style="max-height: 350px; max-width: 350px"
                                 src="${pageContext.request.contextPath}/imgBrand/${brand.getImg()}" 
                                 onerror="this.src='http://bootdey.com/img/Content/avatar/avatar1.png'" 
                                 alt="">
                        </div>
                    </div>
                </div>
                <!-- row -->
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="mb-4">
                        <div class="">
                            <form action="${pageContext.request.contextPath}/ManagerAddBrand" method="post" enctype="multipart/form-data">

                                <div class="mb-3">
                                    <p class="text-danger">${errorUsername}</p>
                                    <label class="small mb-1" for="inputUsername">Name </label>
                                    <input class="form-control" id="inputUsername"
                                           type="text" required name="txtName"
                                           placeholder="Enter your Name" 
                                           value="${brand.getName()}">
                                </div>
                                <div class="row gx-3 mb-3">
                                    <div class="col-md-6">
                                        <!--<p class="text-danger">${errorGmail}</p>-->
                                        <label class="small mb-1" for="inputFirstName">Description</label>
                                        <input class="form-control" id="inputFirstName" 
                                               type="text" required 
                                               name="txtDes"
                                               placeholder="Enter your description"
                                               value="${brand.getDes()}"> 
                                    </div>
                                    <div class="col-md-3">
                                        <label class="small mb-1" for="inputEmailAddress">Upload New Avatar</label>
                                        <input id="inputFile" type="file" name="txtAvatar" accept="image/*" />
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

                                </div>  
                                <button class="btn btn-primary" type="submit">Save changes</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /container -->
        </div>
    </body>
</html>
