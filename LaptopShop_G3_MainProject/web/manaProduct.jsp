<%-- 
    Document   : manaProduct
    Created on : Jun 25, 2024, 10:30:42 PM
    Author     : VietAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.min.css" rel="stylesheet"/>
        <style>


            .sidenav {
                color: wheat;
                height: 100%; /* 100% Full-height */
                width: 0; /* 0 width - change this with JavaScript */
                position: fixed; /* Stay in place */
                z-index: 1; /* Stay on top */
                top: 66; /* Stay at the top */
                left: 0;
                background:#062c33; /* Black*/
                overflow-x: hidden; /* Disable horizontal scroll */
                padding-top: 60px; /* Place content 60px from the top */
                transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
            }

            /* The navigation menu links */
            .sidenav a {
                padding: 8px 8px -9px 32px;
                text-decoration: none;
                font-size: 25px;
                color: #818181;
                display: block;
                transition: 0.3s;
            }

            /* When you mouse over the navigation links, change their color */
            .sidenav a:hover {
                color: #f1f1f1;
            }

            /* Position and style the close button (top right corner) */
            .sidenav .closebtn {
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                margin-left: 50px;
            }

            /* Style page content - use this if you want to push the page content to the right when you open the side navigation */
            #main {
                transition: margin-left .5s;
                padding: 0;

            }

            /* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
            @media screen and (max-height: 450px) {
                .sidenav {
                    padding-top: 15px;
                }
                .sidenav {
                    font-size: 10px;
                }
            }

            .p {
                font-size: 5px;
            }
            .search{
                position: fixed;
                width: 100%;
                z-index: 2;
            }

            .sidenav {
                /* your existing styles */
                position: fixed;
                z-index: 1;
                transition: 0.5s;
            }

            /* Pagination container styling */
            .pagination {
                display: flex;
                justify-content: center;
                padding: 10px 0;
                list-style-type: none;
            }

            /* Pagination items styling */
            .page-item {
                margin: 0 5px;
            }

            .page-item a {
                display: block;
                padding: 10px 15px;
                color: #007bff;
                text-decoration: none;
                border: 1px solid #dee2e6;
                border-radius: 5px;
                transition: background-color 0.3s, color 0.3s;
            }

            /* Active page styling */
            .page-item.active a {
                color: #fff;
                background-color: #007bff;
                border-color: #007bff;
            }

            /* Hover and focus effects */
            .page-item a:hover, .page-item a:focus {
                color: #0056b3;
                background-color: #e9ecef;
                border-color: #dee2e6;
            }




        </style>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>


    <body class='body'>
            <form action="manaProduct" method="GET">
                <div id="mySidenav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    <p class="a">Search</p>
                    <div class="input-group mb-3">
                        <span class="input-group-text " style="color: white">Name</span>
                        <input name="name" type="text" class="form-control" aria-label="Name" value="${param.name}">
                </div>
                <p class="a">Price above</p>
                <div class="input-group mb-3">
                    <span class="input-group-text " style="color: white">Dollar</span>
                    <input name="downPrice" type="text" class="form-control" aria-label="Price above" value="${param.downPrice}">
                </div>
                <p class="a">Price below</p>
                <div class="input-group mb-3">
                    <span class="input-group-text " style="color: white">Dollar</span>
                    <input name="upPrice" type="text" class="form-control" aria-label="Price below" value="${param.upPrice}">
                </div>
                <p class="a">Brand</p>
                <select name="brand" class="form-select a" aria-label="Brand">
                    <c:forEach items="${listBrand}" var="brand">
                        <option value="${brand.id}" ${brand.id == param.brand ? 'selected' : ''}>${brand.name}</option>
                    </c:forEach>
                </select>
                <br/>
                <button type="submit" class="btn btn-primary btn-lg btn-block"><a>Find</a></button>
            </div>
        </form>

        <!-- sidenav -->


        <div id="main" style="">
            <form id="myForm" action="manaProduct">
                <div class="row flex-fill search align-items-center" style="background: #062c33;height: 60px;margin-left: 1px">
                    <div class="open col-sm-1 d-flex align-items-center justify-content-cente" onclick="option()" style="background: white"><img src="https://static.vecteezy.com/system/resources/previews/000/572/119/non_2x/menu-icon-vector.jpg" style="width:35%;"/></div>
                    <div class="col-md-1">
                        <button  class="btn btn-secondary " type="submit" style="width: 150px">
                            <a style="color: white" href="manaProduct">Reset</a>
                        </button>
                    </div>
                    <div class="col-md-1">
                        <a  class="btn btn-secondary" href="addProduct" style="width: 135px">
                            Add Product
                        </a>
                    </div>

                    <div class="col-md-1">
                        <a  class="btn btn-secondary" href="manaCategory" style="width: 140px">
                             Category
                        </a>
                    </div>

                    <div class="col-md-1">
                        <a  class="btn btn-secondary" href="dashboardservlet" style="width: 240px">
                             DashBoard Marketing
                        </a>
                    </div>
                </div>  
            </form>



            <!-- Use any element to open the side nav -->
            <section>
                <div class="text-center container py-5">
                    <div class="mt-4 mb-5"><strong style="color: white;">Total: ${countP} products</strong></div>
                    <c:if test="${requestScope.products == null}">
                        <img src="https://www.kalpamritmarketing.com/design_img/no-product-found.jpg" alt="No Product Found"/>
                    </c:if>
                    <section style="background-color: #eee;">
                        <div class="container py-5">
                            <div class="row justify-content-center mb-3">
                                <c:forEach items="${products}" var="item">   
                                    <div class="col-md-12 col-xl-6">
                                        <div class="card shadow-0 border rounded-3">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                                                        <div class="bg-image hover-zoom ripple rounded ripple-surface">
                                                            <img src="${item.image}" class="w-100" />
                                                            <a href="manaProductIMG?pid=${item.id}">
                                                                <div class="hover-overlay">
                                                                    <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                                        <h5>${item.name}</h5>
                                                        <div class="mb-1 text-muted">
                                                            <span></span>
                                                        </div>
                                                        <div class="mb-2 text-muted">
                                                            <span>Code: ${item.id}</span>
                                                        </div>
                                                        <p class="text-truncate mb-4 mb-md-0">
                                                        </p>
                                                    </div>
                                                    <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                                                        <div class="d-flex flex-row align-items-center mb-1">
                                                            <h4 class="mb-1 me-1" style="color: red">${item.salePrice}$</h4>
                                                        </div>
                                                        <div class="d-flex flex-column mt-4">
                                                            <a id="delete" href="#" onclick="doDelete('${item.id}')" class="btn btn-outline-primary btn-sm mt-2">
                                                                Delete
                                                            </a>
                                                            <a class="btn btn-outline-primary btn-sm mt-2" href="updateProduct?code=${item.id}">
                                                                Update
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </section>
                    <ul class="pagination justify-content-center">
                        <c:forEach begin="1" end="${endP}" var="i">
                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                <a class="page-link" href="manaProduct?index=${i}">${i}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </section>

        </div>
        <!-- sidenav end -->
        <script>
            let isOpen = false;

            function option() {
                if (isOpen) {
                    closeNav();
                } else {
                    openNav();
                }
            }

            function handleCheckboxClick(clickedCheckboxId) {
                const checkboxes = document.querySelectorAll('input[type="checkbox"]');
                checkboxes.forEach(checkbox => {
                    if (checkbox.id !== clickedCheckboxId) {
                        checkbox.checked = false;
                    }
                });
            }

            function openNav() {
                document.getElementById("mySidenav").style.width = "300px";
                document.getElementById("main").style.marginLeft = "300px";

                isOpen = true;
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
                document.getElementById("main").style.marginLeft = "0";

                isOpen = false;
            }

            function submitForm(event) {
                event.preventDefault(); 
                document.getElementById("myForm").submit();
                // Remove the closeNav() call from here so that the sidebar stays open after form submission
            }



        </script>
        <script type="text/javascript">
            function doDelete(id, ) {
                if (confirm('Do you want to delete product code: ' + id + ' ?')) {
                    window.location = 'deleteProduct?code=${id}' + id;
                }
            }
        </script>

    </body>
</html>