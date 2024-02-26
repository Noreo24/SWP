<%-- 
    Document   : profile
    Created on : Jan 17, 2024, 2:48:08 AM
    Author     : LanChau
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/profile.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
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
    </head>
    <body>

        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-right">
                        <c:if test="${sessionScope.acc != null}">
                            <li><a href="${pageContext.request.contextPath}/logoutcontroller">Log out</a></li>
                            <li><a href="${pageContext.request.contextPath}/view/user/profile.jsp"><i class="fa fa-user-o"></i> My Account - ${sessionScope.acc.getFullName()}</a></li>
                            </c:if>
                            <c:if test="${sessionScope.acc == null}">
                            <li><a href="${pageContext.request.contextPath}/view/common/login.jsp"><i class="fa fa-user-o"></i> Log in</a></li>
                            </c:if>
                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="${pageContext.request.contextPath}/home" class="logo">
                                    <img style="width: 250px" src="${pageContext.request.contextPath}/img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">
                                <form>
                                    <select class="input-select">
                                        <option value="0">All Categories</option>
                                        <option value="1">Category 01</option>
                                        <option value="1">Category 02</option>
                                    </select>
                                    <input class="input" placeholder="Search here">
                                    <button class="search-btn">Search</button>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Wishlist -->
                                <div>
                                    <a href="#">
                                        <i class="fa fa-heart-o"></i>
                                        <span>Your Wishlist</span>
                                        <div class="qty">2</div>
                                    </a>
                                </div>
                                <!-- /Wishlist -->

                                <!-- Cart -->
                                <div class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Your Cart</span>
                                        <div class="qty">3</div>
                                    </a>
                                    <div class="cart-dropdown">
                                        <div class="cart-list">
                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="./img/product01.png" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                                    <h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
                                                </div>
                                                <button class="delete"><i class="fa fa-close"></i></button>
                                            </div>

                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="./img/product02.png" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                                    <h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
                                                </div>
                                                <button class="delete"><i class="fa fa-close"></i></button>
                                            </div>
                                        </div>
                                        <div class="cart-summary">
                                            <small>3 Item(s) selected</small>
                                            <h5>SUBTOTAL: $2940.00</h5>
                                        </div>
                                        <div class="cart-btns">
                                            <a href="#">View Cart</a>
                                            <a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Cart -->


                                <!-- Menu Toogle -->
                                <div class="menu-toggle">
                                    <a href="#">
                                        <i class="fa fa-bars"></i>
                                        <span>Menu</span>
                                    </a>
                                </div>
                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <div class="container-xl px-4 mt-4">
            <!-- Account page navigation-->
            <nav class="nav nav-borders">
                <a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a>
                <a class="nav-link active ms-0" href="${pageContext.request.contextPath}/ProfileUser">Profile</a>
                <a class="nav-link" href="#" target="__blank">Billing</a>
                <a class="nav-link" href="#" target="__blank">Security</a>
                <a class="nav-link" href="#"  target="__blank">Notifications</a>
            </nav>
            <hr class="mt-0 mb-4">
            <i style="color: red">${suc}</i>

            <div class="row">
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <!--<div class="card-header"></div>-->
                        <div class="card-body text-center">
                            <!-- Profile picture image--> 
                            <img class="img-account-profile rounded-circle mb-2" 
                                 src="${sessionScope.acc.getAvatar()}" 
                                 onerror="this.src='http://bootdey.com/img/Content/avatar/avatar1.png'" 
                                 alt="">
                            <!-- Profile picture help block-->
                            <div class="small font-italic text-muted mb-4">  </div>
                            <!-- Profile picture upload button-->
                            <c:if test="${sessionScope.acc.getPassword() != null}">
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/view/user/changePassword.jsp">Change Password</a>
                            </c:if>
                                <a class="btn btn-primary" href="">Update Profile</a>
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/logoutcontroller">Log out</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8">
                        <!-- Account details card-->
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="panel">
                                    <div class="bio-graph-heading">
                                    </div>
                                    <div class="panel-body bio-graph-info">
                                        <h1 class="mb-4">${sessionScope.acc.getFullName()}</h1>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="bio-row">
                                                    <p><span>User Name </span>: ${sessionScope.acc.getUser_name()}</p>
                                                </div>
                                                <div class="bio-row">
                                                    <p><span>Gender </span>:
                                                        <c:if test="${sessionScope.acc.getGender() eq 'true'}">
                                                            Male
                                                        </c:if>
                                                        <c:if test="${sessionScope.acc.getGender() eq 'false'}">
                                                            Female
                                                        </c:if>

                                                </div>

                                                <div class="bio-row">
                                                    <p><span>Email </span>: ${sessionScope.acc.getEmail()}</p>
                                                </div>

                                                <div class="bio-row">
                                                    <p><span>Phone </span>: ${sessionScope.acc.getPhone()}</p>
                                                </div>
                                                <div class="bio-row">
                                                    <p><span>Adderss </span>: ${sessionScope.acc.getAddress()}</p>
                                                </div>
                                            </div>
                                            <!--                                        <div class="col-md-6">
                                                                                        <div class="bio-row">
                                                                                            <p><span>Occupation </span>: UI Designer</p>
                                                                                        </div>
                                                                                        <div class="bio-row">
                                                                                            <p><span>Email </span>: jsmith@flatlab.com</p>
                                                                                        </div>
                                                                                        <div class="bio-row">
                                                                                            <p><span>Mobile </span>: (12) 03 4567890</p>
                                                                                        </div>
                                                                                        <div class="bio-row">
                                                                                            <p><span>Phone </span>: 88 (02) 123456</p>
                                                                                        </div>
                                                                                    </div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </html>
