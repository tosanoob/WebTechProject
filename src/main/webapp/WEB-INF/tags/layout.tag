
<%@ tag language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Trường Đại học Bách Khoa - Đại học Đà Nẵng</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Ubuntu:wght@500;700&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner"
        class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Navbar Start -->
    <div class="container-fluid sticky-top bg-primary">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark p-0">
                <a href="index.jsp" class="navbar-brand">
                    <h1 class="text-white">DUT<span class="text-dark">.</span></h1>
                </a>
                <button type="button" class="navbar-toggler ms-auto me-0" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto">
                        <a href="index.jsp" class="nav-item nav-link">Trang chủ</a>
                        <a href="gioithieu.jsp" class="nav-item nav-link">Giới thiệu</a>
                        <a href="allbaidang" class="nav-item nav-link">Bài đăng</a>
                        <a href="nckh.jsp" class="nav-item nav-link">Nghiên cứu khoa học</a>
                        <a href="vitri.jsp" class="nav-item nav-link">Vị trí</a>
                        <%
                        	String username = (String) session.getAttribute("username");
							if (username == null){
								int a =0;
							
						%>
						<a href = "Login.jsp" class = "nav-item nav-link">Đăng nhập</a>
						<% }else{ %>
						<a href = "dangxuat" class = "nav-item nav-link">Đăng xuất</a>
						<%} %>
                    </div>
<!--                     <butaton type="button" class="btn text-white p-0 d-none d-lg-block" data-bs-toggle="modal" -->
<!--                         data-bs-target="#searchModal"><i class="fa fa-search"></i></butaton> -->
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->

	<!-- Cân nhắc tự thêm vào title? -->

    <!-- Hero Start -->
    <div class="container-fluid pt-5 bg-primary hero-header" style="width:100%;height:400px;background-image: url('img/HeaderIMG.jpg'); background-size: cover; background-repeat: no-repeat;">
<!--         <div class="overlay" style="background-color: rgba(#2e63b8, 0.3);"></div> -->
        <div class="container pt-5">
            <div class="row g-5 pt-5">
            <h1 class="text-center display-4 text-white mb-4 animated slideInRight">Trường Đại học Bách Khoa - Đại học Đà Nẵng</h1>
            </div>
        </div>
    </div>
    <!-- Hero End -->


    <!-- Full Screen Search Start -->
<!--     <div class="modal fade" id="searchModal" tabindex="-1"> -->
<!--         <div class="modal-dialog modal-fullscreen"> -->
<!--             <div class="modal-content" style="background: rgba(20, 24, 62, 0.7);"> -->
<!--                 <div class="modal-header border-0"> -->
<!--                     <button type="button" class="btn btn-square bg-white btn-close" data-bs-dismiss="modal" -->
<!--                         aria-label="Close"></button> -->
<!--                 </div> -->
<!--                 <div class="modal-body d-flex align-items-center justify-content-center"> -->
<!--                     <div class="input-group" style="max-width: 600px;"> -->
<!--                         <input type="text" class="form-control bg-transparent border-light p-3" -->
<!--                             placeholder="Type search keyword"> -->
<!--                         <button class="btn btn-light px-4"><i class="bi bi-search"></i></button> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
    <!-- Full Screen Search End -->


    <!-- Main -->

        	<jsp:doBody/>

    <!-- Main! -->
        

    <!-- Newsletter Start -->
    <div class="container-fluid bg-primary newsletter py-5" style="background-image: url('img/FooterIMG.jpg'); background-size: cover; background-repeat: no-repeat;">
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-md-5 ps-lg-0 pt-5 pt-md-0 text-start wow fadeIn" data-wow-delay="0.3s">
<!--                     <img class="img-fluid" src="img/FooterIMG.jpg" alt=""> -->
                </div>
                <div class="col-md-7 py-5 newsletter-text wow fadeIn" data-wow-delay="0.5s">
                    <div class="btn btn-primary rounded-pill text-white px-3 mb-3">Subscriptions</div>
                    <h1 class="text-white mb-4">Theo dõi tin tức</h1>
                    <div class="position-relative w-100 mt-3 mb-2">
                        <input class="form-control border-0 rounded-pill w-100 ps-4 pe-5" type="text"
                            placeholder="Enter Your Email" style="height: 48px;">
                        <button type="button" class="btn shadow-none position-absolute top-0 end-0 mt-1 me-2"><i
                                class="fa fa-paper-plane text-primary fs-4"></i></button>
                    </div>
                    <small class="text-white-50">Nhận những cập nhật mới nhất từ chúng tôi</small>
                </div>
            </div>
        </div>
    </div>
    <!-- Newsletter End -->


    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-white-50 footer pt-5">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.1s">
                    <a href="index.jsp" class="d-inline-block mb-3">
                        <h1 class="text-white">DUT<span class="text-primary">.</span></h1>
                    </a>
                    <p class="mb-0">Trường Đại học Bách khoa với triết lý giáo dục Tư duy, sáng tạo, nuôi dưỡng lòng nhân ái đã hướng đến mục tiêu đào tạo ra những con người đầy trí tuệ, bản lĩnh;
                     có khả năng tư duy độc lập, biết sáng tạo những cái mới có ích, biết phê phán, phản biện và có một tấm lòng nhân ái,
                      biết yêu thương và quan tâm đến mọi người xung quanh, có trách nhiệm với Tổ quốc.</p>
                </div>
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.3s">
                    <h5 class="text-white mb-4">Địa chỉ</h5>
                    <p><i class="fa fa-map-marker-alt me-3"></i>54 Nguyễn Lương Bằng, Liên Chiểu, Đà Nẵng</p>
                    <p><i class="fa fa-phone-alt me-3"></i>+84 0236 3842308</p>
                    <p><i class="fa fa-envelope me-3"></i>tchc.dhbk@dut.udn.vn</p>
                    <div class="d-flex pt-2">
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-instagram"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.5s">
                    <h5 class="text-white mb-4">Tuyển sinh & Đào tạo</h5>
                    <a class="btn btn-link" href="">Thông tin tuyển sinh</a>
                    <a class="btn btn-link" href="">Đào tạo đại học</a>
                    <a class="btn btn-link" href="">Đào tạo sau đại học</a>
                    <a class="btn btn-link" href="">Đào tạo thường xuyên</a>
                    <a class="btn btn-link" href="">Văn bản pháp quy</a>
                </div>
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.7s">
                    <h5 class="text-white mb-4">Các liên kết khác</h5>
                    <a class="btn btn-link" href="">Thư viện</a>
                    <a class="btn btn-link" href="">E-learning</a>
                    <a class="btn btn-link" href="">Email</a>
                    <a class="btn btn-link" href="">Hệ thống thông tin sinh viên</a>
                    <a class="btn btn-link" href="">Hệ thống tác nghiệp</a>
                </div>
            </div>
        </div>
        <div class="container wow fadeIn" data-wow-delay="0.1s">
            <div class="copyright">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a class="border-bottom" href="#">dut.udn.vn</a>, Bản quyền Trường Đại học Bách Khoa - Đại học Đà Nẵng.

                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                        Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <div class="footer-menu">
                            <a href="">Home</a>
                            <a href="">Cookies</a>
                            <a href="">Help</a>
                            <a href="">FAQs</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top pt-2"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
