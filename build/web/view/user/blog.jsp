<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<!--
 // WEBSITE: https://themefisher.com
 // TWITTER: https://twitter.com/themefisher
 // FACEBOOK: https://www.facebook.com/themefisher
 // GITHUB: https://github.com/themefisher/
-->

<html lang="en-us">

    <head>
        <meta charset="utf-8">
        <title>Blog</title>

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

        <style>.paging-container {
                text-align: center;
                margin-top: 20px;
            }

            .pagination {
                display: inline-block;
                padding: 0;
                list-style: none;
            }

            .pagination li {
                display: inline;
            }

            .pagination li a {
                padding: 8px 12px;
                text-decoration: none;
                color: #333;
                background-color: #f5f5f5;
                border: 1px solid #ccc;
                margin-right: 5px;
            }

            .pagination li.active a {
                background-color: #ccc;
                color: #fff;
            }

            .pagination li a:hover {
                background-color: #ebebeb;
            }</style>
    </head>

    <body>
        <!-- navigation -->
        <header class="sticky-top bg-white border-bottom border-default">
            <div class="container">

                <nav class="navbar navbar-expand-lg navbar-white">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
                        <img class="img-fluid" width="150px" src="${pageContext.request.contextPath}/img/logo.png" alt="">
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
                                <a class="nav-link" href="contact.html">Contact</a>
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
        <!-- /navigation -->

        <section class="section">
            <div class="container">
                <div class="row">
                    <aside class="col-lg-4 order-2 order-lg-1">
                        <!-- Search -->
                        <div class="widget">
                            <h5 class="widget-title"><span>Tìm kiếm</span></h5>
                            <form action="${pageContext.request.contextPath}/loadblogpage" class="widget-search">
                                <input id="search-query" name="s" type="search" placeholder="Vui lòng nhập từ khóa!">
                                <button type="submit"><i class="ti-search"></i>
                                </button>
                            </form>
                        </div>
                        <!-- categories -->
                        <div class="widget">
                            <h5 class="widget-title"><span>Thể loại</span></h5>
                            <ul class="list-unstyled widget-list">
                                <c:forEach items="${cateblogList}" var="c">
                                    <li><a href="${pageContext.request.contextPath}/loadblogpage?category=${c.getCategoryBlog_id()}" class="d-flex">${c.getCategoryBlog_name()}
                                            <small class="ml-auto">${c.getNumblog()}</small></a>
                                    </li>
                                </c:forEach>
                                <li><a href="${pageContext.request.contextPath}/loadblogpage" class="d-flex">Tất cả
                                        <small class="ml-auto"></small></a>
                                </li>

                            </ul>
                        </div>
                        <!--                         tags 
                                                <div class="widget">
                                                    <h5 class="widget-title"><span>Tags</span></h5>
                                                    <ul class="list-inline widget-list-inline">
                                                        <li class="list-inline-item"><a href="#!">Booth</a>
                                                        </li>
                                                        <li class="list-inline-item"><a href="#!">City</a>
                                                        </li>
                                                        <li class="list-inline-item"><a href="#!">Image</a>
                                                        </li>
                                                        <li class="list-inline-item"><a href="#!">New</a>
                                                        </li>
                                                        <li class="list-inline-item"><a href="#!">Photo</a>
                                                        </li>
                                                        <li class="list-inline-item"><a href="#!">Seasone</a>
                                                        </li>
                                                        <li class="list-inline-item"><a href="#!">Video</a>
                                                        </li>
                                                    </ul>
                                                </div>-->
                        <!-- latest post -->
                        <div class="widget">
                            <h5 class="widget-title"><span>Bài viết mới nhất</span></h5>
                            <!-- post-item -->
                            <c:forEach items="${blist}" var="b">
                                <ul class="list-unstyled widget-list">
                                    <li class="media widget-post align-items-center">
                                        <a href="${pageContext.request.contextPath}/blogdetail?blogId=${b.getBlog_id()}">
                                            <img loading="lazy" class="mr-3" src="${b.getThumbnail()}">
                                        </a>
                                        <div class="media-body">
                                            <h5 class="h6 mb-0"><a href="${pageContext.request.contextPath}/blogdetail?blogId=${b.getBlog_id()}">${b.getTitle()}</a></h5>
                                            <small>${b.getUpdated_date()}</small>
                                        </div>
                                    </li>
                                </ul>
                            </c:forEach>
                        </div>
                    </aside>
                    <div class="col-lg-8 order-1 order-lg-2 mb-5 mb-lg-0">
                        <c:forEach items="${bloglist}" var="b">
                            <article class="row mb-5">
                                <div class="col-md-4 mb-4 mb-md-0">
                                    <div class="post-slider slider-sm">
                                        <img loading="lazy" src="${b.getThumbnail()}" class="img-fluid" alt="post-thumb" style="height:200px; object-fit: cover;">
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <h3 class="h5"><a class="post-title" href="${pageContext.request.contextPath}/blogdetail?blogId=${b.getBlog_id()}">${b.getTitle()}</a></h3>
                                    <ul class="list-inline post-meta mb-2">
                                        <li class="list-inline-item"><i class="ti-user mr-2"></i><a href="author.html">${b.getAuthor_id()}</a>
                                        </li>
                                        <li class="list-inline-item">Date : ${b.getUpdated_date()}</li>
                                        <li class="list-inline-item">Categories : ${b.getCategoryBlog_id()}
                                        </li>
                                    </ul>
                                    <p>${b.getBrief_infor()}</p> <a href="" class="btn btn-outline-primary">Đọc tiếp</a>
                                </div>
                            </article>
                        </c:forEach>


                        <!--Paging-->
                        <div class="paging-container">
                            <ul class="pagination">
                                <c:forEach begin="1" end="${endPage}" var="i">
                                    <li class=" ${index == i ? 'active' : ''}">
                                        <a href="${pageContext.request.contextPath}/loadblogpage?index=${i}">${i}</a>
                                    </li>
                                </c:forEach>

                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <footer class="section-sm pb-0 border-top border-default">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-md-3 mb-4">
                        <a class="mb-4 d-block" href="index.html">
                            <img class="img-fluid" width="150px" src="${pageContext.request.contextPath}/img/logo.png" alt="LogBook">
                        </a>
                        <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>
                    </div>

                    <div class="col-lg-2 col-md-3 col-6 mb-4">
                        <h6 class="mb-4">Quick Links</h6>
                        <ul class="list-unstyled footer-list">
                            <!--                            <li><a href="about.html">About</a></li>
                                                        <li><a href="contact.html">Contact</a></li>
                                                        <li><a href="privacy-policy.html">Privacy Policy</a></li>
                                                        <li><a href="terms-conditions.html">Terms Conditions</a></li>-->
                        </ul>
                    </div>

                    <div class="col-lg-2 col-md-3 col-6 mb-4">
                        <h6 class="mb-4">Social Links</h6>
                        <ul class="list-unstyled footer-list">
                            <li><a href="#">facebook</a></li>
                            <li><a href="#">twitter</a></li>
                            <li><a href="#">linkedin</a></li>
                            <li><a href="#">github</a></li>
                        </ul>
                    </div>

                    <div class="col-md-3 mb-4">
                        <h6 class="mb-4">Subscribe Newsletter</h6>
                        <form class="subscription" action="javascript:void(0)" method="post">
                            <div class="position-relative">
                                <i class="ti-email email-icon"></i>
                                <input type="email" class="form-control" placeholder="Your Email Address">
                            </div>
                            <button class="btn btn-primary btn-block rounded" type="submit">Subscribe now</button>
                        </form>
                    </div>
                </div>
                <div class="scroll-top">
                    <a href="javascript:void(0);" id="scrollTop"><i class="ti-angle-up"></i></a>
                </div>
                <div class="text-center">
                    <p class="content">&copy; 2020 - Design &amp; Develop By <a href="https://themefisher.com/" target="_blank">Themefisher</a></p>
                </div>
            </div>
        </footer>


        <!-- JS Plugins -->
        <script src="${pageContext.request.contextPath}/plugins/jQuery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap/bootstrap.min.js" async></script>
        <script src="${pageContext.request.contextPath}/plugins/slick/slick.min.js"></script>

        <!-- Main Script -->
        <script src="${pageContext.request.contextPath}/js/script.js"></script>
    </body>
</html>