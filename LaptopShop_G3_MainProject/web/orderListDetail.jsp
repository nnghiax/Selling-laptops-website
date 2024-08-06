<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Order Detail</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/dashboard.css" />
        <style>
            .equal-height {
                display: flex;
                flex-direction: column;
                height: 100%;
            }
            .large-text {
                font-size: 1.25rem; /* Adjust this value as needed */
            }
            .header-text {
                font-size: 1.5rem; /* Adjust this value as needed */
                font-weight: bold;
            }
            .equal-height-sections .card {
                display: flex;
                flex-direction: column;
            }
            .equal-height-sections .card-body {
                flex-grow: 0.5;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <!-- Page Header Start -->
            <div class="container-fluid bg-secondary mb-5">
                <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 100px">
                    <h1 class="font-weight-semi-bold text-uppercase mt-5 mb-3 header-text">Order Detail</h1>
                    <h4 class="mb-5"><a href="home">Home</a></h4>
                </div>
            </div>
            <!-- Page Header End -->

            <!-- Order Detail Start -->
            <div class="container-fluid">
                <form action="orderListDetail" method="post">
                    <div class="row px-xl-5">
                        <div class="col-lg-12 mb-5">
                            <div class="d-flex justify-content-between mb-4">
                                <div class="d-flex flex-column">
                                    <label class="font-weight-semi-bold large-text">Sale ID: ${orderListDetail.saleStaff}</label>
                                    <label class="font-weight-semi-bold large-text">Warehouse Sale ID: ${orderListDetail.whStaff}</label>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <div class="mb-4">
                                    <h4 class="font-weight-semi-bold m-0 large-text">Order ID: ${orderListDetail.id}</h4>
                                    <input type="hidden" name="orderId" value="${orderListDetail.id}">
                                    <input type="hidden" name="orderStatusID" value="${orderListDetail.statusID}">
                                    <p class="large-text">${orderListDetail.date}</p>
                                </div>
                                <div>
                                    <select class="form-select form-select-lg" id="id" name="status">
                                        <option value="1" ${orderListDetail.statusID == 1 ? 'selected' : ''}>Pending</option>
                                        <option value="2" ${orderListDetail.statusID == 2 ? 'selected' : ''}>Confirm</option>
                                        <option value="3" ${orderListDetail.statusID == 3 ? 'selected' : ''}>Shipping</option>
                                        <option value="4" ${orderListDetail.statusID == 4 ? 'selected' : ''}>Complete</option>
                                        <option value="5" ${orderListDetail.statusID == 5 ? 'selected' : ''}>Cancel</option>
                                    </select>
                                    <button type="submit" class="btn btn-success">Submit</button>
                                </div>
                            </div>
                            <div class="card border-dark text-dark bg-light mb-3 w-100">
                                <div class="card-header large-text">Order Item</div>
                                <div class="card-body">
                                    <c:forEach var="item" items="${orderListDetail.orderItem}">
                                        <div class="row mb-5 d-flex align-items-stretch">
                                            <div class="col-lg-12 d-flex align-items-stretch">
                                                <div class="card equal-height w-100 border-dark">
                                                    <div class="card-body">
                                                        <div class="d-flex align-items-center">
                                                            <img src="${item.productImg}" alt="" style="width: 200px;" class="pl-3">
                                                            <div class="w-100 ml-5 pl-5" style="text-align: left">
                                                                <h2>${item.productName}</h2>
                                                                <p class="m-0 med text-primary mb-3">Quantity: ${item.quantity}</p>
                                                                <input class="w-75 mt-2 large-text" type="text" name="serial_${item.orderDetailID}" placeholder="${item.serial == null ? 'Serial' : item.serial}" value="${item.serial != null ? item.serial : ''}"></p>
                                                                <input class="w-75 mt-2 large-text" type="text" name="note_${item.orderDetailID}" placeholder="${item.note == null ? 'Note' : item.note}" value="${item.note != null ? item.note : ''}"></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 mt-3 px-lg-5">
                            <div class="bg-light mb-5">
                                <div class="card border-danger w-100 pb-5">
                                    <div class="card-header">
                                        <h4 class="font-weight-semi-bold mt-2 header-text">Payment Information</h4>
                                    </div>
                                    <div class="card-body text-danger">
                                        <div class="d-flex justify-content-between mb-3">
                                            <h6 class="large-text">Total price:</h6>
                                            <h6 class="large-text">$${orderListDetail.totalPrice}</h6>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <h6 class="large-text">Shipping fee:</h6>
                                            <h6 class="large-text">Free</h6>
                                        </div>
                                        <div class="d-flex justify-content-between mt-2 pt-3" style="border-top: 2px solid black">
                                            <h6 class="large-text">Paid:</h6>
                                            <h6 class="large-text">$${orderListDetail.totalPrice}</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 mt-3 px-lg-5">
                            <div class="bg-light mb-5">
                                <div class="card border-success w-100 pb-5">
                                    <div class="card-header">
                                        <h4 class="font-weight-semi-bold mt-2 header-text">Customer Information</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between mb-3">
                                            <h6 class="large-text">Name:</h6>
                                            <h6 class="large-text">${orderListDetail.customer.name}</h6>
                                        </div>
                                        <div class="d-flex justify-content-between mb-3">
                                            <h6 class="large-text">Phone:</h6>
                                            <h6 class="large-text">${orderListDetail.customer.phone}</h6>
                                        </div>
                                        <div class="d-flex justify-content-between" style="text-align: right">
                                            <h6 class="large-text">Address:</h6>
                                            <h6 class="large-text">${orderListDetail.customer.address}</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!-- Order Detail End -->
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>                             
        <!-- JavaScript Libraries -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>
