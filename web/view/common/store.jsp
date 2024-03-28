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

        <title>All products - G6 MOBILE</title>

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
                    <!-- ASIDE -->
                    <div id="aside" class="col-md-3">
                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Danh mục</h3>

                            <c:forEach items="${allCategories}" var="c">
                                <input onchange="listProductByCate(this)" type="radio" class="form-check-input" id="${c.category_id}" value="${c.category_id}" name="materialExampleRadios">
                                <label class="form-check-label small card-link-secondary" style="font-weight: normal;" for="${c.category_id}">${c.category_name}</label>
                                <br>
                            </c:forEach>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Tìm kiếm theo tên</h3>
                            <form>
                                <div class="d-flex align-items-center">
                                    <div class="md-form md-outline">
                                        <input oninput="searchByName(this)" value="${txtS}" name="txt" type="text" class="form-control mb-0" style="width: 200px;" placeholder="Search here">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Tìm kiếm theo giá</h3>
                            <form>
                                <div class="d-flex align-items-center">
                                    <div class="md-form md-outline popup">
                                        <label for="priceMin" style="padding-left: 9px; padding-bottom: 0; margin:0; font-size: 10px;">MIN</label>
                                        <input oninput="searchByPriceMinToMax()" id="priceMin" type="number" class="form-control mb-0" style="width: 200px; padding: 0; padding-bottom: 4.5px">
                                    </div>
                                    <div class="md-form md-outline popup">
                                        <label for="priceMax" style="padding-left: 9px; padding-bottom: 0; margin:0; font-size: 10px;">MAX</label>
                                        <input oninput="searchByPriceMinToMax()" id="priceMax" type="number" class="form-control mb-0" style="width: 200px; padding: 0; padding-bottom: 4.5px">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Nhãn hiệu</h3>
                            <c:forEach items="${allBrands}" var="c">
                                <input onchange="listProductByBrand(this)" type="radio" class="form-check-input" id="${c.trademark_id}" value="${c.trademark_id}" name="trademark">
                                <label class="form-check-label small card-link-secondary" style="font-weight: normal;" for="${c.trademark_id}">${c.trademark_name}</label>
                                <br>
                            </c:forEach>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Bán chạy</h3>
                            <c:forEach items="${top3SellingInProductList}" var="p">
                                <c:if test="${p.status == 1}">
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <c:forEach items="${allImages}" var="aI">
                                                <c:if test="${p.product_id == aI.product_id}">
                                                    <img src="${aI.images}" alt="">
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <div class="product-body">
                                            <c:forEach items="${allCategories}" var="c">
                                                <c:if test="${p.category_id == c.category_id}">
                                                    <p class="product-category">${c.category_name}</p>
                                                </c:if>
                                            </c:forEach>
                                            <h3 class="product-name"><a href="productDetail?pid=${p.product_id}">${p.product_name}</a></h3>
                                                <c:if test="${p.sale == 1}">
                                                <h4 class="product-price">${p.sale_prices} <del class="product-old-price">${p.original_prices}</del></h4>
                                                </c:if>
                                                <c:if test="${p.sale == 0}">
                                                <h4 class="product-price">${p.original_prices}</h4>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                        <!-- /aside Widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->

                    <p>${status}</p>
                    <div id="store" class="col-md-9">
                        <!-- store top filter -->
                        <div class="store-filter clearfix">
                            <div class="store-sort">
                                <label>
                                    Sắp xếp theo giá:
                                    <select id="sort" class="input-select" onchange="sortByPrice(this)">
                                        <option value="0">Giảm dần</option>
                                        <option value="1">Tăng dần</option>
                                    </select>
                                </label>

                                <label>
                                    Sắp xếp theo đánh giá:
                                    <select id="sort" class="input-select" onchange="sortByRate(this)">
                                        <option value="0">Giảm dần</option>
                                        <option value="1">Tăng dần</option>
                                    </select>
                                </label>
                            </div>
                        </div>
                        <!-- /store top filter -->

                        <!-- store products -->
                        <div class="row" id="content">
                            <!-- product -->
                            <c:set var="x" value="0"/>
                            <c:forEach items="${list_6_product}" var="ap">
                                <c:if test="${ap.status == 1}">
                                    <div class="col-md-4 col-xs-6">
                                        <div class="product">
                                            <div class="product-img">
                                                <c:forEach items="${allImages}" var="aI">
                                                    <c:if test="${ap.product_id == aI.product_id}">
                                                        <img src="${aI.images}" alt="No image">
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${ap.sale == 1}">
                                                    <div class="product-label">
                                                        <span class="sale">SALE</span>
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="product-body">

                                                <h3 class="product-name"><a href="productDetail?pid=${ap.product_id}">${ap.product_name}</a></h3>
                                                    <c:if test="${ap.sale == 1}">
                                                    <h4 class="product-price">${ap.sale_prices} <del class="product-old-price">${ap.original_prices}</del></h4>
                                                    </c:if>
                                                    <c:if test="${ap.sale == 0}">
                                                    <h4 class="product-price">${ap.original_prices}</h4>
                                                </c:if>
                                                <!-- Rating -->
                                                <div>
                                                    <c:if test="${ap.avr_rated_star > 4.0 && ap.avr_rated_star <= 5.0}">
                                                        <div class="product-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${ap.avr_rated_star > 3.0 && ap.avr_rated_star <= 4.0}">
                                                        <div class="product-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${ap.avr_rated_star > 2.0 && ap.avr_rated_star <= 3.0}">
                                                        <div class="product-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${ap.avr_rated_star > 1.0 && ap.avr_rated_star <= 2.0}">
                                                        <div class="product-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${ap.avr_rated_star > 0.0 && ap.avr_rated_star <= 1.0}">
                                                        <div class="product-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${ap.avr_rated_star == 0.0}">
                                                        <div class="product-rating">
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                    </c:if>
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
                                </c:if>
                                <c:set var="x" value="${x+1}"/>
                            </c:forEach>
                            <!-- /product -->
                        </div>
                        <!-- /store products -->

                        <!-- store bottom filter -->
                        <div class="store-filter clearfix">
                            <!--<span class="store-qty">Showing ${x} out of ${numOfProduct} products</span>-->
                            <ul class="store-pagination">
                                <c:forEach begin="1" end="${endPP}" var="i"> 
                                    <li>
                                        <a href="listProduct?productPageNum=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                                <!--<li><a href="listProduct?productPageNum=${i}"><i class="fa fa-angle-right"></i></a></li>-->
                            </ul>
                        </div>
                        <!-- /store bottom filter -->
                    </div>
                    <!-- /STORE -->
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

                                        function listProductByCate(type) {
                                            var selectedOption = type.value;
                                            $.ajax({
                                                url: "/PhoneShop/listProductByCateAjax?selectoption=" + encodeURIComponent(selectedOption),
                                                type: "get", //send it through get method
                                                data: {

                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });
                                        }

                                        function listProductByBrand(type) {
                                            var selectedOption = type.value;
                                            $.ajax({
                                                url: "/PhoneShop/listProductByBrandAjax?selectoption=" + encodeURIComponent(selectedOption),
                                                type: "get", //send it through get method
                                                data: {

                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });
                                        }

                                        function sortByPrice(type) {

                                            var selectedOption = type.value;
                                            $.ajax({
                                                url: "/PhoneShop/sortProductBySalePriceAscAjax?selectoption=" + encodeURIComponent(selectedOption),
                                                type: "get", //send it through get method
                                                data: {

                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });

                                        }

                                        function sortByRate(type) {

                                            var selectedOption = type.value;
                                            $.ajax({
                                                url: "/PhoneShop/sortProductByRateStarAjax?selectoption=" + encodeURIComponent(selectedOption),
                                                type: "get", //send it through get method
                                                data: {

                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });

                                        }

                                        function searchByPriceMinToMax() {
                                            var numMin = document.getElementById("priceMin").value;
                                            var numMax = document.getElementById("priceMax").value;
                                            $.ajax({
                                                url: "/PhoneShop/searchAjaxPriceMinToMax",
                                                type: "get", //send it through get method
                                                data: {
                                                    priceMin: numMin,
                                                    priceMax: numMax
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });
                                        }

                                        function searchByName(param) {
                                            var txtSearch = param.value;
                                            $.ajax({
                                                url: "/PhoneShop/searchByNameAjax",
                                                type: "get", //send it through get method
                                                data: {
                                                    txt: txtSearch
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });
                                        }


        </script>
    </body>
</html>
