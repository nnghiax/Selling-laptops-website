<%-- 
    Document   : manaAccount
    Created on : Jun 6, 2024, 12:02:22 PM
    Author     : VietAnh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>User Management</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                min-width: 1000px;
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 15px;
                background: #299be4;
                color: #fff;
                padding: 16px 30px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn {
                color: #566787;
                float: right;
                font-size: 13px;
                background: #fff;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                margin-left: 10px;
            }
            .table-title .btn:hover, .table-title .btn:focus {
                color: #566787;
                background: #f2f2f2;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }

        </style>
        
        
    <script>
        function doDelete(id){
            var c = confirm("Do you want to delete this account?");
            if(c){
                console.log("Deleting user with ID:", id);
                window.location.href = "deleteAccount?userID=" + id;
            }
        }
    </script>

    </head>
    <body>
    <%@include file="Admin.jsp" %> 
    <div class="container">
    <div class="table-responsive">
        <div class="table-wrapper">
            <!-- Thanh tìm kiếm -->
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-5">
                        <h2>User <b>Management</b></h2>
                    </div>
                    <div class="col-sm-7">
                        <form class="row" action="manaAccount" method="GET">
                            <input class="col-md-4 input-group-text" placeholder="Enter user name" name="uName"> 
                            <button class="col-md-2 btn btn-primary" type="submit">Find</button>
                            <div class="col-md-1"></div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Bảng dữ liệu người dùng -->
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listUser}" var="u">
                        <tr>
                            <td>${u.user_id}</td>
                            <td>
                                <a href="#"><img src="${u.user_image}" class="avatar" alt="Avatar" width="60px" height="60px">${u.user_name}</a>
                            </td>
                            <td>${u.user_phone}</td>
                            <td>${u.user_email}</td>
                            <td>${u.role_id}</td>
                            <td>
                                <a href="updateAccount?userID=${u.user_id}" class="settings" title="Settings" data-toggle="tooltip" style="color: blue"><i class="material-icons">&#xE8B8;</i></a>
                                <a onclick="doDelete(${u.user_id})" type="button" class="delete" title="Delete" data-toggle="tooltip" style="color: red"><i class="material-icons">&#xE5C9;</i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Hiển thị số lượng bản ghi -->
            <div class="clearfix">
                <div class="hint-text"><b>${requestScope.listUser.size()}</b> entries</div>
                <ul class="pagination">
                    <!-- Các liên kết phân trang (nếu có) -->
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>
