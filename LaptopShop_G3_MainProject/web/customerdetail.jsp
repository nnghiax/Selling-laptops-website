<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
                                                                  uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fn"
                                                                  uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <link rel="stylesheet" href="./css/customerdetail.css" />
        <!-- CKEditor 5 -->
        <script src="https://cdn.ckeditor.com/ckeditor5/34.1.0/classic/ckeditor.js"></script>
        <!-- CKFinder -->
        <script src="path/to/ckfinder/ckfinder.js"></script>
        <!-- JQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                        <input
                            type="text"
                            name="query"
                            placeholder="Search blog"
                            value="${msg}"
                            required
                            />
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
                <h3>Customer Detail</h3>
                <form action="updatecustomerdetail" method="post">
                    <div class="detail-container">
                        <div class="row">
                            <div class="left-detail col-md-6">
                                <div class="form-group">
                                    <label>
                                        ID
                                        <input
                                            type="text"
                                            class="form-control"
                                            name="id"
                                            value="${customer.getUser_id()}"
                                            readonly
                                            />
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Name
                                        <input
                                            type="text"
                                            class="form-control"
                                            placeholder="Input name"
                                            name="name"
                                            value="${customer.getUser_name()}"
                                            />
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Email
                                        <input
                                            type="text"
                                            class="form-control"
                                            placeholder="Input email"
                                            name="email"
                                            value="${customer.getUser_email()}"
                                            />
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Phone
                                        <input
                                            type="text"
                                            class="form-control"
                                            placeholder="Input phone number"
                                            name="phone"
                                            value="${customer.getUser_phone()}"
                                            />
                                    </label>
                                </div>
                            </div>
                            <div class="right-detail col-md-6">
                                <h4>Change History</h4>
                                <div class="history-container">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Changer</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Date Change</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${history}" var="change">
                                                <tr>
                                                    <td>${change.getChange_id()}</td>
                                                    <td>${change.getChanger_name()}</td>
                                                    <td>${change.getChange_name()}</td>
                                                    <td>${change.getChange_email()}</td>
                                                    <td>${change.getChange_phone()}</td>
                                                    <td>${change.getChange_date()}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="button">
                        <button type="submit" class="update btn btn-primary">Update</button>
                    </div>
                </form>
            </div>
            <!-- End Main -->
        </div>
    </body>
</html>
