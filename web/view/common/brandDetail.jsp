<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="img/shortcut.png">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>${brand.name}</title>

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
        <%@include file="/navigator/userheader.jsp" %>
        <div id="breadcrumb" class="section" style="padding: 10px; position: sticky; top: 110px; z-index: 100;">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <ul class="breadcrumb-tree">
                            <li><a href="Home">Home</a></li>
                            <li><a href="listProduct">Categories (${category.categoryName})</a></li>
                            <li></li>
                        </ul>
                        <h3 class="breadcrumb-header">${product_detail.product_name}</h3>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- Product main img -->
                    <div class="col-md-5 col-md-push-2">
                        <div id="product-main-img">
                            <div class="product-preview">
                                <img 
                                    src="${pageContext.request.contextPath}/imgBrand/${trademark.img}"
                                      alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /Product main img -->

                    <!-- Product thumb imgs -->
                    <div class="col-md-2  col-md-pull-5">
                        <div id="product-imgs">
                            <div class="product-preview">
                                <img 
                                     src="${pageContext.request.contextPath}/imgBrand/${trademark.img}"
                                     alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /Product thumb imgs -->

                    <!-- Product details -->
                    <div class="col-md-5">
                        <div class="product-details">
                            <h2 class="product-name">${trademark.trademark_name}</h2>

                            <div class="ksp-content p-2 mb-2">
                                <h3 class="ksp-title has-text-centered" style="color: red">ĐẶC ĐIỂM NỔI BẬT</h3> 
                                <div>
                                    <ul>
                                        <li>${trademark.description}</li>
                                        <!--<li>Hãng có ${h.getList().size()} sản phẩm</li>-->

                                    </ul>
                                </div>
                            </div>
                            <br>
                            <br>
                             

                            

                            <ul class="product-links">
                                <li>Share:</li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /Product details -->

                    <!-- Product tab -->
                 </div>
                <!-- /product tab -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /SECTION -->

    <!-- Section -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">

                <div class="col-md-12">
                    <div class="section-title text-center">
                        <h3 class="title">Related Products OF BRAND</h3>
                    </div>
                </div>

                <!-- product -->
                <c:forEach items="${brand.getList()}" var="relatedProduct">
                    <div class="col-md-3 col-xs-6">
                        <div class="product">
                            <div class="product-img">
                                <c:forEach items="${allImages}" var="aI">
                                    <c:if test="${relatedProduct.product_id == aI.productId}">
                                        <img src="${aI.images}" alt="">
                                    </c:if> 
                                </c:forEach>
                                <c:if test="${relatedProduct.sale == 1}">
                                    <div class="product-label">
                                        <span class="sale">SALE</span>
                                    </div>
                                </c:if>
                            </div>
                            <div class="product-body">
                                <c:forEach items="${allCategories}" var="c">
                                    <c:if test="${relatedProduct.category_id == c.categoryId}">
                                        <p class="product-category">${c.categoryName}</p>
                                    </c:if>
                                </c:forEach>
                                <h3 class="product-name"><a href="productDetail?pid=${relatedProduct.product_id}">${relatedProduct.product_name}</a></h3>
                                    <c:if test="${relatedProduct.sale == 1}">
                                    <h4 class="product-price">${relatedProduct.sale_prices} <del class="product-old-price">${relatedProduct.original_prices}</del></h4>
                                    </c:if>
                                    <c:if test="${relatedProduct.sale == 0}">
                                    <h4 class="product-price">${relatedProduct.original_prices}</h4>
                                </c:if>
                                <div class="product-rating">
                                </div>
                                <div class="product-btns">
                                    <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                    <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                </div>
                            </div>
                            <div class="add-to-cart">
                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <!-- /product -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /Section -->

    <!-- NEWSLETTER -->
    <div id="newsletter" class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="newsletter">
                        <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                        <form>
                            <input class="input" type="email" placeholder="Enter Your Email">
                            <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                        </form>
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

    <%@include file="/navigator/footer.jsp" %>>

    <!-- jQuery Plugins -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/slick.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/nouislider.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.zoom.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
