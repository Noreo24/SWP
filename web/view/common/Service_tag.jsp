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
       

        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="breadcrumb-header">Regular Page</h3>
                        <ul class="breadcrumb-tree">
                            <li><a href="#">Home</a></li>
                            <li class="active">Blank</li>
                        </ul>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="container">
                        <h1>Guarantee</h1>
                        <div class="table-responsive">
                            <table class="table" id="orders-table">
                                <h4>Customer information : </h4>
                                <h5>Name : </h5>
                                <h5>Phone : </h5>
                                <h4>Manager information : </h4>
                                <h5>Name : </h5>
                                <h5>ID : </h5>
                                
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Service Tag</th>
                                        <th>Product Name</th>
                                        <th>Condition</th>
                                        <th>Product image</th>
                                        <th>Guarantee</th>
                                        <th>Status</th>

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
                                            <td>${order.status_order eq '0' ? 'Pending' : 'Paid/Pending'}</td>
                                            <td>${order.note}</td>
                                            <td>${order.order_code}</td>
                                            <c:choose>
                                                <c:when test="${order.status_order eq  '1'}">
                                                    <td>
                                            <a href="order-detail?id=${order.order_id}" class="btn btn-secondary">Details</a>
                                            </td>
                                            </br>
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