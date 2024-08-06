<%-- 
    Document   : feedback-list
    Created on : Jul 11, 2024, 5:09:22 PM
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
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap4.css"/>
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"></script>
        <script>
            $(document).ready(function () {
                $("#data-table").DataTable();
            });
        </script>
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
                <h1 class="mt-5" style="color: #000">Feedback List</h1>
                <form action="manage-feedback" id="filter-form" method="post">
                    <input type="hidden" name="action" value="filter" />
                    <select name="star" class="form-control" onchange="document.querySelector('#filter-form').submit()">
                        <option value="" ${star == '' ? "selected" : ""}>All</option>
                        <option value="1" ${star == 1 ? "selected" : ""}>1 star</option>
                        <option value="2" ${star == 2 ? "selected" : ""}>2 star</option>
                        <option value="3" ${star == 3 ? "selected" : ""}>3 star</option>
                        <option value="4" ${star == 4 ? "selected" : ""}>4 star</option>
                        <option value="5" ${star == 5 ? "selected" : ""}>5 star</option>
                    </select>
                </form>
                <table class="table table-bordered" id="data-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>User ID</th>
                            <th>Product ID</th>
                            <th>Star</th>
                            <th>Comment</th>
                            <th>Time</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="feedback" items="${listFeedback}">
                            <tr style="color: black; font-weight: bold">
                                <td>${feedback.feedbackID}</td>
                                <td>${feedback.user_ID}</td>
                                <td>${feedback.product_ID}</td>
                                <td>${feedback.star}</td>
                                <td>${feedback.comment}</td>
                                <td>${feedback.time}</td>
                                <td>
                                    <a href="manage-feedback?action=detail&id=${feedback.feedbackID}" class="btn btn-primary">Detail</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </main>
        </div>
    </body>
</html>
