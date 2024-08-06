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
                <h3>Blog Detail</h3>
                <form action="addnews" method="post">
                    <div class="detail-container">
                        <div class="left-detail">
                            <div class="form-group">
                                <label>
                                    Title
                                    <input type="text" class="form-control" name="title" placeholder="Title"/>
                                </label>
                            </div>
                            <div class="form-group">
                                <label>
                                    Description
                                    <input type="text" class="form-control" placeholder="Description" name="description" />
                                </label>
                            </div>
                            <div class="post-detail">
                                <label>
                                    Content
                                    <textarea placeholder="Post detail..." cols="100" rows="20" id="editor" name="content"></textarea>
                                </label>
                            </div>
                        </div>
                        <div class="right-detail">
                            <div class="form-group">
                                <label>
                                    BlogID
                                    <input type="text" name="blogid" class="form-control" readonly />
                                </label>
                            </div>
                            <div class="form-group">
                                <label>
                                    Author
                                    <input type="text" name="author" class="form-control" value="MrB" readonly />
                                </label>
                            </div>
                            <div class="form-group">
                                <label>
                                    Date
                                    <input type="text" name="date" class="form-control" readonly />
                                </label>
                            </div>
                            <div class="form-group">
                                <label>
                                    Categories
                                    <select class="category form-control" name="category">
                                        <c:forEach items="${bpt}" var="o">
                                            <option value="${o.getTypeID()}">${o.getTypeName()}</option>
                                        </c:forEach>
                                    </select>
                                </label>
                            </div>
                            <div class="visibility form-group">
                                <label>
                                    Status
                                    <input type="radio" name="visibility" value="true"/> Show
                                    <input type="radio" name="visibility" value="false"/> Hide
                                </label>
                            </div>
                            <div class="thumbnail form-group">
                                <label>
                                    Thumbnail
                                    <input type="text" class="form-control" placeholder="Input url" name="thumbnail" />
                                </label>
                            </div>
                        </div>
                    </div>
                    <button class="update btn btn-primary">Update</button>
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
