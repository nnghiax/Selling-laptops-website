<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <jsp:include page="SidebarDashboard.jsp" />
            <!-- End SideBar -->

            <!-- Main -->
            <div class="main-container">
                <div class="filter">
                    <h3>Filter by:</h3>
                    <div class="filter-btn">
                        <div class="filter-list">
                            <input type="button" value="Category" onclick="toggleDropdown('category-list')">
                            <ul id="category-list" name="ctlist" style="display: none;">
                                <c:forEach items="${bpt}" var="a">
                                    <a href="filterinblogdashboard?name=${a.getTypeName()}"><li>${a.getTypeName()}</li></a>
                                        </c:forEach>
                            </ul>
                        </div>
                        <div class="filter-list">
                            <input type="button" value="Author" onclick="toggleDropdown('author-list')">
                            <ul id="author-list" name="atlist" style="display: none;">
                                <c:forEach items="${author}" var="a">
                                    <a href="filterinblogdashboard?authors=${a.getUser_name()}"><li>${a.getUser_name()}</li></a>    
                                        </c:forEach>
                            </ul>
                        </div>
                        <div class="filter-list">
                            <input type="button" value="Status" onclick="toggleDropdown('status-list')">
                            <ul id="status-list" style="display: none;">
                                <a href="filterinblogdashboard?status=True"><li>Showing</li></a>
                                <a href="filterinblogdashboard?status=False"><li>Hiding</li></a>
                            </ul>
                        </div>
                    </div>
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
                            background-color: #4CAF50;
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
                    <div class="addnews-btn"><a href="addnewdashboard">Add New Post</a></div>
                    <div class="addnews-btn"><a href="addblogtype">Add New Blog Type</a></div>

                </div>
                <table class="table-container">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Thumbnail</th>
                            <th>Title</th>
                            <th>Category</th>
                            <th>Author</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Option</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${bs}" var="o">
                            <tr>
                                <td>${o.id}</td>
                                <td style="width: 100px;"><img src="${o.img}" style="max-width: 250px; height: auto;"></td>
                                <td>${o.title}</td>
                                <td>${o.type}</td>
                                <td>${o.user_id}</td>
                                <td>${o.date}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${o.status == 'True'}">
                                            <div class="status">
                                                <span class="material-icons">circle</span>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="nonstatus">
                                                <span class="material-icons">circle</span>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <div class="option-item">
                                        <div class="edit">
                                            <a href="detailblogdashboard?id=${o.id}">
                                                <span class="material-icons">edit</span>
                                            </a>
                                        </div>
                                        <c:choose>
                                            <c:when test="${o.status == 'True'}">
                                                <div class="show-hide">
                                                    <a href="changestatus?idtrue=${o.id}"> 
                                                        <span class="material-icons"> visibility_off </span>
                                                    </a>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="show-hide">
                                                    <a href="changestatus?idfalse=${o.id}">
                                                        <span class="material-icons">visibility</span>
                                                    </a>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <!-- Pagination controls -->        
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <c:forEach begin="1" end="${pagenum}" var="i">
                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                <a class="page-link" href="blistmanage?id=${i}">${i}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </nav>
            </div>
            <!-- End Main -->
        </div>
    </body>
</html>
