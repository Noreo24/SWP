<%-- 
    Document   : profile
    Created on : Jan 17, 2024, 2:48:08 AM
    Author     : LanChau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/profile.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container-xl px-4 mt-4">
            <!-- Account page navigation-->
            <nav class="nav nav-borders">
                <a class="nav-link" href="${pageContext.request.contextPath}/Home">Home</a>
                <a class="nav-link active ms-0" href="${pageContext.request.contextPath}/ProfileUser">Profile</a>
                <!--                <a class="nav-link" href="#" target="__blank">Billing</a>
                                <a class="nav-link" href="#" target="__blank">Security</a>
                                <a class="nav-link" href="#"  target="__blank">Notifications</a>-->
            </nav>
            <hr class="mt-0 mb-4">
            <div class="row">
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <!--<div class="card-header"></div>-->
                        <div class="card-body text-center">
                            <!-- Profile picture image--> 
                            <img class="img-account-profile rounded-circle mb-2" 
                                 src="${userCustomer.getAvatar()}" 
                                 onerror="this.src='http://bootdey.com/img/Content/avatar/avatar1.png'" 
                                 alt="">
                            <!-- Profile picture help block-->
                            <div class="small font-italic text-muted mb-4">  </div>
                            <!-- Profile picture upload button-->
                            <a class="btn btn-primary" href="">Update Profile</a>
                            <a class="btn btn-primary" href="#">Log out</a>
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
                                    <h1 class="mb-4">${userCustomer.getFullName()}</h1>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="bio-row">
                                                <p><span>Email </span>: ${userCustomer.getEmail()}</p>
                                            </div>
                                            <div class="bio-row">
                                                <p><span>User Name </span>: ${userCustomer.getUser_name()}</p>
                                            </div>
                                            <div class="bio-row">
                                                <p><span>Phone </span>: ${userCustomer.getPhone()}</p>
                                            </div>
                                            <div class="bio-row">
                                                <p><span>Adderss </span>: ${userCustomer.getAddress()}</p>
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
