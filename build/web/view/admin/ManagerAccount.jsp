<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Manager Account</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <!-- HEADER -->
        <%@include file="/navigator/adminheader.jsp" %>
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
                <!-- row -->
                <div class="row">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2> <b>List Customer</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="${pageContext.request.contextPath}/ManagerAddAccount"><button type="button" class="btn btn-success">Add New Customer</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="table-title">
                        <div class="row">
                            <form action="${pageContext.request.contextPath}/ManagerAccount" method="get">
                                <div class="col-sm-6">
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="nameSearch"
                                               value="${nameSearch}" placeholder="Search by name"
                                               />
                                        <input type="text" name="pageIndex"  hidden
                                               value="${pageIndex}" required />
                                        <input type="text" name="pageSize"  hidden
                                               value="${pageSize}" required />
                                        <input hidden type="submit"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <br/>
                    <table class="table">
                        <thead class="thead" style="background: #ff2e00">
                            <tr> 
                                <th scope="col">#</th>
                                <th scope="col">Full Name</th>
                                <th scope="col">UserName</th>
                                <th scope="col">Email</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Status</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${customers}" varStatus="loop">
                                <tr>
                                    <th scope="row">${loop.index +1}</th>
                                    <td><a href="${pageContext.request.contextPath}/ManagerEditAccount?userID=${item.getUserId()}">${item.getFullName()}</a> </td>
                                    <td>${item.getUser_name()}</td>
                                    <td>${item.getEmail()}</td>
                                    <td>${item.getPhone()}</td>
                                    <td>
                                        <c:if test="${item.getStatus() == 'true'}">
                                            <p class="text-success">Active</p>
                                        </c:if>
                                        <c:if test="${item.getStatus() == 'false'}">
                                            <p class="text-danger">Block</p>
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${item.getStatus() == 'true'}">
                                            <a href="${pageContext.request.contextPath}/ManagerAccount?userID=${item.getUserId()}&active=false&nameSearch=${nameSearch}&pageIndex=${pageIndex}&pageSize=${pageSize}">
                                                <button class="btn btn-danger">Block</button>
                                            </a> 
                                        </c:if>
                                        <c:if test="${item.getStatus() == 'false'}">
                                            <a href="${pageContext.request.contextPath}/ManagerAccount?userID=${item.getUserId()}&active=true&nameSearch=${nameSearch}&pageIndex=${pageIndex}&pageSize=${pageSize}">
                                                <button class="btn btn-success">Active</button>
                                            </a> 
                                        </c:if>
                                        <a href="${pageContext.request.contextPath}/ManagerEditAccount?userID=${item.getUserId()}">
                                            <button class="btn btn-dark">Edit</button>
                                        </a> 
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /row -->
                <div class="clearfix">
                    <div class="hint-text">Showing <b>${customers.size()}</b> out of <b>${countAccount}</b> entries</div>
                    <ul class="pagination">
                        <li class="page-item"><a href="${pageContext.request.contextPath}/ManagerAccount?nameSearch=${nameSearch}&pageIndex=${pageIndex-1}&pageSize=${pageSize}">Previous</a></li>
                            <c:forEach var="item" begin="1" end="${page}">
                            <li class="page-item ${item == pageIndex ? 'active': ''}">
                                <a href="${pageContext.request.contextPath}/ManagerAccount?nameSearch=${nameSearch}&pageIndex=${item}&pageSize=${pageSize}" class="page-link">${item}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item"><a href="${pageContext.request.contextPath}/ManagerAccount?nameSearch=${nameSearch}&pageIndex=${pageIndex+1}&pageSize=${pageSize}" class="page-link">Next</a></li>
                    </ul>
                </div>
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

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
