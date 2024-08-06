<%-- 
    Document   : completion
    Created on : Jun 17, 2024, 5:16:51 PM
    Author     : vutie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Order Completion</title>
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
                    <a href="home" class="text-decoration-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold">
                            >
                            <img class="img-icon" src="img/laptop.jpg" alt=""/>
                            Laptop
                        </h1>
                    </a>
                </div>
                <div class="col-lg-6 col-6 text-left">
                    <form action="Home" method="GET">
                        <div class="input-group">
                            <input
                                type="text"
                                class="form-control"
                                placeholder="Search for products"
                                name="charProduct"
                                value="${param.SearchProductByName}"
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
                        <span class="badge">0</span>
                    </a>
                </div>
            </div>
        </div>
        <!-- Topbar End -->

        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Order Confirmation</h1>
                <div class="d-inline-flex">
                    <p class="m-0 px-2"><a href="home">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0 px-2">Order Completion</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->

        <!-- Order Confirmation Start -->
        <div class="container">
            <div class="card shadow-sm mb-5">
                <div class="card-body">
                    <div class="order-details mt-4">
                        <p><span class="info-label">Order ID:</span> <strong>${sessionScope.orderID}</strong></p>
                        <p><span class="info-label">Name:</span> <strong>${sessionScope.customerName}</strong></p>
                        <p><span class="info-label">Phone:</span> <strong>${sessionScope.customerPhone}</strong></p>
                        <p><span class="info-label">Address:</span> <strong>${sessionScope.customerAddress}</strong></p>
                        <p><span class="info-label">Payment</span><strong>${sessionScope.paymentMethod}</strong>
                        <p><span class="info-label">ShippingFee</span><strong>${sessionScope.shippingFee}</strong>
                        <p><span class="info-label">Status</span><strong>${sessionScope.statusID}</strong>
                        <p><span class="info-label">Date</span><strong>${sessionScope.orderDate}</strong>
                    </div>
                    <div class="summary mt-3">
                        <p><span class="info-label">Total Amount:</span> <strong>$${sessionScope.totalPrice}</strong></p>
                    </div>
                    <div class="mt-3">
                        <p class="text-danger font-weight-bold">Please keep your phone available. Our staff will contact you within 15 minutes to confirm your order.</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Order Confirmation End -->
    </body>
</html>