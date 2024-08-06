<%-- 
    Document   : detail
    Created on : May 26, 2024, 10:08:06 AM
    Author     : VietAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="getFeedback" class="model.CalculateFeedback" />
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
        <style>
            .rating {
                display: flex;
                cursor: pointer;
            }

            .star {
                font-size: 1.5em;
                color: #ccc;
            }

            .star.filled {
                color: #f1c40f;
            }

            .star:hover,
            .star:hover ~ .star {
                color: #f1c40f;
            }
        </style>
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
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                    </a>
                </div>
                <div class="col-lg-6 col-6 text-left">
                    <form action="">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for products">
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
                    <a href="" class="btn border">
                        <i class="fas fa-shopping-cart text-primary"></i>
                        <span class="badge">0</span>
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
                        <div class="navbar-nav w-100 overflow-hidden" style="height: 270px">
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
                                <a href="detail.html" class="nav-item nav-link">Shop Detail</a>
                                <a href="lstblogtype" class="nav-item nav-link">Blog</a>
                                <div class="nav-item dropdown">
                                    <a
                                        href="#"
                                        class="nav-link dropdown-toggle"
                                        data-toggle="dropdown"
                                        >Pages</a
                                    >
                                    <div class="dropdown-menu rounded-0 m-0">
                                        <a href="cart.html" class="dropdown-item">Shopping Cart</a>
                                        <a href="checkout.html" class="dropdown-item">Checkout</a>
                                    </div>
                                </div>
                                <a href="contact.html" class="nav-item nav-link">Contact</a>
                            </div>
                            <div class="navbar-nav ml-auto py-0">
                                <a href="" class="nav-item nav-link">Login</a>
                                <a href="" class="nav-item nav-link">Register</a>
                            </div>
                        </div>
                    </nav>

                    <!-- Page Header -->
                    <div id="header-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
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


        <!-- Shop Detail Start -->
        <div class="container-fluid py-5">
            <div class="row px-xl-5">
                <div class="col-lg-5 pb-5">
                    <div id="product-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner border">
                            <c:forEach var="img" items="${detailProduct.productImg}">
                                <div class="carousel-item ${img == detailProduct.productImg[0] ? 'active' : ''}">
                                    <img class="w-100 h-100" src="${img.img_url}" alt="Product Image">
                                </div>
                            </c:forEach>
                        </div>
                        <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                            <i class="fa fa-2x fa-angle-left text-dark"></i>
                        </a>
                        <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                            <i class="fa fa-2x fa-angle-right text-dark"></i>
                        </a>
                    </div>
                </div>



                <div class="col-lg-7 pb-5">
                    <h3 class="font-weight-semi-bold">${detailProduct.name}</h3>
                    <div class="d-flex mb-3">
                        <p class = "text-dark font-weight-medium mb-0 mr-3">Product Code: ${detailProduct.id} </p>
                        <c:set var="totalStar" value="${getFeedback.totalStar(feedbacks)}" />
                        <div class="text-primary mr-2">
                            <c:choose>
                                <c:when test="${totalStar > 0}">
                                    <c:forEach var="i" begin="1" end="${getFeedback.floor(totalStar)}">
                                        <small class="fas fa-star"></small>
                                    </c:forEach>

                                    <c:if test="${totalStar - getFeedback.floor(totalStar) >= 0.5}">
                                        <small class="fas fa-star-half-alt"></small>
                                    </c:if>
                                    <c:forEach var="i" begin="${getFeedback.floor(totalStar) + (totalStar - getFeedback.floor(totalStar) >= 0.5 ? 1 : 0)}" end="4">
                                        <small class="far fa-star"></small>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="i" begin="0" end="4">
                                        <small class="far fa-star"></small>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <small class="pt-1">(${feedbacks.size()} Reviews)</small>
                    </div>
                    <h3 class="font-weight-semi-bold mb-4" style="color: red">$${detailProduct.salePrice}</h3>

                    <div class="d-flex mb-3">
                        <p class="text-dark font-weight-medium mb-0 mr-3">CPU: ${detailProduct.productDetail.cpu}</p>
                    </div>


                    <div class="d-flex mb-3">
                        <p class="text-dark font-weight-medium mb-0 mr-3">Ram:   ${detailProduct.productDetail.ram}</p>
                    </div>


                    <div class="d-flex mb-3">
                        <p class="text-dark font-weight-medium mb-0 mr-3">Storage:  ${detailProduct.productDetail.storage}</p>
                    </div>




                    <div class="d-flex mb-3">
                        <p class="text-dark font-weight-medium mb-0 mr-3">GPU: ${detailProduct.productDetail.gpu}</p>
                    </div>


                    <div class="d-flex mb-3">
                        <p class="text-dark font-weight-medium mb-0 mr-3">Screen:  ${detailProduct.productDetail.screen}</p>
                    </div>


                    <div class="d-flex mb-3">
                        <p class="text-dark font-weight-medium mb-0 mr-3">Battery: ${detailProduct.productDetail.battery}</p>
                    </div>



                    <div class="d-flex mb-3">
                        <p class="text-dark font-weight-medium mb-0 mr-3">Weight: ${detailProduct.productDetail.weight}</p>
                    </div>



                    <div class="d-flex mb-3">
                        <p class="text-dark font-weight-medium mb-0 mr-3">Color: ${detailProduct.productDetail.color}</p>

                    </div>


                    <div class="d-flex align-items-center mb-4 pt-2">
                        <div class="input-group quantity mr-3" style="width: 130px;">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-minus" >
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input type="text" class="form-control bg-secondary text-center" value="1">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-plus">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <a href="addCart?laptopID=${detailProduct.id}"><button class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i> Add To Cart</button></a>

                    </div>
                    <div class="d-flex pt-2">
                        <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
                        <div class="d-inline-flex">
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
                                <i class="fab fa-pinterest"></i>
                            </a>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row px-xl-5">
                <div class="col">
                    <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                        <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Information</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews (${feedbacks.size()})</a>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="tab-pane-1">
                            <h4 class="mb-3">Product Description</h4>
                            <p>${detailProduct.description}</p>
                        </div>
                        <div class="tab-pane fade" id="tab-pane-2">
                            <h4 class="mb-3">Additional Information</h4>
                            <p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam invidunt duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam. Dolore diam stet rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit rebum, diam kasd invidunt tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>
                            <div class="row">
                                <div class="col-md-6">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item px-0">
                                            Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                        </li>
                                    </ul> 
                                </div>
                                <div class="col-md-6">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item px-0">
                                            Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                        </li>
                                    </ul> 
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tab-pane-3">
                            <div class="row">
                                <div class="col-md-6">
                                    <h4 class="mb-4">${feedbacks.size()} review for "${detailProduct.id}"</h4>

                                    <div class="btn-group mb-4" role="group" aria-label="Filter by stars">
                                        <button type="button" class="btn btn-primary" onclick="filterByStars(5)">5 Stars</button>
                                        <button type="button" class="btn btn-primary" onclick="filterByStars(4)">4 Stars</button>
                                        <button type="button" class="btn btn-primary" onclick="filterByStars(3)">3 Stars</button>
                                        <button type="button" class="btn btn-primary" onclick="filterByStars(2)">2 Stars</button>
                                        <button type="button" class="btn btn-primary" onclick="filterByStars(1)">1 Star</button>
                                        <button type="button" class="btn btn-secondary" onclick="filterByStars(0)">All</button>
                                    </div>

                                    <div id="feedbacksContainer">
                                        <c:forEach items="${feedbacks}" var="feed">
                                            <div class="media mb-4 feedback" data-stars="${feed.star}">
                                                <img src="${feed.user.user_image}" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                                <div class="media-body">
                                                    <h6>${feed.user.user_name}<small> - <i>${feed.time}</i></small></h6>
                                                    <div class="text-primary mb-2">
                                                        <c:forEach begin="1" end="5" varStatus="status">
                                                            <i class="${status.index <= feed.star ? 'fas fa-star' : 'far fa-star'}"></i>
                                                        </c:forEach>
                                                    </div>
                                                    <p>${feed.comment}</p>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>

                                <script>
                                    function filterByStars(stars) {
                                        var feedbacks = document.querySelectorAll('.feedback');
                                        feedbacks.forEach(function (feedback) {
                                            var feedbackStars = feedback.getAttribute('data-stars');
                                            if (stars == 0 || feedbackStars == stars) {
                                                feedback.style.display = 'block';
                                            } else {
                                                feedback.style.display = 'none';
                                            }
                                        });
                                    }
                                </script>

                                <div class="col-md-6">
                                    <h4 class="mb-4">Leave a review</h4>
                                    <small>Your email address will not be published. Required fields are marked *</small>
                                    <c:if test="${user != null}">
                                        <c:if test="${isOrder == true}">
                                            <form action="feedback" method="post">
                                                <input type="hidden" name="productId" value="${detailProduct.id}" />
                                                <input type="hidden" name="feedbackId" value="${current.feedbackID}" />
                                                <input type="hidden" name="action" value="${current != null ? "edit" : "add"}" />
                                                <div class="d-flex my-3">
                                                    <p class="mb-0 mr-2">Your Rating * :</p>
                                                    <div class="rating text-primary">
                                                        <c:forEach var="i" begin="1" end="5">
                                                            <span class="star" data-value="${i}" 
                                                                  <c:if test="${current.star >= i}">class="filled"</c:if> >
                                                                      <i class="far fa-star"></i>
                                                                  </span>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                                <div class="form-group mb-0">
                                                    <p class="mb-0 mr-2">Comment * :</p>
                                                    <div class="">
                                                        <textarea cols="5" name="comment" value="Leave Your Review" class="form-control">${current.comment}</textarea>
                                                    </div>
                                                </div>
                                                <input type="hidden" name="rating" id="rating" value="${current.star}">
                                                <div class="form-group mb-0">
                                                    <input type="submit" value="Leave Your Review" class="btn btn-primary px-3">
                                                </div>
                                            </form>
                                        </c:if>
                                        <c:if test="${isOrder == false}">
                                            <a href="home" class="btn btn-primary">Shopping now to feedback</a>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${user == null}">
                                        <a href="login" class="btn btn-primary">Login to feedback</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Shop Detail End -->


        <!-- Products Start -->
        <div class="container-fluid py-5">
            <div class="text-center mb-4">
                <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
            </div>
            <div class="row px-xl-5">
                <div class="col">
                    <div class="owl-carousel related-carousel">


                        <c:forEach items="${AdditionProduct}" var="product">
                            <div class="card product-item border-0">
                                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                    <img class="img-fluid w-100" src="${product.image}" alt="">
                                </div>
                                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                    <h6 class="text-truncate mb-3">${product.name}</h6>
                                    <div class="d-flex justify-content-center">
                                        <h6>$${product.salePrice}</h6><h6 class="text-muted ml-2"><del>$${product.price}</del></h6>
                                    </div>
                                </div>
                                <div class="card-footer d-flex justify-content-between bg-light border">
                                    <a href="detail?code=${product.id}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                    <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
        <!-- Products End -->


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
        <script>
    const stars = document.querySelectorAll('.star');
    const ratingInput = document.getElementById('rating');
    let currentRating = ratingInput.value;

    stars.forEach(star => {
        star.addEventListener('mouseover', handleMouseOver);
        star.addEventListener('mouseout', handleMouseOut);
        star.addEventListener('click', handleClick);
    });

    function handleMouseOver(event) {
        const value = event.target.parentElement.getAttribute('data-value');
        fillStars(value);
    }

    function handleMouseOut() {
        fillStars(currentRating);
    }

    function handleClick(event) {
        const value = event.target.parentElement.getAttribute('data-value');
        currentRating = value;
        ratingInput.value = value;
        fillStars(value);
    }

    function fillStars(value) {
        stars.forEach(star => {
            if (star.getAttribute('data-value') <= value) {
                star.classList.add('filled');
            } else {
                star.classList.remove('filled');
            }
        });
    }

    fillStars(currentRating);
        </script>
    </body>

</html>


