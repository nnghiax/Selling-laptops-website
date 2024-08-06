<%-- 
    Document   : slider-form
    Created on : Jul 11, 2024, 4:39:44 PM
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
                <h1 class="mt-5">${slider == null ? 'Add New Slider' : 'Edit Slider'}</h1>
                <form action="slider?action=${slider == null ? 'insert' : 'update'}" method="post">
                    <c:if test="${slider != null}">
                        <input type="hidden" name="id" value="${slider.id}">
                    </c:if>
                    <div class="form-group">
                        <label style="color: #000; font-weight: bold" for="title">Title</label>
                        <input type="text" class="form-control" id="title" name="title" value="${slider.title}">
                    </div>
                    <div class="form-group">
                        <label style="color: #000; font-weight: bold" for="image">Image</label>
                        <input type="text" class="form-control" id="image" name="image" value="${slider.image}">
                    </div>
                    <div class="form-group">
                        <label style="color: #000; font-weight: bold" for="backlink">Backlink</label>
                        <input type="text" class="form-control" id="backlink" name="backlink" value="${slider.backlink}">
                    </div>
                    <div class="form-group">
                        <label style="color: #000; font-weight: bold" for="status">Status</label>
                        <select style="color: #000; font-weight: bold" class="form-control" id="status" name="status">
                            <option value="1" <c:if test="${slider.status == 1}">selected</c:if>>Active</option>
                            <option value="0" <c:if test="${slider.status == 0}">selected</c:if>>Inactive</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">${slider == null ? 'Save' : 'Update'}</button>
                </form>
            </main>
        </div>
    </body>
</html>
