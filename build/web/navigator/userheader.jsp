<%-- 
    Document   : HeaderForUser
    Created on : Jan 11, 2024, 10:22:31 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>

    </head>
    <body>
        <!-- HEADER -->
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-right">
                        <c:if test="${sessionScope.acc != null}">
                            <li><a href="logoutcontroller">Log out</a></li>
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
                                        <option value="0">Danh mục</option>
                                        <c:forEach items="${catelist}" var="c">
                                            <option value="${c.getCategory_id()}">${c.getCategory_name()}</option>
                                        </c:forEach>
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
                                <!-- Cart -->
                                <div >
                                    <a href="cart">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Your Cart</span>
                                        <div class="qty">3</div>
                                    </a>
                                </div>
                                <!-- MyOrder -->
                                <div>
                                    <a href="myOrder">
                                        <i class="fa fa-list-alt"></i>
                                        <span>Your Orders</span>
                                        <div class="qty">4</div>
                                    </a>
                                </div>
                                <!-- /MyOrder -->

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
        <!-- /HEADER -->
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li  class="${checkActive == 'Home' ? 'active': ''}">
                            <a href="home">Home</a>
                        </li>
                        <li class="${checkActive == 'List product' ? 'active': ''}">
                            <a href="listProduct">Categories</a>
                        </li>
                        <li class="${checkActive == 'Blog' ? 'active': ''}">
                            <a href="${pageContext.request.contextPath}/loadblogpage">Blogs</a>
                        </li>
                        <li class="${checkActive == 'Brand' ? 'active': ''}">
                            <a href="${pageContext.request.contextPath}/BrandList">Brands</a>
                        </li>
                    </ul>
<!--                    <ul class="main-nav nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#">Categories</a></li>
                        <li><a href="/loadblogpage">Blogs</a></li>
                        <li><a href="/BrandList">Brands</a></li>
                    </ul>-->
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>   
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/slick.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/nouislider.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.zoom.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <df-messenger
        intent="WELCOME"
        chat-title="Phone_Shop_AI"
        agent-id="c263e20b-a262-4f4a-9b97-c708d35f8917"
        language-code="vi"
        ></df-messenger>
</body>
</html>
