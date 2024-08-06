<%-- 
    Document   : manaCategory
    Created on : Jul 8, 2024, 9:36:13 PM
    Author     : VietAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .card-header {
            background-color: #007bff;
            color: white;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .product-image {
            width: 100px;
            height: auto;
            object-fit: cover;
        }
        .filter-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .add-category-form {
            display: none;
        }
    </style>
    <script>
        function toggleAddCategoryForm() {
            var form = document.getElementById('addCategoryForm');
            var toggleButton = document.getElementById('toggleAddCategoryBtn');
            
            if (form.style.display === 'none') {
                form.style.display = 'block';
                toggleButton.innerText = 'Cancel';
            } else {
                form.style.display = 'none';
                toggleButton.innerText = 'Add New Category';
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                Manage Categories
            </div>
            <div class="card-body">
                 <a style="" href="manaProduct"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/BackButton.svg/2048px-BackButton.svg.png" width="50px" alt="alt"/></a>
                <div class="filter-container">
                    <!-- Category Filter -->
                    <form action="manaCategory" method="POST" class="form-inline">
                        <label class="mr-2" for="categoryFilter">Filter by Category:</label>
                        <select class="form-control" id="categoryFilter" name="cid">
                            <option value="">All Categories</option>
                            <c:forEach items="${listCategory}" var="cates">
                                <option value="${cates.categoryID}">${cates.categoryName}</option>
                            </c:forEach> 
                        </select>
                        <button type="submit" class="btn btn-primary ml-2">Filter</button>
                    </form>

                    <!-- Product Search -->
                    <form action="manaCategory" method="POST" class="form-inline">
                        <label class="mr-2" for="searchProduct">Search Product:</label>
                        <input type="text" class="form-control" id="searchProduct" name="pid" placeholder="Enter product id">
                        <button type="submit" class="btn btn-primary ml-2">Search</button>
                    </form>
                </div>
                <button id="toggleAddCategoryBtn" class="btn btn-primary mb-3" onclick="toggleAddCategoryForm()">Add New Category</button>
                
                <!-- Add New Category Form -->
                <div id="addCategoryForm" class="add-category-form">
                    <h5>Add New Category</h5>
                    <form action="addCategory" method="POST">
                        <div class="form-group">
                            <label for="categoryID">Category ID:</label>
                            <input type="text" class="form-control" id="categoryID" name="addCateID" required>
                        </div>
                        <div class="form-group">
                            <label for="productID">Product ID:</label>
                            <input type="text" class="form-control" id="productID" name="addProcID" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Add</button>
                    </form>
                </div>

                <table class="table table-bordered mt-3">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Category Name</th>
                            <th scope="col">Product ID</th>
                            <th scope="col">Product Image</th>
                            <th scope="col">Product Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listPC}" var="pc">
                            <tr>
                                <td>${pc.category.categoryName}</td>
                                <td>${pc.product.id}</td>
                                <td><img class="product-image" src="${pc.product.image}" alt="Product Image"/></td>
                                <td>${pc.product.name}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
