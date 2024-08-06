<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Order List</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/orderLists-style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/dashboard.css" />

        <style>
            .table{
                table-layout: fixed;
                width: 100%;
            }
            .table th,
            .table td {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                text-align: center;
            }

            .table th.product,
            .table td.product {
                width: 40%;
                text-align: left;
            }

            .table th.total-price,
            .table td.total-price,
            .table th.payment-method,
            .table td.payment-method,
            .table th.status,
            .table td.status,
            .table th.view-details,
            .table td.view-details {
                width: 15%;
            }

        </style>
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
                            ><img class="img-icon" src="img/laptop.jpg" alt="" />
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
                                
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Order List</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="home">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Order Processing</p>
                </div>
            </div>
        </div>
                                
        <div class="row px-xl-5 mt-5">
            <div class="col-12">
                <div class="d-flex justify-content-between mb-3">
                    <div class="input-group mb-3 w-50">
                        <form action="orderList" method="get" class="form-inline">
                            <input type="text" class="form-control" placeholder="Search" name="searchTerm">
                            <div class="input-group-append">
                                <button class="btn btn-danger" type="submit">Search</button>
                            </div>
                        </form>
                    </div>
                    <div class="input-group mb-3 w-50">
                        <form action="orderList" method="get" class="form-inline">
                            <div class="input-group">
                                <select class="custom-select" id="status" name="status">
                                    <option value="All">All</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Confirm">Confirm</option>
                                    <option value="Shipping">Shipping</option>
                                    <option value="Complete">Complete</option>
                                    <option value="Cancel">Cancel</option>
                                </select>
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="submit">Filter</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <c:if test="${not empty sessionScope.message}">
                    <div class="alert alert-success">
                        ${sessionScope.message}
                    </div>
                    <c:remove var="message" scope="session" />
                </c:if>
                <c:forEach var="orderList" items="${orderList}">
                    <div class="mb-5">
                        <table class="table">
                            <thead class="table-border">
                                <tr style="font-size: large" class="table-primary">
                                    <th colspan="2" class="text-uppercase text-dark" style="text-align: left"><strong>${orderList.customer.name} - ${orderList.customer.phone}</strong></th>
                                    <th class="text-uppercase text-danger" style="text-align: right"><strong>${orderList.date}</strong></th>
                                    <th colspan="3" style="text-align: right"
                                        class="text-uppercase text-danger"><strong>OrderID: ${orderList.id}</strong></th>
                                </tr>
                                <tr style="font-size: medium" class="table-secondary">
                                    <th class="product" colspan="2">Product</th>
                                    <th class="total-price">Total Price</th>
                                    <th class="payment-method">Payment Method</th>
                                    <th class="status">Status</th>
                                    <th class="view-details">View Details</th>
                                </tr>
                            </thead>
                            <tbody class="table-bordered">
                                <c:forEach var="item" items="${orderList.orderItem}" varStatus="status">
                                    <tr style="font-size: large">
                                        <td class="product" colspan="2">
                                            <img src="${item.productImg}" alt="" style="width: 50px;">
                                            ${item.productName}
                                        </td>
                                        <c:if test="${status.first}">
                                            <td rowspan="${orderList.orderItem.size()}"
                                                class="total-price align-middle text-center">${orderList.totalPrice}</td>
                                            <td rowspan="${orderList.orderItem.size()}"
                                                class="payment-method align-middle text-center">${orderList.paymentMethod}</td>
                                            <c:choose>
                                                <c:when test="${orderList.statusID == 1}">
                                                    <td rowspan="${orderList.orderItem.size()}"
                                                        class="status align-middle text-center bg-warning text-dark">${orderList.status}</td>
                                                </c:when>
                                                <c:when test="${orderList.statusID == 2}">
                                                    <td rowspan="${orderList.orderItem.size()}"
                                                        class="status align-middle text-center bg-info text-white">${orderList.status}</td>
                                                </c:when>
                                                <c:when test="${orderList.statusID == 3}">
                                                    <td rowspan="${orderList.orderItem.size()}"
                                                        class="status align-middle text-center bg-secondary text-dark">${orderList.status}</td>
                                                </c:when>
                                                <c:when test="${orderList.statusID == 4}">
                                                    <td rowspan="${orderList.orderItem.size()}"
                                                        class="status align-middle text-center bg-success text-white">${orderList.status}</td>
                                                </c:when>
                                                <c:when test="${orderList.statusID == 5}">
                                                    <td rowspan="${orderList.orderItem.size()}"
                                                        class="status align-middle text-center bg-danger text-white">${orderList.status}</td>
                                                </c:when>
                                            </c:choose>
                                            <td rowspan="${orderList.orderItem.size()}"
                                                class="view-details align-middle text-center">
                                                <a href="orderListDetail?orderID=${orderList.id}"
                                                   class="btn btn-primary">View Details</a>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

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
