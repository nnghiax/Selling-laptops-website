<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Marketing Dashboard</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;900&display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/dashboard-css.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    </head>
    <body>
        <div class="grid-container">
            <!-- Header -->
            <header class="header">
                <div class="menu-icon" onclick="openSidebar()">
                    <span class="material-icons">menu</span>
                </div>
            </header>
            <!-- End Header -->

            <!-- Sidebar -->
            <aside id="sidebar">
                <div class="sidebar-title">
                    <div class="sidebar-brand">
                        <span class="material-icons">shopping_cart</span> STORE
                    </div>
                </div>
                <ul class="sidebar-list">
                    <li class="sidebar-list-items active">
                        <a href="dashboard.jsp" class="sidebar-item">
                            <span class="material-icons">category</span> Dashboard
                        </a>
                    </li>
                    <li class="sidebar-list-items">
                        <a href="dashboard.jsp" class="sidebar-item">
                            <span class="material-icons">inventory_2</span> Products
                        </a>
                    </li>
                    <li class="sidebar-list-items">
                        <a href="blistmanage" class="sidebar-item">
                            <span class="material-icons">newspaper</span> Blogs
                        </a>
                    </li>
                    <li class="sidebar-list-items">
                        <a href="slider" class="sidebar-item">
                            <span class="material-icons">laptop_mac</span> Sliders
                        </a>
                    </li>
                    <li class="sidebar-list-items">
                        <a href="dashboard.jsp" class="sidebar-item">
                            <span class="material-icons">person</span> Customers
                        </a>
                    </li>
                    <li class="sidebar-list-items">
                        <a href="manage-feedback" class="sidebar-item">
                            <span class="material-icons">chat</span> Feedbacks
                        </a>
                    </li>
                    <li class="sidebar-list-items">
                        <a href="dashboard.jsp" class="sidebar-item">
                            <span class="material-icons">view_cozy</span> Brands
                        </a>
                    </li>
                </ul>
            </aside>
            <main class="main-container">
                <h1 class="mt-5">Slider List</h1>
                <a href="slider?action=new" class="btn btn-primary mb-3">Add New Slider</a>
                <form action="slider" id="filterForm">
                    <input name="action" value="filter" type="hidden"/>
                    <div>
                        <select name="status" onchange="document.querySelector('#filterForm').submit()">
                            <option value="-1" ${status == -1 ? "selected" : ""}>All</option>
                            <option value="1" ${status == 1 ? "selected" : ""}>Active</option>
                            <option value="0" ${status == 0 ? "selected" : ""}>Inactive</option>
                        </select>
                    </div>
                </form>
                <table id="sliderTable" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Image</th>
                            <th>Backlink</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="slider" items="${listSlider}">
                            <tr>
                                <td>${slider.id}</td>
                                <td>${slider.title}</td>
                                <td><img src="${slider.image}" alt="${slider.title}" style="width:100px;height:50px;"></td>
                                <td style="color: red; font-weight: bold">
                                    <a href="${slider.backlink}">${slider.backlink}</a>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${slider.status == 1}">
                                            <span class="badge badge-success">Active</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-secondary">Inactive</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="slider?action=edit&id=${slider.id}" class="btn btn-info">Edit</a>
                                    <a onclick="return confirm('Are you sure to delete?')" href="slider?action=delete&id=${slider.id}" class="btn btn-danger">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </main>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
        <script>
            $(document).ready(function () {
                $('#sliderTable').DataTable({
                    "searching": true,
                    "columnDefs": [
                        {
                            "targets": [0, 2, 3, 4, 5],
                            "searchable": false
                        }
                    ]
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
