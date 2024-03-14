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
                <!-- container -->
            <div>
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <!--<div class="card-header"></div>-->
                        <div class="card-body text-center">
                            <!-- Profile picture image--> 
                            <img class="img-account-profile rounded-circle mb-2" id="imgAvatar" style="max-height: 350px; max-width: 350px"
                                 src="${userAccount.getAvatar()}" 
                                 onerror="this.src='http://bootdey.com/img/Content/avatar/avatar1.png'" 
                                 alt="">
                        </div>
                    </div>
                </div>
                <!-- row -->
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/ManagerAddAccount" method="post" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputUsername">Username <span class="text-danger">${errorUserName}</span></label> </label>
                                    <input class="form-control" id="inputUsername"
                                           type="text" required
                                           name="username"
                                           placeholder="Enter your username" 
                                           value="${userAccount.getUser_name()}">
                                </div>
                                <div class="row gx-3 mb-3">

                                    <div class="col-md-6">

                                        <label class="small mb-1" for="inputFirstName">Gmail <span class="text-danger">${errorEmail}</span></label>
                                        <input class="form-control" id="inputFirstName"
                                               type="email" required
                                               placeholder="Enter your gmail" 
                                               name="gmail"
                                               value="${userAccount.getEmail()}">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputLastName">Full Name</label>
                                        <input class="form-control" id="inputLastName" type="text" name="textFullName" required
                                               placeholder="Enter your last name" value="${userAccount.getFullName()}">
                                    </div>
                                </div>
                                <div class="row gx-3 mb-3">
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputOrgName">Phone</label>
                                        <input class="form-control" id="inputOrgName" type  ="text" name="txtPhone" required
                                               placeholder="Enter your phone" value="${userAccount.getPhone()}">
                                    </div>

                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputLocation">Address</label>
                                        <input class="form-control" id="inputLocation" type="text" name="txtAddress" required
                                               placeholder="Enter your address" value="${userAccount.getAddress()}">
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="small mb-1" for="inputEmailAddress">Upload Avatar</label>
                                    <input id="inputFile" type="file" name="txtAvatar" accept="image/*" required/>
                                </div>
                                <script>
                                    // L?y tham chi?u ??n n?t v? input
                                    var inputFile = document.getElementById('inputFile');

                                    // Th?m s? ki?n change cho input file
                                    inputFile.addEventListener('change', function () {
                                        var file = inputFile.files[0];
                                        validateFileType(file);
                                    });

                                    function validateFileType(file) {
                                        if (file) {
                                            var fileType = file.type;

                                            // Ki?m tra ??nh d?ng t?p c? ph?i l? h?nh ?nh hay kh?ng
                                            if (!fileType.startsWith('image/')) {
                                                // Hi?n th? th?ng b?o l?i n?u t?p kh?ng ph?i l? h?nh ?nh
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
                                        // X?a gi? tr? c?a input file
                                        inputFile.value = '';

                                        // Ti?p t?c l?ng nghe s? ki?n change cho input file
                                        inputFile.addEventListener('change', function () {
                                            var file = inputFile.files[0];
                                            validateFileType(file);
                                        });
                                    }

                                    function updateAvatar(link) {
                                        var imgElement = document.getElementById("imgAvatar");
                                        imgElement.src = link;
                                    }
                                </script>
                                <div class="row gx-3 mb-3">

                                    <div class="col-md-6">
                                        <label class="small mb-1" >Gender: </label>
                                        <input  id="inputGenderMale" type="radio" name="gender"
                                                checked   value="1"> 
                                        <label for="inputGenderMale">Male</label>
                                        <input  id="inputGenderFeMale" type="radio" name="gender"
                                                <c:if test="${!userAccount.getGender()}">
                                                    checked
                                                </c:if>
                                                value="0">
                                        <label for="inputGenderFeMale">FeMale</label>
                                    </div>
                                </div>
                                <div class="row gx-3 mb-3">
                                    <div class="col-md-6">
                                        <label class="form-label small mb-1">Role</label>
                                        <select class="form-select" name="roleSelect">
                                            <option value="Customer" selected>Customer</option>
                                            <option value="Admin" 
                                                    <c:if test="${userAccount.getRoleName().equals('Admin')}">
                                                        selected
                                                    </c:if>
                                                    >Admin</option>
                                            <option value="Management" 
                                                    <c:if test="${userAccount.getRoleName().equals('Management')}">
                                                        selected
                                                    </c:if>>Management</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputEmailAddress">Password</label>
                                    <input class="form-control" id="inputEmailAddress"
                                           type="text" name="pass" required
                                           placeholder="Enter your password" value="${userAccount.getAvatar()}">
                                </div>
                                <br/>
                                <button class="btn btn-primary" type="submit">Save changes</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /container -->
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
