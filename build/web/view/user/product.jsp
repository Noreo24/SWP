<%@page contentType="text/html" pageEncoding="UTF-8" %>

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
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <ul class="breadcrumb-tree">
                            <li><a href="#">Home</a></li>
                            <li><a href="#">All Categories</a></li>
                            <li><a href="#">Accessories</a></li>
                            <li><a href="#">Headphones</a></li>
                            <li class="active">Product name goes here</li>
                        </ul>
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
                                <img src="${pageContext.request.contextPath}/img/product01.png" alt="">
                            </div>

                            <div class="product-preview">
                                <img src="${pageContext.request.contextPath}/img/product03.png" alt="">
                            </div>

                            <div class="product-preview">
                                <img src="${pageContext.request.contextPath}/img/product06.png" alt="">
                            </div>

                            <div class="product-preview">
                                <img src="${pageContext.request.contextPath}/img/product08.png" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /Product main img -->

                    <!-- Product thumb imgs -->
                    <div class="col-md-2  col-md-pull-5">
                        <div id="product-imgs">
                            <div class="product-preview">
                                <img src="${pageContext.request.contextPath}/img/product01.png" alt="">
                            </div>

                            <div class="product-preview">
                                <img src="${pageContext.request.contextPath}/img/product03.png" alt="">
                            </div>

                            <div class="product-preview">
                                <img src="${pageContext.request.contextPath}/img/product06.png" alt="">
                            </div>

                            <div class="product-preview">
                                <img src="${pageContext.request.contextPath}/img/product08.png" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /Product thumb imgs -->

                    <!-- Product details -->
                    <div class="col-md-5">
                        <div class="product-details">
                            <h2 class="product-name">product name goes here</h2>
                            <div>
                                <div class="product-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                                <a class="review-link" href="#">10 Review(s) | Add your review</a>
                            </div>
                            <div>
                                <h3 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h3>
                                <span class="product-available">In Stock</span>
                            </div>
                            <div class="ksp-content p-2 mb-2">
                                <h3 class="ksp-title has-text-centered" style="color: red">
                                    ĐẶC ĐIỂM NỔI BẬT</h3> 
                                <div>
                                    <ul>
                                        <li> Thoả sức chụp ảnh, quay video chuyên nghiệp - Camera đến 200MP, chế độ chụp đêm cải tiến, bộ xử lí ảnh thông minh</li><li> Chiến game bùng nổ - chip Snapdragon 8 Gen 2 8 nhân tăng tốc độ xử lí, màn hình 120Hz, pin 5.000mAh</li><li> Nâng cao hiệu suất làm việc với Siêu bút S Pen tích hợp, dễ dàng đánh dấu sự kiện từ hình ảnh hoặc video</li><li> Thiết kế bền bỉ, thân thiện - Màu sắc lấy cảm hứng từ thiên nhiên, chất liệu kính và lớp phim phủ PET tái chế</li>
                                    </ul>
                                </div>
                            </div>
                            <br>
                            <br>
                            <div class="add-to-cart">
                                <div class="qty-label">
                                    <p style="color: orangered; font-size: 20px">Quantity:</p>
                                    <div class="input-number">
                                        <input type="number">
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
                                <li><a href="#">Headphones</a></li>
                                <li><a href="#">Accessories</a></li>
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
                                <li><a data-toggle="tab" href="#tab3">Reviews (3)</a></li>
                            </ul>
                            <!-- /product tab nav -->

                            <!-- product tab content -->
                            <div class="tab-content">
                                <!-- tab1  -->
                                <div id="tab1" class="tab-pane fade in active">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p style="text-align: justify;"><strong style="color: red">iPhone 15 128GB</strong> được trang bị <strong>màn hình Dynamic Island kích thước 6.1 inch</strong> với công nghệ hiển thị <strong>Super Retina XDR</strong> màn lại trải nghiệm hình ảnh vượt trội. Điện thoại với mặt lưng kính nhám chống bám mồ hôi cùng <strong>5 phiên bản màu sắc</strong> lựa chọn: <strong>Hồng, Vàng, Xanh lá, Xanh dương và đen</strong>. Camera trên <strong>iPhone 15 series</strong> cũng được nâng cấp lên <strong>cảm biến 48MP</strong> cùng tính năng chụp<strong> zoom quang học tới 2x</strong>. Cùng với thiết kế cổng sạc thay đổi từ lightning sang USB-C vô cùng ấn tượng.</p>                                   
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab1  -->

                                <!-- tab2  -->
                                <div id="tab2" class="tab-pane fade in">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td style="background: #f2f2f2">Kích thước màn hình</td>
                                                        <td>6.8 inches</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #f2f2f2">Công nghệ màn hình</td>
                                                        <td>Dynamic AMOLED 2X</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #f2f2f2">Camera sau</td>
                                                        <td>Siêu rộng: 12MP F2.2 (Dual Pixel AF)<br>
                                                            Chính: 200MP F1.7 OIS ±3° (Super Quad Pixel AF)<br>
                                                            Tele 1: 10MP F4.9 (10X, Dual Pixel AF) OIS,<br>
                                                            Tele 2: 10MP F2.4 (3X, Dual Pixel AF) OIS Thu phóng chuẩn không gian 100X</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #f2f2f2">Camera trước</td>
                                                        <td>12MP, ƒ/1.9</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #f2f2f2">Chipset</td>
                                                        <td>A17 Pro</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #f2f2f2">Dung lượng RAM</td>
                                                        <td>8 GB</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #f2f2f2">Bộ nhớ trong</td>
                                                        <td>256 GB</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #f2f2f2">Pin</td>
                                                        <td>4422 mAh
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #f2f2f2">Thẻ SIM</td>
                                                        <td>2 SIM (nano‑SIM và eSIM)</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #f2f2f2">Hệ điều hành</td>
                                                        <td>iOS 17</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #f2f2f2">Độ phân giải màn hình</td>
                                                        <td>2796 x 1290-pixel</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #f2f2f2">Tính năng màn hình</td>
                                                        <td>Tốc độ làm mới 120Hz<br>460 ppi<br>HDR<br>True Tone<br>Dải màu rộng (P3)<br>Haptic Touch<br>Tỷ lệ tương phản 2.000.000:1</td>
                                                    </tr>
                                                </tbody>
                                            </table>                                        </div>
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
                                                    <span>4.5</span>
                                                    <div class="rating-stars">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
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
                                                <ul class="reviews">
                                                    <li>
                                                        <div class="review-heading">
                                                            <h5 class="name">John</h5>
                                                            <p class="date">27 DEC 2018, 8:0 PM</p>
                                                            <div class="review-rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-o empty"></i>
                                                            </div>
                                                        </div>
                                                        <div class="review-body">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="review-heading">
                                                            <h5 class="name">John</h5>
                                                            <p class="date">27 DEC 2018, 8:0 PM</p>
                                                            <div class="review-rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-o empty"></i>
                                                            </div>
                                                        </div>
                                                        <div class="review-body">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="review-heading">
                                                            <h5 class="name">John</h5>
                                                            <p class="date">27 DEC 2018, 8:0 PM</p>
                                                            <div class="review-rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-o empty"></i>
                                                            </div>
                                                        </div>
                                                        <div class="review-body">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="reviews-pagination">
                                                    <li class="active">1</li>
                                                    <li><a href="#">2</a></li>
                                                    <li><a href="#">3</a></li>
                                                    <li><a href="#">4</a></li>
                                                    <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- /Reviews -->

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
                    <div class="col-md-3 col-xs-6">
                        <div class="product">
                            <div class="product-img">
                                <img src="${pageContext.request.contextPath}/img/product01.png" alt="">
                                <div class="product-label">
                                    <span class="sale">-30%</span>
                                </div>
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
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
                    <!-- /product -->

                    <!-- product -->
                    <div class="col-md-3 col-xs-6">
                        <div class="product">
                            <div class="product-img">
                                <img src="${pageContext.request.contextPath}/img/product02.png" alt="">
                                <div class="product-label">
                                    <span class="new">NEW</span>
                                </div>
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                <div class="product-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
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
                    <!-- /product -->

                    <div class="clearfix visible-sm visible-xs"></div>

                    <!-- product -->
                    <div class="col-md-3 col-xs-6">
                        <div class="product">
                            <div class="product-img">
                                <img src="${pageContext.request.contextPath}/img/product03.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                <div class="product-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
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
                    <!-- /product -->

                    <!-- product -->
                    <div class="col-md-3 col-xs-6">
                        <div class="product">
                            <div class="product-img">
                                <img src="${pageContext.request.contextPath}/img/product04.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
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
