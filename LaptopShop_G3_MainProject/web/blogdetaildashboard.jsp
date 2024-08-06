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
        <!-- JQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Include jQuery library -->
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
            <jsp:include page="SidebarDashboard.jsp" />
            <!-- End SideBar -->
            <!-- Main -->
            <div class="main-container">
                <h3>Blog Detail</h3>
                <form action="updateblogdetail" method="post">
                    <div class="detail-container">
                        <div class="left-detail">
                            <div class="form-group">
                                <label>
                                    Title
                                    <input type="text" class="form-control" name="title" placeholder="Title" value="${bs.title}"/>
                                </label>
                            </div>
                            <div class="form-group">
                                <label>
                                    Description
                                    <input type="text" class="form-control" placeholder="Description" name="description" value="${bs.description}" />
                                </label>
                            </div>
                            <div class="post-detail">
                                <label>
                                    Content
                                    <textarea placeholder="Post detail..." cols="100" rows="20" id="editor" name="content" ">${bs.content}</textarea>
                                </label>
                            </div>
                        </div>
                        <div class="right-detail">
                            <div class="form-group">
                                <label>
                                    BlogID
                                    <input type="text" name="blogid" class="form-control" value="${bs.id}" readonly />
                                </label>
                            </div>
                            <div class="form-group">
                                <label>
                                    Author
                                    <input type="text" name="author" class="form-control" value="${bs.user_id}" readonly />
                                </label>
                            </div>
                            <div class="form-group">
                                <label>
                                    Date
                                    <input type="text" name="date" class="form-control" value="${bs.date}" readonly />
                                </label>
                            </div>
                            <div class="form-group">
                                <label>
                                    Categories
                                    <select class="category form-control" name="category" value="value="${bs.type}"">
                                        <c:forEach items="${bpt}" var="o">
                                            <option value="${o.getTypeID()}" 
                                                    <c:if test="${o.getTypeID() == bs.type}">selected</c:if>>${o.getTypeName()}</option>
                                        </c:forEach>
                                    </select>
                                </label>
                            </div>
                            <div class="visibility form-group">
                                <label>
                                    Status
                                    <input type="radio" name="visibility" value="true" ${bs.status == 'true' ? 'checked' : ''} />Show
                                    <input type="radio" name="visibility" value="false" ${bs.status == 'false' ? 'checked' : ''} />Hide
                                </label>
                            </div>
                            <div class="thumbnail form-group">
                                <label for="thumbnail">Select a thumbnail:</label>
                                <img src="${bs.img}" alt="Thumbnail" style="max-width: 200px; max-height: 200px; margin-bottom: 10px;">
                                <input type="text" id="thumbnail" class="form-control" name="thumbnail" accept="image/*" value="${bs.img}">
                            </div>
                        </div>
                    </div>
                    <div class="button">
                        <button id="deleteButton" class="update btn btn-primary" style="background-color: red; color: #FFF">Delete</button>

                        <script>
                            $(document).ready(function () {
                                $('#deleteButton').click(function () {
                                    if (confirm("Are you sure you want to delete this post?")) {
                                        var blogPostID = '${bs.id}'; // Replace with actual blog post ID from your server-side data
                                        var url = 'deleteBlogDashBoard?id=' + blogPostID;
                                        window.location.href = url;
                                    }
                                });
                            });
                        </script>
                        <button class="update btn btn-primary">Update</button>
                    </div>

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
            /* Custom CSS for images in CKEditor */
            .ck-content img {
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
