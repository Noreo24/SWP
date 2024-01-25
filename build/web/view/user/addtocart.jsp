<%-- 
    Document   : addtocart
    Created on : Jan 23, 2024, 1:39:59 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA_Compatible" content="IE-adge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Javascript-cart</title>
</head>

<body>
    <section class="product">
        <div class="container">
            <div class="product-items">
                <div class="product-item">
                    <img src="images/product10.jpg" alt="">
                    <div class="product-item-text">
                        <p><span>320.000</span><sup>đ</sup></p>
                        <h1 style="font-weight: bold; font-size: 18px;">Iphone 14ProMax</h1>
                    </div>
                    <button>Add to cart</button>
                </div>

                <div class="product-item">
                    <img src="images/product11.webp" alt="">
                    <div class="product-item-text">
                        <p><span>320.000</span><sup>đ</sup></p>
                        <h1 style="font-weight: bold; font-size: 18px;">Iphone 13ProMax</h1>
                    </div>
                    <button>Add to cart</button>
                </div>

                <div class="product-item">
                    <img src="images/product12.jpg" alt="">
                    <div class="product-item-text">
                        <p><span>320.000</span><sup>đ</sup></p>
                        <h1 style="font-weight: bold; font-size: 18px;">Iphone XSMax</h1>
                    </div>
                    <button>Add to cart</button>
                </div>

                <div class="product-item">
                    <img src="images/product13.jpg" alt="">
                    <div class="product-item-text">
                        <p><span>320.000</span><sup>đ</sup></p>
                        <h1 style="font-weight: bold; font-size: 18px;">Iphone 12ProMax</h1>
                    </div>
                    <button>Add to cart</button>
                </div>

                <div class="product-item">
                    <img src="images/product14.jpg" alt="">
                    <div class="product-item-text">
                        <p><span>320.000</span><sup>đ</sup></p>
                        <h1 style="font-weight: bold; font-size: 18px;">Iphone 15ProMax</h1>
                    </div>
                    <button>Add to cart</button>
                </div>

            </div>
        </div>
    </section>

    <section class="cart">
        <h2>Cart</h2>
        <form action="">
            <table>
                <thead>
                    <tr>
                        <th>Sản phẩm</th>
                        <th>Giá</th>
                        <th>SL</th>
                        <th>Chọn</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="display: flex;align-items: center;"><img style="width: 70px;" src="images/product10.jpg" alt="">Iphone 14ProMax</td>
                        <td><p><span>320.000</span><sup>đ</sup></p></td>
                        <td><input style="width: 30px; outline: none;" type="number" value="1" min="0"></td>
                        <td style="cursor: pointer;">Xóa</td>
                    </tr>
                    <tr>
                        <td style="display: flex;align-items: center;"><img style="width: 70px;" src="images/product11.webp" alt="">Iphone 13ProMax</td>
                        <td><p><span>320.000</span><sup>đ</sup></p></td>
                        <td><input style="width: 30px; outline: none;" type="number" value="1" min="1"></td>
                        <td style="cursor: pointer;">Xóa</td>
                    </tr>
                </tbody>
            </table>
            <div style="text-align: right;" class="price-total">
                <p style="font-weight: bold;">Tổng tiền:<span>320.000</span><sup>đ</sup></p>
            </div>
        </form>
    </section>

</body>

</html>
