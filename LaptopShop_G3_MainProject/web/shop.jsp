<%-- 
    Document   : Shop.jsp
    Created on : May 26, 2024, 8:52:18 AM
    Author     : VietAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>EShopper - Bootstrap Shop Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>

        <!-- Topbar Start -->
        <div class="container-fluid">
            <div class="row bg-secondary py-2 px-xl-5">
                <div class="col-lg-6 d-none d-lg-block">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-dark" href="">FAQs</a>
                        <span class="text-muted px-2">|</span>
                        <a class="text-dark" href="">Help</a>
                        <span class="text-muted px-2">|</span>
                        <a class="text-dark" href="">Support</a>
                    </div>
                </div>
                <div class="col-lg-6 text-center text-lg-right">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a class="text-dark pl-2" href="">
                            <i class="fab fa-youtube"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row align-items-center py-3 px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a href="" class="text-decoration-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold">
                            ><img class="img-icon" src="img/laptop.jpg" alt="" />
                            Laptop
                        </h1>
                    </a>
                </div>

                <!-- Search product by name -->
                <div class="col-lg-6 col-6 text-left">
                    <form action="searchProduct" method="GET">
                        <div class="input-group">
                            <input
                                type="text"
                                class="form-control"
                                placeholder="Search for products"
                                name="key"
                                value="${param.key}"

                                />
                            <div class="input-group-append">
                                <span class="input-group-text bg-transparent text-primary">
                                    <i class="fa fa-search"></i>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>


                <div class="col-lg-3 col-6 text-right">
                    <a href="" class="btn border">
                        <i class="fas fa-heart text-primary"></i>
                        <span class="badge">0</span>
                    </a>
                    <a href="cart" class="btn border">
                        <i class="fas fa-shopping-cart text-primary"></i>
                        <span class="badge">
                            <c:choose>
                                <c:when test="${not empty sessionScope.cart.items}">
                                    ${fn:length(sessionScope.cart.items)}
                                </c:when>
                                <c:otherwise>
                                    0
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </a>
                </div>
            </div>
        </div>
        <!-- Topbar End -->

        <!-- Navbar Start -->
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                        <h6 class="m-0">Categories</h6>
                        <i class="fa fa-angle-down text-dark"></i>
                    </a>
                    <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
                        <div class="navbar-nav w-100 overflow-hidden" style="height: 250px">
                            <c:forEach items="${listCategory}" var="cate">
                                <a href="category?cid=${cate.categoryID}" class="nav-item nav-link">${cate.categoryName}</a>
                            </c:forEach>
                        </div>
                    </nav>
                </div>


                <div class="col-lg-9">
                    <nav
                        class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0"
                        >
                        <a href="" class="text-decoration-none d-block d-lg-none">
                            <h1 class="m-0 display-5 font-weight-semi-bold">
                                <span class="text-primary font-weight-bold border px-3 mr-1"
                                      >E</span
                                >Shopper
                            </h1>
                        </a>
                        <button
                            type="button"
                            class="navbar-toggler"
                            data-toggle="collapse"
                            data-target="#navbarCollapse"
                            >
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div
                            class="collapse navbar-collapse justify-content-between"
                            id="navbarCollapse"
                            >
                            <div class="navbar-nav mr-auto py-0">
                                <a href="home" class="nav-item nav-link active">Home</a>
                                <a href="home" class="nav-item nav-link">Shop</a>
                                <a href="lstblogtype" class="nav-item nav-link">Blog</a>

                                <c:if test="${sessionScope.user != null and sessionScope.user.role_id eq '3'}">
                                    <div class="nav-item dropdown">
                                        <a
                                            href="home"
                                            class="nav-link dropdown-toggle"
                                            data-toggle="dropdown"
                                            >Sale</a
                                        >
                                        <div class="dropdown-menu rounded-0 m-0">
                                            <a href="orderList" class="dropdown-item">Order Processing</a>
                                            <a href="importGoods.jsp" class="dropdown-item">Import Goods</a>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.user != null and sessionScope.user.role_id eq '2'}">
                                    <a href="dashboard.jsp" class="nav-item nav-link">DashBoard</a>
                                </c:if>
                                <c:if test="${sessionScope.user != null and sessionScope.user.role_id eq '1'}">
                                    <a href="Admin.jsp" class="nav-item nav-link">Admin</a>
                                </c:if>
                            </div>
                            <c:if test="${empty sessionScope.user}">
                                <div class="navbar-nav ml-auto py-0">
                                    <a href="login" class="nav-item nav-link">Login</a>
                                    <a href="signup" class="nav-item nav-link">Register</a>
                                </div>
                            </c:if>
                            <c:if test="${not empty sessionScope.user}">
                                <div class="navbar-nav ml-auto py-0">
                                    <a href="profile" class="nav-item nav-link">${sessionScope.user.user_name}</a>
                                    <c:choose>
                                        <c:when test="${sessionScope.user.role_id eq '3'}">
                                            <c:if test="${sessionScope.user != null and sessionScope.user.role_id eq '3'}">
                                                <div class="nav-item dropdown">
                                                    <a
                                                        href="home"
                                                        class="nav-link dropdown-toggle"
                                                        data-toggle="dropdown"
                                                        >Task manager</a
                                                    >
                                                    <div class="dropdown-menu rounded-0 m-0">
                                                        <a href="orderList" class="dropdown-item">Order Processing</a>
                                                        <a href="importGoods" class="dropdown-item">Import Goods</a>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:when>
                                        <c:when test="${sessionScope.user.role_id eq '4'}">
                                            <a href="myOrder" class="nav-item nav-link">My Order</a>
                                        </c:when>
                                        <c:otherwise>
                                        </c:otherwise>
                                    </c:choose>
                                    <a href="logout" class="nav-item nav-link">Logout</a>
                                </div>
                            </c:if>
                        </div>
                    </nav>
                    <!-- Page Header -->
                    <div id="header-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <c:forEach items="${sliders}" var="sl" varStatus="index">
                                <div class="carousel-item ${index.index == 0 ? "active" : ""}" style="height: 410px">
                                    <img class="img-fluid" src="${sl.image}" alt="Image" />
                                    <div
                                        class="carousel-caption d-flex flex-column align-items-center justify-content-center"
                                        >
                                        <div class="p-3" style="max-width: 700px">
                                            <h4
                                                class="text-light text-uppercase font-weight-medium mb-3"
                                                >
                                                10% Off Your First Order
                                            </h4>
                                            <h3 class="display-4 text-white font-weight-semi-bold mb-4">
                                                ${sl.title}
                                            </h3>
                                            <a href="${sl.backlink}" class="btn btn-light py-2 px-3">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <c:if test="${sliders.size() == 0}">
                                <div class="carousel-item active" style="height: 410px">
                                    <img class="img-fluid" src="https://www.vlance.vn/download/portfolio/44292" alt="Image" />
                                    <div
                                        class="carousel-caption d-flex flex-column align-items-center justify-content-center"
                                        >
                                        <div class="p-3" style="max-width: 700px">
                                            <h4
                                                class="text-light text-uppercase font-weight-medium mb-3"
                                                >
                                                10% Off Your First Order
                                            </h4>
                                            <h3 class="display-4 text-white font-weight-semi-bold mb-4">
                                                Laptop gaming
                                            </h3>
                                            <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item" style="height: 410px">
                                    <img class="img-fluid" src="https://cdn.tgdd.vn/Files/2019/08/08/1185458/8-chiengametothon_800x450.jpg" alt="Image" />
                                    <div
                                        class="carousel-caption d-flex flex-column align-items-center justify-content-center"
                                        >
                                        <div class="p-3" style="max-width: 700px">
                                            <h4
                                                class="text-light text-uppercase font-weight-medium mb-3"
                                                >
                                                10% Off Your First Order
                                            </h4>
                                            <h3 class="display-4 text-white font-weight-semi-bold mb-4">
                                                office laptop
                                            </h3>
                                            <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                        <a
                            class="carousel-control-prev"
                            href="#header-carousel"
                            data-slide="prev"
                            >
                            <div class="btn btn-dark" style="width: 45px; height: 45px">
                                <span class="carousel-control-prev-icon mb-n2"></span>
                            </div>
                        </a>
                        <a
                            class="carousel-control-next"
                            href="#header-carousel"
                            data-slide="next"
                            >
                            <div class="btn btn-dark" style="width: 45px; height: 45px">
                                <span class="carousel-control-next-icon mb-n2"></span>
                            </div>
                        </a>
                    </div>


                </div>
            </div>
        </div>
        <!-- Navbar End -->





        <div class="container-fluid pt-5">
            <div class="row px-xl-5">
                <!-- Shop Sidebar Start -->
                <div class="col-lg-3 col-md-12">
                    <!-- Warranty Start -->
                    <div class="border-bottom mb-4 pb-4">
                        <h5 class="font-weight-semi-bold mb-4">Filter by warranty</h5>
                        <form>
                            <c:forEach var="product" items="${listWarranty}">
                                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input type="checkbox" class="custom-control-input" id="${product.warranty}"  name="warranty" value="${product.warranty}"/>
                                    <label class="custom-control-label" for="${product.warranty}">${product.warranty} Month</label>
                                    <span class="badge border font-weight-normal">${countW[product.warranty]}</span>
                                </div>
                            </c:forEach>
                            <button type="submit" class="btn btn-primary">Filter</button>
                        </form>
                    </div>
                    <!-- Warranty End -->

                    <!-- Brand Start -->
                    <div class="border-bottom mb-4 pb-4">
                        <h5 class="font-weight-semi-bold mb-4">Filter by brand</h5>
                        <form>
                            <c:forEach var="brand" items="${listBrand}">
                                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input type="checkbox" class="custom-control-input" id="${brand.id}"  name="brand" value="${brand.id}"/>
                                    <label class="custom-control-label" for="${brand.id}">${brand.name}</label>
                                    <span class="badge border font-weight-normal">${countP[brand.id]}</span>
                                </div>
                            </c:forEach>
                            <button type="submit" class="btn btn-primary">Filter</button>
                        </form>
                    </div>
                    <!-- Brand End -->

                    <!-- Color Start -->
                    <div class="mb-5">
                        <h5 class="font-weight-semi-bold mb-4">Filter by color</h5>
                        <form>
                            <c:forEach var="product" items="${listColor}">
                                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input type="checkbox" class="custom-control-input" id="${product.color}"  name="color" value="${product.color}"/>
                                    <label class="custom-control-label" for="${product.color}">${product.color}</label>
                                    <span class="badge border font-weight-normal">${countC[product.color]}</span>
                                </div>
                            </c:forEach>
                            <button type="submit" class="btn btn-primary">Filter</button>
                        </form>
                    </div>
                    <!-- Color End -->
                </div>
                <!-- Shop Sidebar End -->


                <!-- Shop Product Start -->
                <div class="col-lg-9 col-md-12">
                    <div class="row pb-3">
                        <div class="col-12 pb-1">
                            <div class="d-flex align-items-center justify-content-between mb-4">

                                <!-- Search product by name -->
                                <form action="home" method="POST">
                                    <div class="input-group">
                                        <input name="txt" type="text" class="form-control" placeholder="Search by name">
                                        <div class="input-group-append">
                                            <span class="input-group-text bg-transparent text-primary">
                                                <i class="fa fa-search"></i>
                                            </span>
                                        </div>
                                    </div>
                                </form>
                                <div class="dropdown ml-4">
                                    <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                        Sort by
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                        <a class="dropdown-item" href="home?sort=asc">Ascending price</a>
                                        <a class="dropdown-item" href="home?sort=desc">Descending price</a>
                                    </div>
                                </div>
                            </div>
                        </div>







                        <c:forEach var="product" items="${products}">
                            <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                                <div class="card product-item border-0 mb-4">
                                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                        <img class="img-fluid w-100" src="${product.image}" alt="">
                                    </div>
                                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                        <h6 class="text-truncate mb-3">${product.name}</h6>
                                        <div class="d-flex justify-content-center">
                                            <h6 style="color: red">$${product.salePrice}</h6><h6 class="text-muted ml-2"><del>$${product.price}</del></h6>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between bg-light border">
                                        <a href="detail?code=${product.id}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                        <a href="addCart?laptopID=${product.id}" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>












                        <div class="col-12 pb-1">
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center mb-3">
                                    <c:if test="${currentPage > 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="?page=${currentPage - 1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:forEach var="i" begin="1" end="${totalPages}">
                                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                                            <a class="page-link" href="?page=${i}&sort=${param.sort}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${currentPage < totalPages}">
                                        <li class="page-item">
                                            <a class="page-link" href="?page=${currentPage + 1}&sort=${param.sort}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                <!-- Shop Product End -->
            </div>
        </div>
        <!-- Shop End -->


        <!-- Footer Start -->
        <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
            <div class="row px-xl-5 pt-5">
                <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                    <a href="" class="text-decoration-none">
                        <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <p>Dolore erat dolor sit lorem vero amet. Sed sit lorem magna, ipsum no sit erat lorem et magna ipsum dolore amet erat.</p>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>
                            <form action="">
                                <div class="form-group">
                                    <input type="text" class="form-control border-0 py-4" placeholder="Your Name" required="required" />
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                                           required="required" />
                                </div>
                                <div>
                                    <button class="btn btn-primary btn-block border-0 py-3" type="submit">Subscribe Now</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row border-top border-light mx-xl-5 py-4">
                <div class="col-md-6 px-xl-0">
                    <p class="mb-md-0 text-center text-md-left text-dark">
                        &copy; <a class="text-dark font-weight-semi-bold" href="#">Your Site Name</a>. All Rights Reserved. Designed
                        by
                        <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com">HTML Codex</a><br>
                        Distributed By <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
                    </p>
                </div>
                <div class="col-md-6 px-xl-0 text-center text-md-right">
                    <img class="img-fluid" src="img/payments.png" alt="">
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>
