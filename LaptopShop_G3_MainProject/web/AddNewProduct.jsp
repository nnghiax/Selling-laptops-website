<%-- 
    Document   : AddNewProduct
    Created on : Jun 26, 2024, 12:34:12 AM
    Author     : VietAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Product</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <style>
            body {
                background-color: #f8f9fa;
            }
            .container {
                max-width: 1000px;
                margin-top: 50px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                border-radius: 8px;
                padding: 30px;
            }
            .card-header {
                background-color: #007bff;
                color: white;
                border-radius: 5px 5px 0 0;
                font-weight: bold;
            }
            .form-group label {
                font-weight: bold;
            }
            .form-group.row {
                margin-bottom: 20px;
            }
            .form-group .col-sm-6 {
                padding-right: 5px;
                padding-left: 5px;
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


        <div class="container">
            <div class="card">
                <div class="card-header" style="background-color: #299be4; color: #f8f9fa">
                    Add New Product
                </div>
                <div class="card-body">
                    <form action="addProduct" method="POST">
                        <a style="" href="manaProduct"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/BackButton.svg/2048px-BackButton.svg.png" width="50px" alt="alt"/></a>
                        <div class="form-group row mt-2">
                            <label for="productCode" class="col-sm-2 col-form-label">Code</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="productCode" name="productCode" >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">Name</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="name" name="name" >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="image" class="col-sm-2 col-form-label">Image</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control-file" id="image" name="image">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="warranty" class="col-sm-2 col-form-label">Warranty</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="warranty" name="warranty">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="description" class="col-sm-2 col-form-label">Description</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="price" class="col-sm-2 col-form-label">Price</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="price" name="price" >
                            </div>
                            <label for="salePrice" class="col-sm-2 col-form-label">Sale Price</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="salePrice" name="salePrice" >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="cpu" class="col-sm-2 col-form-label">CPU</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="cpu" name="cpu" >
                            </div>
                            <label for="ram" class="col-sm-2 col-form-label">RAM</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="ram" name="ram" >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="storage" class="col-sm-2 col-form-label">Storage</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="storage" name="storage">
                            </div>
                            <label for="gpu" class="col-sm-2 col-form-label">GPU</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="gpu" name="gpu" >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="screen" class="col-sm-2 col-form-label">Screen</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="screen" name="screen">
                            </div>
                            <label for="battery" class="col-sm-2 col-form-label">Battery</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="battery" name="battery" >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="weight" class="col-sm-2 col-form-label">Weight</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="weight" name="weight">
                            </div>
                            <label for="color" class="col-sm-2 col-form-label">Color</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="color" name="color">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="os" class="col-sm-2 col-form-label">OS</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="os" name="os">
                            </div>
                            <label for="brand" class="col-sm-2 col-form-label">Brand</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="brand" name="brand">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-10 offset-sm-2">
                                <button type="submit" class="btn btn-primary">Add Product</button>
                            </div>
                        </div>
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
