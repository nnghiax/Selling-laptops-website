<%-- 
    Document   : slider-list
    Created on : Jul 11, 2024, 4:39:31 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Marketing Dashboard</title>
        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;900&display=swap"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/icon?family=Material+Icons"
            rel="stylesheet"
            />
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!--Custom CSS-->
        <link rel="stylesheet" href="css/dashboard-css.css" />
    </head>
    <body>
        <div class="grid-container">
            <!--Header-->
            <header class="header">
                <div class="menu-icon" onclick="openSidebar()">
                    <span class="material-icons">menu</span>
                </div>
                
            </header>
            <!--End Header-->

            <!--SideBar-->
            <aside id="sidebar">
                <div class="sidebar-title">
                    <div class="sidebar-brand">
                        <span class="material-icons"> shopping_cart </span> STORE
                    </div>
                </div>
                <ul class="sidebar-list">
                    <li class="sidebar-list-items active">
                        <a href="dashboard.jsp" class="sidebar-item">
                            <span class="material-icons"> category </span> Dashboard
                        </a>
                    </li>
                    <li class="sidebar-list-items">
                        <a href="dashboard.jsp" class="sidebar-item">
                            <span class="material-icons"> inventory_2 </span> Products
                        </a>
                    </li>
                    <li class="sidebar-list-items ">
                        <a href="blistmanage" class="sidebar-item">
                            <span class="material-icons"> newspaper </span> Blogs
                        </a>

                    </li>
                    <li class="sidebar-list-items">
                        <a href="slider" class="sidebar-item">
                            <span class="material-icons"> laptop_mac </span>
                            Sliders
                        </a>
                    </li>
                    <li class="sidebar-list-items">
                        <a href="dashboard.jsp" class="sidebar-item">
                            <span class="material-icons"> person </span> Customers
                        </a>
                    </li>
                    <li class="sidebar-list-items">
                        <a href="manage-feedback" class="sidebar-item">
                            <span class="material-icons"> chat </span> Feedbacks
                        </a>
                    </li>
                    <li class="sidebar-list-items">
                        <a href="dashboard.jsp" class="sidebar-item">
                            <span class="material-icons"> view_cozy </span> Brands
                        </a>
                    </li>
                </ul>
            </aside>
            <main class="main-container">
                
                <div class="container mt-5">
                    <h2>Feedback Detail</h2>
                    <div class="card w-100">
                        <div class="card-body" style="color: #fff; background: #333">
                            <p><strong>Feedback ID:</strong> ${feedback.feedbackID}</p>
                            <p><strong>User:</strong> ${feedback.user.user_name}</p>
                            <p><strong>Product:</strong> ${feedback.product.name}</p>
                            <p><strong>Star Rating:</strong> ${feedback.star}</p>
                            <p><strong>Comment:</strong> ${feedback.comment}</p>
                            <p><strong>Time:</strong> ${feedback.time}</p>
                            <a href="manage-feedback" class="btn btn-secondary">Back to List</a>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>
