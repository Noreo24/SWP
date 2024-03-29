<%-- 
    Document   : profile
    Created on : Jan 17, 2024, 2:48:08 AM
    Author     : LanChau
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/profile.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    </head>
    <body>

        <%@include file="/navigator/userHeaderVer2.jsp"%>
        
        <div class="container-xl px-4 mt-4">
            <!-- Account page navigation-->
            <%@include file="/navigator/subMenuUser.jsp"%>

            <div class="row">
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <!--<div class="card-header"></div>-->
                        <div class="card-body text-center">
                            <!-- Profile picture image--> 
                            <img class="img-account-profile rounded-circle mb-2" 
                                  src="${pageContext.request.contextPath}/imgUser/${sessionScope.acc.getAvatar()}" 
                                 onerror="this.src='http://bootdey.com/img/Content/avatar/avatar1.png'" 
                                 alt="">
                            <!-- Profile picture help block-->
                            <div class="small font-italic text-muted mb-4">  </div>
                            <!-- Profile picture upload button-->
                            <c:if test="${sessionScope.acc.getPassword() != null}">
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/view/user/changePassword.jsp">Change Password</a>
                            </c:if>
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/UpdateProfileUser">Update Profile</a>
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/logoutcontroller">Log out</a>
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
                                        <h1 class="mb-4">${sessionScope.acc.getFullName()}</h1>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="bio-row">
                                                    <p><span>User Name </span>: ${sessionScope.acc.getUser_name()}</p>
                                                </div>
                                                <div class="bio-row">
                                                    <p><span>Gender </span>:
                                                        <c:if test="${sessionScope.acc.getGender() eq 'true'}">
                                                            Male
                                                        </c:if>
                                                        <c:if test="${sessionScope.acc.getGender() eq 'false'}">
                                                            Female
                                                        </c:if>

                                                </div>

                                                <div class="bio-row">
                                                    <p><span>Email </span>: ${sessionScope.acc.getEmail()}</p>
                                                </div>

                                                <div class="bio-row">
                                                    <p><span>Phone </span>: ${sessionScope.acc.getPhone()}</p>
                                                </div>
                                                <div class="bio-row">
                                                    <p><span>Adderss </span>: ${sessionScope.acc.getAddress()}</p>
                                                </div>
                                            </div>
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
