<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <%@include file="/navigator/userheader.jsp" %>


        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- shop -->
                    <div class="col-md-3 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="https://images.prismic.io/southern-phone-1/2694f07a-c11e-4a14-b185-14e018ff94dc_A32-Phone-Mockup.png?auto=compress,format&rect=0,159,3701,2316&w=620&h=388" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Smartphones<br>Collection</h3>
                                <a href="#" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-3 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="${pageContext.request.contextPath}/img/shop01.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Laptop<br>Collection</h3>
                                <a href="#" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-3 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="${pageContext.request.contextPath}/img/shop03.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Tablet<br>Collection</h3>
                                <a href="#" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->
                    <!-- shop -->
                    <div class="col-md-3 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="${pageContext.request.contextPath}/img/shop02.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Headphone<br>Collection</h3>
                                <a href="#" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">New Products</h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">
                                    <li><a href="home?category=2&modP=1">Laptops</a></li>
                                    <li><a href="home?category=1&modP=1">Smartphones</a></li>
                                    <li><a href="home?category=3&modP=1">Tablets</a></li>
                                    <li><a href="home?category=4&modP=1">Headphones</a></li>

                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick"  data-nav="#slick-nav-1">
                                        <!-- product -->

                                        <c:forEach var="product" items="${listNewProducts}">
                                            <div class="product">
                                                <div class="product-img">
                                                    <!-- Assuming you have an 'image' property in your Product class -->
                                                    <img src="${product.productImages[0].images}" alt="Product Image">
                                                    <!-- Add other image-related code as needed -->
                                                    <div class="product-label">
                                                        <c:if test="${product.sale == 'true'}">
                                                            <span class="sale">${product.salePercent}</span>
                                                        </c:if>
                                                        <span class="new">NEW</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">${product.category.category_name}</p>
                                                    <h3 class="product-name"><a href="productDetail?pid=${product.productId}">${product.productName}</a></h3>
                                                    <h4 class="product-price">
                                                        <fmt:formatNumber value="${product.sale ? product.salePrices : product.originalPrices}" type="currency" currencyCode="VND"/>
                                                        <c:if test="${product.sale == 'true'}">
                                                            <del class="product-old-price">
                                                                <fmt:formatNumber value="${product.originalPrices}" type="currency" currencyCode="VND"/>
                                                            </del>
                                                        </c:if>
                                                    </h4>
                                                    <div class="product-rating">
                                                        <!-- Assuming you have an 'avrRatedStar' property in your Product class -->
                                                        <c:forEach begin="1" end="${product.avrRatedStar}">
                                                            <i class="fa fa-star"></i>
                                                        </c:forEach>
                                                    </div>
                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <a href="update-cart?id=${product.productId}&amount=1" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <!-- /product -->


                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Hot Deal</h3>

                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab6" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-6">
                                        <!-- product -->

                                        <c:forEach var="product" items="${listProductsTopDeal}">
                                            <div class="product">
                                                <div class="product-img">
                                                    <!-- Assuming you have an 'image' property in your Product class -->
                                                    <img src="${product.productImages[0].images}" alt="Product Image">
                                                    <!-- Add other image-related code as needed -->
                                                    <div class="product-label">
                                                        <c:if test="${product.sale == 'true'}">
                                                            <span class="sale">${product.salePercent}</span>
                                                        </c:if>
                                                        <span class="new">NEW</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">${product.category.category_name}</p>
                                                    <h3 class="product-name"><a href="productDetail?pid=${product.productId}">${product.productName}</a></h3>
                                                    <h4 class="product-price">
                                                        <fmt:formatNumber value="${product.sale ? product.salePrices : product.originalPrices}" type="currency" currencyCode="VND"/>
                                                        <c:if test="${product.sale == 'true'}">
                                                            <del class="product-old-price">
                                                                <fmt:formatNumber value="${product.originalPrices}" type="currency" currencyCode="VND"/>
                                                            </del>
                                                        </c:if>
                                                    </h4>
                                                    <div class="product-rating">
                                                        <!-- Assuming you have an 'avrRatedStar' property in your Product class -->
                                                        <c:forEach begin="1" end="${product.avrRatedStar}">
                                                            <i class="fa fa-star"></i>
                                                        </c:forEach>
                                                    </div>
                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <a href="update-cart?id=${product.productId}&amount=1" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <!-- /product -->


                                    </div>
                                    <div id="slick-nav-6" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->
        <!-- HOT DEAL SECTION -->
        <div id="hot-deal" class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="hot-deal">
                            <h2 class="text-uppercase">hot deal this week</h2>
                            <!--<p>New Collection Up to 50% OFF</p>-->
                            <div class="section">
                                <!-- container -->
                                <div class="container">
                                    <!-- row -->
                                    <div class="row">
                                        <!-- /section title -->

                                        <!-- Products tab & slick -->
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="products-tabs">
                                                    <!-- tab -->
                                                    <div id="tab6" class="tab-pane active">
                                                        <div class="products-slick" data-nav="#slick-nav-6">
                                                            <!-- product -->

                                                            <c:forEach var="product" items="${listProductsTopDeal}" begin ="0" end="0">
                                                                <div class="product">
                                                                    <div class="product-img">
                                                                        <!-- Assuming you have an 'image' property in your Product class -->
                                                                        <img src="${product.productImages[0].images}" alt="Product Image">
                                                                        <!-- Add other image-related code as needed -->
                                                                        <div class="product-label">
                                                                            <c:if test="${product.sale == 'true'}">
                                                                                <span class="sale">${product.salePercent}</span>
                                                                            </c:if>
                                                                            <span class="new">NEW</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-body">
                                                                        <p class="product-category">${product.category.category_name}</p>
                                                                        <h3 class="product-name"><a href="productDetail?pid=${product.productId}">${product.productName}</a></h3>
                                                                        <h4 class="product-price">
                                                                            <fmt:formatNumber value="${product.sale ? product.salePrices : product.originalPrices}" type="currency" currencyCode="VND"/>
                                                                            <c:if test="${product.sale == 'true'}">
                                                                                <del class="product-old-price">
                                                                                    <fmt:formatNumber value="${product.originalPrices}" type="currency" currencyCode="VND"/>
                                                                                </del>
                                                                            </c:if>
                                                                        </h4>
                                                                        <div class="product-rating">
                                                                            <!-- Assuming you have an 'avrRatedStar' property in your Product class -->
                                                                            <c:forEach begin="1" end="${product.avrRatedStar}">
                                                                                <i class="fa fa-star"></i>
                                                                            </c:forEach>
                                                                        </div>
                                                                        <div class="product-btns">
                                                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="add-to-cart">
                                                                        <a href="update-cart?id=${product.productId}&amount=1" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</a>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                            <!-- /product -->


                                                        </div>
                                                        <div id="slick-nav-6" class="products-slick-nav"></div>
                                                    </div>
                                                    <!-- /tab -->
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Products tab & slick -->
                                    </div>
                                    <!-- /row -->
                                </div>
                                <!-- /container -->
                            </div>
                            <!-- /product -->

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Top selling</h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">
                                    <li><a href="home?category=2">Laptops</a></li>
                                    <li><a href="home?category=1">Smartphones</a></li>
                                    <li><a href="home?category=3">Tablets</a></li>
                                    <li><a href="home?category=4">Headphones</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <div class="products-slick" data-nav="#slick-nav-2">
                                        <!-- product -->

                                        <c:forEach var="product" items="${listSoleProducts}">
                                            <div class="product">
                                                <div class="product-img">
                                                    <!-- Assuming you have an 'image' property in your Product class -->
                                                    <img src="${product.productImages[0].images}" alt="Product Image">
                                                    <!-- Add other image-related code as needed -->
                                                    <div class="product-label">
                                                        <c:if test="${product.sale == 'true'}">
                                                            <span class="sale">${product.salePercent}</span>
                                                        </c:if>
                                                        <span class="new">SOLE: ${product.sole}</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">${product.category.category_name}</p>
                                                    <h3 class="product-name"><a href="productDetail?pid=${product.productId}">${product.productName}</a></h3>
                                                    <h4 class="product-price">
                                                        <fmt:formatNumber value="${product.sale ? product.salePrices : product.originalPrices}" type="currency" currencyCode="VND"/>
                                                        <c:if test="${product.sale == 'true'}">
                                                            <del class="product-old-price">
                                                                <fmt:formatNumber value="${product.originalPrices}" type="currency" currencyCode="VND"/>
                                                            </del>
                                                        </c:if>
                                                    </h4>
                                                    <div class="product-rating">
                                                        <!-- Assuming you have an 'avrRatedStar' property in your Product class -->
                                                        <c:forEach begin="1" end="${product.avrRatedStar}">
                                                            <i class="fa fa-star"></i>
                                                        </c:forEach>
                                                    </div>
                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <a href="update-cart?id=${product.productId}&amount=1" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</a>
                                                </div>
                                            </div>
                                        </c:forEach>

                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-2" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">New Product</h4>
                            <div class="section-nav">
                                <div id="slick-nav-3" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-3">
                            <div>
                                <!-- product widget -->
                                <c:forEach var="product" items="${listNewProducts}" begin="0" end="2"> 
                                    <!-- product widget -->
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="${product.productImages[0].images}" alt="Product Image">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${product.category.category_name}</p>
                                            <h3 class="product-name"><a href="productDetail?pid=${product.productId}">${product.productName}</a></h3>
                                            <h4 class="product-price">${product.sale ? product.salePrices : product.originalPrices}
                                                <c:if test="${product.sale == 'true'}">
                                                    <del class="product-old-price">
                                                        <fmt:formatNumber value="${product.originalPrices}" type="currency" currencyCode="VND"/>
                                                    </del>
                                                </c:if>
                                            </h4>
                                        </div>
                                    </div>
                                    <!-- /product widget -->
                                </c:forEach>
                            </div>
                            <!-- /product widget -->

                            <!-- product widget -->
                            <div>
                                <!-- product widget -->
                                <c:forEach var="product" items="${listNewProducts}" begin="3" end="5"> 
                                    <!-- product widget -->
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="${product.productImages[0].images}" alt="Product Image">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${product.category.category_name}</p>
                                            <h3 class="product-name"><a href="productDetail?pid=${product.productId}">${product.productName}</a></h3>
                                            <h4 class="product-price">${product.sale ? product.salePrices : product.originalPrices}
                                                <c:if test="${product.sale == 'true'}">
                                                    <del class="product-old-price">
                                                        <fmt:formatNumber value="${product.originalPrices}" type="currency" currencyCode="VND"/>
                                                    </del>
                                                </c:if>
                                            </h4>
                                        </div>
                                    </div>
                                    <!-- /product widget -->
                                </c:forEach>
                            </div>
                            <!-- /product widget -->

                            <!-- product widget -->
                            <div>
                                <!-- product widget -->
                                <c:forEach var="product" items="${listNewProducts}" begin="6" end="8"> 
                                    <!-- product widget -->
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="${product.productImages[0].images}" alt="Product Image">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${product.category.category_name}</p>
                                            <h3 class="product-name"><a href="productDetail?pid=${product.productId}">${product.productName}</a></h3>
                                            <h4 class="product-price">${product.sale ? product.salePrices : product.originalPrices}
                                                <c:if test="${product.sale == 'true'}">
                                                    <del class="product-old-price">
                                                        <fmt:formatNumber value="${product.originalPrices}" type="currency" currencyCode="VND"/>
                                                    </del>
                                                </c:if>
                                            </h4>
                                        </div>
                                    </div>
                                    <!-- /product widget -->
                                </c:forEach>
                            </div>                            <!-- product widget -->



                        </div>
                    </div>

                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Hot Deal</h4>
                            <div class="section-nav">
                                <div id="slick-nav-4" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-4">
                            <div>
                                <!-- product widget -->
                                <c:forEach var="product" items="${listProductsTopDeal}" begin="0" end="2"> 
                                    <!-- product widget -->
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="${product.productImages[0].images}" alt="Product Image">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${product.category.category_name}</p>
                                            <h3 class="product-name"><a href="productDetail?pid=${product.productId}">${product.productName}</a></h3>
                                            <h4 class="product-price">${product.sale ? product.salePrices : product.originalPrices}
                                                <c:if test="${product.sale == 'true'}">
                                                    <del class="product-old-price">
                                                        <fmt:formatNumber value="${product.originalPrices}" type="currency" currencyCode="VND"/>
                                                    </del>
                                                </c:if>
                                            </h4>
                                        </div>
                                    </div>
                                    <!-- /product widget -->
                                </c:forEach>
                            </div>
                            <!-- /product widget -->

                            <!-- product widget -->
                            <div>
                                <!-- product widget -->
                                <c:forEach var="product" items="${listProductsTopDeal}" begin="3" end="5"> 
                                    <!-- product widget -->
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="${product.productImages[0].images}" alt="Product Image">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${product.category.category_name}</p>
                                            <h3 class="product-name"><a href="productDetail?pid=${product.productId}">${product.productName}</a></h3>
                                            <h4 class="product-price">${product.sale ? product.salePrices : product.originalPrices}
                                                <c:if test="${product.sale == 'true'}">
                                                    <del class="product-old-price">
                                                        <fmt:formatNumber value="${product.originalPrices}" type="currency" currencyCode="VND"/>
                                                    </del>
                                                </c:if>
                                            </h4>
                                        </div>
                                    </div>
                                    <!-- /product widget -->
                                </c:forEach>
                            </div>
                            <!-- /product widget -->

                            <!-- product widget -->
                            <div>
                                <!-- product widget -->
                                <c:forEach var="product" items="${listProductsTopDeal}" begin="6" end="8"> 
                                    <!-- product widget -->
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="${product.productImages[0].images}" alt="Product Image">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${product.category.category_name}</p>
                                            <h3 class="product-name"><a href="productDetail?pid=${product.productId}">${product.productName}</a></h3>
                                            <h4 class="product-price">${product.sale ? product.salePrices : product.originalPrices}
                                                <c:if test="${product.sale == 'true'}">
                                                    <del class="product-old-price">
                                                        <fmt:formatNumber value="${product.originalPrices}" type="currency" currencyCode="VND"/>
                                                    </del>
                                                </c:if>
                                            </h4>
                                        </div>
                                    </div>
                                    <!-- /product widget -->
                                </c:forEach>
                            </div>  
                        </div>
                    </div>

                    <div class="clearfix visible-sm visible-xs"></div>

                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Top selling</h4>
                            <div class="section-nav">
                                <div id="slick-nav-5" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-5">
                            <div>
                                <!-- product widget -->
                                <c:forEach var="product" items="${listSoleProducts}" begin="0" end="2"> 
                                    <!-- product widget -->
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="${product.productImages[0].images}" alt="Product Image">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${product.category.category_name}</p>
                                            <h3 class="product-name"><a href="productDetail?pid=${product.productId}">${product.productName}</a></h3>
                                            <h4 class="product-price">${product.sale ? product.salePrices : product.originalPrices}
                                                <c:if test="${product.sale == 'true'}">
                                                    <del class="product-old-price">
                                                        <fmt:formatNumber value="${product.originalPrices}" type="currency" currencyCode="VND"/>
                                                    </del>
                                                </c:if>
                                            </h4>
                                        </div>
                                    </div>
                                    <!-- /product widget -->
                                </c:forEach>
                            </div>
                            <!-- /product widget -->

                            <!-- product widget -->
                            <div>
                                <!-- product widget -->
                                <c:forEach var="product" items="${listSoleProducts}" begin="3" end="5"> 
                                    <!-- product widget -->
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="${product.productImages[0].images}" alt="Product Image">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${product.category.category_name}</p>
                                            <h3 class="product-name"><a href="productDetail?pid=${product.productId}">${product.productName}</a></h3>
                                            <h4 class="product-price">${product.sale ? product.salePrices : product.originalPrices}
                                                <c:if test="${product.sale == 'true'}">
                                                    <del class="product-old-price">
                                                        <fmt:formatNumber value="${product.originalPrices}" type="currency" currencyCode="VND"/>
                                                    </del>
                                                </c:if>
                                            </h4>
                                        </div>
                                    </div>
                                    <!-- /product widget -->
                                </c:forEach>
                            </div>
                            <!-- /product widget -->

                            <!-- product widget -->
                            <div>
                                <!-- product widget -->
                                <c:forEach var="product" items="${listSoleProducts}" begin="6" end="8"> 
                                    <!-- product widget -->
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="${product.productImages[0].images}" alt="Product Image">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${product.category.category_name}</p>
                                            <h3 class="product-name"><a href="productDetail?pid=${product.productId}">${product.productName}</a></h3>
                                            <h4 class="product-price">${product.sale ? product.salePrices : product.originalPrices}
                                                <c:if test="${product.sale == 'true'}">
                                                    <del class="product-old-price">
                                                        <fmt:formatNumber value="${product.originalPrices}" type="currency" currencyCode="VND"/>
                                                    </del>
                                                </c:if>
                                            </h4>
                                        </div>
                                    </div>
                                    <!-- /product widget -->
                                </c:forEach>
                            </div> 
                        </div>
                    </div>

                </div>
                <!-- /row -->
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

        <%@include file="/navigator/footer.jsp" %>


        <!-- jQuery Plugins -->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/slick.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/nouislider.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.zoom.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
        <script>
// Set the date we're counting down to
            var countDownDate = new Date("Mar 27, 2024 00:00:00").getTime();

// Update the countdown every 1 second
            var x = setInterval(function () {

                // Get the current date and time
                var now = new Date().getTime();

                // Calculate the remaining time
                var distance = countDownDate - now;

                // Calculate days, hours, minutes, and seconds
                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                // Display the countdown
                document.getElementById("days").innerHTML = "<h3>" + days + "</h3><span>Days</span>";
                document.getElementById("hours").innerHTML = "<h3>" + hours + "</h3><span>Hours</span>";
                document.getElementById("minutes").innerHTML = "<h3>" + minutes + "</h3><span>Mins</span>";
                document.getElementById("seconds").innerHTML = "<h3>" + seconds + "</h3><span>Secs</span>";

                // If the countdown is over, display a message
                if (distance < 0) {
                    clearInterval(x);
                    document.getElementById("hot-deal").innerHTML = "EXPIRED";
                }
            }, 1000);
        </script>

    </body>
</html>
