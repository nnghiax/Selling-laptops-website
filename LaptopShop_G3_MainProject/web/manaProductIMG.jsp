<%-- 
    Document   : manaProductIMG
    Created on : Jul 7, 2024, 8:57:08 PM
    Author     : VietAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product Images</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .container {
                max-width: 800px;
                margin-top: 50px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                border-radius: 8px;
                padding: 30px;
            }
            .card-header {
                background-color: #299be4;
                color: #f8f9fa;
                border-radius: 5px 5px 0 0;
                font-weight: bold;
            }
            .carousel-inner img {
                width: 100%;
                height: 400px; /* adjust as necessary */
                object-fit: cover;
            }
            .form-group label {
                font-weight: bold;
            }
            .form-row {
                padding-left: 15px;
                padding-right: 15px;
            }
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }
            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }
        </style>
    </head>
    <body>


        <div class="container mt-5" style="background-color: #f8f9fa">

            <h2 class="card-header mb-4" style="background-color: #007bff; color: white">Update Product Images</h2>
            <a style="" href="manaProduct"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/BackButton.svg/2048px-BackButton.svg.png" width="50px" alt="alt"/></a>
            <div class="row">
                <!-- Left column - Display current product images -->
                <div class="col-md-6">
                    <h5 style="color: #858585">Current Images</h5>
                    <div id="product-carousel" class="carousel slide mb-4" data-ride="carousel">
                        <div class="carousel-inner border">
                            <c:forEach var="img" items="${listImage}" varStatus="status">
                                <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                    <img class="d-block w-100" src="${img.img_url}" alt="Product Image">
                                </div>
                            </c:forEach>
                        </div>
                        <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </a>
                    </div>
                </div>

                <!-- Right column - Input fields for new images -->
                <div class="col-md-6">
                    <h5 style="color: #858585">Enter Image URLs</h5>
                    <form action="manaProductIMG" method="POST">
                        <input type="hidden" name="pid" value="${param.pid}">
                        <c:forEach var="img" items="${listImage}" varStatus="status">
                            <div class="form-group col-md-12">
                                <label for="image${status.index + 1}">Image ${status.index + 1}:</label>
                                <input type="text" class="form-control" id="image${status.index + 1}" name="image${status.index + 1}" value="${img.img_url}">
                            </div>
                        </c:forEach>
                        <c:forEach var="index" begin="${listImage.size() + 1}" end="4">
                            <div class="form-group col-md-12">
                                <label for="image${index}">Image ${index}:</label>
                                <input type="text" class="form-control" id="image${index}" name="image${index}" value="">
                            </div>
                        </c:forEach>
                        <button type="submit" class="btn btn-primary ml-3">Update Images</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>

