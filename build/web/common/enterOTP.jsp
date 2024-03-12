<!doctype html>
<html lang="en">
    <head>
        <title>Login 10</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/csslogin/style.css">

    </head>
    <body class="img js-fullheight" style="background-image: url(${pageContext.request.contextPath}/img/bg.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Login</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <h3 class="mb-4 text-center">Did you forget password?</h3>
                            <form action="${pageContext.request.contextPath}/sendotp" method="post" class="signin-form">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Email" value="${email}" required name="email">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Send new password again</button>
                                </div>
                            </form>
                            <h3 class="mb-4 text-center">Enter password</h3>
                            <form action="${pageContext.request.contextPath}/sendotp" class="signin-form">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="password" required name="otp">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Verify</button>
                                </div>
                            </form>
                                <i style="color: red">${err}</i>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="${pageContext.request.contextPath}/js/jslogin/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jslogin/popper.js"></script>
        <script src="${pageContext.request.contextPath}/js/jslogin/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jslogin/main.js"></script>

    </body>
</html>

