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
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Danh sách brand</h1>
                    <div class="card mb-4">
                        <div class="card-header">
                            <!--<i class="fas fa-table me-1"></i>-->

                            <script>
                                function onSubmitForm() {
                                    document.querySelector('#searchForm').submit();
                                }
                            </script>
                        </div>
                        <div class="card-body">
                            <!--<table class="table" id="datatablesSimple">-->
                            <div>
                                <table class="table">
                                    <thead>
                                        <tr> 
                                            <th scope="col">#</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Des</th>
                                            <th scope="col">Img</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${trademarks}" varStatus="loop">
                                            <tr>
                                                <th scope="row">${loop.index +1}</th>
                                                <td> ${item.trademark_name}</td>
                                                <td>${item.description}</td>
                                                <td>
                                                    <img src="${item.img}" width="100px"
                                                         height="150px" alt="alt"/>
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/ManagerEditBrand?id=${item.trademark_id}">
                                                        <button class="btn btn-dark">Edit</button>
                                                    </a> 
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/jsmanage/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/jsmanage/datatables-simple-demo.js"></script>
    </body>
</html>
