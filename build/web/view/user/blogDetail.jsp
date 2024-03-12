<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <!-- navigation -->
        <%@include file="/navigator/headerBlog.jsp" %>

        <!-- /navigation -->

        <section class="section">
            <div class="container">
                <article class="row mb-4">
                    <div class="col-lg-10 mx-auto mb-4">
                        <h1 class="h2 mb-3">${b.getTitle()}</h1>
                        <ul class="list-inline post-meta mb-3">
                            <li class="list-inline-item"><i class="ti-user mr-2"></i><a href="#">${b.getAuthor_id()}</a>
                            </li>
                            <li class="list-inline-item">Date : ${b.getUpdated_date()}</li>
                            <li class="list-inline-item">Categories : <a href="#!" class="ml-1">${b.getCategoryBlog_id()} </a>
                            </li>
                        </ul>
                        <br>
                        <b class="h5"> ${b.getBrief_infor()}</b>
                    </div>

                    <div class="col-12 mb-3">
                        <div class="post-slider">
                            <img src="${pageContext.request.contextPath}/thumbnail/${b.getThumbnail()}" class="img-fluid" alt="post-thumb">
                        </div>
                    </div>

                    <div class="col-lg-10 mx-auto">
                        <div class="content">${b.getContent()}</div>
                    </div>
                </article>
                <h3 style="color: #ff3b02" class="h3 mb-3">Tin liên quan</h3>
                <div class="col-lg-8 order-1 order-lg-2 mb-5 mb-lg-0">
                    <c:forEach items="${rblist}" var="b">
                        <article class="row mb-5">
                            <div class="col-md-4 mb-4 mb-md-0">
                                <div class="post-slider slider-sm">
                                    <img loading="lazy" src="${pageContext.request.contextPath}/thumbnail/${b.getThumbnail()}" class="img-fluid" alt="post-thumb" style="height:200px; object-fit: cover;">
                                </div>
                            </div>
                            <div class="col-md-8">
                                <h3 class="h5"><a class="post-title" href="${pageContext.request.contextPath}/blogdetail?blogId=${b.getBlog_id()}">${b.getTitle()}</a></h3>
                                <ul class="list-inline post-meta mb-2">
                                    <li class="list-inline-item"><i class="ti-user mr-2"></i>${b.getAuthor_id()}
                                    </li>
                                    <li class="list-inline-item">Date : ${b.getUpdated_date()}</li>
                                    <li class="list-inline-item">Categories : ${b.getCategoryBlog_id()}
                                    </li>
                                </ul>
                                <p>${b.getBrief_infor()}</p> <a href="${pageContext.request.contextPath}/blogdetail?blogId=${b.getBlog_id()}" class="btn btn-outline-primary">Đọc tiếp</a>
                            </div>
                        </article>
                    </c:forEach>
                </div>
            </div>
        </section>

        <%@include file="/navigator/blogfooter.jsp" %>


        <!-- JS Plugins -->
        <script src="plugins/jQuery/jquery.min.js"></script>
        <script src="plugins/bootstrap/bootstrap.min.js" async></script>
        <script src="plugins/slick/slick.min.js"></script>

        <!-- Main Script -->
        <script src="js/script.js"></script>
    </body>
</html>