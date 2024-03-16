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
                    <h1 class="mt-4 text-center mb-4">Thống Kê</h1>
                    <div class="dateFromTo">
                        <form action="${pageContext.request.contextPath}/dashboard">
                            Từ: 
                            <input class="" type="date" id="start" name="start" value="${start}">
                            Đến: 
                            <input type="date" id="end" name="end" value="${end}">
                            <input class="ml-4 btn btn-danger" type="submit" value="Thống kê"/>
                        </form>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    Danh sách đơn hàng
                                </div>
                                <div class="card-body">
                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>OrderID</th>
                                                <th>Ngày đặt hàng</th>
                                                <th>Tổng tiền</th>
                                                <th>Tên người mua</th>
                                                <th>Điện thoại</th>
                                                <th>Địa chỉ</th>
                                                <th>Trạng thái đơn hàng</th>
                                                <th>Mã sản phẩm</th>
                                                <th>Mã đơn hàng</th>
                                                <th>Note</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${orderList}" var="o">                                           
                                                <tr>
                                                    <td>${o.getOrder_id()}</td>
                                                    <td>${o.getOrderDate()}</td>
                                                    <td>${o.getTotal_cost()}</td>
                                                    <td>${o.getFullName()}</td>
                                                    <td>${o.getPhone()}</td>
                                                    <td>${o.getAddress()}</td>
                                                    <td>${o.getStatus_order()}</td>
                                                    <td>${o.getUserId()}</td>
                                                    <td>${o.getOrder_code()}</td>
                                                    <td>${o.getNote()}</td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="card mb-4">
                                <div class="card-header mb-4 nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseThongkesanpham" aria-expanded="false" aria-controls="collapseThongkesanpham">
                                    <i class="fas fa-chart-area me-1"></i>
                                    Thống kê doanh thu
                                </div>
                                <div id="collapseThongkesanpham" aria-labelledby="headingOne" data-bs-parent="#cutomerSetting" class="collapse card-body">
                                    <div class="row">
                                        <div class="col-xl-11">
                                            <div class="card-body"><canvas id="myBarChart-2" width="100%" height="40"></canvas></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="card mb-4">
                                <div class="card-header mb-4 nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseThongkekhachhang" aria-expanded="false" aria-controls="collapseThongkekhachhang">
                                    <i class="fas fa-chart-area me-1"></i>
                                    Thống kê sản phẩm bán ra
                                </div>
                                <div id="collapseThongkekhachhang" aria-labelledby="headingOne" data-bs-parent="#cutomerSetting" class="collapse card-body">
                                    <div class="row">
                                        <div class="col-xl-6">
                                            <div class="card-body"><canvas id="myPieChart-1" width="100%" height="40"></canvas></div>
                                        </div>
                                        <div class="col-xl-6">
                                            <div class="card-body"><canvas id="myPieChart-2" width="100%" height="40"></canvas></div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="card mb-4">
                                <div class="card-header mb-4 nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseThongkebaidang" aria-expanded="false" aria-controls="collapseThongkebaidang">
                                    <i class="fas fa-chart-area me-1"></i>
                                    Thống kê bài đăng
                                </div>
                                <div id="collapseThongkebaidang" aria-labelledby="headingOne" data-bs-parent="#cutomerSetting" class="collapse card-body">
                                    <div class="row">
                                        <div class="col-xl-6">

                                            <div class="card-body"><canvas id="myBarChart-1" width="100%" height="40"></canvas></div>
                                        </div>
                                        <div class="col-xl-6">
                                            <div class="card-body"><canvas id="myAreaChart-1" width="100%" height="40"></canvas></div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>


                    </div>
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
