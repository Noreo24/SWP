<!doctype html>
<html lang="en">
    <head>
        <title>Change password</title>
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
                        <h2 class="heading-section">Change password</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <h3 class="text-capitalize">${sussPass}</h3>
                        <div class="login-wrap p-0">
                            <h3 class="mb-4 text-center"></h3>
                            <form action="ChangePassword" class="signin-form" method="post">
                                <div class="form-group">
                                    <p class="text-danger">${errorPassOld}</p>
                                    <input type="password" class="form-control"
                                           value="${passOld}"   placeholder="Entrt old password" required name="txtPasswordOld">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" 
                                         value="${pass}"   placeholder="Entrt new password" required name="txtPassword">
                                </div> 
                                <div class="form-group">
                                     <p class="text-danger">${errorPassConfirm}</p>
                                     <input type="password" class="form-control" value="${passConfirm}"
                                           placeholder="Confirm password" required name="txtPasswordConfirm">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Submit</button>
                                </div>
                            </form>
                                
                            <div class="form-group">
                                <a href="${pageContext.request.contextPath}/Home"><button type="button" class="form-control btn btn-primary submit px-3">Home</button></a>
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

