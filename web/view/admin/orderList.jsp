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

    </head>
    <body class="sb-nav-fixed">
        <%@include file="/navigator/adminheader.jsp" %>
        <%@include file="/navigator/adminmenu.jsp" %>

        <div id="layoutSidenav_content">
            <main>
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="container">
                            <h1>Orders list</h1>
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
// Set new default font family and font color to mimic Bootstrap's default styling
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';
// Area Chart Example
            var ctx1 = document.getElementById("myAreaChart-1");
            var myLineChart = new Chart(ctx1, {
            type: 'line',
                    data: {
                    labels: [<c:forEach  items="${listChartBlogArea}" var="blog" > "${blog.date}",</c:forEach>],
                            datasets: [{
                            label: "Bài Đăng",
                                    lineTension: 0.3,
                                    backgroundColor: "rgba(2,117,216,0.2)",
                                    borderColor: "rgba(2,117,216,1)",
                                    pointRadius: 5,
                                    pointBackgroundColor: "rgba(2,117,216,1)",
                                    pointBorderColor: "rgba(255,255,255,0.8)",
                                    pointHoverRadius: 5,
                                    pointHoverBackgroundColor: "rgba(2,117,216,1)",
                                    pointHitRadius: 50,
                                    pointBorderWidth: 2,
                                    data: [<c:forEach  items="${listChartBlogArea}" var="blog" > "${blog.value}",</c:forEach>],
                            }],
                    },
                    options: {
                    scales: {
                    xAxes: [{
                    time: {
                    unit: 'date'
                    },
                            gridLines: {
                            display: false
                            },
                            ticks: {
                            maxTicksLimit: 7
                            }
                    }],
                            yAxes: [{
                            ticks: {
                            min: 0,
                                    max: ${maxListChartBlogArea},
                                    maxTicksLimit: 5
                            },
                                    gridLines: {
                                    color: "rgba(0, 0, 0, .125)",
                                    }
                            }],
                    },
                            legend: {
                            display: false
                            }
                    }
            });
        </script>
        <script>
            /// Set new default font family and font color to mimic Bootstrap's default styling
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';
            // Bar Chart Example
            var ctx1 = document.getElementById("myBarChart-1");
            var myLineChart = new Chart(ctx1, {
            type: 'bar',
                    data: {
                    labels: [<c:forEach  items="${listChartBlogBar}" var="product" > "${product.date}",</c:forEach>],
                            datasets: [{
                            label: "Bài Đăng",
                                    backgroundColor: "rgba(2,117,216,1)",
                                    borderColor: "rgba(2,117,216,1)",
                                    data: [<c:forEach  items="${listChartBlogBar}" var="product" > "${product.value}",</c:forEach>],
                            }],
                    },
                    options: {
                    scales: {
                    xAxes: [{
                    time: {
                    unit: 'month'
                    },
                            gridLines: {
                            display: false
                            },
                            ticks: {
                            maxTicksLimit: 6
                            }
                    }],
                            yAxes: [{
                            ticks: {
                            min: 0,
                                    max: ${maxListChartBlogBar},
                                    maxTicksLimit: 5
                            },
                                    gridLines: {
                                    display: true
                                    }
                            }],
                    },
                            legend: {
                            display: false
                            }
                    }
            });
        </script>

        <script>
            /// Set new default font family and font color to mimic Bootstrap's default styling
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';
            // Bar Chart Example
            var ctx1 = document.getElementById("myBarChart-2");
            var myLineChart = new Chart(ctx1, {
            type: 'bar',
                    data: {
                    labels: [<c:forEach  items="${listChartRevenueBar}" var="product" > "${product.date}",</c:forEach>],
                            datasets: [{
                            label: "Doanh thu",
                                    backgroundColor: "rgb(255, 255, 59)",
                                    borderColor: "rgba(2,117,216,1)",
                                    data: [<c:forEach  items="${listChartRevenueBar}" var="product" > "${product.value}",</c:forEach>],
                            }],
                    },
                    options: {
                    scales: {
                    xAxes: [{
                    time: {
                    unit: 'month'
                    },
                            gridLines: {
                            display: false
                            },
                            ticks: {
                            maxTicksLimit: 6
                            }
                    }],
                            yAxes: [{
                            ticks: {
                            min: 0,
                                    max: ${maxListChartRevenueBar},
                                    maxTicksLimit: 5
                            },
                                    gridLines: {
                                    display: true
                                    }
                            }],
                    },
                            legend: {
                            display: false
                            }
                    }
            });
        </script>
        <script>
// Set new default font family and font color to mimic Bootstrap's default styling
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';
// Pie Chart Example
            var ctx = document.getElementById("myPieChart-1");
            var myPieChart = new Chart(ctx, {
            type: 'pie',
                    data: {
                    labels: [<c:forEach  items="${listChartTradeMarkPie}" var="product" > "${product.getTrademark_name()}",</c:forEach>],
                            datasets: [{
                            data: [<c:forEach  items="${listChartTradeMarkPie}" var="product" > "${product.getTrademark_id()}",</c:forEach>],
                                    backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745', '#Dc760d', '#Dcb10d', '#A9dc0d', '#9ac8ee', '#D480f1', '#0ddc3c', '#7f2e2e', '#047592'],
                            }],
                    },
            });
            </script>
            <script>
                // Set new default font family and font color to mimic Bootstrap's default styling
                Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                Chart.defaults.global.defaultFontColor = '#292b2c';
                // Pie Chart Example
                var ctx = document.getElementById("myPieChart-2");
                var myPieChart = new Chart(ctx, {
                type: 'pie',
                        data: {
                        labels: [<c:forEach  items="${listChartCategoryPie}" var="product" > "${product.getCategory_name()}",</c:forEach>],
                                datasets: [{
                                data: [<c:forEach  items="${listChartCategoryPie}" var="product" > "${product.getCategory_id()}",</c:forEach>],
                                        backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745', '#Dc760d'],
                                }],
                        },
                });

        </script>
    </body>
</html>
