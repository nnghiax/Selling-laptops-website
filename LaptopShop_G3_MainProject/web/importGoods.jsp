<%-- 
    Document   : importGoods
    Created on : Jul 20, 2024, 12:32:22 AM
    Author     : vutie
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Import Goods</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="img/favicon.ico" rel="icon">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
                            <img class="img-icon" src="img/laptop.jpg" alt="" />
                            Laptop
                        </h1>
                    </a>
                </div>
                <div class="col-lg-6 col-6 text-left">
                    <form action="Home" method="GET">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for products" name="charProduct" value="${param.SearchProductByName}">
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
                                <c:otherwise>0</c:otherwise>
                            </c:choose>
                        </span>
                    </a>
                </div>
            </div>
        </div>
        <!-- Topbar End -->
        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Import Goods</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="home">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Import Goods</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->

        <!-- Import Goods -->
        <div class="container-fluid pt-5">
            <c:if test="${not empty sessionScope.message}">
                <div>
                    <h4 class="alert alert-success">${sessionScope.message}</h2>
                </div>
            </c:if>
            <c:if test="${not empty sessionScope.error}">
                <div>
                    <h5 class="alert alert-danger">${sessionScope.error}</h5>
                </div>
            </c:if>
            <div class="row px-xl-5">
                <div class="col-lg-9 mb-5">
                    <form action="importGoods" method="POST">
                        <div class="form-group">
                            <label for="productSelect">Select Product:</label>
                            <select class="form-control" id="productSelect" name="productID" onchange="fetchProductDetails()">
                                <option value="">Select a product</option>
                                <c:forEach var="product" items="${productList}">
                                    <option value="${product.id}">${product.id} - ${product.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="productSerials">Enter Product Serials (one per line):</label>
                            <textarea class="form-control" id="productSerials" name="productSerials" rows="10"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
                <div class="col-lg-3 mb-5">
                    <div id="productDetails" class="mb-3">
                        <!--product detail -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Import Goods End -->

        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>
        <script src="js/main.js"></script>
        <script>
                                function fetchProductDetails() {
                                    var productId = document.getElementById("productSelect").value;
                                    if (productId) {
                                        $.ajax({
                                            url: 'importGoods', // Servlet URL
                                            type: 'GET',
                                            data: {productId: productId},
                                            dataType: 'json',
                                            success: function (product) {
                                                var productDetailsHtml = '<div class="card product-item border-danger mb-4">';
                                                productDetailsHtml += '<div class="card-header position-relative border p-0">';
                                                productDetailsHtml += '<img class="img-fluid w-100" src="' + product.image + '" alt="">';
                                                productDetailsHtml += '<div class="card-body border-left border-right text-center p-0 pt-4 pb-3">';
                                                productDetailsHtml += '<h6 class="text-truncate mb-3">' + product.name + '</h6>';
                                                productDetailsHtml += '<div class="d-flex justify-content-center">';
                                                productDetailsHtml += '<h6 style="color: red">' + product.id + '</h6>';
                                                productDetailsHtml += '</div>';
                                                productDetailsHtml += '</div>';
                                                productDetailsHtml += '</div>';
                                                $('#productDetails').html(productDetailsHtml);
                                            },
                                            error: function () {
                                                $('#productDetails').html('<p>Error fetching product details.</p>');
                                            }
                                        });
                                    } else {
                                        $('#productDetails').html('');
                                    }
                                }
        </script>
    </body>
</html>


