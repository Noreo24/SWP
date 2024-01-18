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
                        <h2 class="heading-section">REGISTER</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <form action="${pageContext.request.contextPath}/registercontroller" method="post" class="signin-form">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Email" name="email" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Username" name="username" required>
                                </div>
                                <div class="form-group">
                                    <input id="password-field" type="password" class="form-control" placeholder="Password" name="pass" required>
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <input id="repassword-field" type="password" class="form-control" placeholder="Re-password" name="repass" required>
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Fullname" name="fullname" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Phone" name="phone" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Address" name="address" required>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Register</button>
                                </div>
                                <i style="color: red">${err}</i>
                            </form>
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

