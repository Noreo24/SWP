<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Manager Add Account</title>

        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <link rel="stylesheet" href="css/font-awesome.min.css">

        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
        <script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/classic/translations/vi.js"></script>
        <script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/media-embed/media-embed.js"></script>
        <style>
            .form-control-file {
                display: block;
                width: 100%;
                padding: 0.375rem 0.75rem;
                line-height: 2;
                color: #495057;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #ced4da;
                border-radius: 0.25rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }
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
        </style>
    </head>
    <body>
        <!-- HEADER -->
        <%@include file="/navigator/adminheader.jsp" %>
        <!-- /HEADER -->

        <!-- BREADCRUMB -->
        <!-- /BREADCRUMB -->


        <!-- SECTION -->
        <div id="layoutSidenav">
            <div class="groundy" id="layoutSidenav_content">
                <main>
                    <div class="container rounded bg-white mt-5 mb-5">
                        <form action="addblogcontroller" method="post" enctype="multipart/form-data" >
                            <div class="row"  style="margin-top: 8%;">
                                <div class="p-4">
                                    <h4 class="text-center">Thêm Bài Viết</h4>
                                </div>
                                <div class="col-md-8">
                                    <div class="p-3 py-5">
                                        <div class="col-md-12">Tiêu đề<input type="text" name="title" class="form-control" placeholder="Nhập tiêu đề" ></div>
                                        <div class="col-md-12">Thông tin rút gọn<textarea class="form-control" name="brief_infor"  rows="2" ></textarea></div>
                                        <div class="col-md-12">Nội dung
                                            <textarea cols="20" rows="40" id="editor" name="content"></textarea>
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
                                                    placeholder: 'Welcome to CKEditor 5!',
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
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="p-3 py-5">
                                        <div class="row mt-16">
                                            <div class="col-md-12">Danh mục
                                                <select class="form-control" name="categoryId" aria-label="Default select example">
                                                    <c:forEach items="${sessionScope.list}" var="c">
                                                        <option value="${c.getCategoryBlog_id()}">
                                                            ${c.getCategoryBlog_name()}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-md-12">Trạng thái
                                                <br/>
                                                <input name="status" type="radio" value="1" checked/>&nbsp;Hiện
                                                <input name="status" type="radio" value="0" />&nbsp;Ẩn
                                            </div>
                                            <div class="col-md-12">Hình thu nhỏ<input type="file" name="thumbnail" class="form-control" placeholder="Thumbnail">${img}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-5 p-4 text-center">
                                    <a href="${pageContext.request.contextPath}/bloglistmanage"><button class="btn btn-outline-dark" type="button">Quay lại</button></a>
                                    <input class="btn btn-danger ml-5" type="submit" value="Thêm mới">
                                </div>
                            </div>
                        </form> 
                    </div>
                </main>
                <!-- Footer-->
            </div>
        </div>

        <!-- NEWSLETTER -->
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
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

        <!-- FOOTER -->
        <footer id="footer">
            <!-- top footer -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">About Us</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                                <ul class="footer-links">
                                    <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                                    <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Categories</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Hot deals</a></li>
                                    <li><a href="#">Laptops</a></li>
                                    <li><a href="#">Smartphones</a></li>
                                    <li><a href="#">Cameras</a></li>
                                    <li><a href="#">Accessories</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="clearfix visible-xs"></div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Information</h3>
                                <ul class="footer-links">
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Orders and Returns</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Service</h3>
                                <ul class="footer-links">
                                    <li><a href="#">My Account</a></li>
                                    <li><a href="#">View Cart</a></li>
                                    <li><a href="#">Wishlist</a></li>
                                    <li><a href="#">Track My Order</a></li>
                                    <li><a href="#">Help</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /top footer -->

            <!-- bottom footer -->
            <div id="bottom-footer" class="section">
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="footer-payments">
                                <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                                <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                            </ul>
                            <span class="copyright">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </span>


                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /bottom footer -->
        </footer>
        <!-- /FOOTER -->
        <script>
            function displayImage(event) {
                var input = event.target;
                var reader = new FileReader();
                reader.onload = function () {
                    var dataURL = reader.result;
                    var image = document.getElementById("previewImage");
                    image.src = dataURL;
                };
                reader.readAsDataURL(input.files[0]);
            }
        </script>
        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>