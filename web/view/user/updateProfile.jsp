<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                            <a class="btn btn-primary" href="#">Log out</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/UpdateProfileUser" method="post">
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputUsername">Username </label>
                                    <input class="form-control" disabled  id="inputUsername" type="text" required
                                           placeholder="Enter your username" value="${userCustomer.getUser_name()}">
                                </div>
                                <div class="row gx-3 mb-3">
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputFirstName">Gmail</label>
                                        <input class="form-control" id="inputFirstName" type="email" disabled required
                                               placeholder="Enter your gmail" value="${userCustomer.getEmail()}">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputLastName">Full Name</label>
                                        <input class="form-control" id="inputLastName" type="text" name="textFullName" required
                                               placeholder="Enter your last name" value="${userCustomer.getFullName()}">
                                    </div>
                                </div>
                                <div class="row gx-3 mb-3">
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputOrgName">Phone</label>
                                        <input class="form-control" id="inputOrgName" type  ="text" name="txtPhone" required
                                               placeholder="Enter your phone" value="${userCustomer.getPhone()}">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputLocation">Address</label>
                                        <input class="form-control" id="inputLocation" type="text" name="txtAddress" required
                                               placeholder="Enter your address" value="${userCustomer.getAddress()}">
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputEmailAddress">Link Avatar</label>
                                    <input class="form-control" id="inputEmailAddress" type="text" name="txtAvatar" required
                                           placeholder="Enter your link avatar" value="${userCustomer.getAvatar()}">
                                </div>
                                <div class="row gx-3 mb-3">

                                    <div class="col-md-6">
                                        <label class="small mb-1" >Gender: </label>
                                        <input  id="inputGenderMale" type="radio" name="gender"
                                                checked   value="1"> 
                                        <label for="inputGenderMale">Male</label>
                                        <input  id="inputGenderFeMale" type="radio" name="gender"
                                                <c:if test="${!userCustomer.getGender()}">
                                                    checked
                                                </c:if>
                                                value="0">
                                        <label for="inputGenderFeMale">FeMale</label>
                                    </div>
                                </div>
                                <button class="btn btn-primary" type="submit">Save changes</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
