<%-- 
    Document   : blogfooter
    Created on : Feb 29, 2024, 12:29:05 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

    </head>
    <body>
        <footer class="section-sm pb-0 border-top border-default">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-md-3 mb-4">
                        <a class="mb-4 d-block" href="index.html">
                            <img class="img-fluid" width="150px" src="${pageContext.request.contextPath}/img/logo.png" alt="LogBook">
                        </a>
                        <p>E-shop Mobile là nền tảng trực tuyến hàng đầu chuyên bán điện thoại di động chất lượng cao, cung cấp nhiều loại thiết bị tiên tiến nhằm đáp ứng nhu cầu và sở thích đa dạng của những người đam mê công nghệ.</p>
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
