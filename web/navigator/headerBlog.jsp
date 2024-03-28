<%-- 
    Document   : headerBlog
    Created on : Mar 3, 2024, 12:01:32 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Cheerful Loving Couple Bakers Drinking Coffee</title>

        <!-- mobile responsive meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5">
        <meta name="description" content="This is meta description">
        <meta name="author" content="Themefisher">

        <!-- plugins -->
        <link rel="preload" href="https://fonts.gstatic.com/s/opensans/v18/mem8YaGs126MiZpBA-UFWJ0bbck.woff2" style="font-display: optional;">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:600%7cOpen&#43;Sans&amp;display=swap" media="screen">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/slick/slick.css">

        <!-- Main Stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cssblog/style.css">

        <!--Favicon-->

    </head>
    <body>
        <header class="sticky-top bg-white border-bottom border-default">
            <div class="container">

                <nav class="navbar navbar-expand-lg navbar-white">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
                        <img class="img-fluid" width="150px" style="border-radius: 10px" src="${pageContext.request.contextPath}/img/logo.png" alt="">
                    </a>
                    <button class="navbar-toggler border-0" type="button" data-toggle="collapse" data-target="#navigation">
                        <i class="ti-menu"></i>
                    </button>

                    <div class="collapse navbar-collapse text-center" id="navigation">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/home">Trang chủ</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
                                   aria-expanded="false">
                                    Thể loại <i class="ti-angle-down ml-1"></i>
                                </a>
                                <div class="dropdown-menu">
                                    <c:forEach items="${cateblogList}" var="c">
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/loadblogpage?category=${c.getCategoryBlog_id()}">${c.getCategoryBlog_name()}</a>
                                    </c:forEach>
                                </div>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="">Contact</a>
                            </li>
                            <c:if test="${sessionScope.acc != null}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
                                        </svg></a>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/view/user/profile.jsp">Thông tin cá nhân</a></li>
                                        <li><hr class="dropdown-divider" /></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logoutcontroller">Đăng xuất</a></li>
                                    </ul>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.acc == null}">
                                <li><a class="nav-link" href="${pageContext.request.contextPath}/view/common/login.jsp"><i class="fa fa-user-o"></i> Log in</a></li>
                            </c:if>

                        </ul>

                        <!-- search -->
                        <div class="search px-4">
                            <button id="searchOpen" class="search-btn"><i class="ti-search"></i></button>
                            <div class="search-wrapper">
                                <form action="${pageContext.request.contextPath}/loadblogpage" class="h-100">
                                    <input class="search-box pl-4" id="search-query" name="s" type="search" placeholder="Vui lòng nhập từ khóa!">
                                </form>
                                <button id="searchClose" class="search-close"><i class="ti-close text-dark"></i></button>
                            </div>
                        </div>

                    </div>
                </nav>

            </div>
        </header>   
        <script src="plugins/jQuery/jquery.min.js"></script>
        <script src="plugins/bootstrap/bootstrap.min.js" async></script>
        <script src="plugins/slick/slick.min.js"></script>

        <!-- Main Script -->
        <script src="js/script.js"></script>
    </body>
</html>
