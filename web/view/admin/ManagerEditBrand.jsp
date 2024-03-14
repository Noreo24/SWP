<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/managecss/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="/navigator/adminheader.jsp"%>
        <%@include file="/navigator/adminmenu.jsp"%>

        
        <div id="layoutSidenav_content">
            <!-- container -->
            <div class="container">
                <h3>Edit Brand</h3>
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="mb-4 mb-xl-0">
                        <!--<div class="card-header"></div>-->
                        <div class="card-body text-center">
                            <!-- Profile picture image--> 
                            <img class="img-account-profile rounded-circle mb-2" id="imgAvatar" style="max-height: 350px; max-width: 350px"
                                 src="${brand.getImg()}" 
                                 onerror="this.src='http://bootdey.com/img/Content/avatar/avatar1.png'" 
                                 alt="">
                        </div>
                    </div>
                </div>
                <!-- row -->
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/ManagerEditBrand" method="post" >

                                <div class="mb-3">
                                    <input  type="text" name="txtId" hidden
                                            value="${trademark.trademark_id}" required />
                                    <p class="text-danger">${errorUsername}</p>
                                    <label class="small mb-1" for="inputUsername">Name </label>
                                    <input class="form-control" id="inputUsername"
                                           type="text" required name="txtName"
                                           placeholder="Enter your Name" 
                                           value="${trademark.trademark_name}">
                                </div>
                                <div class="row gx-3 mb-3">
                                    <div class="col-md-6">
                                        <!--<p class="text-danger">${errorGmail}</p>-->
                                        <label class="small mb-1" for="inputFirstName">Description</label>
                                        <input class="form-control" id="inputFirstName" 
                                               type="text" required 
                                               name="txtDes"
                                               placeholder="Enter your description"
                                               value="${trademark.description}"> 
                                    </div>
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputLastName">Link img</label>
                                        <input class="form-control" id="inputLastName" 
                                               type="text" name="txtImg" 
                                               required
                                               placeholder="Enter your link image brand" 
                                               value="${trademark.img}">
                                    </div>
                                </div>  
                                <button class="btn btn-primary" type="submit">Save changes</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /container -->
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/jsmanage/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/jsmanage/datatables-simple-demo.js"></script>
    </body>
</html>
