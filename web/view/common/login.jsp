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
                            <h3 class="mb-4 text-center">Have an account?</h3>
                            <form action="${pageContext.request.contextPath}/logincontroller" method="post" class="signin-form">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Username" required name="username">
                                </div>
                                <div class="form-group">
                                    <input id="password-field" type="password" class="form-control" placeholder="Password" required name="password">
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
                                </div>
                                <i style="color: red">${err}</i>
                                <div class="form-group d-md-flex">
                                    <div class="w-50">
                                        <input type="checkbox" value="rememberpass" checked name="rememberpass">
                                        <label for="rememberpass">Remember Me
                                        </label>
                                    </div>
                                    <div class="w-50 text-md-right">
                                        <a href="${pageContext.request.contextPath}/view/common/forgotPass.jsp" style="color: #fff">Forgot Password</a>
                                    </div>
                                </div>
                            </form>
                            <div class="form-group">
                                <a href="${pageContext.request.contextPath}/view/common/register.jsp"><button class="form-control btn btn-primary px-3">Register a new account</button></a>
                            </div>
                            <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p> 

                            <div class="social d-flex text-center">
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:9999/PhoneShop/logingooglecontroller&response_type=code
                                   &client_id=101425332251-q5etcuuteqhjvd19fg392nnprnqrnjla.apps.googleusercontent.com&approval_prompt=force" class="px-2 py-2 mr-md-1 rounded">Google</a>
                            </div>
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

