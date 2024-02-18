<!--
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <%
                    String err = "";
            if(request.getAttribute("err")!= null){
            err = (String)request.getAttribute("err");
            }
        %>
        <%@include file="components/adminHeader.jsp" %>i


        <!-- /BREADCRUMB -->
        <!-- SECTION -->
        <div class="container rounded bg-white mt-5 mb-5">
            <form action="addPhone" method="post" enctype="multipart/form-data">
                <div class="row"  style="margin-top: 8%;">
                    <div class="p-4">

                        <h4 class="text-center">ADD PHONE</h4>
                    </div>
                    <div class="col-md-8">
                        <div class="p-3 py-5">
                            <div class="col-md-12">Phone name:<input type="text" class="form-control"  name="name"></div>
                            <div class="col-md-12">Phone highlights:<textarea class="form-control" name="highlight"  rows="2" ></textarea></div>
                            Phone description:
                            <textarea cols="90" rows="10" id="editor" name="desciption"></textarea>

                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="p-3 py-5">
                            <div class="row mt-16">
                                <div class="col-md-12">Original price:<input name="original_price" type="number" class="form-control" /></div>                                        
                                <div class="col-md-12">Sale price:<input name="sale_price" type="number" class="form-control" /></div>  
                                <div class="col-md-12">Quantity:<input name="quantity" type="number" class="form-control" /></div>
                                <div class="col-md-12">Trademark:
                                    <br>
                                    <select name="trademark">
                                        <c:forEach items="${tlist}" var="item">
                                            <option value="${item.getTrademark_id()}">${item.getTrademark_name()}</option>

                                        </c:forEach>
                                    </select></div>                                        

                                <div class="col-md-12">Image: <input type="file" name="image" class="form-control" placeholder="Thumbnail" value=""></div>
                            </div>

                        </div>

                    </div>

                    <div class="col-md-12">
                        <div class="p-3 py-5">
                            <h5 style="margin-top: 20px " class="text-center">Phone detail</h5>
                            <div class="col-md-12">
                                <table border="0">

                                    <tbody>
                                        <tr>
                                            <td>Screen size:</td>
                                            <td><input style="margin: 10px" type="text" name="screen_size"></td>
                                        </tr>
                                        <tr>
                                            <td>Screen tech:</td>
                                            <td><input style="margin: 10px" type="text" name="screen_tech"></td>
                                        </tr>
                                        <tr>
                                            <td>Camera:</td>
                                            <td><input style="margin: 10px" type="text" name="camera"></td>
                                        </tr>
                                        <tr>
                                            <td>Chip:</td>
                                            <td><input style="margin: 10px" type="text" name="chip"></td>
                                        </tr>
                                        <tr>
                                            <td>Ram:</td>
                                            <td><input style="margin: 10px" type="text" name="ram"></td>
                                        </tr>
                                        <tr>
                                            <td>Pin:</td>
                                            <td><input style="margin: 10px" type="text" name="pin"></td>
                                        </tr>
                                        <tr>
                                            <td>Sim:</td>
                                            <td><input style="margin: 10px" type="text" name="sim"></td>
                                        </tr>
                                        <tr>
                                            <td>Operation_system:   </td>
                                            <td><input style="margin: 10px" type="text" name="os"></td>
                                        </tr>
                                        <tr>
                                            <td>Screen_feature:</td>
                                            <td><input style="margin: 10px" type="text" name="screenfeature"></td>
                                        </tr>

                                        <tr>
                                            <td>Other_feature:</td>
                                            <td><input style="margin: 10px" type="text" name="other"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="container">
                    <!-- row -->
                    <input type="submit" class="btn btn-success" name="submit" value="Save">
                    <a href="#"><button type="button" class="btn btn-primary">Back</button></a>
                    <br>
                    <br>
                    <i style="color: red"><%=err%></i>

                </div>
            </form> 
        </div>        <!-- SECTION -->
        <div class="section">
            <!-- container -->

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
-->