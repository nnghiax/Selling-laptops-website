<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <link rel="stylesheet" href="css/blogdetaildashboard.css" />
        <!-- CKEditor 5 -->
        <script src="https://cdn.ckeditor.com/ckeditor5/34.1.0/classic/ckeditor.js"></script>
        <!-- CKFinder -->
        <script src="path/to/ckfinder/ckfinder.js"></script>
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
            <aside id="sidebar">
                <div class="sidebar-title">
                    <div class="sidebar-brand">
                        <span class="material-icons"> shopping_cart </span> STORE
                    </div>
                </div>
                <ul class="sidebar-list">
                    <li class="sidebar-list-items">
                        <a href="dashboard.jsp" class="sidebar-item">
                            <span class="material-icons"> category </span> Dashboard
                        </a>
                    </li>
                    <li class="sidebar-list-items">
                        <a href="dashboard.jsp" class="sidebar-item">
                            <span class="material-icons"> inventory_2 </span> Products
                        </a>
                    </li>
                    <li class="sidebar-list-items active">
                        <a href="blistmanage" class="sidebar-item">
                            <span class="material-icons"> newspaper </span> Blogs
                        </a>
                    </li>
                    <li class="sidebar-list-items">
                        <a href="dashboard.jsp" class="sidebar-item">
                            <span class="material-icons"> laptop_mac </span> Sliders
                        </a>
                    </li>
                    <li class="sidebar-list-items">
                        <a href="dashboard.jsp" class="sidebar-item">
                            <span class="material-icons"> person </span> Customers
                        </a>
                    </li>
                    <li class="sidebar-list-items">
                        <a href="dashboard.jsp" class="sidebar-item">
                            <span class="material-icons"> chat </span> Feedbacks
                        </a>
                    </li>
                    <li class="sidebar-list-items">
                        <a href="dashboard.jsp" class="sidebar-item">
                            <span class="material-icons"> view_cozy </span> Brands
                        </a>
                    </li>
                </ul>
            </aside>
            <!-- End SideBar -->
            <!-- Main -->
            <div class="main-container">
                <h3>Blog Type Detail</h3>
                <form action="updateblogtype" method="get">
                    <div class="detail-container">
                        <div class="left-detail col-md-6">
                            <div class="form-group">
                                <label>
                                    Blog Type ID
                                    <input type="text" class="form-control" name="id" placeholder="ID" value="${type.getTypeID()}" readonly />
                                </label>
                            </div>
                            <div class="form-group">
                                <label>
                                    Blog Type
                                    <input type="text" class="form-control" placeholder="BlogType" value="${type.getTypeName()}" name="type" />
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="all-btn" style="display: flex;">
                        <button class="update btn btn-primary" onclick="confirmDelete(${type.getTypeID()})" style="background-color: red">Delete</button>
                        <button type="submit" class="update btn btn-primary">Update</button>
                    </div>

                    <script>
                        function confirmDelete(typeID) {
                            console.log(typeID); // Check if typeID is correctly passed
                            if (confirm("Are you sure you want to delete this blog type?")) {
                                window.location.href = `deleteblogtype?did=`+typeID;
                            }
                        }

                    </script>


                </form>


            </div>
            <!-- End Main -->
        </div>
        <style>
            .ck-editor__editable_inline {
                height: 300px; /* Adjust this value as needed */
                width: 100%;
                width: 900px;
            }
        </style>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                ClassicEditor
                        .create(document.querySelector('#editor'), {
                            ckfinder: {
                                uploadUrl: '${pageContext.request.contextPath}/uploadImage'
                            }
                        })
                        .then(editor => {
                            const content = `${bs.content}`;
                        })
                        .catch(error => {
                            console.error(error);
                        });
            });
        </script>
    </body>
</html>
