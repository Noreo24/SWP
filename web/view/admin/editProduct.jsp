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
                            <i style="color: red">${ERROR}</i>
                        </div>
                        <div class="col-md-8">
                            <div class="p-3">
                                <h5 class="col-md-12" style="font-weight: bold;">ID
                                    <input type="text" name="id" class="form-control" value="${product.product_id}" readonly>
                                </h5>
                                <h5 class="col-md-12" style="font-weight: bold;">Tên sản phẩm
                                    <input type="text" name="productName" class="form-control" value="${product.product_name}" >
                                </h5>
                                <h5 class="col-md-12" style="font-weight: bold;">Đặc điểm nổi bật
                                    <textarea cols="20" rows="40" id="editor2" name="highlight">
                                        ${product.getProduct_highlights()}
                                    </textarea>
                                </h5>
                                <h5 class="col-md-12" style="font-weight: bold;">Mô tả
                                    <textarea cols="20" rows="40" id="editor" name="content">
                                        ${product.getProduct_description()}
                                    </textarea>
                                </h5>
                                <h5 class="col-md-6" style="font-weight: bold;">Chi tiết</h5>
                                <div class="col-md-12">
                                    <table class="table hidden" id="phonedetail">
                                        <tbody>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Màu sắc</td>
                                                <td>${phone_detail.color}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Kích cỡ màn hình</td>
                                                <td>${phone_detail.screen_size}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Công nghệ màn hình</td>
                                                <td>${phone_detail.screen_tech}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Camera sau</td>
                                                <td>${phone_detail.camera_rear}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Camera trước</td>
                                                <td>${phone_detail.front_camera}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Chipset</td>
                                                <td>${phone_detail.chip}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Dung lượng RAM</td>
                                                <td>${phone_detail.ram}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Bộ nhớ trong</td>
                                                <td>${phone_detail.rom}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Pin</td>
                                                <td>${phone_detail.pin}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Thẻ SIM</td>
                                                <td>${phone_detail.sim}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Hệ điều hành</td>
                                                <td>${phone_detail.operation_system}</td>
                                                <!--                                                        </tr>                                                      <tr>
                                                                                                            <td style="background: #f2f2f2; width: 20%;">Độ phân giải màn hình</td>
                                                                                                            <td>2796 x 1290-pixel</td>
                                                                                                        </tr>-->
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Tính năng màn hình</td>
                                                <td>${phone_detail.screen_feature}</td>
                                            </tr>
                                            <c:if test="${phone_detail.other_feature != null}">
                                                <tr>
                                                    <td style="background: #f2f2f2; width: 20%;">Tính năng khác</td>
                                                    <td>${phone_detail.other_feature}</td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                    <table class="table hidden" id="laptopdetail">
                                        <tbody>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Màu sắc</td>
                                                <c:if test="${lap_detail.color != null}">
                                                    <td>${lap_detail.color}</td>
                                                </c:if>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Kích cỡ màn hình</td>
                                                <td>${lap_detail.screen_size}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Công nghệ màn hình</td>
                                                <td>${lap_detail.screen_tech}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Chipset</td>
                                                <td>${lap_detail.chip}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Dung lượng RAM</td>
                                                <td>${lap_detail.ram}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Pin</td>
                                                <td>${lap_detail.pin}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Hệ điều hành</td>
                                                <td>${lap_detail.operation_system}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Tính năng màn hình</td>
                                                <td>${lap_detail.screen_feature}</td>
                                            </tr>
                                            <c:if test="${lap_detail.other_feature != null}">
                                                <tr>
                                                    <td style="background: #f2f2f2; width: 20%;">Tính năng khác</td>
                                                    <td>${lap_detail.other_feature}</td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                    <table class="table hidden" id="tabletdetail">
                                        <tbody>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Màu sắc</td>
                                                <td>${tablet_detail.color}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Kích cỡ màn hình</td>
                                                <td>${tablet_detail.screen_size}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Công nghệ màn hình</td>
                                                <td>${tablet_detail.screen_tech}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Camera sau</td>
                                                <td>${tablet_detail.camera_rear}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Camera trước</td>
                                                <td>${tablet_detail.front_camera}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Chipset</td>
                                                <td>${tablet_detail.chip}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Dung lượng RAM</td>
                                                <td>${tablet_detail.ram}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Bộ nhớ trong</td>
                                                <td>${tablet_detail.rom}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Pin</td>
                                                <td>${tablet_detail.pin}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Thẻ SIM</td>
                                                <td>${tablet_detail.sim}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Hệ điều hành</td>
                                                <td>${tablet_detail.operation_system}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Độ phân giải màn hình</td>
                                                <td>${tablet_detail.screen_resolution}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Tính năng màn hình</td>
                                                <td>${tablet_detail.screen_feature}</td>
                                            </tr>
                                            <c:if test="${tablet_detail.other_feature != null}">
                                                <tr>
                                                    <td style="background: #f2f2f2; width: 20%;">Tính năng khác</td>
                                                    <td>${tablet_detail.other_feature}</td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                    <table class="table hidden" id="headphonedetail">
                                        <tbody>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Màu sắc</td>
                                                <td>${headphone_detail.color}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Tương thích</td>
                                                <td>${headphone_detail.connect}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Thời lượng pin</td>
                                                <td>${headphone_detail.using_time}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Công nghệ âm thanh</td>
                                                <td>${headphone_detail.sound_tech}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Micro</td>
                                                <td>${headphone_detail.micro}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Phương thức điều khiển</td>
                                                <td>${headphone_detail.control_method}</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f2f2f2; width: 20%;">Chống nước</td>
                                                <td>${headphone_detail.waterproof}</td>
                                            </tr>
                                            <c:if test="${headphone_detail.other_feature != null}">
                                                <tr>
                                                    <td style="background: #f2f2f2; width: 20%;">Tính năng khác</td>
                                                    <td>${headphone_detail.other_feature}</td>
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
                                    <h5 class="col-md-12" style="font-weight: bold;">Trạng thái</h5>
                                    <br/>
                                    <c:if test="${product.status == 1}">
                                        <!--<div class="row">-->
                                        <label for="yes" class="col-md-6">Sẵn bán</label>
                                        <input id="yes" name="status" type="radio" value="1" checked/>
                                        <label for="no" class="col-md-6">Không bán</label>
                                        <input id="no" name="status" type="radio" value="0"/>
                                        <!--</div>-->
                                    </c:if>
                                    <c:if test="${product.status == 0}">
                                        <!--<div class="row">-->
                                        <label for="yes" class="col-md-6">Sẵn bán</label>
                                        <input id="yes" name="status" type="radio" value="1"/>
                                        <label for="no" class="col-md-6">Không bán</label>
                                        <input id="no" name="status" type="radio" value="0" checked/>
                                        <!--</div>-->
                                    </c:if>
                                    <h5 class="col-md-12" style="font-weight: bold;">Số lượng sản phẩm</h5>
                                    <div class="col-md-4" style="font-weight: bold;">Ban đầu
                                        <input type="number" name="totalQuantity" class="form-control" value="${product.quantity + product.sole}" >
                                    </div>
                                    <div class="col-md-4" style="font-weight: bold;">Đã bán
                                        <input type="number" name="sold" class="form-control" value="${product.sole}">
                                    </div>
                                    <div class="col-md-4" style="font-weight: bold;">Còn lại
                                        <input type="number" name="remain" class="form-control" value="${product.quantity}">
                                    </div>
                                    <h5 class="col-md-4" style="font-weight: bold;">Sale
                                        <br/>
                                        <c:if test="${product.sale == 1}">
                                            <input name="sale" type="radio" value="1" checked/>&nbsp;<i class="fa fa-check" style="color: green;"></i>
                                            <input name="sale" type="radio" value="0"/>&nbsp;<i class="fa fa-times" style="color: red;"></i>
                                        </c:if>
                                        <c:if test="${product.sale == 0}">
                                            <input name="sale" type="radio" value="1"/>&nbsp;<i class="fa fa-check" style="color: green;"></i>
                                            <input name="sale" type="radio" value="0" checked/>&nbsp;<i class="fa fa-times" style="color: red;"></i>
                                        </c:if>
                                    </h5>
                                    <div class="col-md-12" style="font-weight: bold;">Giá gốc
                                        <input type="text" name="originalPrice" class="form-control" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" value="${product.original_prices}" data-type="currency" placeholder="$1,000,000.00">
                                    </div>
                                    <div class="col-md-12" style="font-weight: bold;">Giá sale
                                        <input type="text" name="salePrice" class="form-control" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" value="${product.original_prices}" data-type="currency" placeholder="$1,000,000.00">
                                    </div>
                                    <h5 class="col-md-6" style="font-weight: bold;">Chọn ảnh
                                        <input id="inputFile" type="file" name="thumbnail" class="form-control" placeholder="Ảnh">
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
<!--        <script>
            $("input[data-type='currency']").on({
                keyup: function () {
                    formatCurrency($(this));
                },
                blur: function () {
                    formatCurrency($(this), "blur");
                }
            });


            function formatNumber(n) {
                // format number 1000000 to 1,234,567
                return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",")
            }


            function formatCurrency(input, blur) {
                // appends $ to value, validates decimal side
                // and puts cursor back in right position.

                // get input value
                var input_val = input.val();

                // don't validate empty input
                if (input_val === "") {
                    return;
                }

                // original length
                var original_len = input_val.length;

                // initial caret position 
                var caret_pos = input.prop("selectionStart");

                // check for decimal
                if (input_val.indexOf(".") >= 0) {

                    // get position of first decimal
                    // this prevents multiple decimals from
                    // being entered
                    var decimal_pos = input_val.indexOf(".");

                    // split number by decimal point
                    var left_side = input_val.substring(0, decimal_pos);
                    var right_side = input_val.substring(decimal_pos);

                    // add commas to left side of number
                    left_side = formatNumber(left_side);

                    // validate right side
                    right_side = formatNumber(right_side);

                    // On blur make sure 2 numbers after decimal
                    if (blur === "blur") {
                        right_side += "00";
                    }

                    // Limit decimal to only 2 digits
                    right_side = right_side.substring(0, 2);

                    // join number by .
                    input_val = "$" + left_side + "." + right_side;

                } else {
                    // no decimal entered
                    // add commas to number
                    // remove all non-digits
                    input_val = formatNumber(input_val);
                    input_val = "$" + input_val;

                    // final formatting
                    if (blur === "blur") {
                        input_val += ".00";
                    }
                }

                // send updated string to input
                input.val(input_val);

                // put caret back in the right position
                var updated_len = input_val.length;
                caret_pos = updated_len - original_len + caret_pos;
                input[0].setSelectionRange(caret_pos, caret_pos);
            }
        </script>-->
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
            // L?y tham chi?u ??n nút và input
            var inputFile = document.getElementById('inputFile');

            // Thêm s? ki?n change cho input file
            inputFile.addEventListener('change', function () {
                var file = inputFile.files[0];
                validateFileType(file);
            });

            function validateFileType(file) {
                if (file) {
                    var fileType = file.type;

                    // Ki?m tra ??nh d?ng t?p có ph?i là hình ?nh hay không
                    if (!fileType.startsWith('image/')) {
                        // Hi?n th? thông báo l?i n?u t?p không ph?i là hình ?nh
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
                // Xóa giá tr? c?a input file
                inputFile.value = '';

                // Ti?p t?c l?ng nghe s? ki?n change cho input file
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
