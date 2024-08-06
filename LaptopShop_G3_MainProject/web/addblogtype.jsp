<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : addblogtype
    Created on : Jul 17, 2024, 3:08:21 AM
    Author     : Nguyen Bao
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
            <!-- Bootstrap CSS -->
            <link
                href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
                rel="stylesheet"
                />
            <!-- Custom CSS -->
            <link rel="stylesheet" href="css/blog-dashboard.css" />
        </head>
        <body>
            <div class="grid-container">
                <!-- Header -->
                <header class="header">
                    <div class="menu-icon" onclick="openSidebar()">
                        <span class="material-icons">menu</span>
                    </div>
                    <div class="header-left">
                        <form id="searchForm" action="searchinblogdashboard" method="GET">
                            <input type="text" name="query" placeholder="Search blog" value="${msg}" required />
                            <span class="material-icons" onclick="submitForm()">search</span>
                        </form>
                    </div>  

                    <script>
                        function submitForm() {
                            document.getElementById("searchForm").submit();
                        }
                    </script>
                </header>
                <!-- End Header -->

                <!-- SideBar -->
                <aside id="sidebar">
                    <div class="sidebar-title">
                        <li class="sidebar-list-items">
                            <a href="lstblogtype" class="sidebar-item"> 
                                <span class="material-icons"> shopping_cart </span> STORE
                            </a>
                        </li>
                    </div>
                    <ul class="sidebar-list">
                        <li class="sidebar-list-items">
                            <a href="dashboard.jsp" class="sidebar-item">
                                <span class="material-icons"> category </span> Dashboard
                            </a>
                        </li>
                        <li class="sidebar-list-items">
                            <a href="dashboard.jsp" class="sidebar-item">
                                <span class="material-icons"> inventory_2 </span> Products
                            </a>
                        </li>
                        <li class="sidebar-list-items active">
                            <a href="blistmanage" class="sidebar-item">
                                <span class="material-icons"> newspaper </span> Blogs
                            </a>

                        </li>
                        <li class="sidebar-list-items">
                            <a href="dashboard.jsp" class="sidebar-item">
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
                            <a href="dashboard.jsp" class="sidebar-item">
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
                <!-- End SideBar -->

                <!-- Main -->
                <div class="main-container">
                    <div class="filter">
                        <script>
                            function toggleDropdown(id) {
                                var list = document.getElementById(id);
                                if (list.style.display === "none" || list.style.display === "") {
                                    list.style.display = "block";
                                } else {
                                    list.style.display = "none";
                                }
                            }

                            window.onclick = function (event) {
                                if (!event.target.matches('.filter-buttons input[type="button"]')) {
                                    var dropdowns = document.querySelectorAll(".filter-buttons ul");
                                    dropdowns.forEach(function (dropdown) {
                                        if (dropdown.style.display === "block") {
                                            dropdown.style.display = "none";
                                        }
                                    });
                                }
                            }
                        </script>
                        <style>
                            .addnews-btn {
                                display: inline-block;
                                margin-right: 10px;
                                background-color: #red;
                                padding: 10px 20px;
                                border-radius: 5px;
                                text-align: center;
                                text-decoration: none;
                                color: white;
                                font-weight: bold;
                                transition: background-color 0.3s ease;
                            }

                            .addnews-btn a {
                                color: white;
                                text-decoration: none;
                            }

                            .addnews-btn:hover {
                                background-color: #45a049;
                            }
                        </style>
                        <div class="addnews-btn"><a href="blistmanage">Back</a></div>
                        <div class="addnews-btn"><a href="addnewblogtype.jsp">Add</a></div>
                    </div>
                    <table class="table-container">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Blog Type</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${blogtype}" var="o">
                                <tr>
                                    <td>${o.getTypeID()}</td>
                                    <td>${o.getTypeName()}</td>
                                    <td>
                                        <div class="option-item">
                                            <div class="edit">
                                                <a href="editblogtype?id=${o.getTypeID()}">
                                                    <span class="material-icons">edit</span>
                                                </a>
                                            </div>
                                            <div class="edit">
                                                <button class="delete-btn" onclick="confirmDelete(${o.getTypeID()})">
                                                    <span class="material-icons">delete</span>
                                                </button>
                                            </div>
                                        </div>
                                        <script>
                                            function confirmDelete(typeID) {
                                                console.log(typeID); // Check if typeID is correctly passed
                                                if (confirm("Are you sure you want to delete this blog type?")) {
                                                    window.location.href = `deleteblogtype?did=` + typeID;
                                                }
                                            }
                                        </script>
                                    </td>
                                </tr>
                            </c:forEach>
                        <style>
                            .option-item {
                                display: flex;
                                gap: 10px;
                            }

                            .delete-btn {
                                background: none;
                                border: none;
                                cursor: pointer;
                                padding: 0;
                            }

                            .delete-btn .material-icons {
                                background-color: red;
                            }
                        </style>


                        </tbody>
                    </table>
                </div>
                <!-- End Main -->
            </div>
        </body>
    </html>

    <h1>Hello World!</h1>
</body>
</html>
