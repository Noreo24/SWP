<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
<style>
    /* CSS để giảm khoảng cách giữa h1 và table */
    .container-fluid {
        margin-top: 20px; /* Điều chỉnh giá trị này để thay đổi khoảng cách */
    }
</style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="/navigator/adminheader.jsp" %>
        <%@include file="/navigator/adminmenu.jsp" %>

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <!-- row -->
                    <h1 class="mt-4 text-center mb-4">Danh sách đơn hàng</h1>
                    <div class="dateFromTo">
                        <form action="${pageContext.request.contextPath}/order-list">
                            Từ: 
                            <input class="form-control w-25" type="date" id="start" name="start" value="${start}">
                            Đến: 
                            <input class="form-control w-25" type="date" id="end" name="end" value="${end}">  
                        </form>
                        </form>
                    </div>
                    <br>
                    <div class="row">
                        <div class="container">
                            <div class="table-responsive">
                                <table class="table" id="orders-table">
                                    <thead>
                                        <tr>
                                            <th>Order ID</th>
                                            <th>Order Date</th>
                                            <th>Total Cost</th>
                                            <th>Full Name</th>
                                            <th>Phone</th>
                                            <th>Address</th>
                                            <th>Status</th>
                                            <th>Note</th>
                                            <th>Order Code</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="order" items="${orders}">
                                            <tr>
                                                <td>${order.order_id}</td>
                                                <td>${order.orderDate}</td>
                                                <td><fmt:formatNumber value="${order.total_cost}" type="currency" currencyCode="VND"/></td>
                                                <td>${order.fullName}</td>
                                                <td>${order.phone}</td>
                                                <td>${order.address}</td>
                                                <td>${order.statusString}</td>
                                                <td>${order.note}</td>
                                                <td>${order.order_code}</td>
                                                <c:choose>
                                                    <c:when test="${order.status_order ne null}">
                                                        <td>
                                                            <a href="order-detail?id=${order.order_id}" class="btn btn-secondary">Details</a>
                                                            <a href="order-accept?id=${order.order_id}" class="btn btn-primary">Accept</a>
                                                        </td>
                                                        </br>
                                                    </c:when>
                                                    <c:otherwise>    
                                                        <td>
                                                            <a href="order-detail?id=${order.order_id}" class="btn btn-secondary">Details</a>
                                                        </td>
                                                    </c:otherwise> 
                                                </c:choose>

                                            </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
            </main>
            <!-- Footer-->
        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/jsmanage/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var startDateInput = document.getElementById("start");
                var endDateInput = document.getElementById("end");
                var tableRows = document.querySelectorAll("#orders-table tbody tr");
                // Add event listeners to start and end date inputs
                startDateInput.addEventListener("change", filterByDate);
                endDateInput.addEventListener("change", filterByDate);
                // Function to filter table rows by date range
                function filterByDate() {
                    var startDate = new Date(startDateInput.value);
                    var endDate = new Date(endDateInput.value);
                    tableRows.forEach(function (row) {
                        var orderDate = new Date(row.cells[1].textContent); // Assuming order date is in the second column

                        if (orderDate >= startDate && orderDate <= endDate) {
                            row.style.display = ""; // Show row if within date range
                        } else {
                            row.style.display = "none"; // Hide row if outside date range
                        }
                    });
                }
            });
        </script>

    </body>
</html>
