<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Electro - HTML Ecommerce Template</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- DataTable CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>

    </head>
    <body>
        <%@include file="/navigator/userheader.jsp" %>


        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="container">
                        <h1>My Orders</h1>
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
                                                <c:when test="${order.status_order ne  '0'  }">
                                                    <td>
                                                        <a href="order-detail?id=${order.order_id}" class="btn btn-secondary">Details</a>
                                                    </td>
                                                </c:when>
                                                <c:otherwise>    
                                                    <td>
                                                        <a href="update-order?id=${order.order_id}&action=delete" class="btn btn-danger">Remove</a>
                                                        <a href="order-detail?id=${order.order_id}" class="btn btn-secondary">Details</a>
                                                        <a href="payment?id=${order.order_id}" class="btn btn-secondary">
                                                            <i class="fas fa-credit-card"></i> Pay
                                                        </a>
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
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- DataTable JS -->
        <script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
        <!-- Initialize DataTable -->
        <script type="text/javascript">
            $(document).ready(function () {
                var table = $('#orders-table').DataTable({
                    "lengthChange": false // Disable the page length menu
                });

                // Handle row removal
                $('#orders-table tbody').on('click', '.remove-btn', function () {
                    var row = $(this).closest('tr');
                    table.row(row).remove().draw(false);
                });
            });
        </script>
    </body>
</html>