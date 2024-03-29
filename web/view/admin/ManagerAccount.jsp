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
                    <h1 class="mt-4">Danh sách account</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"> <a href="${pageContext.request.contextPath}/ManagerAddAccount"><button type="button" class="btn btn-success">Add New Account</button></a></li>
                    </ol>
                    <!--                    <div class="col-xl-2 col-md-3">
                                            <div class="card bg-success text-white mb-4">
                                                <div class="card-body">Export Blog List</div>
                                                <div class="card-footer d-flex align-items-center justify-content-between">
                                                    <a class="small text-white stretched-link" href="${pageContext.request.contextPath}/exportfile?type=product">Export file</a>
                                                    <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                                </div>
                                            </div>
                                        </div>-->
                    <div class="card mb-4">
                        <div class="card-header">
                            <!--<i class="fas fa-table me-1"></i>-->
                            <div class="row">
                                <form id="searchForm" action="${pageContext.request.contextPath}/ManagerAccount" method="get">
                                    <div class="input-group" style="width: 100%; display: flex; justify-content: space-between; ">
                                        <div class="col-sm-2">
                                            <label class="small mb-1" style="font-weight: bold;">Số sản phẩm hiển thị</label>
                                            <select onchange="onSubmitForm()" class="form-control" name="pageSize">
                                                <option selected value="5">5</option>
                                                <option 
                                                    <c:if test="${pageSize == 10}">
                                                        selected
                                                    </c:if> value="10">10</option>
                                                <option <c:if test="${pageSize == 30}">
                                                        selected
                                                    </c:if> value="30">30</option> 
                                                <option <c:if test="${pageSize == 50}">
                                                        selected
                                                    </c:if> value="50">50</option>
                                            </select>
                                        </div>
                                        <div class="col-sm-2">
                                            <label class="small mb-1" style="font-weight: bold;">Search by name</label>
                                            <input type="text" class="form-control" name="nameSearch"
                                                   value="${nameSearch}" placeholder="Search by name"
                                                   />
                                        </div>
                                        <div class="col-sm-2">
                                            <label class="small mb-1" style="font-weight: bold;">Search Roles</label>
                                            <select onchange="onSubmitForm()" class="form-select" name="roleSelect">
                                                <option value="Customer" selected>Customer</option>
                                                <option value="Admin" 
                                                        <c:if test="${roleSelect.equals('Admin')}">
                                                            selected
                                                        </c:if>
                                                        >Admin</option>
                                                <option value="Management" 
                                                        <c:if test="${roleSelect.equals('Management')}">
                                                            selected
                                                        </c:if>>Management</option>
                                            </select>
                                        </div>
                                        <div class="col-sm-3">
                                            <input type="text" name="pageIndex" id="pageIndexID"  hidden
                                                   value="${pageIndex}" required />
                                            <input type="text" name="pageSize"  hidden
                                                   value="${pageSize}" required />
                                            <input hidden type="submit"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <script>
                                function onSubmitForm() {
                                    document.getElementById("pageIndexID").value = '1'
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
                                            <th scope="col">Full Name</th>
                                            <th scope="col">UserName</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Phone</th>
                                            <th scope="col">Role</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${accounts}" varStatus="loop">
                                            <tr>
                                                <th scope="row">${loop.index +1}</th>
                                                <td>${item.getFullName()} </td>
                                                <td>${item.getUser_name()}</td>
                                                <td>${item.getEmail()}</td>
                                                <td>${item.getPhone()}</td>
                                                <td>${item.getRoleName()}</td>
                                                <td>
                                                    <c:if test="${item.getStatus() == 'true'}">
                                                        <p class="text-success">Active</p>
                                                    </c:if>
                                                    <c:if test="${item.getStatus() == 'false'}">
                                                        <p class="text-danger">Block</p>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <c:if test="${item.getUserID() != sessionScope.accountSession.getUserID()}">
                                                        <c:if test="${item.getStatus() == 'true'}">
                                                            <a href="${pageContext.request.contextPath}/ManagerAccount?userID=${item.getUserID()}&active=false&nameSearch=${nameSearch}&pageIndex=${pageIndex}&pageSize=${pageSize}&roleSelect=${roleSelect}">
                                                                <button class="btn btn-danger">Block</button>
                                                            </a> 
                                                        </c:if>
                                                        <c:if test="${item.getStatus() == 'false'}">
                                                            <a href="${pageContext.request.contextPath}/ManagerAccount?userID=${item.getUserID()}&active=true&nameSearch=${nameSearch}&pageIndex=${pageIndex}&pageSize=${pageSize}&roleSelect=${roleSelect}">
                                                                <button class="btn btn-success">Active</button>
                                                            </a> 
                                                        </c:if>

                                                        <a href="${pageContext.request.contextPath}/ManagerEditAccount?userID=${item.getUserID()}&roleSelect=${roleSelect}">
                                                            <button class="btn btn-dark">Edit</button>
                                                        </a> 
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="clearfix">
                                <div class="hint-text">Showing <b>${accounts.size()}</b> out of <b>${countAccount}</b> entries</div>
                                <ul class="pagination">
                                    <li class="page-item"><a href="${pageContext.request.contextPath}/ManagerAccount?nameSearch=${nameSearch}&pageIndex=${pageIndex-1}&pageSize=${pageSize}&roleSelect=${roleSelect}" class="page-link">Previous</a></li>
                                        <c:forEach var="item" begin="1" end="${page}">
                                        <li class="page-item ${item == pageIndex ? 'active': ''}">
                                            <a href="${pageContext.request.contextPath}/ManagerAccount?nameSearch=${nameSearch}&pageIndex=${item}&pageSize=${pageSize}&roleSelect=${roleSelect}" class="page-link">${item}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item"><a href="${pageContext.request.contextPath}/ManagerAccount?nameSearch=${nameSearch}&pageIndex=${pageIndex+1}&pageSize=${pageSize}&roleSelect=${roleSelect}" class="page-link">Next</a></li>
                                </ul>
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
