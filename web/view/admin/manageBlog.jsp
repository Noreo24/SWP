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
        <%@include file="/navigator/adminheader.jsp" %>
        <%@include file="/navigator/adminmenu.jsp" %>

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Danh sách blogs</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard">Dashboard</a></li>
                        <li class="breadcrumb-item active">Blogs</li>
                    </ol>
                    <div class="col-xl-2 col-md-3">
                        <div class="card bg-success text-white mb-4">
                            <div class="card-body">Export Blog List</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="${pageContext.request.contextPath}/exportfile?type=blog">Export file</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Danh sách blogs                            </div>
                        <div class="card-body">

                            <form class="" action="${pageContext.request.contextPath}/bloglistmanage" method="get">
                                <div class="input-group" style="width: 600px">
                                    <select name="categoryBlog" class="form-control">
                                        <option value="" selected="">Tất cả Blog</option>
                                        <c:forEach items="${clist}" var="c">
                                            <option value="${c.getCategoryBlog_id()}">${c.getCategoryBlog_name()}</option>
                                        </c:forEach>
                                    </select>
                                    <input value="${search}" name="search" class="form-control" type="text" placeholder="Search by Title" aria-label="Search" aria-describedby="btnNavbarSearch" />
                                    <button class="btn btn-primary" id="btnNavbarSearch" type="submit"><i class="fas fa-search"></i></button>
                                </div>
                            </form>

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Hình thu nhỏ</th>
                                        <th>Tiêu đề</th>
                                        <th>Danh mục</th>
                                        <th>Tác giả</th>
                                        <th>Ngày cập nhật</th>
                                        <th>Trạng thái</th>
                                        <th>Tùy chọn</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach items="${bloglist}" var="blog">
                                        <tr>
                                            <td>${blog.getBlog_id()}</td>
                                            <td><img src="${pageContext.request.contextPath}/thumbnail/${blog.getThumbnail()}" style="width: 150px"></td>
                                            <td>${blog.getTitle()}</td>
                                            <td>${blog.getCategoryBlog_id()}</td>
                                            <td>${blog.getAuthor_id()}</td>
                                            <td>${blog.getUpdated_date()}</td>
                                            <td><c:if test="${blog.getStatus() eq 'true'}">
                                                    Hiện                                        
                                                </c:if>
                                                <c:if test="${blog.getStatus() eq 'false'}">
                                                    Ẩn                                       
                                                </c:if>
                                            </td>
                                            <td>
                                                <div style="display: flex; justify-content: space-around;">
                                                    <a href="${pageContext.request.contextPath}/editblog?blogid=${blog.getBlog_id()}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                                        </svg></a>

                                                    <a href="${pageContext.request.contextPath}/changeblogstatus?blogid=${blog.getBlog_id()}&status=${blog.getStatus()}"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-slash-fill" viewBox="0 0 16 16">
                                                        <path d="m10.79 12.912-1.614-1.615a3.5 3.5 0 0 1-4.474-4.474l-2.06-2.06C.938 6.278 0 8 0 8s3 5.5 8 5.5a7 7 0 0 0 2.79-.588M5.21 3.088A7 7 0 0 1 8 2.5c5 0 8 5.5 8 5.5s-.939 1.721-2.641 3.238l-2.062-2.062a3.5 3.5 0 0 0-4.474-4.474z"/>
                                                        <path d="M5.525 7.646a2.5 2.5 0 0 0 2.829 2.829zm4.95.708-2.829-2.83a2.5 2.5 0 0 1 2.829 2.829zm3.171 6-12-12 .708-.708 12 12z"/>
                                                        </svg></a>

                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="datatable-bottom">
                                <nav class="datatable-pagination">
                                    <ul class="datatable-pagination-list">

                                        <c:forEach begin="1" end="${endPage}" var="i">
                                            <li class="datatable-pagination-list-item ${index == i ? 'active' : ''}">
                                                <a href="${pageContext.request.contextPath}/bloglistmanage?index=${i}&search=${search}&categoryBlog=${categoryBlogId}" data-page="3" class="datatable-pagination-list-item-link">${i}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Your Website 2023</div>
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/jsmanage/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/jsmanage/datatables-simple-demo.js"></script>
    </body>
</html>
