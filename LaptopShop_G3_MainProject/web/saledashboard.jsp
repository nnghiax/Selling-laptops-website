<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Marketing Dashboard</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;900&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
        <!--Custom CSS-->
        <link rel="stylesheet" href="css/dashboard.css" />
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    </head>
    <body>
        <div class="grid-container">
            <!--Header-->
            <header class="header">
                <div class="menu-icon" onclick="openSidebar()">
                    <span class="material-icons">menu</span>
                </div>
                <div class="header-left">
                    <span class="material-icons">search</span>
                    <input type="text" placeholder="Search blog" />
                </div>
            </header>
            <!--End Header-->

            <!--SideBar-->
            <jsp:include page="SidebarDashboard.jsp" />

            <!--EndSideBar-->

            <!--Main-->
            <main class="main-container">
                <div class="main-title">
                </div>

                <div class="chart container">
                    <h2 class="chart-title">Product informations</h2>
                    <div class="row">
                        <div class="chart-card col-12 col-md-6">
                            <form action="saledashboardservlet" method="get">
                                <div class="option-date">
                                    <label>From
                                        <input type="date" class="date" name="from-start" value="${sevendaysago}" />
                                    </label>
                                    <label>To
                                        <input type="date" class="date" name="from-end" value="${now}" />
                                    </label>
                                    <input type="submit" value="Search" />
                                </div>
                            </form>
                            <div class="area-chart">
                                <canvas id="myChart"></canvas>
                            </div>
                        </div>
                        <div class="chart-card col-12 col-md-6">
                            <div class="area-chart">
                                <canvas id="myChart2"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="chart container">
                    <h2 class="chart-title">Top 5 Pay Customers</h2>
                    <div class="row">
                        <div class="chart-card col-12 ">
                            <table border="1" class="table styled-table">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Address</th>
                                        <th>Gender</th>
                                        <th>Birthdate</th>
                                        <th>Total Pay</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${rich}" var="o"> 
                                        <tr>
                                            <td>${o.name}</td>
                                            <td>${o.address}</td>
                                            <td>${o.gender}</td>
                                            <td>${o.birthdate}</td>
                                            <td>${o.totalpay}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <style>
                    .product-image {
                        max-width: 400px;
                        max-height: 350px;
                        width: auto;
                        height: auto;
                    }
                </style>

                <div class="chart container">
                    <h2 class="chart-title">Top 3 Sold Products</h2>
                    <div class="row">
                        <div class="chart-card col-12">
                            <table border="1" class="table styled-table">
                                <thead>
                                    <tr>
                                        <th>Name Product</th>
                                        <th>Img</th>
                                        <th>Price</th>
                                        <th>Total Sold</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${toppro}" var="o"> 
                                        <tr>
                                            <td>${o.name}</td>
                                            <td><img src="${o.img}" alt="Product Image" style="width: 200px; height: 200px;" class="product-image"></td>
                                            <td>${o.price}</td>
                                            <td>${o.sold}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


            </main>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <!--EndMain-->
        </div>
        <script type="text/javascript">
                    document.addEventListener("DOMContentLoaded", function () {
                        var xValues = [];
                        var yValues = [];
            <c:forEach var="item" items="${saletrend}">
                        xValues.push("${item.date}");
                        yValues.push(${item.quantity});
            </c:forEach>;
                        new Chart("myChart", {
                            type: "bar",
                            data: {
                                labels: xValues,
                                datasets: [{
                                        fill: false,
                                        lineTension: 0,
                                        backgroundColor: "rgba(0,123,255,0.5)", // Màu xanh nhạt
                                        borderColor: "rgba(0,123,255,1.0)", // Màu xanh đậm
                                        borderWidth: 1,
                                        data: yValues,
                                        barThickness: 20, // Độ rộng của cột
                                    }]
                            },
                            options: {
                                title: {
                                    display: true,
                                    text: "Sale trends from the last 7 days",
                                    fontSize: 20
                                },
                                legend: {display: false},
                                scales: {
                                    yAxes: [{ticks: {min: 0}}]
                                }
                            }
                        });

                        //PieChart
                        var xValuesPie = [];
                        var yValuesPie = [];
                        var barColors = [];

            <c:forEach var="item" items="${brandsold}">
                        xValuesPie.push("${item.name}");
                        yValuesPie.push(${item.total});
                        barColors.push(getRandomColor());
            </c:forEach>;

                        function getRandomColor() {
                            var letters = '0123456789ABCDEF';
                            var color = '#';
                            for (var i = 0; i < 6; i++) {
                                color += letters[Math.floor(Math.random() * 16)];
                            }
                            return color;
                        }

                        new Chart("myChart2", {
                            type: "pie",
                            data: {
                                labels: xValuesPie,
                                datasets: [{
                                        backgroundColor: barColors,
                                        data: yValuesPie
                                    }]
                            },
                            options: {
                                title: {
                                    display: true,
                                    text: "Quantity of Brand from the last 7 days",
                                    fontSize: 20
                                },
                                legend: {
                                    display: true,
                                    position: 'bottom',
                                    labels: {
                                        fontSize: 10 // Đặt kích thước phông chữ của chú thích
                                    }
                                }
                            }
                        });

                        //LineChart
                        var xValuesLine = [];
                        var yValuesLine = [];

            <c:forEach var="item" items="${productquantity}">
                        yValuesLine.push(${item.quantity}); // Đảm bảo rằng item.quantity là số lượng sản phẩm
                        xValuesLine.push("${item.name}"); // Đưa tên sản phẩm vào nhãn cho biểu đồ line
            </c:forEach>;

                        var lineColorFull = "rgba(0, 123, 255, 1.0)"; // Màu sắc đường viền đầy đủ
                        var lineColorTransparent = "rgba(0, 123, 255, 0.5)"; // Màu sắc đường viền trong suốt

                        new Chart("myChart3", {
                            type: "line", // Loại biểu đồ là line (đường)
                            data: {
                                labels: xValuesLine,
                                datasets: [{
                                        label: 'Quantity',
                                        borderColor: lineColorFull, // Màu sắc đường viền đầy đủ
                                        backgroundColor: lineColorTransparent, // Màu sắc đường viền trong suốt
                                        fill: false, // Không điền màu nền dưới đường biểu đồ
                                        data: yValuesLine
                                    }]
                            },
                            options: {
                                title: {
                                    display: true,
                                    text: 'Product Quantities', // Tiêu đề của biểu đồ
                                    fontSize: 20
                                },
                                scales: {
                                    yAxes: [{
                                            ticks: {
                                                beginAtZero: true // Đặt trục y bắt đầu từ giá trị 0
                                            }
                                        }],
                                    xAxes: [{
                                            ticks: {
                                                fontSize: 12 // Đặt kích thước phông chữ của nhãn trục x
                                            }
                                        }]
                                }
                            }
                        });
                    });
        </script>
    </body>
</html>
