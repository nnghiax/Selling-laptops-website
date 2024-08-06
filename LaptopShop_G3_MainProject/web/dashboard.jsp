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
                    <h2>Quantity</h2>
                </div>
                <div class="main-cards">
                    <div class="card">
                        <div class="card-inner">
                            <h3>Posts</h3>
                            <span class="material-icons">newspaper</span>
                        </div>
                        <h1>${blognum}</h1>
                    </div>

                    <div class="card">
                        <div class="card-inner">
                            <h3>Products</h3>
                            <span class="material-icons">inventory_2</span>
                        </div>
                        <h1>${productnum}</h1>
                    </div>

                    <div class="card">
                        <div class="card-inner">
                            <h3>Customers</h3>
                            <span class="material-icons">person</span>
                        </div>
                        <h1>${customernum}</h1>
                    </div>

                    <div class="card">
                        <div class="card-inner">
                            <h3>Feedbacks</h3>
                            <span class="material-icons">chat</span>
                        </div>
                        <h1>${feedbacknum}</h1>
                    </div>
                </div>

                <div class="chart container">

                    <h2 class="chart-title">Blog informations</h2>
                    <div class="row">
                        <div class="chart-card col-12 col-md-6">

                            <form action="dashboardservlet" method="get">
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
                    <h2 class="chart-title">Quantity of Product from each Warehouse</h2>
                    <div class="row">
                        <div class="chart-card ">
                            <div class="area-chart">
                                <canvas id="myChart3"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="chart container">
                    <h2 class="chart-title">Quantity of Star Rate</h2>
                    <div class="row">
                        <div class="chart-card ">
                            <div class="area-chart">
                                <canvas id="myChart4"></canvas>
                            </div>
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
                        // Lấy dữ liệu từ JSP
                        var xValues = [];
                        var yValues = [];
                        // Duyệt qua dữ liệu và đẩy vào mảng xValues và yValues
            <c:forEach var="item" items="${statistic}">
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
                                legend: {display: false},
                                scales: {
                                    yAxes: [{ticks: {min: 0}}]
                                }
                            }
                        });
                        //PieChart
                        var xValuesPie = ["Show", "Hide"];
                        var yValuesPie = [];
            <c:forEach var="item" items="${statistic2}">
                        yValuesPie.push(${item.show}, ${item.hide});
            </c:forEach>;
                        var barColors = [
                            "#b91d47",
                            "#00aba9"
                        ];
                        new Chart("myChart2", {
                            type: "pie",
                            data: {
                                labels: xValuesPie,
                                datasets: [{
                                        backgroundColor: barColors.slice(0, xValuesPie.length), // Sử dụng màu từ barColors, cắt bớt nếu cần thiết
                                        data: yValuesPie
                                    }]
                            },
                            options: {
                                title: {
                                    display: true
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
                                    text: 'Product Quantities' // Tiêu đề của biểu đồ
                                },
                                scales: {
                                    yAxes: [{
                                            ticks: {
                                                beginAtZero: true // Đặt trục y bắt đầu từ giá trị 0
                                            }
                                        }]
                                }
                            }
                        });
                        //BarChart
                        var xValuesLine = ["1 Star", "2 Star", "3 Star", "4 Star", "5 Star"];
                        var yValuesLine = [];


            <c:forEach var="item" items="${starrate}">
                        yValuesLine.push(${item.onestar}, ${item.twostar}, ${item.threestar}, ${item.fourstar}, ${item.fivestar}); // Đảm bảo rằng item.quantity là số lượng sản phẩm
            </c:forEach>;

                        var lineColorFull = "rgba(0, 123, 255, 1.0)"; // Màu sắc đường viền đầy đủ
                        var lineColorTransparent = "rgba(0, 123, 255, 0.5)"; // Màu sắc đường viền trong suốt

                        new Chart("myChart4", {
                            type: "bar", // Loại biểu đồ là line (đường)
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
                                    text: 'Star rate by people' // Tiêu đề của biểu đồ
                                },
                                scales: {
                                    yAxes: [{
                                            ticks: {
                                                beginAtZero: true // Đặt trục y bắt đầu từ giá trị 0
                                            }
                                        }]
                                }
                            }
                        });
                    });
        </script>
    </body>
</html>
