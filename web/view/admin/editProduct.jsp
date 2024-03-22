<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    // Lấy ngày tháng hiện tại
    Date currentDate = new Date();

    // Tạo đối tượng SimpleDateFormat với định dạng mong muốn
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

    // Định dạng ngày tháng năm
    String formattedDate = sdf.format(currentDate);
%>--%>
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
        <script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
        <script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/classic/translations/vi.js"></script>
        <script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/media-embed/media-embed.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <style>
            .payment-method__item-name {
                font-size: 20px;
                padding-left: 20px;
            }

            .payment-method__item {
                display: flex;
                align-items: center;
                border: 1px solid #D9D9D9;
                border-radius: 16px;
                padding: 15px 20px;
                margin-bottom: 1rem;
            }



            .payment-method__item-icon-wrapper img {
                min-width: 100px;
                max-height: 100px;
                max-width: 100px;
                padding-left: 40px;
                image-rendering: -webkit-optimize-contrast;
            }
            .body_cartCompletion {
                font-family: sans-serif;
                background: linear-gradient(110deg, #fdfdbe 60%, #f9f86c 60%);
            }
            .groundy{
                font-family: sans-serif;
                background: linear-gradient(110deg, #fdfdbe 60%, #f9f86c 60%);
            }

            .circle {
                height: 10px;
                width: 10px;
                border: 50%;
            }
            .hidden {
                display: none;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="/navigator/adminheader.jsp" %>
        <%@include file="/navigator/adminmenu.jsp" %>

        <div id="layoutSidenav_content">
            <div class="container rounded bg-white mt-5 mb-5" style="margin-top: 0;">
                <form action="${pageContext.request.contextPath}/editProduct" method="post" enctype="multipart/form-data" >
                    <div class="row">
                        <div class="p-4" style="padding: 0;">
                            <h1 class="text-center">Sửa thông tin sản phẩm</h1>
                        </div>
                        <div class="col-md-8">
                            <div class="p-3">

                                <h5 class="col-md-12" style="font-weight: bold;">ID
                                    <input type="text" name="pId" class="form-control" value="${product.getProduct_id()}" readonly>
                                </h5>
                                <h5 class="col-md-12" style="font-weight: bold;">Tên sản phẩm
                                    <input type="text" name="productName" class="form-control" value="${product.product_name}" required>
                                </h5>
                                <h5 class="col-md-12" style="font-weight: bold;">Đặc điểm nổi bật
                                    <textarea cols="20" rows="40" id="editor2" name="highlight" required>
                                        ${product.getProduct_highlights()}
                                    </textarea>
                                </h5>
                                <h5 class="col-md-12" style="font-weight: bold;">Mô tả
                                    <textarea cols="20" rows="40" id="editor" name="content" required>
                                        ${product.getProduct_description()}
                                    </textarea>
                                </h5>
                                <h5 class="col-md-6" style="font-weight: bold;">Chi tiết</h5>
                                <div class="col-md-12">
                                    <table class="table" id="phonedetail">
                                        <tbody>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Màu sắc</td>
                                                <td><input name="phoneColor" class="form-control" value="${phone_detail.color}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Kích cỡ màn hình</td>
                                                <td><input name="phoneScreenSize" class="form-control" value="${phone_detail.screen_size}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Công nghệ màn hình</td>
                                                <td><input name="phoneScreenTech" class="form-control" value="${phone_detail.screen_tech}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Camera sau</td>
                                                <td><input name="phoneCamRear" class="form-control" value="${phone_detail.camera_rear}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Camera trước</td>
                                                <td><input name="phoneCamFront" class="form-control" value="${phone_detail.front_camera}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Chipset</td>
                                                <td><input name="phoneChip" class="form-control" value="${phone_detail.chip}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Dung lượng RAM</td>
                                                <td><input name="phoneRam" class="form-control" value="${phone_detail.ram}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Bộ nhớ trong</td>
                                                <td><input name="phoneRom" class="form-control" value="${phone_detail.rom}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Pin</td>
                                                <td><input name="phonePin" class="form-control" value="${phone_detail.pin}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Thẻ SIM</td>
                                                <td><input name="phoneSim" class="form-control" value="${phone_detail.sim}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Hệ điều hành</td>
                                                <td><input name="phoneOS" class="form-control" value="${phone_detail.operation_system}"></td>
                                            </tr> 
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Tính năng màn hình</td>
                                                <td><input name="phoneScreenFeature" class="form-control" value="${phone_detail.screen_feature}"></td>
                                            </tr>
                                            <c:if test="${phone_detail.other_feature != null}">
                                                <tr>
                                                    <td style="background: #f2f2f2; width: 20%;">Tính năng khác</td>
                                                    <td><input name="phoneOther" class="form-control" value="${phone_detail.other_feature}"></td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                    <table class="table hidden" id="laptopdetail">
                                        <tbody>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Màu sắc</td>
                                                <td><input name="lapColor" class="form-control" value="${lap_detail.color}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Kích cỡ màn hình</td>
                                                <td><input name="lapScreenSize" class="form-control" value="${lap_detail.screen_size}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Công nghệ màn hình</td>
                                                <td><input name="lapScreenTech" class="form-control" value="${lap_detail.screen_tech}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Chipset</td>
                                                <td><input name="lapChip" class="form-control" value="${lap_detail.chip}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Dung lượng RAM</td>
                                                <td><input name="lapRam" class="form-control" value="${lap_detail.ram}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Pin</td>
                                                <td><input name="lapPin" class="form-control" value="${lap_detail.pin}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Hệ điều hành</td>
                                                <td><input name="lapOS" class="form-control" value="${lap_detail.operation_system}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Tính năng màn hình</td>
                                                <td><input name="lapScreenFeature" class="form-control" value="${lap_detail.screen_feature}"></td>
                                            </tr>
                                            <c:if test="${lap_detail.other_feature != null}">
                                                <tr>
                                                    <td style="background: #f2f2f2; width: 20%;">Tính năng khác</td>
                                                    <td><input name="lapOther" class="form-control" value="${lap_detail.other_feature}"></td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                    <table class="table hidden" id="tabletdetail">
                                        <tbody>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Màu sắc</td>
                                                <td><input name="tabColor" class="form-control" value="${tablet_detail.color}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Kích cỡ màn hình</td>
                                                <td><input name="tabScreenSize" class="form-control" value="${tablet_detail.screen_size}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Công nghệ màn hình</td>
                                                <td><input name="tabScreenTech" class="form-control" value="${tablet_detail.screen_tech}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Camera sau</td>
                                                <td><input name="tabCamRear" class="form-control" value="${tablet_detail.camera_rear}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Camera trước</td>
                                                <td><input name="tabCamFront" class="form-control" value="${tablet_detail.front_camera}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Chipset</td>
                                                <td><input name="tabChip" class="form-control" value="${tablet_detail.chip}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Dung lượng RAM</td>
                                                <td><input name="tabRam" class="form-control" value="${tablet_detail.ram}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Bộ nhớ trong</td>
                                                <td><input name="tabRom" class="form-control" value="${tablet_detail.rom}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Pin</td>
                                                <td><input name="tabPin" class="form-control" value="${tablet_detail.pin}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Thẻ SIM</td>
                                                <td><input name="tabSim" class="form-control" value="${tablet_detail.sim}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Hệ điều hành</td>
                                                <td><input name="tabOS" class="form-control" value="${tablet_detail.operation_system}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Độ phân giải màn hình</td>
                                                <td><input name="tabScreenResolution" class="form-control" value="${tablet_detail.screen_resolution}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Tính năng màn hình</td>
                                                <td><input name="tabScreenFeature" class="form-control" value="${tablet_detail.screen_feature}"></td>
                                            </tr>
                                            <c:if test="${tablet_detail.other_feature != null}">
                                                <tr>
                                                    <td style="background: #f2f2f2; width: 20%;">Tính năng khác</td>
                                                    <td><input name="tabOther" class="form-control" value="${tablet_detail.other_feature}"></td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                    <table class="table hidden" id="headphonedetail">
                                        <tbody>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Màu sắc</td>
                                                <td><input name="headphoneColor" class="form-control" value="${headphone_detail.color}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Tương thích</td>
                                                <td><input name="headphoneConnect" class="form-control" value="${headphone_detail.connect}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Thời lượng pin</td>
                                                <td><input name="headphoneTime" class="form-control" value="${headphone_detail.using_time}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Công nghệ âm thanh</td>
                                                <td><input name="headphoneSound" class="form-control" value="${headphone_detail.sound_tech}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Micro</td>
                                                <td>
                                                    <c:if test="${headphone_detail.micro == 1}">
                                                        <input name="headphoneMic" type="radio" value="1" checked/>&nbsp;<i class="fa fa-check" style="color: green;"></i>
                                                        <input name="headphoneMic" type="radio" value="0"/>&nbsp;<i class="fa fa-times" style="color: red;"></i>
                                                    </c:if>
                                                    <c:if test="${headphone_detail.micro == 0}">
                                                        <input name="headphoneMic" type="radio" value="1"/>&nbsp;<i class="fa fa-check" style="color: green;"></i>
                                                        <input name="headphoneMic" type="radio" value="0" checked/>&nbsp;<i class="fa fa-times" style="color: red;"></i>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Phương thức điều khiển</td>
                                                <td><input name="headphoneCotrol" class="form-control" value="${headphone_detail.control_method}"></td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Chống nước</td>
                                                <td><input name="headphoneWaterproof" class="form-control" value="${headphone_detail.waterproof}"></td>
                                            </tr>
                                            <c:if test="${headphone_detail.other_feature != null}">
                                                <tr>
                                                    <td style="background: #f2f2f2; width: 20%;">Tính năng khác</td>
                                                    <td><input name="headphoneOther" class="form-control" value="${headphone_detail.other_feature}"></td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4" style="position: sticky; top: 10px; z-index: 100;">
                            <div class="p-3">
                                <div class="row mt-16">
                                    <h5 class="col-md-6" style="font-weight: bold;">Danh mục
                                        <select class="form-control" name="categoryId" id="categoryId" onchange="showTable()" aria-label="Default select example">
                                            <c:forEach items="${allCategories}" var="c">
                                                <option value="${c.category_id}"
                                                        <c:if test="${product.category_id.equals(c.category_id)}">
                                                            selected
                                                        </c:if>>
                                                    ${c.category_name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <script>
                                            function showTable() {
                                                var categoryId = document.getElementById("categoryId").value;
                                                var phonedetail = document.getElementById("phonedetail");
                                                var laptopdetail = document.getElementById("laptopdetail");
                                                var tabletdetail = document.getElementById("tabletdetail");
                                                var headphonedetail = document.getElementById("headphonedetail");


                                                if (categoryId === "1") {
                                                    phonedetail.classList.remove("hidden");
                                                    laptopdetail.classList.add("hidden");
                                                    tabletdetail.classList.add("hidden");
                                                    headphonedetail.classList.add("hidden");
                                                } else if (categoryId === "2") {
                                                    phonedetail.classList.add("hidden");
                                                    laptopdetail.classList.remove("hidden");
                                                    tabletdetail.classList.add("hidden");
                                                    headphonedetail.classList.add("hidden");
                                                } else if (categoryId === "3") {
                                                    phonedetail.classList.add("hidden");
                                                    laptopdetail.classList.add("hidden");
                                                    tabletdetail.classList.remove("hidden");
                                                    headphonedetail.classList.add("hidden");
                                                } else if (categoryId === "4") {
                                                    phonedetail.classList.add("hidden");
                                                    laptopdetail.classList.add("hidden");
                                                    tabletdetail.classList.add("hidden");
                                                    headphonedetail.classList.remove("hidden");
                                                }
                                            }
                                        </script>
                                    </h5>
                                    <h5 class="col-md-6" style="font-weight: bold;">Nhãn hiệu
                                        <select class="form-control" name="trademarkId" aria-label="Default select example">
                                            <c:forEach items="${allTrademarks}" var="tm">
                                                <option value="${tm.trademark_id}"
                                                        <c:if test="${product.trademark_id.equals(tm.trademark_id)}">
                                                            selected
                                                        </c:if>>
                                                    ${tm.trademark_name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </h5>
                                    <h5 class="col-md-12" style="font-weight: bold;">Số lượng sản phẩm</h5>
                                    <div class="col-md-4" style="font-weight: bold;">Ban đầu
                                        <input type="text" name="totalQuantity" class="form-control" value="${product.quantity + product.sole}" readonly>
                                    </div>
                                    <div class="col-md-4" style="font-weight: bold;">Đã bán
                                        <input type="text" name="sold" class="form-control" value="${product.sole}"data-type="currency"  required>
                                    </div>
                                    <div class="col-md-4" style="font-weight: bold;">Còn lại
                                        <input type="text" name="remain" class="form-control" value="${product.quantity}" data-type="currency" required>
                                    </div>
                                    <h5 class="col-md-4" style="font-weight: bold;">Sale
                                        <br/>
                                        <c:if test="${product.sale == 1}">
                                            <input name="sale" type="radio" onchange="inputSalePrice(this)" value="1" checked/>&nbsp;<i class="fa fa-check" style="color: green;"></i>
                                            <input name="sale" type="radio" onchange="inputSalePrice(this)" value="0"/>&nbsp;<i class="fa fa-times" style="color: red;"></i>
                                        </c:if>
                                        <c:if test="${product.sale == 0}">
                                            <input name="sale" type="radio" onchange="inputSalePrice(this)" value="1"/>&nbsp;<i class="fa fa-check" style="color: green;"></i>
                                            <input name="sale" type="radio" onchange="inputSalePrice(this)" value="0" checked/>&nbsp;<i class="fa fa-times" style="color: red;"></i>
                                        </c:if>
                                    </h5>
                                    <div class="col-md-12" style="font-weight: bold;">Giá gốc
                                        <input type="text" name="originalPrice" class="form-control" value="${product.original_prices}" data-type="currency" required>
                                    </div>
                                    <%--<c:if test="${product.sale==1}">--%>
                                    <div class="col-md-12" style="font-weight: bold;" name="salePriceLabel">Giá sale
                                        <input id="salePrice" type="text" name="salePrice" class="form-control" value="${product.sale_prices}" data-type="currency">
                                    </div>
                                    <%--</c:if>--%>
                                    <h5 class="col-md-6" style="font-weight: bold;">Chọn ảnh
                                        <input id="inputFile" type="file" name="thumbnail" class="form-control" placeholder="Ảnh" required>
                                    </h5>
                                    <h5 class="col-md-6" style="font-weight: bold;">Ngày cập nhật
                                        <input type="text" name="updateDate" class="form-control" value="${updateDate}" readonly="">
                                    </h5>
                                </div>
                                <c:forEach items="${allImages}" var="i">
                                    <c:if test="${product.product_id == i.product_id}">
                                        <div class="card-body text-center">
                                            <img class="img-account-profile rounded-circle mb-2" id="imgProduct" style="max-height: 350px; max-width: 350px"
                                                 src="${i.images}" 
                                                 onerror="this.src='http://bootdey.com/img/Content/avatar/avatar1.png'" 
                                                 alt="">
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="mt-5 p-4 text-center">
                            <a href="javascript:history.back()">
                                <button class="btn btn-outline-dark" type="button">
                                    Quay lại
                                </button>
                            </a>
                            <input class="btn btn-danger ml-5" type="submit" value="Lưu">
                        </div>
                    </div>
                </form> 
            </div>
            <!--</main>-->
            <!-- Footer-->
        </div>
        <script>
            // Ensure jQuery is ready before executing the script
            $(document).ready(function () {
                $("input[data-type='currency']").on({
                    keyup: function () {
                        formatCurrency($(this));
                    }
//                    ,
//                    blur: function () {
//                        formatCurrency($(this), "blur");
//                    }
                });

                function formatNumber(n) {
                    // format number 1000000 to 1,234,567
                    return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                }

                function formatCurrency(input, blur) {
                    var input_val = input.val();
                    if (input_val === "") {
                        return;
                    }
                    var original_len = input_val.length;
                    var caret_pos = input.prop("selectionStart");

                    if (input_val.indexOf(".") >= 0) {
                        var decimal_pos = input_val.indexOf(".");
                        var left_side = input_val.substring(0, decimal_pos);
                        var right_side = input_val.substring(decimal_pos);
                        left_side = formatNumber(left_side);
                        right_side = formatNumber(right_side);
//                        if (blur === "blur") {
//                            right_side += "00";
//                        }
                        right_side = right_side.substring(0, 2);
                        input_val = left_side + "." + right_side;
                    } else {
                        input_val = formatNumber(input_val);
//                        if (blur === "blur") {
//                            input_val += ".00";
//                        }
                    }

                    input.val(input_val);

                    var updated_len = input_val.length;
                    caret_pos = updated_len - original_len + caret_pos;
                    input[0].setSelectionRange(caret_pos, caret_pos);
                }
            });
        </script>
        <script>
            function inputSalePrice(radio) {
                var salePriceInput = document.getElementsByName("salePrice")[0];
                var salePriceLabel = document.getElementsByName("salePriceLabel")[0];
                if (radio.value === "1") {
                    document.getElementById("salePrice").setAttribute("required", "required");
                    document.getElementById("salePrice").removeAttribute("readonly");
                    salePriceInput.style.display = "block";
                    salePriceLabel.style.display = "block";
                } else {
                    salePriceInput.style.display = "none";
                    salePriceLabel.style.display = "none";
                    document.getElementById("salePrice").setAttribute("readonly", "readonly");
                    document.getElementById("salePrice").removeAttribute("required");
                    let domain = "0";
                    document.getElementById("salePrice").value = domain;
                }
            }
        </script>
        <script>
            CKEDITOR.ClassicEditor.create(document.getElementById("editor2"), {
                // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format

                toolbar: {
                    items: [
                        'exportPDF', 'exportWord', '|',
                        'findAndReplace', 'selectAll', '|',
                        'heading', '|',
                        'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
                        'bulletedList', 'numberedList', 'todoList', '|',
                        'outdent', 'indent', '|',
                        'undo', 'redo',
                        '-',
                        'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                        'alignment', '|',
                        'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
                        'specialCharacters', 'horizontalLine', 'pageBreak', '|',
                        'textPartLanguage', '|',
                        'sourceEditing'
                    ],
                    shouldNotGroupWhenFull: true
                },
                // Changing the language of the interface requires loading the language file using the <script> tag.
                // language: 'es',
                list: {
                    properties: {
                        styles: true,
                        startIndex: true,
                        reversed: true
                    }
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
                heading: {
                    options: [
                        {model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph'},
                        {model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1'},
                        {model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2'},
                        {model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3'},
                        {model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4'},
                        {model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5'},
                        {model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6'}
                    ]
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
                placeholder: 'Nhập nội dung bài viết',
                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
                fontFamily: {
                    options: [
                        'default',
                        'Arial, Helvetica, sans-serif',
                        'Courier New, Courier, monospace',
                        'Georgia, serif',
                        'Lucida Sans Unicode, Lucida Grande, sans-serif',
                        'Tahoma, Geneva, sans-serif',
                        'Times New Roman, Times, serif',
                        'Trebuchet MS, Helvetica, sans-serif',
                        'Verdana, Geneva, sans-serif'
                    ],
                    supportAllValues: true
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
                fontSize: {
                    options: [10, 12, 14, 'default', 18, 20, 22],
                    supportAllValues: true
                },
                // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
                // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
                htmlSupport: {
                    allow: [
                        {
                            name: /.*/,
                            attributes: true,
                            classes: true,
                            styles: true
                        }
                    ]
                },
                // Be careful with enabling previews
                // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
                htmlEmbed: {
                    showPreviews: true
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
                link: {
                    decorators: {
                        addTargetToExternalLinks: true,
                        defaultProtocol: 'https://',
                        toggleDownloadable: {
                            mode: 'manual',
                            label: 'Downloadable',
                            attributes: {
                                download: 'file'
                            }
                        }
                    }
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
                mention: {
                    feeds: [
                        {
                            marker: '@',
                            feed: [
                                '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                                '@cupcake', '@danish', '@donut', '@drag?e', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                                '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@souffl?',
                                '@sugar', '@sweet', '@topping', '@wafer'
                            ],
                            minimumCharacters: 1
                        }
                    ]
                },
                // The "super-build" contains more premium features that require additional configuration, disable them below.
                // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
                removePlugins: [
                    // These two are commercial, but you can try them out without registering to a trial.
                    // 'ExportPdf',
                    // 'ExportWord',
                    'CKBox',
                    'CKFinder',
                    'EasyImage',
                    // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
                    // Storing images as Base64 is usually a very bad idea.
                    // Replace it on production website with other solutions:
                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
                    // 'Base64UploadAdapter',
                    'RealTimeCollaborativeComments',
                    'RealTimeCollaborativeTrackChanges',
                    'RealTimeCollaborativeRevisionHistory',
                    'PresenceList',
                    'Comments',
                    'TrackChanges',
                    'TrackChangesData',
                    'RevisionHistory',
                    'Pagination',
                    'WProofreader',
                    // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
                    // from a local file system (file://) - load this site via HTTP server if you enable MathType.
                    'MathType',
                    // The following features are part of the Productivity Pack and require additional license.
                    'SlashCommand',
                    'Template',
                    'DocumentOutline',
                    'FormatPainter',
                    'TableOfContents'
                ]
            });

            ClassicEditor
                    .create(document.querySelector('#highlight'))
                    .catch(error => {
                        console.error(error);
                    });


        </script>
        <script>
            CKEDITOR.ClassicEditor.create(document.getElementById("editor"), {
                // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format

                toolbar: {
                    items: [
                        'exportPDF', 'exportWord', '|',
                        'findAndReplace', 'selectAll', '|',
                        'heading', '|',
                        'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
                        'bulletedList', 'numberedList', 'todoList', '|',
                        'outdent', 'indent', '|',
                        'undo', 'redo',
                        '-',
                        'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                        'alignment', '|',
                        'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
                        'specialCharacters', 'horizontalLine', 'pageBreak', '|',
                        'textPartLanguage', '|',
                        'sourceEditing'
                    ],
                    shouldNotGroupWhenFull: true
                },
                // Changing the language of the interface requires loading the language file using the <script> tag.
                // language: 'es',
                list: {
                    properties: {
                        styles: true,
                        startIndex: true,
                        reversed: true
                    }
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
                heading: {
                    options: [
                        {model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph'},
                        {model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1'},
                        {model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2'},
                        {model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3'},
                        {model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4'},
                        {model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5'},
                        {model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6'}
                    ]
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
                placeholder: 'Nhập nội dung bài viết',
                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
                fontFamily: {
                    options: [
                        'default',
                        'Arial, Helvetica, sans-serif',
                        'Courier New, Courier, monospace',
                        'Georgia, serif',
                        'Lucida Sans Unicode, Lucida Grande, sans-serif',
                        'Tahoma, Geneva, sans-serif',
                        'Times New Roman, Times, serif',
                        'Trebuchet MS, Helvetica, sans-serif',
                        'Verdana, Geneva, sans-serif'
                    ],
                    supportAllValues: true
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
                fontSize: {
                    options: [10, 12, 14, 'default', 18, 20, 22],
                    supportAllValues: true
                },
                // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
                // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
                htmlSupport: {
                    allow: [
                        {
                            name: /.*/,
                            attributes: true,
                            classes: true,
                            styles: true
                        }
                    ]
                },
                // Be careful with enabling previews
                // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
                htmlEmbed: {
                    showPreviews: true
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
                link: {
                    decorators: {
                        addTargetToExternalLinks: true,
                        defaultProtocol: 'https://',
                        toggleDownloadable: {
                            mode: 'manual',
                            label: 'Downloadable',
                            attributes: {
                                download: 'file'
                            }
                        }
                    }
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
                mention: {
                    feeds: [
                        {
                            marker: '@',
                            feed: [
                                '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                                '@cupcake', '@danish', '@donut', '@drag?e', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                                '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@souffl?',
                                '@sugar', '@sweet', '@topping', '@wafer'
                            ],
                            minimumCharacters: 1
                        }
                    ]
                },
                // The "super-build" contains more premium features that require additional configuration, disable them below.
                // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
                removePlugins: [
                    // These two are commercial, but you can try them out without registering to a trial.
                    // 'ExportPdf',
                    // 'ExportWord',
                    'CKBox',
                    'CKFinder',
                    'EasyImage',
                    // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
                    // Storing images as Base64 is usually a very bad idea.
                    // Replace it on production website with other solutions:
                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
                    // 'Base64UploadAdapter',
                    'RealTimeCollaborativeComments',
                    'RealTimeCollaborativeTrackChanges',
                    'RealTimeCollaborativeRevisionHistory',
                    'PresenceList',
                    'Comments',
                    'TrackChanges',
                    'TrackChangesData',
                    'RevisionHistory',
                    'Pagination',
                    'WProofreader',
                    // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
                    // from a local file system (file://) - load this site via HTTP server if you enable MathType.
                    'MathType',
                    // The following features are part of the Productivity Pack and require additional license.
                    'SlashCommand',
                    'Template',
                    'DocumentOutline',
                    'FormatPainter',
                    'TableOfContents'
                ]
            });

            ClassicEditor
                    .create(document.querySelector('#content'))
                    .catch(error => {
                        console.error(error);
                    });
        </script>

        <script>
            var inputFile = document.getElementById('inputFile');
            inputFile.addEventListener('change', function () {
                var file = inputFile.files[0];
                validateFileType(file);
            });

            function validateFileType(file) {
                if (file) {
                    var fileType = file.type;
                    if (!fileType.startsWith('image/')) {
                        alert('Please choose a file image.');
                        clearFileInput();
                    } else {
                        var fileReader = new FileReader();
                        fileReader.onload = function () {
                            var link = fileReader.result;
                            updateAvatar(link);
                        };
                        fileReader.readAsDataURL(file);
                    }
                }
            }

            function clearFileInput() {
                inputFile.value = '';

                inputFile.addEventListener('change', function () {
                    var file = inputFile.files[0];
                    validateFileType(file);
                });
            }

            function updateAvatar(link) {
                var imgElement = document.getElementById("imgProduct");
                imgElement.src = link;
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/jsmanage/scripts.js"></script>
        <script src="${pageContext.request.contextPath}/js/changePriceFormat.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/jsmanage/datatables-simple-demo.js"></script>
    </body>
</html>
