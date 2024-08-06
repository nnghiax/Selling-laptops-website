<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Order List</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/orderList-style.css" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid">
            <!-- Header Section (omitted for brevity) -->
            <!-- Your existing header code here -->
        </div>

        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Order Lists</h1>
                <div class="d-inline-flex">
                    <p class="m-0 px-2"><a href="home">Home</a></p>
                    <p class="m-0">-</p>
                    <p class="m-0 px-2">Order Lists</p>
                </div>
            </div>
        </div>

        <div class="container">
            <c:forEach var="order" items="${sessionScope.orderList}">
                <div class="order-card">
                    <div class="order-headers">
                        <p class="order-date">Order Date: ${order.date}</p>
                    </div>
                    <img src="${order.productImages}" alt="${order.productNames}">
                    <div class="order-details">
                        <a href="#"><h5>${order.productNames}</h5></a>
                                <c:choose>
                                    <c:when test="${order.otherProduct == 0}">
                                <p></p>
                            </c:when>
                            <c:otherwise>
                                <p> and other ${order.otherProduct} products</p>
                            </c:otherwise>
                        </c:choose>
                        <a><p class="order-status">${order.status}</p></a>
                        <p class="order-price">$${order.totalPrice}</p>
                    </div>
                    <a href="myOrderDetail?orderId=${order.id}" class="btn-view">View Order Details</a>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
