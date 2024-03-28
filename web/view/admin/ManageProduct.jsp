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
                    <h1 class="mt-4">Danh sách sản phẩm</h1>
                    <div class="card mb-4">
                        <div class="card-header">
                            <!--<i class="fas fa-table me-1"></i>-->
                            <div class="row">
                                <form id="searchForm" action="${pageContext.request.contextPath}/manageProduct" method="get">
                                    <div class="input-group" style="width: 100%; display: flex; justify-content: space-between; ">
                                        <div class="col-sm-2">
                                            <label class="small mb-1" style="font-weight: bold;">Số sản phẩm hiển thị</label>
                                            <select onchange="onSubmitForm()" class="form-control" name="pageSize">
                                                <option value="5" 
                                                        <c:if test="${pageSize == 5}">
                                                            selected
                                                        </c:if>>5
                                                </option>
                                                <option value="10"
                                                        <c:if test="${pageSize == 10}">
                                                            selected
                                                        </c:if>>10
                                                </option>
                                                <option  value="30"
                                                         <c:if test="${pageSize == 30}">
                                                             selected
                                                         </c:if>>30
                                                </option> 
                                                <option value="50"
                                                        <c:if test="${pageSize == 50}">
                                                            selected
                                                        </c:if>>50
                                                </option>
                                            </select>
                                        </div>
                                        <div class="col-sm-2">
                                            <label class="small mb-1" style="font-weight: bold;">Danh mục</label>
                                            <select onchange="onSubmitForm()" class="form-control" name="cateSelect">
                                                <option value="All"
                                                        <c:if test="${cateSelect.equals('All')}">
                                                            selected
                                                        </c:if>>Tất cả
                                                </option>
                                                <c:forEach items="${allCategories}" var="c">
                                                    <option value="${c.category_name}"
                                                            <c:if test="${cateSelect.equals(c.category_name)}">
                                                                selected
                                                            </c:if>>
                                                        ${c.category_name}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-2">
                                            <label class="small mb-1" style="font-weight: bold;">Nhãn hiệu</label>
                                            <select onchange="onSubmitForm()" class="form-control" name="trademarkSelect">
                                                <option value="All"
                                                        <c:if test="${trademarkSelect.equals('All')}">
                                                            selected
                                                        </c:if>>Tất cả
                                                </option>
                                                <c:forEach items="${allTrademarks}" var="tm">
                                                    <option value="${tm.trademark_name}"
                                                            <c:if test="${trademarkSelect.equals(tm.trademark_name)}">
                                                                selected
                                                            </c:if>>
                                                        ${tm.trademark_name}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="small mb-1" style="font-weight: bold;">Tên sản phẩm</label>
                                            <input type="text" class="form-control" name="nameSearch"
                                                   value="${nameSearch}" placeholder="Nhập tên"
                                                   />
                                        </div>
                                        <div class="col-xl-2 col-md-3">
                                            <label class="small mb-1" style="font-weight: bold;">Xuất file excel</label>
                                            <div class="card bg-success text-white mb-4">
                                                <div class="card-footer d-flex align-items-center justify-content-between">
                                                    <a class="small text-white stretched-link" href="${pageContext.request.contextPath}/exportfile?type=product">Export file</a>
                                                    <!--<div class="small text-white"><i class="fas fa-angle-right"></i></div>-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
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
                                            <th>ID</th>
                                            <th>Hình thu nhỏ</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Danh mục</th>
                                            <th>Nhãn hiệu</th>
                                            <th>Sale</th>
                                            <th>Quản lý</th>
                                            <th>Trạng thái</th>
                                            <th>Tùy chọn</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listProduct}" var="p">
                                            <tr>
                                                <td>${p.product_id}</td>
                                                <td>
                                                    <c:forEach items="${allImages}" var="i">
                                                        <c:if test="${i.product_id == p.product_id}">
                                                            <img src="${pageContext.request.contextPath}/${i.images}" style="width: 100px; height: 100%;" alt="Err pic">
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>
                                                    <a href="productDetail?pid=${p.product_id}" style="font-weight: bold; text-decoration: none; color: black;" onmouseover="this.style.color = '#d31837'" onmouseout="this.style.color = 'black'">
                                                        ${p.product_name}
                                                    </a>
                                                </td>
                                                <td>
                                                    <c:forEach items="${allCategories}" var="c">
                                                        <c:if test="${p.category_id == c.category_id}">
                                                            <!--<a href="listProduct"  style="text-decoration: none; color: black;" onmouseover="this.style.color = '#d31837'" onmouseout="this.style.color = 'black'">-->
                                                                ${c.category_name}
                                                            <!--</a>-->
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>
                                                    <c:forEach items="${allTrademarks}" var="tm">
                                                        <c:if test="${tm.trademark_id == p.trademark_id}">
                                                            <!--<a href="listProduct"  style="text-decoration: none; color: black;" onmouseover="this.style.color = '#d31837'" onmouseout="this.style.color = 'black'">-->
                                                                ${tm.trademark_name}
                                                            <!--</a>-->
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>
                                                    <c:if test="${p.sale == 1}">
                                                        Yes
                                                    </c:if>
                                                    <c:if test="${p.sale == 0}">
                                                        No
                                                    </c:if>
                                                </td>
                                                <td>Manager</td>
                                                <td>
                                                    <c:if test="${p.status == 1}">
                                                        Hiện                                        
                                                    </c:if>
                                                    <c:if test="${p.status == 0}">
                                                        Ẩn                                       
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <div style="display: flex; justify-content: space-around;">
                                                        <a href="editProduct?pid=${p.product_id}">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                                            </svg>
                                                        </a>
                                                        <a href="changeStatusProduct?pid=${p.product_id}&status=${p.status}"> 
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-slash-fill" viewBox="0 0 16 16">
                                                            <path d="m10.79 12.912-1.614-1.615a3.5 3.5 0 0 1-4.474-4.474l-2.06-2.06C.938 6.278 0 8 0 8s3 5.5 8 5.5a7 7 0 0 0 2.79-.588M5.21 3.088A7 7 0 0 1 8 2.5c5 0 8 5.5 8 5.5s-.939 1.721-2.641 3.238l-2.062-2.062a3.5 3.5 0 0 0-4.474-4.474z"/>
                                                            <path d="M5.525 7.646a2.5 2.5 0 0 0 2.829 2.829zm4.95.708-2.829-2.83a2.5 2.5 0 0 1 2.829 2.829zm3.171 6-12-12 .708-.708 12 12z"/>
                                                            </svg>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="clearfix">
                                <div class="hint-text">Showing <b>${listProduct.size()}</b> out of <b>${countProduct}</b> entries</div>
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a href="${pageContext.request.contextPath}/manageProduct?nameSearch=${nameSearch}&pageIndex=${pageIndex-1}&pageSize=${pageSize}&cateSelect=${cateSelect}&trademarkSelect=${trademarkSelect}" class="page-link fa fa-angle-left"></a>
                                    </li>
                                    <c:forEach var="item" begin="1" end="${page}">
                                        <li class="page-item ${item == pageIndex ? 'active': ''}">
                                            <a href="${pageContext.request.contextPath}/manageProduct?nameSearch=${nameSearch}&pageIndex=${item}&pageSize=${pageSize}&cateSelect=${cateSelect}&trademarkSelect=${trademarkSelect}" class="page-link">${item}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                        <a href="${pageContext.request.contextPath}/manageProduct?nameSearch=${nameSearch}&pageIndex=${pageIndex+1}&pageSize=${pageSize}&cateSelect=${cateSelect}&trademarkSelect=${trademarkSelect}" class="page-link fa fa-angle-right"></a>
                                    </li>
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
