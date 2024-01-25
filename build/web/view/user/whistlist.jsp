<%@ page import="Model.Whistlist" %>
<%@ page import="Model.Product" %>
<%@ page import="Model.ProductImage" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>User Whistlist</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">



        <script>
            function updateTotalPrice(row) {
                var quantityInput = row.querySelector('.quantity-input');
                var salePriceCell = row.querySelector('.sale-price');
                var totalPriceCell = row.querySelector('.total-price');

                var quantity = parseInt(quantityInput.value);

                // Check if quantity is negative
                if (quantity < 0) {
                    alert("Quantity cannot be negative. Please enter a valid quantity.");
                    quantityInput.value = 0;
                    quantity = 0;
                }

                var salePrice = parseFloat(salePriceCell.textContent);

                var totalPrice = quantity * salePrice;
                totalPriceCell.textContent = formatPrice(totalPrice);

                updateGrandTotal();
            }

            function updateGrandTotal() {
                var grandTotalCell = document.getElementById('grand-total');
                var totalPrices = document.querySelectorAll('.total-price');
                var sum = 0;

                totalPrices.forEach(function (totalPriceCell) {
                    var totalPrice = parseFloat(totalPriceCell.textContent.replace(/[^\d.]/g, ''));

                    // Check if the parsed value is a valid number
                    if (!isNaN(totalPrice)) {
                        sum += totalPrice;
                    }
                });

                grandTotalCell.textContent = formatPrice(sum);
            }

            function formatPrice(price) {
                return price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND', minimumFractionDigits: 0});
            }
        </script>

    </head>
    <body>

        <%@include file="/navigator/userheader.jsp" %>
        <%@include file="/navigator/navigation.jsp" %>
        <h2 class="container text-center">Whistlist Entries for User ID: ${userID}</h2>
        <table class="container text-center" border="1">
            <thead>
                <tr>
                    <th>Product Image</th>
                    <th>Product Name</th>
                    <th>Sale Prices</th>
                    <th>Quantity</th>
                    <th>Del</th>
                    <th>Total Prices</th>

                    <!-- Add other columns as needed -->
                </tr>
            </thead>
            <tbody>
                <c:forEach var="entry" items="${whistlistEntries}">
                    <tr>
                        <c:forEach var="image" items="${productImages}">
                            <c:if test="${image.product_id eq entry.productId}">
                                <!-- Display image information in the same row -->
                                <td><img src="${image.images}" alt="Product Image"/></td>
                                </c:if>
                            </c:forEach>

                        <c:forEach var="product" items="${whistlistProducts}">
                            <c:if test="${product.product_id eq entry.productId}">
                                <!-- Display product information in the same row -->
                                <td>${product.product_name}</td>
                                <td class="sale-price">${product.sale_prices}</td>
                            </c:if>
                        </c:forEach>

                        <td>
                            <input type="number" class="quantity-input" name="quantity" oninput="updateTotalPrice(this.parentNode.parentNode)" />
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/deleteWhistList?whistlist_id=${entry.whistlist_id}" style="color: red;">
                                Delete <ion-icon name="trash-bin-outline"></ion-icon>
                            </a>
                        </td>

                        <td class="total-price">${product.sale_prices}</td>

                    </tr>

                </c:forEach>
                <tr>
                    <td colspan="4" style="color: red;">Total of order:</td>
                    <td id="grand-total">0.00</td>
                </tr>

            </tbody>
        </table>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                            <form>
                                <input class="input" type="email" placeholder="Enter Your Email">
                                <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                            </form>
                            <ul class="newsletter-follow">
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /NEWSLETTER -->

        <%@include file="/navigator/footer.jsp" %>


        <!-- jQuery Plugins -->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/slick.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/nouislider.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.zoom.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
    </body>
</html>
