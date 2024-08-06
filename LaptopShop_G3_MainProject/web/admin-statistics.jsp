<%-- 
    Document   : admin-statistics
    Created on : Jul 11, 2024, 9:58:35 PM
    Author     : HP
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
            function doDelete(id) {
                var c = confirm("Do you want to delete this account?");
                if (c) {
                    console.log("Deleting user with ID:", id);
                    window.location.href = "deleteAccount?userID=" + id;
                }
            }
        </script>

    </head>
    <body>
        <%@include file="Admin.jsp" %> 
        <main class="main-container table-responsive">
            <div class="container" style="background: #fff; padding: 10px">
                <h1 class="mt-5">Order Statistics</h1>
                <form action="admin-statistics" method="post" style="color: #000; font-weight: bold">
                    <div class="form-group">
                        <label for="type">Select Type:</label>
                        <select class="form-control" id="type" name="type" required>
                            <option value="date" ${key != null && key == 'date' ? "selected" : ""}>By Date</option>
                            <option value="month" ${key != null && key == 'month' ? "selected" : ""}>By Month</option>
                        </select>
                    </div>
                    <div class="form-group" id="dateFields" style="${key != null && key == 'date' ? "" : 'display: none'}">
                        <label for="startDate">Start Date:</label>
                        <input type="date" class="form-control" id="startDate" name="startDate" value="${start}">
                        <label for="endDate">End Date:</label>
                        <input type="date" class="form-control" id="endDate" name="endDate" value="${end}">
                    </div>
                    <div class="form-group" id="monthFields" style="${key != null && key == 'month' ? "" : 'display: none'}">
                        <label for="startMonth">Start Month:</label>
                        <input type="month" class="form-control" id="startMonth" name="startMonth" value="${fromMonth}">
                        <label for="endMonth">End Month:</label>
                        <input type="month" class="form-control" id="endMonth" name="endMonth" value="${toMonth}">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
            <div class="container" style="background: #fff; padding: 10px">
                <h1 class="mt-5">Order Statistics</h1>
                <div id="order_chart" style="width: 100%; height: 500px;"></div>
                <div id="revenue_chart" style="width: 100%; height: 500px;"></div>
            </div>
        </main>
        <script>
            document.getElementById('type').addEventListener('change', function () {
                var type = this.value;
                if (type === 'date') {
                    document.getElementById('dateFields').style.display = 'block';
                    document.getElementById('monthFields').style.display = 'none';
                } else {
                    document.getElementById('dateFields').style.display = 'none';
                    document.getElementById('monthFields').style.display = 'block';
                }
            });
        </script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawOrderChart);
            google.charts.setOnLoadCallback(drawRevenueChart);

            function drawOrderChart() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Date');
                data.addColumn('number', 'Total Orders');
                var chartData = [];
                var type = document.getElementById('type').value;

            <c:forEach var="order" items="${orders}">
                var date = new Date("${order.date}");
                var dateString = (type === 'month') ? (date.getFullYear() + '-' + (date.getMonth() + 1)) :
                        (date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate());
                chartData.push([dateString, 1]);
            </c:forEach>

                data.addRows(aggregateAndSortData(chartData));

                var options = {
                    title: 'Order Statistics by ${key}',
                    curveType: 'function',
                    legend: {position: 'bottom'}
                };

                var chart = new google.visualization.LineChart(document.getElementById('order_chart'));
                chart.draw(data, options);
            }

            function drawRevenueChart() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Date');
                data.addColumn('number', 'Total Revenue');
                var chartData = [];
                var type = document.getElementById('type').value;

            <c:forEach var="order" items="${orders}">
                var date = new Date("${order.date}");
                var dateString = (type === 'month') ? (date.getFullYear() + '-' + (date.getMonth() + 1)) :
                        (date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate());
                chartData.push([dateString, ${order.totalPrice}]);
            </c:forEach>

                data.addRows(aggregateAndSortData(chartData));

                var options = {
                    title: 'Revenue Statistics by ${key}',
                    curveType: 'function',
                    legend: {position: 'bottom'}
                };

                var chart = new google.visualization.LineChart(document.getElementById('revenue_chart'));
                chart.draw(data, options);
            }

            function aggregateAndSortData(chartData) {
                var aggregatedData = {};
                chartData.forEach(function (entry) {
                    var dateString = entry[0];
                    if (!aggregatedData[dateString]) {
                        aggregatedData[dateString] = [dateString, 0];
                    }
                    aggregatedData[dateString][1] += entry[1];
                });

                var result = [];
                for (var key in aggregatedData) {
                    result.push(aggregatedData[key]);
                }

                result.sort(function (a, b) {
                    return new Date(a[0]) - new Date(b[0]);
                });

                return result;
            }
        </script>


    </body>
</html>
