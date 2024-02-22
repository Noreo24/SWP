<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Electro - HTML Ecommerce Template</title>

        <!-- Google font -->
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

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <%@include file="/navigator/adminheader.jsp" %>
<<<<<<< HEAD:web/view/admin/adminMenu.jsp
        <div class="d-grid gap-2" style="display: flex; flex-direction: column; align-items: center;">
            <button class="btn btn-primary" style="margin-top: 20px" type="button">Products manage</button>
            <button class="btn btn-success" style="margin-top: 20px" type="button">Accounts manage</button>
            <a href="${pageContext.request.contextPath}/bloglistmanage"><button class="btn btn-info" style="margin-top: 20px" type="button">Blogs manage</button></a>
=======
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <%@include file="/navigator/navigation.jsp" %>
        <!-- /NAVIGATION -->

        <!-- BREADCRUMB -->
        <%@include file="navigator/menu.jsp" %>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <!--<div class="card-header"></div>-->
                        <div class="card-body text-center">
                            <!-- Profile picture image--> 
                            <img class="img-account-profile rounded-circle mb-2" id="imgAvatar" style="max-height: 350px; max-width: 350px"
                                 src="${pageContext.request.contextPath}/imgUser/${userAccount.getAvatar()}" 
                                 onerror="this.src='http://bootdey.com/img/Content/avatar/avatar1.png'" 
                                 alt="">
                        </div>
                    </div>
                </div>
                <!-- row -->
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/ManagerEditAccount" method="post" enctype="multipart/form-data">
                                <input hidden type="text" name="userID" value="${userAccount.getUserID()}" required/>
                                <div class="mb-3">
                                    <p class="text-danger">${errorUsername}</p>
                                    <label class="small mb-1" for="inputUsername">Username </label>
                                    <input class="form-control" id="inputUsername" type="text" required name="txtUsername"
                                           placeholder="Enter your username" value="${userAccount.getUser_name()}">
                                    <input type="text" required hidden name="txtUsernameOld"
                                           value="${accountOld.getUser_name()}">
                                </div>
                                <div class="row gx-3 mb-3">
                                    <div class="col-md-6">
                                        <p class="text-danger">${errorGmail}</p>
                                        <label class="small mb-1" for="inputFirstName">Gmail</label>
                                        <input class="form-control" id="inputFirstName" type="email" required name="txtGmail"
                                               placeholder="Enter your gmail" value="${userAccount.getEmail()}">
                                        <input type="text" required hidden name="txtGmailOld"
                                               value="${accountOld.getEmail()}">
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

                                <!--                                <div class="mb-3">
                                                                    <label class="small mb-1" for="inputEmailAddress">Link Avatar</label>
                                                                    <input class="form-control" id="inputEmailAddress" type="text" name="txtAvatar" required
                                                                           onchange="updateAvatar(this.value)"
                                                                           placeholder="Enter your link avatar" value="${userAccount.getAvatar()}">
                                                                </div>
                                                                <script>
                                                                    function updateAvatar(link) {
                                                                        var imgElement = document.getElementById("imgAvatar");
                                                                        imgElement.src = link;
                                                                    }
                                                                </script>-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputEmailAddress">Upload New Avatar</label>
                                    <input id="inputFile" type="file" name="txtAvatar" accept="image/*" />
                                </div>
                                <script>
                                    // L?y tham chi?u ??n n�t v� input
                                    var inputFile = document.getElementById('inputFile');

                                    // Th�m s? ki?n change cho input file
                                    inputFile.addEventListener('change', function () {
                                        var file = inputFile.files[0];
                                        validateFileType(file);
                                    });

                                    function validateFileType(file) {
                                        if (file) {
                                            var fileType = file.type;

                                            // Ki?m tra ??nh d?ng t?p c� ph?i l� h�nh ?nh hay kh�ng
                                            if (!fileType.startsWith('image/')) {
                                                // Hi?n th? th�ng b�o l?i n?u t?p kh�ng ph?i l� h�nh ?nh
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
                                        // X�a gi� tr? c?a input file
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
                                <button class="btn btn-primary" type="submit">Save changes</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /container -->
>>>>>>> 51d25809906605ac8e4ce6aa7ab5edf1d3e40558:web/view/admin/ManagerEditAccount.jsp
        </div>
        <!-- NEWSLETTER -->
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <ul class="newsletter-follow">
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /NEWSLETTER -->

        <!-- FOOTER -->
        <footer id="footer">
            <!-- top footer -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">About Us</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                                <ul class="footer-links">
                                    <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                                    <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Categories</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Hot deals</a></li>
                                    <li><a href="#">Laptops</a></li>
                                    <li><a href="#">Smartphones</a></li>
                                    <li><a href="#">Cameras</a></li>
                                    <li><a href="#">Accessories</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="clearfix visible-xs"></div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Information</h3>
                                <ul class="footer-links">
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Orders and Returns</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Service</h3>
                                <ul class="footer-links">
                                    <li><a href="#">My Account</a></li>
                                    <li><a href="#">View Cart</a></li>
                                    <li><a href="#">Wishlist</a></li>
                                    <li><a href="#">Track My Order</a></li>
                                    <li><a href="#">Help</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /top footer -->

            <!-- bottom footer -->
            <div id="bottom-footer" class="section">
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="footer-payments">
                                <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                                <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                            </ul>
                            <span class="copyright">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </span>


                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /bottom footer -->
        </footer>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>