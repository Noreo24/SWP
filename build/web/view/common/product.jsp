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

        <title>${product_detail.product_name}</title>

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
                    <!-- Product main img -->
                    <div class="col-md-5 col-md-push-2">
                        <c:forEach var="pImages" items="${product_images}">
                            <div id="product-main-img">
                                <div class="product-preview">
                                    <img src="${pImages.images}" alt="">
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <!-- /Product main img -->

                    <!-- Product thumb imgs -->
                    <div class="col-md-2  col-md-pull-5">
                        <c:forEach var="pImages" items="${product_images}">
                            <div id="product-imgs">
                                <div class="product-preview">
                                    <img src="${pImages.images}" alt="">
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <!-- /Product thumb imgs -->

                    <!-- Product details -->
                    <div class="col-md-5">
                        <div class="product-details">
                            <h2 class="product-name">${product_detail.product_name}</h2>
                            <div>
                                <c:if test="${product_detail.avr_rated_star > 4.0 && product_detail.avr_rated_star <= 5.0}">
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                </c:if>
                                <c:if test="${product_detail.avr_rated_star > 3.0 && product_detail.avr_rated_star <= 4.0}">
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                </c:if>
                                <c:if test="${product_detail.avr_rated_star > 2.0 && product_detail.avr_rated_star <= 3.0}">
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                </c:if>
                                <c:if test="${product_detail.avr_rated_star > 1.0 && product_detail.avr_rated_star <= 2.0}">
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                </c:if>
                                <c:if test="${product_detail.avr_rated_star > 0.0 && product_detail.avr_rated_star <= 1.0}">
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                </c:if>
                                <c:if test="${product_detail.avr_rated_star == 0.0}">
                                    <div class="product-rating">
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                </c:if>
                                <a class="review-link" href="#">${number_of_feedback} Review(s) | Add your review</a>
                            </div>
                            <div>
                                <c:if test="${product_detail.sale == 1}">
                                    <h4 class="product-price">${product_detail.sale_prices} <del class="product-old-price">${product_detail.original_prices}</del></h4>
                                    </c:if>
                                    <c:if test="${product_detail.sale == 0}">
                                    <h4 class="product-price">${product_detail.original_prices}</h4>
                                </c:if>
                                <c:if test="${product_detail.status == 1}">
                                    <span class="product-available">
                                        In Stock
                                    </span>
                                </c:if>
                            </div>
                            <div class="ksp-content p-2 mb-2">
                                <h3 class="ksp-title has-text-centered" style="color: red">ĐẶC ĐIỂM NỔI BẬT</h3> 
                                <div>
                                    <ul>
                                        <li>${product_detail.product_highlights}</li>
                                    </ul>
                                </div>
                            </div>
                            <br>
                            <br>
                            <div class="add-to-cart">
                                <div class="qty-label">
                                    <p style="color: orangered; font-size: 20px">Quantity:</p>
                                    <div class="input-number">
                                        <input type="number" value="1">
                                        <span class="qty-up">+</span>
                                        <span class="qty-down">-</span>
                                    </div>
                                </div>
                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                            </div>

                            <ul class="product-btns">
                                <li><a href="#"><i class="fa fa-heart-o"></i> add to wishlist</a></li>
                                <li><a href="#"><i class="fa fa-exchange"></i> add to compare</a></li>
                            </ul>

                            <ul class="product-links">
                                <li>Category:</li>
                                <li><a href="#">${category.category_name}</a></li>
                            </ul>

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
                    <div class="col-md-12">
                        <div id="product-tab">
                            <!-- product tab nav -->
                            <ul class="tab-nav">
                                <li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
                                <li><a data-toggle="tab" href="#tab2">Details</a></li>
                                <li><a data-toggle="tab" href="#tab3">Reviews (${number_of_feedback})</a></li>
                            </ul>
                            <!-- /product tab nav -->

                            <!-- product tab content -->
                            <div class="tab-content">
                                <!-- tab1  -->
                                <div id="tab1" class="tab-pane fade in active">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p style="text-align: justify;">
                                                ${product_detail.product_description}
                                            </p>                                   
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab1  -->

                                <!-- tab2  -->
                                <div id="tab2" class="tab-pane fade in">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <c:if test="${category.category_id == 1}">
                                                <table class="table">
                                                    <tbody>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Màu sắc</td>
                                                            <td>${phone_detail.color}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Kích cỡ màn hình</td>
                                                            <td>${phone_detail.screen_size}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Công nghệ màn hình</td>
                                                            <td>${phone_detail.screen_tech}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Camera sau</td>
                                                            <td>${phone_detail.camera_rear}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Camera trước</td>
                                                            <td>${phone_detail.front_camera}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Chipset</td>
                                                            <td>${phone_detail.chip}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Dung lượng RAM</td>
                                                            <td>${phone_detail.ram}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Bộ nhớ trong</td>
                                                            <td>${phone_detail.rom}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Pin</td>
                                                            <td>${phone_detail.pin}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Thẻ SIM</td>
                                                            <td>${phone_detail.sim}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Hệ điều hành</td>
                                                            <td>${phone_detail.operation_system}</td>
                                                            <!--                                                        </tr>                                                      <tr>
                                                                                                                        <td style="background: #f2f2f2; width: 20%;">Độ phân giải màn hình</td>
                                                                                                                        <td>2796 x 1290-pixel</td>
                                                                                                                    </tr>-->
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Tính năng màn hình</td>
                                                            <td>${phone_detail.screen_feature}</td>
                                                        </tr>
                                                        <c:if test="${phone_detail.other_feature != null}">
                                                            <tr>
                                                                <td style="background: #f2f2f2; width: 20%;">Tính năng khác</td>
                                                                <td>${phone_detail.other_feature}</td>
                                                            </tr>
                                                        </c:if>
                                                    </tbody>
                                                </table>
                                            </c:if>
                                            <c:if test="${category.category_id == 2}">
                                                <table class="table">
                                                    <tbody>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Màu sắc</td>
                                                            <c:if test="${lap_detail.color != null}">
                                                                <td>${lap_detail.color}</td>
                                                            </c:if>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Kích cỡ màn hình</td>
                                                            <td>${lap_detail.screen_size}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Công nghệ màn hình</td>
                                                            <td>${lap_detail.screen_tech}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Chipset</td>
                                                            <td>${lap_detail.chip}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Dung lượng RAM</td>
                                                            <td>${lap_detail.ram}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Pin</td>
                                                            <td>${lap_detail.pin}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Hệ điều hành</td>
                                                            <td>${lap_detail.operation_system}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Tính năng màn hình</td>
                                                            <td>${lap_detail.screen_feature}</td>
                                                        </tr>
                                                        <c:if test="${lap_detail.other_feature != null}">
                                                            <tr>
                                                                <td style="background: #f2f2f2; width: 20%;">Tính năng khác</td>
                                                                <td>${lap_detail.other_feature}</td>
                                                            </tr>
                                                        </c:if>
                                                    </tbody>
                                                </table>
                                            </c:if>
                                            <c:if test="${category.category_id == 3}">
                                                <table class="table">
                                                    <tbody>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Màu sắc</td>
                                                            <td>${tablet_detail.color}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Kích cỡ màn hình</td>
                                                            <td>${tablet_detail.screen_size}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Công nghệ màn hình</td>
                                                            <td>${tablet_detail.screen_tech}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Camera sau</td>
                                                            <td>${tablet_detail.camera_rear}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Camera trước</td>
                                                            <td>${tablet_detail.front_camera}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Chipset</td>
                                                            <td>${tablet_detail.chip}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Dung lượng RAM</td>
                                                            <td>${tablet_detail.ram}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Bộ nhớ trong</td>
                                                            <td>${tablet_detail.rom}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Pin</td>
                                                            <td>${tablet_detail.pin}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Thẻ SIM</td>
                                                            <td>${tablet_detail.sim}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Hệ điều hành</td>
                                                            <td>${tablet_detail.operation_system}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Độ phân giải màn hình</td>
                                                            <td>${tablet_detail.screen_resolution}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Tính năng màn hình</td>
                                                            <td>${tablet_detail.screen_feature}</td>
                                                        </tr>
                                                        <c:if test="${tablet_detail.other_feature != null}">
                                                            <tr>
                                                                <td style="background: #f2f2f2; width: 20%;">Tính năng khác</td>
                                                                <td>${tablet_detail.other_feature}</td>
                                                            </tr>
                                                        </c:if>
                                                    </tbody>
                                                </table>
                                            </c:if>
                                            <c:if test="${category.category_id == 4}">
                                                <table class="table">
                                                    <tbody>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Màu sắc</td>
                                                            <td>${headphone_detail.color}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Tương thích</td>
                                                            <td>${headphone_detail.connect}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Thời lượng pin</td>
                                                            <td>${headphone_detail.using_time}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Công nghệ âm thanh</td>
                                                            <td>${headphone_detail.sound_tech}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Micro</td>
                                                            <td>${headphone_detail.micro}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Phương thức điều khiển</td>
                                                            <td>${headphone_detail.control_method}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background: #f2f2f2; width: 20%;">Chống nước</td>
                                                            <td>${headphone_detail.waterproof}</td>
                                                        </tr>
                                                        <c:if test="${headphone_detail.other_feature != null}">
                                                            <tr>
                                                                <td style="background: #f2f2f2; width: 20%;">Tính năng khác</td>
                                                                <td>${headphone_detail.other_feature}</td>
                                                            </tr>
                                                        </c:if>
                                                    </tbody>
                                                </table>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab2  -->

                                <!-- tab3  -->
                                <div id="tab3" class="tab-pane fade in">
                                    <div class="row">
                                        <!-- Rating -->
                                        <div class="col-md-3">
                                            <div id="rating">
                                                <div class="rating-avg">
                                                    <span>${product_detail.avr_rated_star}</span>
                                                    <c:if test="${product_detail.avr_rated_star > 4.0 && product_detail.avr_rated_star <= 5.0}">
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${product_detail.avr_rated_star > 3.0 && product_detail.avr_rated_star <= 4.0}">
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${product_detail.avr_rated_star > 2.0 && product_detail.avr_rated_star <= 3.0}">
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${product_detail.avr_rated_star > 1.0 && product_detail.avr_rated_star <= 2.0}">
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${product_detail.avr_rated_star > 0.0 && product_detail.avr_rated_star <= 1.0}">
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${product_detail.avr_rated_star == 0.0}">
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                    </c:if>
                                                </div>
                                                <ul class="rating">
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width: 80%;"></div>
                                                        </div>
                                                        <span class="sum">3</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width: 60%;"></div>
                                                        </div>
                                                        <span class="sum">2</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div></div>
                                                        </div>
                                                        <span class="sum">0</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div></div>
                                                        </div>
                                                        <span class="sum">0</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div></div>
                                                        </div>
                                                        <span class="sum">0</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- /Rating -->

                                        <!-- Reviews -->
                                        <div class="col-md-6">
                                            <div id="reviews">
                                                <c:forEach var="feedback" items="${list_3_feedback}">
                                                    <ul class="reviews">
                                                        <li>
                                                            <div class="review-heading">
                                                                <h5 class="name">${feedback.fullName}</h5>
                                                                <p class="date">${feedback.date}</p>
                                                                <c:if test="${feedback.rated_star == 5.0}">
                                                                    <div class="review-rating">
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${feedback.rated_star == 4.0}">
                                                                    <div class="review-rating">
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${feedback.rated_star == 3.0}">
                                                                    <div class="review-rating">
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${feedback.rated_star == 2.0}">
                                                                    <div class="review-rating">
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${feedback.rated_star == 1.0}">
                                                                    <div class="review-rating">
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${feedback.rated_star == 0.0}">
                                                                    <div class="review-rating">
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    </div>
                                                                </c:if>
                                                            </div>
                                                            <div class="review-body">
                                                                <span>${feedback.feedback}</span>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </c:forEach>
                                            </div>
                                            <ul class="reviews-pagination">
                                                <c:forEach begin="1" end="${endP}" var="i"> 
                                                    <li>
                                                        <a href="productDetail?pid=${product_detail.product_id}&feedbackPageNum=${i}">${i}</a>
                                                    </li>
                                                </c:forEach>
                                                <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                            </ul>
                                        </div>
                                        <!-- Review Form -->
                                        <div class="col-md-3">
                                            <div id="review-form">
                                                <form class="review-form">
                                                    <input class="input" type="text" placeholder="Your Name">
                                                    <input class="input" type="email" placeholder="Your Email">
                                                    <textarea class="input" placeholder="Your Review"></textarea>
                                                    <div class="input-rating">
                                                        <span>Your Rating: </span>
                                                        <div class="stars">
                                                            <input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
                                                            <input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
                                                            <input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
                                                            <input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
                                                            <input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
                                                        </div>
                                                    </div>
                                                    <button class="primary-btn">Submit</button>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- /Review Form -->
                                    </div>
                                    <!-- /Reviews -->
                                </div>
                            </div>
                            <!-- /tab3  -->
                        </div>
                        <!-- /product tab content  -->
                    </div>
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
                        <h3 class="title">Related Products</h3>
                    </div>
                </div>

                <!-- product -->
                <c:forEach items="${relatedProduct}" var="relatedProduct">
                    <div class="col-md-3 col-xs-6">
                        <div class="product">
                            <div class="product-img">
                                <c:forEach items="${allImages}" var="aI">
                                    <c:if test="${relatedProduct.product_id == aI.product_id}">
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
                                    <c:if test="${relatedProduct.category_id == c.category_id}">
                                        <p class="product-category">${c.category_name}</p>
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

    <%@include file="/navigator/footer.jsp" %>

    <!-- jQuery Plugins -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/slick.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/nouislider.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.zoom.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
