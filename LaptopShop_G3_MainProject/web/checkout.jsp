<%-- 
    Document   : checkout
    Created on : Jun 3, 2024, 11:24:59 AM
    Author     : vutie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Checkout</title>
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
                            >
                            <img class="img-icon" src="img/laptop.jpg" alt=""/>
                            Laptop
                        </h1>
                    </a>
                </div>

                <!-- Search product by name -->
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
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Check Out</h1>
                <div class="d-inline-flex">
                    <p class="m-0 px-2"><a href="home">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0 px-2"><a href="cart">Shopping Cart</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Check Out</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->

        <!-- Checkout Start -->
        <div class="container-fluid">
            <form action="checkout" method="POST" id="checkout-form" id="checkout-form">
                <div class="row px-xl-5">
                    <div class="col-lg-6 mb-5">
                        <div class="bg-light p-30 mb-5">
                            <h2 class="font-weight-semi-bold mb-4">Address</h2>
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label>Full Name</label>
                                    <input class="form-control" type="text" name="fullName" placeholder="Full Name" required value="${sessionScope.customerInfo.name}">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Phone</label>
                                    <input class="form-control" type="text" name="phone" placeholder="Phone" required value="${sessionScope.customerInfo.phone}">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Province / City</label>
                                    <select class="form-control" id="city" name="city" required>
                                        <option value="">Select City</option>
                                    </select>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>District / District</label>
                                    <select class="form-control" id="district" name="district" equired>
                                        <option value="">Select District</option>
                                    </select>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Ward / Commune</label>
                                    <select class="form-control" id="ward" name="ward" required>
                                        <option value="">Select Ward</option>
                                    </select>
                                </div>
                                <div class="col-md-12 form-group">
                                    <label>Detail Address</label>
                                    <input class="form-control" type="text" name="detailAddress" placeholder="Example: 1 Thai Ha" required value="${sessionScope.customerInfo.detailAddress}">
                                    <small class="form-text text-muted">Please only enter house number and street name.</small>
                                </div>
                            </div>

                            <div class="bg-light p-30 mb-5">
                                <h2 class="font-weight-semi-bold mb-4">Payment Methods</h2>
                                <div class="form-group">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" id="Card" name="paymentMethod" value="Card" required>
                                        <label class="custom-control-label" for="Card">Visa - Master Card</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" id="VnPay" name="paymentMethod" value="VnPay" required>
                                        <label class="custom-control-label" for="VnPay">VnPay</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" id="Cash" name="paymentMethod" value="Cash" required>
                                        <label class="custom-control-label" for="Cash">Cash</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 mb-5">
                        <div class="card border-secondary mb-5">
                            <div class="card-header bg-secondary border-0">
                                <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                            </div>
                            <div class="col-lg-12 mt-3 table-responsive mb-5">
                                <c:if test="${not empty sessionScope.cart.items}">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Product</th>
                                                <th>Quantity</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${sessionScope.cart.items}">
                                                <tr>
                                                    <td><img src="${item.cartProduct.img}" alt="" style="width: 50px;"></td>
                                                    <td>${item.cartProduct.name}</td>
                                                    <td class="text-center">${item.quantity}</td>
                                                    <td class="total">$${item.price * item.quantity}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>
                                <c:if test="${empty sessionScope.cart.items}">
                                    <p>Your cart is empty</p>
                                </c:if>
                            </div>

                            <c:set var="totalPrice" value="0" />
                            <c:forEach var="item" items="${sessionScope.cart.items}">
                                <c:set var="totalPrice" value="${totalPrice + (item.price * item.quantity)}" />
                            </c:forEach>

                            <div class="card-body">
                                <div class="d-flex justify-content-between mb-3 pt-1">
                                    <h6 class="font-weight-medium">Subtotal</h6>
                                    <h6 class="font-weight-medium">$<c:out value="${totalPrice}" /></h6>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <h6 class="font-weight-medium">Shipping</h6>
                                    <h6 class="font-weight-medium" id="shippingFee">$0</h6>
                                </div>
                            </div>
                            <div class="card-footer border-secondary bg-transparent">
                                <div class="d-flex justify-content-between mt-2">
                                    <h5 class="font-weight-bold">Total</h5>
                                    <h5 class="font-weight-bold" id="totalAmount">$<c:out value="${totalPrice}" /></h5>
                                </div>
                                <input type="hidden" name="totalPrice" id="hiddenTotalPrice" value="${totalPrice}">
                                <input type="hidden" name="shippingFee" id="hiddenShippingFee" value="0">
                                <button type="submit" class="btn btn-block btn-primary my-3 py-3">Process Payment</button>
                                <input type="hidden" id="cityName" name="cityName">
                                <input type="hidden" id="districtName" name="districtName">
                                <input type="hidden" id="wardName" name="wardName">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- Checkout End -->

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
        <script src="js/address.js"></script>
    </body>
</html>
