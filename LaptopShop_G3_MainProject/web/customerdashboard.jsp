<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Marketing Dashboard</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;900&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/blog-dashboard.css" />
    </head>
    <body>
        <div class="grid-container">
            <header class="header">
                <div class="menu-icon" onclick="openSidebar()">
                    <span class="material-icons">menu</span>
                </div>
                <div class="header-left">
                    <form id="searchForm" action="searchcustomerdashboard" method="GET">
                        <input type="text" name="query" placeholder="Search customer" value="${msg}" required />
                        <span class="material-icons" onclick="submitForm()">search</span>
                    </form>
                </div>  

                <script>
                    function submitForm() {
                        document.getElementById("searchForm").submit();
                    }
                </script>
            </header>

            <jsp:include page="SidebarDashboard.jsp" />

            <div class="main-container">
                <div class="filter">
                    <%
                        String attribute = (String) request.getAttribute("attribute");
                        String order = (String) request.getAttribute("order");
                    %>
                    <h3>Sorted By:</h3>
                    <div class="filter-btn">
                        <div class="filter-list">
                            <a href="sortcustomerdashboard?attribute=name&order=<%= ("name".equals(attribute) && "asc".equals(order)) ? "desc" : "asc" %>" id="sortName">
                                <input type="button" value="Name<%= "name".equals(attribute) ? ("asc".equals(order) ? " ^" : " v") : "" %>" id="nameSortButton">
                            </a>
                        </div>
                        <div class="filter-list">
                            <a href="sortcustomerdashboard?attribute=email&order=<%= ("email".equals(attribute) && "asc".equals(order)) ? "desc" : "asc" %>" id="sortEmail">
                                <input type="button" value="Email<%= "email".equals(attribute) ? ("asc".equals(order) ? " ^" : " v") : "" %>" id="emailSortButton">
                            </a>
                        </div>
                        <div class="filter-list">
                            <a href="sortcustomerdashboard?attribute=phone&order=<%= ("phone".equals(attribute) && "asc".equals(order)) ? "desc" : "asc" %>" id="sortPhone">
                                <input type="button" value="Phone<%= "phone".equals(attribute) ? ("asc".equals(order) ? " ^" : " v") : "" %>" id="phoneSortButton">
                            </a>
                        </div>
                    </div>

                    <script>
                        function toggleSortOrder(elementId, attribute) {
                            const url = new URL(window.location.href);
                            const currentOrder = url.searchParams.get("order") || "asc";
                            const newOrder = currentOrder === "asc" ? "desc" : "asc";
                            url.searchParams.set("attribute", attribute);
                            url.searchParams.set("order", newOrder);
                            window.location.href = url.toString(); // Redirect to the updated URL
                        }
                    </script>
                </div>
                <table class="table-container">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${customer}" var="o">
                            <tr>
                                <td>${o.getUser_id()}</td>
                                <td style="width: 100px;"><img src="${o.getUser_image()}" style="max-width: 250px; height: auto;"></td>
                                <td>${o.getUser_name()}</td>
                                <td>${o.getUser_email()}</td>
                                <td>${o.getUser_phone()}</td>
                                <td>
                                    <div class="option-item">
                                        <div class="edit">
                                            <a href="detailcustomerdashboard?id=${o.getUser_id()}">
                                                <span class="material-icons">edit</span>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
