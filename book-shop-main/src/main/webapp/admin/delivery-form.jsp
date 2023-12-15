<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Dashboard</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="${pageContext.request.contextPath}/admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/assets/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/admin/assets/css/style.css" rel="stylesheet">

    <!-- Logo -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/store/icon/paper-plane.ico">

    <!-- Chỗ này hong biết sao nó hong ăn bên file style.css nên phải để ở đây :>> -->
    <style>
        .img-rectangle {
            width: 250px;
        }

        .recent-sales {
            width: 1160px;
        }

        .desciption-column-witdh {
            width: 300px;
            text-align: justify;
        }

        .action-column {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .margin-top-10 {
            margin-top: 10px;
        }

        .margin-top-30 {
            margin-top: 30px;
        }
    </style>

    <!-- =======================================================
    * Template Name: NiceAdmin - v2.4.1
    * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>

<body>

<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
        <a href="${pageContext.request.contextPath}/admin" class="logo d-flex align-items-center">
            <img src="${pageContext.request.contextPath}/store/icon/paper-plane.ico" alt="">
            <span class="d-none d-lg-block">Giấy Bookstore</span>
        </a>
        <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">

            <li class="nav-item dropdown pe-3">

                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    <c:if test="${sessionScope.acc.image.equals('') || empty sessionScope.acc.image}">
                        <img class="rounded-circle" src="https://static.vecteezy.com/system/resources/thumbnails/001/840/618/small/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-free-vector.jpg" alt="Profile">
                    </c:if>
                    <c:if test="${!sessionScope.acc.image.equals('') && not empty sessionScope.acc.image}">
                        <img class="rounded-circle" src="${sessionScope.acc.image}" alt="Profile">
                    </c:if>
                    <span class="d-none d-md-block dropdown-toggle ps-2">${sessionScope.acc.name}</span>
                </a><!-- End Profile Iamge Icon -->


                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">
                        <h6>${sessionScope.acc.name}</h6>
                        <c:if test="${sessionScope.acc.isRole==1}">
                            <span>Quản lý</span>
                        </c:if>
                        <c:if test="${sessionScope.acc.isRole==2}">
                            <span>Nhân viên</span>
                        </c:if>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/admin/employee?action=edit&employeeID=${sessionScope.acc.id}">
                            <i class="bi bi-person"></i>
                            <span>Tài khoản</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="/logout">
                            <i class="bi bi-box-arrow-right"></i>
                            <span>Đăng xuất</span>
                        </a>
                    </li>

                </ul><!-- End Profile Dropdown Items -->
            </li><!-- End Profile Nav -->

        </ul>
    </nav><!-- End Icons Navigation -->

</header><!-- End Header -->

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <c:if test="${sessionScope.acc.isRole==1}">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin">
                    <i class="bi bi-grid"></i>
                    <span>Dashboard</span>
                </a>
            </c:if>
        </li><!-- End Dashboard Nav -->

        <li class="nav-heading">Pages</li>

        <%--        <li class="nav-item">--%>
        <%--            <a class="nav-link collapsed" href="">--%>
        <%--                <i class="bi bi-person"></i>--%>
        <%--                <span>Profile</span>--%>
        <%--            </a>--%>
        <%--        </li><!-- End Profile Page Nav -->--%>
        <li class="nav-item">
            <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/customer">
                <i class="bi bi-emoji-sunglasses"></i>
                <span>Customer</span>
            </a>
        </li><!-- End Customer Page Nav -->

        <c:if test="${sessionScope.acc.isRole==1}">
            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/employee">
                    <i class="bi bi-emoji-expressionless"></i>
                    <span>Employee</span>
                </a>
            </li><!-- End Employee Page Nav -->
        </c:if>

        <c:if test="${sessionScope.acc.isRole==1}">
            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/book">
                    <i class="bi bi-journal-bookmark-fill"></i>
                    <span>Book</span>
                </a>
            </li><!-- End Book Page Nav -->
        </c:if>

        <li class="nav-item">
            <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/order">
                <i class="bi bi-receipt-cutoff"></i>
                <span>Order</span>
            </a>
        </li><!-- End Order Page Nav -->

        <c:if test="${sessionScope.acc.isRole==1}">
            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/category">
                    <i class="bi bi-grid-1x2"></i>
                    <span>Category</span>
                </a>
            </li><!-- End Category Page Nav -->
        </c:if>

        <c:if test="${sessionScope.acc.isRole==1}">
            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/paymethod">
                    <i class="bi bi-wallet2"></i>
                    <span>Pay method</span>
                </a>
            </li><!-- End Pay method Page Nav -->
        </c:if>

        <c:if test="${sessionScope.acc.isRole==1}">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/delivery">
                    <i class="bi bi-box-seam"></i>
                    <span>Delivery</span>
                </a>
            </li><!-- End Category Page Nav -->
        </c:if>
    </ul>

</aside><!-- End Sidebar-->

<main id="main" class="main">

    <div class="pagetitle">
        <h1>${action.equals("insert")?"Thêm phương thức vận chuyển":"Chỉnh phương thức vận chuyển"}</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Home</a></li>
                <li class="breadcrumb-item active">Delivery</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
        <div class="row">

            <!-- Left side columns -->
            <div class="col-lg-8 recent-sales">
                <div class="row">
                    <c:if test="${not empty message}">
                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                            <i class="bi bi-exclamation-triangle me-1"></i>
                                ${message}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>
                    <form action="${pageContext.request.contextPath}/admin/delivery" method="post">
                        <div class="row mb-3">
                            <label for="inputText" class="col-sm-2 col-form-label">Tên phương thức</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="deliveryName" value="${delivery.name}"
                                ${action.equals("insert")?"required":"readonly"}>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputNumber" class="col-sm-2 col-form-label">Phí ship</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" name="deliveryShipFee" required value="${delivery.shipFee}" ${action.equals("insert")?"required":"readonly"}>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label"></label>
                            <div class="col-sm-10">
                                <a href="${pageContext.request.contextPath}/admin/delivery" class="btn ${action.equals("insert")?"btn-danger":"btn-success"}">${action.equals("insert")?"Cancel":"OK"}</a>
                                <button type="submit" class="btn btn-success" value="add" ${action.equals("insert")?"":"hidden"}>Save</button>
                            </div>
                        </div>
                        <input type="hidden" name="action" value="save">
                        <input type="hidden" name="dID" value="${delivery.id}">
                    </form><!-- End General Form Elements -->
                    <button class="btn btn-primary" id="fileButton" hidden>Upload Image</button>
                </div>
            </div><!-- End Left side columns -->

        </div>
    </section>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer" class="footer">
    <div class="copyright">
        &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
</footer><!-- End Footer -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="${pageContext.request.contextPath}/admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/vendor/chart.js/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/vendor/echarts/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/vendor/quill/quill.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/vendor/tinymce/tinymce.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="${pageContext.request.contextPath}/admin/assets/js/main.js"></script>

<%-- Script để up ảnh lên trên firebase --%>
<script type="text/javascript">
    const firebaseConfig = {
        apiKey: "AIzaSyAkEUZstCnJ5AqGXBqpTefdojdmFJUlg9s",
        authDomain: "bookstore-group6.firebaseapp.com",
        projectId: "bookstore-group6",
        storageBucket: "bookstore-group6.appspot.com",
        messagingSenderId: "511904505175",
        appId: "1:511904505175:web:024a0d6a156673f8b87212",
        measurementId: "G-113KCDWNBN"
    };

    firebase.initializeApp(firebaseConfig);

    var image = '';
    // firebase bucket name
    // REPLACE WITH THE ONE YOU CREATE
    // ALSO CHECK STORAGE RULES IN FIREBASE CONSOLE
    var fbBucketName = 'images';

    // get elements
    var uploader = document.getElementById('uploader');
    var fileButton = document.getElementById('fileButton');

    // listen for file selection
    fileButton.addEventListener('click', function (e) {

        // get file
        var file = document.getElementById("fileImage").files[0];

        // create a storage ref
        <%--var storageRef = firebase.storage().ref(`${fbBucketName}/${file.name}`);--%>
        const storageRef = firebase.storage().ref(file.name);
        // upload file
        var uploadTask = storageRef.put(file);

        // The part below is largely copy-pasted from the 'Full Example' section from
        // https://firebase.google.com/docs/storage/web/upload-files

        // update progress bar
        uploadTask.on(firebase.storage.TaskEvent.STATE_CHANGED, // or 'state_changed'
            function (snapshot) {
                // Get task progress, including the number of bytes uploaded and the total number of bytes to be uploaded
                var progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                uploader.value = progress;
                console.log('Upload is ' + progress + '% done');
                switch (snapshot.state) {
                    case firebase.storage.TaskState.PAUSED: // or 'paused'
                        console.log('Upload is paused');
                        break;
                    case firebase.storage.TaskState.RUNNING: // or 'running'
                        console.log('Upload is running');
                        break;
                }
            }, function (error) {

                // A full list of error codes is available at
                // https://firebase.google.com/docs/storage/web/handle-errors
                switch (error.code) {
                    case 'storage/unauthorized':
                        // User doesn't have permission to access the object
                        break;

                    case 'storage/canceled':
                        // User canceled the upload
                        break;

                    case 'storage/unknown':
                        // Unknown error occurred, inspect error.serverResponse
                        break;
                }
            }, function () {
                // Upload completed successfully, now we can get the download URL
                // save this link somewhere, e.g. put it in an input field
                var downloadURL = uploadTask.snapshot.downloadURL;
                image = downloadURL;
                console.log('downloadURL ===>', downloadURL);
                console.log('pic ==', downloadURL)
                var imgElement = document.getElementById('imageLink');
                imgElement.value = downloadURL;
                console.log(imgElement.value);
            });

    });
    z

    function resultImage() {
        console.log('image resulte -->', image)
        return image;
    }
</script>

</body>

</html>